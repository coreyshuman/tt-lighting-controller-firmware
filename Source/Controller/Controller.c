#include "Include\GenericTypeDefs.h"
#include "Include\HardwareProfile\HardwareProfile.h"
#include <stdlib.h>
#include <plib.h>
#include <string.h>
#include "Config.h"
#include "Controller.h"

typedef struct
{
	UINT8 Cmd;
    UINT16 Len;
	UINT8 Data[CONTROLLER_BUFF_SIZE];
	
}T_FRAME;

static const UINT8 FirmwareInfo[2] __attribute__((section("app_vars"), address(0x9FC00920))) =
{
    MAJOR_VERSION,
    MINOR_VERSION
};


static T_FRAME RcvBuff;
static T_FRAME TxmBuff;
static BOOL RxFrameValid;
static EEPROM_HANDLE eepromHandle;
static config_t* configHandle;
static BYTE ControllerAddress = 0;




void HandleCommand(void);
BOOL ControlUpdateConfig(void);
void ControlDefaultConfig(void);


void ControllerInitialize(void) 
{
    EepromInit(&eepromHandle, EE_I2C, 400000, EE_ADDR, FALSE);
    configHandle = ConfigInit(&eepromHandle);
    
    LightingInit();
    AnimationInit(configHandle);
    
    FanInit();
    FanSetSpeeds(configHandle->fanSpeed);
    FanCaptureEnable();
    
    AnimationSetInterval(ANIMATION_INTERVAL);
    AnimationUpdate();
    AnimationStart();
    
    RxFrameValid = FALSE;
    
    ControllerAddress = PORTA & 0x03 | ((PORTB & 0x03) << 2);
}

void ControllerLoop(void)
{
    if(LedBusy) return;
    
    AnimationUpdate();
    FanLoop();
    
    if(RxFrameValid)
	{
		// Valid frame received, process the command.
		HandleCommand();	
		// Reset the flag.
		RxFrameValid = FALSE;			
	}      
}

void SetResponseErrorOccured(CONTROL_ERROR_CODES errorCode)
{
    TxmBuff.Cmd = 0x40;
    TxmBuff.Len = 1;
    TxmBuff.Data[0] = errorCode;
}

void SetReceiveErrorOccured(CONTROL_ERROR_CODES errorCode)
{
    RcvBuff.Len = 1;
    RcvBuff.Cmd = 0x40;
    RcvBuff.Data[0] = errorCode;
    RxFrameValid = TRUE;
}

// Setup send response to USB. Data is copied to TX buffer if data not NULL.
void SetResponseSendData(BYTE* data, UINT16 len)
{
    if(len > CONTROLLER_BUFF_SIZE) {
        SetResponseErrorOccured(RESPONSE_TOO_LONG);
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
            
        case CMD_READ_CONTROLLER_ADDRESS:
            //TxmBuff.Data[0] = PORTA & 0x03 | ((PORTB & 0x03) << 2);
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
            
        case CMD_READ_FANSPEED: // read fan speed
            SetResponseSendData((BYTE*)&FanSpeed, 10);
			break;
            
        case CMD_READ_EE_DEBUG: // cts debug
            length = getDebug((char *)&TxmBuff.Data[0]);
            SetResponseSendData(NULL, length);
            break;
			
        case CMD_READ_EEPROM: // read eeprom, max 30 bytes at a time
            resetDebug(); // cts debug
            eepromHandle.data = &TxmBuff.Data[0];
            eepromHandle.len = RcvBuff.Data[1];
            eepromHandle.address = RcvBuff.Data[0];
            if(eepromHandle.len + eepromHandle.address >= 256) {
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
                SetResponseErrorOccured(EEPROM_FAILED);
            }
            break;
            
        case CMD_WRITE_EEPROM: // write eeprom, max address is 255
            resetDebug(); // cts debug
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
                SetResponseErrorOccured(EEPROM_FAILED);
            }
            break;
        
        case CMD_ERROR_OCCURED:
            SetResponseErrorOccured(RcvBuff.Data[0]);
            break;
	    default:
	    	SetResponseErrorOccured(UNKNOWN_COMMAND);
	    	break;
	}   
	
    RcvBuff.Len = 0; // clear buffer
		
}

BOOL ControlUpdateConfig(void)
{
    if(configHandle->length != (RcvBuff.Data[2] + (RcvBuff.Data[3] << 8))) {
        return 0;
    }
    memcpy((void*)configHandle, (void*)&RcvBuff.Data[0], ConfigSize);
    AnimationUpdateBuffer();
    FanSetSpeeds(configHandle->fanSpeed);
    return 1;
}

void ControlDefaultConfig(void)
{
    ConfigDefault();
    AnimationUpdateBuffer();
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
            SetReceiveErrorOccured(USB_PACKET_OVERFLOW);
            return;
        } else if(RcvBuff.Cmd != RxData[0]) {
            SetReceiveErrorOccured(INVALID_MULTIPACKET);
            return;
        }
    } else {
        RcvBuff.Cmd = RxData[0];
    }
	
    crc.Val = CalculateCrc(RxData, RxLen);
    RxData += 2; // skip CMD and LEN
    // verify received CRC
    if(crc.byte.LB != *(RxData + RxLen - 2) || crc.byte.HB != *(RxData + RxLen - 1)) {
        SetReceiveErrorOccured(CRC_INVALID);
        return;
    }
    
	while(RxLen > 2)
	{
		RxLen--;
		
		if(RcvBuff.Len >= CONTROLLER_BUFF_SIZE)
		{
			SetReceiveErrorOccured(RECEIVE_TOO_LONG);
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
			SetResponseErrorOccured(RESPONSE_TOO_LONG);
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


