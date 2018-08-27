
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

UINT16 CalculateCrc(UINT8 *data, UINT32 len);
void HandleCommand(void);

void ControllerInitialize(void) 
{
    EepromInit(&eepromHandle, EE_I2C, 400000, 0xA0, FALSE);
    LightingInit();
    AnimationInit();
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
	UINT8 Cmd;
    int ret;
	// First byte of the data field is command.
	Cmd = RcvBuff.Data[0];
	// Partially build response frame. First byte in the data field carries command.
	TxmBuff.Data[0] = RcvBuff.Data[0];
	
	// Reset the response length to 0.
	TxmBuff.Len = 0;
				
	// Process the command.		
	switch(Cmd)
	{
		case READ_BOOT_INFO: // Read boot loader version info.
			memcpy(&TxmBuff.Data[1], &BootInfo, 2);
			//Set the transmit frame length.
			TxmBuff.Len = 2 + 1; // Boot Info Fields	+ command
			break;
            
        case 0x35: // read fan speed
            memcpy(&TxmBuff.Data[1], &fan1speed, 2);
			//Set the transmit frame length.
			TxmBuff.Len = 2 + 1; // fan speed + command
			break;
			
        case 0x38: // read eeprom, max 30 bytes at a time
            if(RcvBuff.Data[2] > 30) {
                RcvBuff.Data[2] = 30;
            }
            eepromHandle.data = &TxmBuff.Data[2];
            eepromHandle.len = RcvBuff.Data[2];
            eepromHandle.address = RcvBuff.Data[1];
            ret = 0;
            while(ret == 0)
            {
                ret = EepromRead2(&eepromHandle);
            }
            if(ret == 1)
            {
                TxmBuff.Data[1] = RcvBuff.Data[2];
                TxmBuff.Len = TxmBuff.Data[1] + 2;
            }
            else
            {
                TxmBuff.Data[1] = 0;
                TxmBuff.Len = 2;
            }
            
            break;
            
        case 0x39: // write eeprom, max address is 255
            if(RcvBuff.Data[1] + RcvBuff.Data[2] >= 256)
            {
                RcvBuff.Data[2] = 256 - RcvBuff.Data[1];
            }
            eepromHandle.data = &RcvBuff.Data[3];
            eepromHandle.len = RcvBuff.Data[2];
            eepromHandle.address = RcvBuff.Data[1];
            ret = 0;
            while(ret == 0)
            {
                ret = EepromWrite2(&eepromHandle);
            }
            
            TxmBuff.Data[1] = ret > 0 ? RcvBuff.Data[2] : 0;
            TxmBuff.Len = 1 + 1; // cmd plus bytes written
            break;
            
	    default:
	    	// Nothing to do.
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
	static BOOL Escape = FALSE;
	WORD_VAL crc;
	
	while((RxLen > 0) && (!RxFrameValid)) // Loop till len = 0 or till frame is valid
	{
		RxLen--;
		
		if(RcvBuff.Len >= sizeof(RcvBuff.Data))
		{
			RcvBuff.Len = 0;
		}	
		
		switch(*RxData)
		{
			
			case SOH: //Start of header
				if(Escape)
				{
					// Received byte is not SOH, but data.
					RcvBuff.Data[RcvBuff.Len++] = *RxData;
					// Reset Escape Flag.
					Escape = FALSE;
				}
				else
				{
					// Received byte is indeed a SOH which indicates start of new frame.
					RcvBuff.Len = 0;				
				}		
				break;
				
			case EOT: // End of transmission
				if(Escape)
				{
					// Received byte is not EOT, but data.
					RcvBuff.Data[RcvBuff.Len++] = *RxData;
					// Reset Escape Flag.
					Escape = FALSE;
				}
				else
				{
					// Received byte is indeed a EOT which indicates end of frame.
					// Calculate CRC to check the validity of the frame.
					if(RcvBuff.Len > 1)
					{
						crc.byte.LB = RcvBuff.Data[RcvBuff.Len-2];
						crc.byte.HB = RcvBuff.Data[RcvBuff.Len-1];
						if((CalculateCrc(RcvBuff.Data, (UINT32)(RcvBuff.Len-2)) == crc.Val) && (RcvBuff.Len > 2))
						{
							// CRC matches and frame received is valid.
							RxFrameValid = TRUE;
												
						}
					}		
					
				}							
				break;
				
				
		    case DLE: // Escape character received.
				if(Escape)
				{
					// Received byte is not ESC but data.
					RcvBuff.Data[RcvBuff.Len++] = *RxData;
					// Reset Escape Flag.
					Escape = FALSE;					
				}
				else
				{
					// Received byte is an escape character. Set Escape flag to escape next byte.
					Escape = TRUE;					
				}	
				break;
			
			default: // Data field.
			    RcvBuff.Data[RcvBuff.Len++] = *RxData;
			    // Reset Escape Flag.
			    Escape = FALSE;
				break;	
			
		}

		//Increment the pointer.
		RxData++;	
	
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
UINT ControllerGetTransmitFrame(UINT8* Buff)
{
	INT BuffLen = 0;
	WORD_VAL crc;
	UINT8 i;
	
	if(TxmBuff.Len) 
	{
		//There is something to transmit.
		// Calculate CRC of the frame.
		crc.Val = CalculateCrc(TxmBuff.Data, (UINT32)TxmBuff.Len);
		TxmBuff.Data[TxmBuff.Len++] = crc.byte.LB;
		TxmBuff.Data[TxmBuff.Len++] = crc.byte.HB; 	
		
		// Insert SOH (Indicates beginning of the frame)	
		Buff[BuffLen++] = SOH;
		
		// Insert Data Link Escape Character.
		for(i = 0; i < TxmBuff.Len; i++)
		{
			if((TxmBuff.Data[i] == EOT) || (TxmBuff.Data[i] == SOH)
				|| (TxmBuff.Data[i] == DLE))
			{
				// EOT/SOH/DLE repeated in the data field, insert DLE.
				Buff[BuffLen++] = DLE;			
			}
			Buff[BuffLen++] = TxmBuff.Data[i];
		} 
		
		// Mark end of frame with EOT.
		Buff[BuffLen++] = EOT;
		
		TxmBuff.Len = 0; // Purge this buffer, no more required.
	}	
	
	return(BuffLen); // Return buffer length.
	
}	

/**
 * Static table used for the table_driven implementation.
 *****************************************************************************/
static const UINT16 crc_table[16] = 
{
    0x0000, 0x1021, 0x2042, 0x3063, 0x4084, 0x50a5, 0x60c6, 0x70e7,
    0x8108, 0x9129, 0xa14a, 0xb16b, 0xc18c, 0xd1ad, 0xe1ce, 0xf1ef
};

/********************************************************************
* Function: 	CalculateCrc()
*
* Precondition: 
*
* Input: 		Data pointer and data length
*
* Output:		CRC.
*
* Side Effects:	None.
*
* Overview:     Calculates CRC for the given data and len
*
*			
* Note:		 	None.
********************************************************************/	
UINT16 CalculateCrc(UINT8 *data, UINT32 len)
{
    UINT i;
    UINT16 crc = 0;
    
    while(len--)
    {
        i = (crc >> 12) ^ (*data >> 4);
	    crc = crc_table[i & 0x0F] ^ (crc << 4);
	    i = (crc >> 12) ^ (*data >> 0);
	    crc = crc_table[i & 0x0F] ^ (crc << 4);
	    data++;
	} 

    return (crc & 0xFFFF);
}
