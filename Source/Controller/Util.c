#include "GenericTypeDefs.h"
#include "./HardwareProfile/HardwareProfile.h"
#include <stdlib.h>
#include <plib.h>
#include "./Controller/Util.h"

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

/********************************************************************
* Function: 	DelayMs()
*
* Precondition: 
*
* Input: 		Length of delay in ms
*
* Output:		None
*
* Side Effects:	None.
*
* Overview:     Executes while loop for given duration.
*
*			
* Note:		 	None.
********************************************************************/	
void DelayMs(UINT32 msecs)
{
    volatile UINT32 start = ReadCoreTimer();
    UINT32 delayTicks = ((GetSystemClock()/2) / 1000) * msecs;
    while ((UINT32)(ReadCoreTimer() - start) < delayTicks);
}
