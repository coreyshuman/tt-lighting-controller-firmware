#include "GenericTypeDefs.h"
#include "./HardwareProfile/HardwareProfile.h"
#include <stdlib.h>
#include <plib.h>
#include <string.h>
#include "./Controller/Config.h"
#include "./Controller/Controller.h"
#include "./Common.h"
#include "./Controller/Debug.h"

typedef struct
{
	UINT8 Cmd;
    UINT16 Len;
	UINT8 Data[CONTROLLER_BUFF_SIZE];
	
}T_FRAME;

static const UINT8 FirmwareInfo[2] __attribute__((section("app_vars"), address(APP_VERSION_ADDRESS))) =
{
    MAJOR_VERSION,
    MINOR_VERSION
};

BYTE BootloaderModeFlag __attribute__((address(BOOTLOADER_MODE_ADDRESS))) = 0;

static T_FRAME RcvBuff;
static T_FRAME TxmBuff;
static BOOL RxFrameValid;
static EEPROM_HANDLE eepromHandle;
static config_t* configHandle;
static BYTE ControllerAddress = 0;
static DWORD LastResetStatus =  0;



void HandleCommand(void);
BOOL ControlUpdateConfig(void);
void ControlDefaultConfig(void);


void ControllerInit(void) 
{
    EepromInit(&eepromHandle, EE_I2C, 400000, EE_ADDR, FALSE);
    // Let I2C stabilize
    DelayMs(10); 
    configHandle = ConfigInit(&eepromHandle);
    
    LightingInit();
    AnimationInit(configHandle);
    
    FanInit();
    FanSetSpeeds(configHandle->fanSpeed);
    
    
    AnimationSetInterval(ANIMATION_INTERVAL);
    AnimationUpdate();
    AnimationStart();
    
    FanCaptureEnable();
    
    RxFrameValid = FALSE;
    
    ControllerAddress = PORTA & 0x03 | ((PORTB & 0x03) << 2);
    
    LastResetStatus = RCON;
    RCONCLR = 0xFFFFFFFF;
}

void ControllerLoop(void)
{
    if(!LedBusy) {
        FanLoop();
        AnimationUpdate();
    }
    
    if(RxFrameValid)
	{
		// Valid frame received, process the command.
		HandleCommand();
        
		// Reset the flag.
        RxFrameValid = FALSE;
        RcvBuff.Len = 0;
	}
}

// Send error code response to the master.
void SetResponseErrorOccurred(CONTROL_ERROR_CODES errorCode)
{
    TxmBuff.Cmd = 0x40;
    TxmBuff.Len = 1;
    TxmBuff.Data[0] = errorCode;
}

// Error occurred during RX processing. This will be forwarded to the
// packet parser, which will send the error code response.
void SetReceiveErrorOccurred(CONTROL_ERROR_CODES errorCode)
{
    RcvBuff.Len = 1;
    RcvBuff.Cmd = 0x40;
    RcvBuff.Data[0] = errorCode;
    RxFrameValid = TRUE;
}

void ResetToBootloader()
{
    BootloaderModeFlag = BOOTLOADER_MODE_FLAG;
    SoftReset();
    while(1);
}

// Setup send response to USB. Data is copied to TX buffer if data not NULL.
void SetResponseSendData(BYTE* data, UINT16 len)
{
    if(len > CONTROLLER_BUFF_SIZE) {
        SetResponseErrorOccurred(RESPONSE_TOO_LONG);
        return;
    }
    if(data != NULL) {
        //memcpy(&TxmBuff.Data[0], data, len);
        int i;
        for(i=0; i<len; i++) {
            TxmBuff.Data[i] = *data++;
        }
    }
    TxmBuff.Len = len;
}

/********************************************************************
* Function: 	HandleCommand()
*
* Precondition: 
*
* Input: 		None.
*
* Output:		None.
*
* Side Effects:	None.
*
* Overview: 	Process the received frame and take action depending on
				the command received.
*
*			
* Note:		 	None.
********************************************************************/
void HandleCommand(void)
{
	UINT8 cmd;
    UINT16 length;
    EEPROM_STATUS eepromStatus;
    BOOL status;
    int i;
	// First byte of the data field is command.
	cmd = RcvBuff.Cmd;
	// Partially build response frame. First byte in the data field carries command.
	TxmBuff.Cmd = cmd;
	
	// Reset the response length to 0.
	TxmBuff.Len = 0;
				
	// Process the command.		
	switch(cmd)
	{
		case CMD_READ_BOOT_INFO: // Read bootloader version info.
			SetResponseSendData((void*)BOOTLOADER_VERSION_ADDRESS, 2);
			break;
            
        case CMD_READ_FIRMWARE_INFO: // Read firmware version info.
			SetResponseSendData((void*)&FirmwareInfo, 2);
			break;
            
        case CMD_RESET_TO_BOOTLOADER: 
			ResetToBootloader();
			break;
            
        case CMD_READ_BOOT_STATUS:
			SetResponseSendData((void*)&LastResetStatus, 4);
			break;
            
        case CMD_READ_CONTROLLER_ADDRESS:
            SetResponseSendData((BYTE*)&ControllerAddress, 1);
            SetResponseSendData(NULL, 1);
            break;
            
        case CMD_READ_CONFIG:
            SetResponseSendData((void*)configHandle, ConfigSize);
            break;
            
        case CMD_UPDATE_CONFIG:
            status = ControlUpdateConfig();
            SetResponseSendData((void*)&status, 1);
            break;
            
        case CMD_DEFAULT_CONFIG:
            ControlDefaultConfig();
            status = 1;
            SetResponseSendData((void*)&status, 1);
            break;
            
        case CMD_WRITE_CONFIG:
            status = ConfigUpdate();
            SetResponseSendData((void*)&status, 1);
            break;
            
        case CMD_READ_FANSPEED: // send metric values and read fan speed
            if(RcvBuff.Len != DEVICECOUNT) {
                return SetResponseErrorOccurred(INVALID_PAYLOAD_LENGTH);
            }
            AnimationSetMetrics(RcvBuff.Data);
            SetResponseSendData((BYTE*)&FanSpeed, 10);
			break;
        
        case CMD_WRITE_FANSPEED:
            if(RcvBuff.Len != DEVICECOUNT) {
                return SetResponseErrorOccurred(INVALID_PAYLOAD_LENGTH);
            }
            for(i=0; i < DEVICECOUNT; i++) {
                if(RcvBuff.Data[i] == 0xFF) {
                    RcvBuff.Data[i] = configHandle->fanSpeed[i];
                }
            }
            FanSetSpeeds(RcvBuff.Data);
            status = 1;
            SetResponseSendData((void*)&status, 1);
            break;

        case CMD_SET_TIME:
            if(RcvBuff.Len != 3) {
                return SetResponseErrorOccurred(INVALID_PAYLOAD_LENGTH);
            }
            AnimationSetTime(RcvBuff.Data);
            status = 1;
            SetResponseSendData((void*)&status, 1);
            break;
            
        case CMD_WRITE_LED_FRAME:
            if(RcvBuff.Len != DEVICECOUNT*DEVICESIZEBYTES) {
                return SetResponseErrorOccurred(INVALID_PAYLOAD_LENGTH);
            }
            AnimationWriteCustomFrame((BYTE *)&RcvBuff.Data[0]);
            status = 1;
            SetResponseSendData((void*)&status, 1);
            break;
            
        case CMD_READ_EE_DEBUG: 
        {
            if(RcvBuff.Len < 1) {
                return SetResponseErrorOccurred(INVALID_PAYLOAD_LENGTH);
            }
            status = 1;
            
            char debugCommand = (char)RcvBuff.Data[0];
            BYTE *ptr;
            switch(debugCommand) {
                case 'r':
                    DebugReset();
                    break;
                case 'a':
                    ptr = DebugGetCurrentAnimationBufferPointer();
                    return SetResponseSendData((void*)ptr, DEVICECOUNT*DEVICESIZEBYTES);
                case 'b':
                    ptr = (BYTE*)DebugGetCurrentAnimationFramePointer();
                    return SetResponseSendData((void*)ptr, DEVICECOUNT);
                case 'l':
                    ptr = LedDrawBuffer;
                    return SetResponseSendData((void*)ptr, DEVICECOUNT*DEVICESIZEBYTES);

                case 'm':
                    ptr = LedWriteBuffer;
                    return SetResponseSendData((void*)ptr, DEVICECOUNT*DEVICESIZEBYTES);
                case 'd':
                    length = DebugGet((char *)&TxmBuff.Data[0]);
                    return SetResponseSendData(NULL, length);
                    
                case 'e':
                {
                    BYTE metrics[DEVICECOUNT];
                    for(i=0; i<DEVICECOUNT; i++) {
                        metrics[i] = RcvBuff.Data[1];
                    }
                    AnimationSetMetrics(metrics);
                    break;
                }
                case 'p':
                    if(RcvBuff.Len != 2) {
                        return SetResponseErrorOccurred(INVALID_PAYLOAD_LENGTH);
                    }
                    DebugSetPlayPause(RcvBuff.Data[1]);
                    break;   
                case 's':
                    DebugStepAnimation();
                    break;
                    
                default:
                    status = 0;
                    return SetResponseErrorOccurred(INVALID_PAYLOAD_LENGTH);
            }
            
            return SetResponseSendData((void*)&status, 1);
        }
        case CMD_READ_EEPROM: // read eeprom (up to 256 bytes)
            eepromHandle.data = &TxmBuff.Data[0];
            eepromHandle.len = RcvBuff.Data[1] + (RcvBuff.Data[2] << 8);
            eepromHandle.address = RcvBuff.Data[0];
            if(eepromHandle.len + eepromHandle.address > 256) {
                eepromHandle.len = 256 - eepromHandle.address;
            }
            length = eepromHandle.len;
            eepromStatus = EEPROM_IN_PROGRESS;
            while(eepromStatus == 0)
            {
                eepromStatus = EepromRead(&eepromHandle);
            }
            if(eepromStatus == EEPROM_SUCCESS) {
                SetResponseSendData(NULL, length);
            } else {
                SetResponseErrorOccurred(EEPROM_FAILED);
            }
            break;
            
        case CMD_WRITE_EEPROM: // write eeprom, max address is 255
            eepromHandle.data = &RcvBuff.Data[2];
            eepromHandle.address = RcvBuff.Data[0];
            length = RcvBuff.Data[1];
            if(length + eepromHandle.address >= 256)
            {
                length = 256 - eepromHandle.address;
            }
            eepromHandle.len = length;
            
            eepromStatus = EEPROM_IN_PROGRESS;
            while(eepromStatus == EEPROM_IN_PROGRESS)
            {
                eepromStatus = EepromWrite(&eepromHandle);
            }
            if(eepromStatus == EEPROM_SUCCESS) {
                SetResponseSendData(NULL, length);
            } else {
                SetResponseErrorOccurred(EEPROM_FAILED);
            }
            break;
        
        case CMD_ERROR_OCCURRED:
            SetResponseErrorOccurred(RcvBuff.Data[0]);
            break;
	    default:
	    	SetResponseErrorOccurred(UNKNOWN_COMMAND);
	    	break;
	}
}

BOOL ControlUpdateConfig(void)
{
    if(configHandle->length != (RcvBuff.Data[2] + (RcvBuff.Data[3] << 8))) {
        return 0;
    }
    memcpy((void*)configHandle, (void*)&RcvBuff.Data[0], ConfigSize);
    AnimationUpdateBuffer(NULL);
    FanSetSpeeds(configHandle->fanSpeed);
    return 1;
}

void ControlDefaultConfig(void)
{
    ConfigDefault();
    AnimationUpdateBuffer(NULL);
    FanSetSpeeds(configHandle->fanSpeed);
}

/********************************************************************
* Function: 	BuildRxFrame()
*
* Precondition: 
*
* Input: 		Pointer to Rx Data and Rx byte length.
*
* Output:		None.
*
* Side Effects:	None.
*
* Overview: 	Builds rx frame and checks CRC.
*
*			
* Note:		 	None.
********************************************************************/
void ControllerBuildRxFrame(UINT8 *RxData, INT16 RxLen)
{
	WORD_VAL crc;
    BOOL multipacket = (RxData[1] & 0x80) == 0x80; // check multipacket flag
    RxLen = RxData[1] & 0x3F; // Read length byte
    
    // if data already in buffer, we are in multipacket mode. Skip cmd and data
    if(RcvBuff.Len > 0) {
        if(RxFrameValid) {
            // old packet still in buffer
            SetReceiveErrorOccurred(USB_PACKET_OVERFLOW);
            return;
        } else if(RcvBuff.Cmd != RxData[0]) {
            SetReceiveErrorOccurred(INVALID_MULTIPACKET);
            return;
        }
    } else {
        RcvBuff.Cmd = RxData[0];
    }
	
    crc.Val = CalculateCrc(RxData, RxLen);
    RxData += 2; // skip CMD and LEN
    // verify received CRC
    if(crc.byte.LB != *(RxData + RxLen - 2) || crc.byte.HB != *(RxData + RxLen - 1)) {
        SetReceiveErrorOccurred(CRC_INVALID);
        return;
    }
    
	while(RxLen > 2)
	{
		RxLen--;
		
		if(RcvBuff.Len >= CONTROLLER_BUFF_SIZE)
		{
			SetReceiveErrorOccurred(RECEIVE_TOO_LONG);
            return;
		}	
        
        RcvBuff.Data[RcvBuff.Len++] = *RxData;				
		RxData++;	
	}
    
    if(!multipacket) {
        RxFrameValid = TRUE;
    }
}	

/********************************************************************
* Function: 	GetTransmitFrame()
*
* Precondition: 
*
* Input: 		Buffer pointer.
*
* Output:		Length of the buffer.
*
* Side Effects:	None.
*
* Overview: 	Gets the complete transmit frame into the "Buff".
*
*			
* Note:		 	None.
********************************************************************/
UINT ControllerGetTransmitFrames(UINT8* usbBuffer)
{
	UINT16 buffLen = 0;
    UINT16 dataLen = TxmBuff.Len;
	UINT16 packetDataCount;
    UINT16 packetIndex = 0;
    WORD_VAL crc;
    
	while(dataLen) 
	{
        if(buffLen >= USB_BUFFER_SIZE)
		{
			SetResponseErrorOccurred(RESPONSE_TOO_LONG);
            return 0;
		}	
        
        usbBuffer[buffLen++] = TxmBuff.Cmd;
        // if greater than 60 bytes, flag for multibyte
        usbBuffer[buffLen++] = (dataLen > 60 ? (60 | 0x80) : dataLen) + 2;
        
        packetDataCount = 0;
		while(dataLen > 0 && packetDataCount < 60)
		{
			usbBuffer[buffLen++] = TxmBuff.Data[packetIndex++];
            dataLen --;
            packetDataCount++;
		} 
        
        crc.Val = CalculateCrc(&usbBuffer[buffLen-packetDataCount-2], usbBuffer[buffLen-packetDataCount-1] & 0x3F);
        
        // Add CRC
        usbBuffer[buffLen++] = crc.byte.LB;
        usbBuffer[buffLen++] = crc.byte.HB;	
	}	
    
    // pad 0xFF to 64 byte boundary since we always send 64 bytes per packet
    packetDataCount = buffLen % 64;
    while(packetDataCount-- > 0) {
        usbBuffer[buffLen++] = 0xFF;
    }
    
    TxmBuff.Len = 0; // Purge this buffer, no more required.
	
	return(buffLen); // Return buffer length.
	
}	


