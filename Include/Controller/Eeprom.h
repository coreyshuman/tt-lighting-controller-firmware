#ifndef I2C_EEPROM_H
#define	I2C_EEPROM_H

#define EE_I2C I2C2
#define EE_ADDR 0xA0
#define EE_RETRY 1000;

typedef enum _EEPROM_STATE_MACHINE
{
    EE_INIT = 0,
    EE_START,
    EE_START_WAIT,
    EE_RESTART,
    EE_RESTART_WAIT,
    EE_STOP,
    EE_DEVICE,
    EE_DEVICE_WAIT,
    EE_SEND_ADDRESS,        // todo - add support for 16 bit address
    EE_SEND_ADDRESS_WAIT,
    EE_READ_BEGIN,
    EE_READ_BEGIN_WAIT,
    EE_RECEIVE,
    EE_RECEIVE_WAIT,
    EE_SEND,
    EE_SEND_WAIT,
    EE_SEND_INCREMENT,
    EE_SEND_PAGE_BOUNDARY,
    EE_RESEND
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
int EepromRead2(EEPROM_HANDLE *handle);
int EepromWrite2(EEPROM_HANDLE *handle);
void EepromRead(unsigned int ee_addr, unsigned char *buf, unsigned int len);
void EepromWritePage(unsigned int ee_addr, unsigned char *buf, unsigned int len);
void EepromWrite(unsigned int ee_addr, unsigned char *buf, unsigned int len);


#ifdef	__cplusplus
}
#endif

#endif	/* I2C_EEPROM_H */

