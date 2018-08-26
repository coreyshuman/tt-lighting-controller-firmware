#include "Include\GenericTypeDefs.h"
#include "Include\HardwareProfile\HardwareProfile.h"
#include <stdlib.h>
#include <plib.h>
#include "Controller/Eeprom.h"

#define EE_I2C I2C2
#define EE_ADDR 0xA0

void EepromInit(void)
{
    I2CConfigure(EE_I2C, I2C_ENABLE_SLAVE_CLOCK_STRETCHING | I2C_ENABLE_HIGH_SPEED);
    I2CSetFrequency(EE_I2C, GetPeripheralClock(), 400000);
    I2CEnable(EE_I2C, TRUE);
}

void EepromRead(unsigned int ee_addr, unsigned char *buf, unsigned int len)
{
    
    // Start
    StartI2C2();
    IdleI2C2();

    MasterWriteI2C2(EE_ADDR | 0);        // Write control byte
    IdleI2C2();
    if (I2C2STATbits.ACKSTAT)    return;            // NACK'ed by slave ?
    MasterWriteI2C2(ee_addr);            // Address of operation
    IdleI2C2();
    if (I2C2STATbits.ACKSTAT)    return;            // NACK'ed by slave ?

    RestartI2C2();
    IdleI2C2();
    MasterWriteI2C2(EE_ADDR | 1);        // Read command
    IdleI2C2();
    if (I2C2STATbits.ACKSTAT)    return;            // NACK'ed by slave ?
    while (len)
    {
     I2C2CONbits.RCEN = 1;
     while(!DataRdyI2C2());
     *buf = I2C2RCV;
     buf++;
     len--;
     if (len)
     {
         // ACK the slave
         I2C2CONbits.ACKDT = 0;
         I2C2CONbits.ACKEN = 1;
     }
     else
     {
         // NACK the slave
         I2C2CONbits.ACKDT = 1;
         I2C2CONbits.ACKEN = 1;
     }
     while(I2C2CONbits.ACKEN == 1);    // Wait till ACK/NACK sequence is over 
    }
    StopI2C2();
    IdleI2C2();
    
}

void EepromWritePage(unsigned int ee_addr, unsigned char *buf, unsigned int len)
{
    
    // Start
    StartI2C2();
    IdleI2C2();

    MasterWriteI2C2(EE_ADDR | 0);        // Write control byte
    IdleI2C2();
    if (I2C2STATbits.ACKSTAT)    return;            // NACK'ed by slave ?

    MasterWriteI2C2(ee_addr >> 8);            // Address of operation
    IdleI2C2();
    if (I2C2STATbits.ACKSTAT)    return;            // NACK'ed by slave ?

    MasterWriteI2C2(ee_addr);            // Address of operation
    IdleI2C2();
    if (I2C2STATbits.ACKSTAT)    return;            // NACK'ed by slave ?

    while (len)
    {
     MasterWriteI2C2(*buf++);
     IdleI2C2();
     if (I2C2STATbits.ACKSTAT)    return;            // NACK'ed by slave ?
     len--;
    }
    StopI2C2();
    IdleI2C2();

    // Do acknowledge poll (indicating, that eeprom has completed flashing our bytes
    while(1) {
     StartI2C2();
     IdleI2C2();

     MasterWriteI2C2(EE_ADDR | 0);    // Call the eeprom
     IdleI2C2();

     if (I2C2STATbits.ACKSTAT==0) break;
     StopI2C2();
     IdleI2C2();
    }

    StopI2C2();
    IdleI2C2();
    
}

void EepromWrite(unsigned int ee_addr, unsigned char *buf, unsigned int len)
{
    
    int bytes_to_write;
    while (len)
    {
     bytes_to_write = 0x100;    // 256 byte page size
     if (len<bytes_to_write) bytes_to_write = len;
     EepromWritePage(ee_addr, buf, bytes_to_write);
     len-=bytes_to_write;
     buf+=bytes_to_write;
     ee_addr+=bytes_to_write;
    }
    
}