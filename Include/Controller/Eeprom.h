#ifndef I2C_EEPROM_H
#define	I2C_EEPROM_H

#define EE_I2C I2C2
#define EE_ADDR 0xA0
#define EE_RETRY_COUNT 1000
#define EE_RESEND_COUNT 10
#define EE_ACK_POLLING_COUNT 10000

typedef enum _EEPROM_STATUS {
    EEPROM_FAIL = -1,
    EEPROM_IN_PROGRESS = 0,
    EEPROM_SUCCESS = 1   
} EEPROM_STATUS;

typedef enum _EEPROM_STATE_MACHINE
{
    EE_INIT = 0,            // 00
    EE_START,               // 01
    EE_START_WAIT,          // 02
    EE_RESTART,             // 03
    EE_RESTART_WAIT,        // 04
    EE_STOP,                // 05
    EE_DEVICE,              // 06
    EE_DEVICE_WAIT,         // 07
    EE_SEND_ADDRESS,        // 08 todo - add support for 16 bit address
    EE_SEND_ADDRESS_WAIT,   // 09
    EE_READ_BEGIN,          // 0A
    EE_READ_BEGIN_WAIT,     // 0B
    EE_RECEIVE,             // 0C
    EE_RECEIVE_WAIT,        // 0D
    EE_SEND,                // 0E
    EE_SEND_WAIT,           // 0F
    EE_SEND_INCREMENT,      // 10
    EE_SEND_PAGE_BOUNDARY,  // 11
    EE_RESEND,              // 12
    EE_ERROR = 0xFF         // FF
} EEPROM_STATE_MACHINE;

typedef struct __EEPROM_HANDLE 
{
    __I2C1ACONbits_t *I2CCON;
    __I2C1STATbits_t *I2CSTAT;
    DWORD clock;
    I2C_MODULE id;
    unsigned int address;
    unsigned char *data;
    unsigned int len;
    WORD deviceAddress;
    WORD retry;
    WORD resend;
    WORD pageSize;
    WORD pageCount;
    BYTE * I2CTRN;
    BYTE * I2CRCV;
    EEPROM_STATE_MACHINE deviceState;
    BOOL address16bit;
} EEPROM_HANDLE;
//#define EEPROM_HANDLE struct _EEPROM_HANDLE

#ifdef	__cplusplus
extern "C" {
#endif

int EepromInit(EEPROM_HANDLE *handle, I2C_MODULE id, DWORD clock, WORD deviceAddress, BOOL address16bit);
int EepromRead(EEPROM_HANDLE *handle);
int EepromWrite(EEPROM_HANDLE *handle);


// cts debug
void resetDebug();
int getDebug(char *d);

#ifdef	__cplusplus
}
#endif

#endif	/* I2C_EEPROM_H */

