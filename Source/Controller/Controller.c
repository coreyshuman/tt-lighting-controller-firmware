#include "Include\GenericTypeDefs.h"
#include "Include\HardwareProfile\HardwareProfile.h"
#include <stdlib.h>
#include <plib.h>
#include "Controller.h"

typedef enum
{
	READ_BOOT_INFO = 1,
	ERASE_FLASH, 
	PROGRAM_FLASH,
	READ_CRC,
	JMP_TO_APP
	
}T_COMMANDS;	


typedef struct
{
	UINT8 Cmd;
    UINT Len;
	UINT8 Data[CONTROLLER_BUFF_SIZE];
	
}T_FRAME;

typedef struct 
{
	UINT8 RecDataLen;
	DWORD_VAL Address;
	UINT8 RecType;
	UINT8* Data;
	UINT8 CheckSum;	
	DWORD_VAL ExtSegAddress;
	DWORD_VAL ExtLinAddress;
}T_HEX_RECORD;	


static const UINT8 BootInfo[2] =
{
    MAJOR_VERSION,
    MINOR_VERSION
};


static T_FRAME RcvBuff;
static T_FRAME TxmBuff;
static BOOL RxFrameValid;
static EEPROM_HANDLE eepromHandle;
static config_t* configHandle;


void HandleCommand(void);

void ControllerInitialize(void) 
{
    EepromInit(&eepromHandle, EE_I2C, 400000, 0xA0, FALSE);
    configHandle = ConfigInit(&eepromHandle);
    LightingInit();
    AnimationInit(configHandle);
    FanInit();
    
    AnimationSetInterval(500);
    
    AnimationUpdate();
    AnimationStart();
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
    RcvBuff.Data[0] = 0x40;
    RcvBuff.Data[1] = errorCode;
}

// Setup send response to USB. Data is copied to TX buffer if data not NULL.
void SetResponseSendData(const void* data, UINT8 len)
{
    if(len > CONTROLLER_BUFF_SIZE) {
        SetResponseErrorOccured(RESPONSE_TOO_LONG);
        return;
    }
    if(data != NULL) {
        memcpy(&TxmBuff.Data[0], data, len);
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
    UINT8 length;
    EEPROM_STATUS eepromStatus;
	// First byte of the data field is command.
	cmd = RcvBuff.Data[0];
	// Partially build response frame. First byte in the data field carries command.
	TxmBuff.Cmd = cmd;
	
	// Reset the response length to 0.
	TxmBuff.Len = 0;
				
	// Process the command.		
	switch(cmd)
	{
		case READ_BOOT_INFO: // Read boot loader version info.
			memcpy((void *)&TxmBuff.Data[1], (const void*)&BootInfo, 2);
			//Set the transmit frame length.
			TxmBuff.Len = 2 + 1; // Boot Info Fields	+ command
			break;
         case CMD_READ_CONFIG:
            SetResponseSendData((const void*)configHandle, ConfigSize);
            break;
            
        case CMD_READ_FANSPEED: // read fan speed
            SetResponseSendData((const void*)&fan1speed, 2);
			break;
			
        case CMD_READ_EEPROM: // read eeprom, max 30 bytes at a time
            eepromHandle.data = &TxmBuff.Data[0];
            eepromHandle.len = RcvBuff.Data[2];
            eepromHandle.address = RcvBuff.Data[1];
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
            eepromHandle.data = &RcvBuff.Data[3];
            //eepromHandle.len = RcvBuff.Data[2];
            eepromHandle.address = RcvBuff.Data[1];
            length = RcvBuff.Data[2];
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
            SetResponseErrorOccured(RcvBuff.Data[1]);
            break;
	    default:
	    	SetResponseErrorOccured(UNKNOWN_COMMAND);
	    	break;
	}   
	

		
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
    
    // if data already in buffer, we are in multipacket mode. Skip cmd and data
    if(RcvBuff.Len > 0) {
        if(RxFrameValid) {
            SetReceiveErrorOccured(USB_PACKET_OVERFLOW);
            return;
        } else if(RcvBuff.Cmd == RxData[0]) {
            RxLen = RxData[1] & 0x3F; // Read length byte
            RxData += 2;
        } else {
            SetReceiveErrorOccured(INVALID_MULTIPACKET);
            return;
        }
    } else {
        RcvBuff.Cmd = RxData[0];
        RxLen = RxData[1] & 0x3F + 2; // Read length byte, + 2 for CMD and LEN
    }
	
	while(RxLen > 0)
	{
		RxLen--;
		
		if(RcvBuff.Len >= sizeof(RcvBuff.Data))
		{
			SetReceiveErrorOccured(RECEIVE_TOO_LONG);
            RxFrameValid = TRUE;
            return;
		}	
        
        RcvBuff.Data[RcvBuff.Len++] = *RxData;				
		RxData++;	
	}
    
    crc.byte.LB = RcvBuff.Data[RcvBuff.Len-2];
    crc.byte.HB = RcvBuff.Data[RcvBuff.Len-1];
    if((CalculateCrc(RcvBuff.Data, (UINT32)(RcvBuff.Len-2)) == crc.Val) && (RcvBuff.Len > 2)) {
        // CRC matches and frame received is valid.
        if(multipacket) {
            RxFrameValid = TRUE;
        }
    } else {
        RcvBuff.Cmd = 0;
        RcvBuff.Len = 0;
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
	INT buffLen = 0;
    INT dataLen = TxmBuff.Len;
	WORD_VAL crc;
	UINT8 packetDataCount;
    UINT8 packetIndex = 0;
    
	while(dataLen) 
	{
        if(buffLen >= CONTROLLER_BUFF_SIZE)
		{
			SetResponseErrorOccured(RESPONSE_TOO_LONG);
            return 0;
		}	
        
        usbBuffer[buffLen++] = TxmBuff.Cmd;
        // if greater than 60 bytes, flag for multibyte
        usbBuffer[buffLen++] = (dataLen > 60 ? (62 | 0x80) : dataLen) + 2;
        
        packetDataCount = 0;
		while(dataLen > 0 && packetDataCount < 60)
		{
			usbBuffer[buffLen++] = TxmBuff.Data[packetIndex++];
            dataLen --;
		} 
        
        crc = CalculateCrc(&usbBuffer[buffLen-packetDataCount-2], usbBuffer[buffLen-packetDataCount-1]);
        
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


