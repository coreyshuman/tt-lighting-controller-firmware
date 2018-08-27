#include "Include\GenericTypeDefs.h"
#include "Include\HardwareProfile\HardwareProfile.h"
#include <stdlib.h>
#include <plib.h>
#include "Controller/Eeprom.h"

int EepromInit(EEPROM_HANDLE *handle, I2C_MODULE id, DWORD clock, WORD deviceAddress, BOOL address16bit)
{
    WORD *dataPtr;
    switch(id)
    {
        case I2C1:
            handle->I2CCON = &I2C1CON;
            handle->I2CSTAT = &I2C1STAT;
            handle->I2CTRN = &I2C1TRN;
            handle->I2CRCV = &I2C1RCV;
            TRISBbits.TRISB8 = 0;
            TRISBbits.TRISB9 = 0;
            break;
        case I2C2:
            handle->I2CCON = &I2C2CON;
            handle->I2CSTAT = &I2C2STAT;
            handle->I2CTRN = &I2C2TRN;
            handle->I2CRCV = &I2C2RCV;
            TRISBbits.TRISB2 = 0;
            TRISBbits.TRISB3 = 0;
            ANSELBbits.ANSB2 = 0;
            ANSELBbits.ANSB3 = 0;
            break;
        default:
            return 0;
    }
    dataPtr = handle->I2CCON;
    handle->deviceState = EE_INIT;
    handle->id = id;
    handle->deviceAddress = deviceAddress & 0xF7;
    handle->address16bit = address16bit;
    handle->retry = EE_RETRY;
    handle->resend = 0;
    *dataPtr = (WORD)0;
    handle->clock = I2CSetFrequency(id, GetPeripheralClock(), clock);
    *dataPtr = (WORD)I2C_ENABLE_HIGH_SPEED;
    *dataPtr = *dataPtr | (WORD)0x8000;
    return 1;
}

BOOL I2CIdle(EEPROM_HANDLE *handle)
{
    return (!handle->I2CCON->SEN && !handle->I2CCON->PEN && !handle->I2CSTAT->TRSTAT && !handle->I2CCON->ACKEN);
}

BOOL CheckRetry(EEPROM_HANDLE *handle) {
    if(handle->retry <= 0 || handle->resend >= 3) {
        handle->deviceState = EE_INIT;
        handle->retry = EE_RETRY;
        return TRUE;
    }
    return FALSE;
}

void EEStart(EEPROM_HANDLE *handle, EEPROM_STATE_MACHINE next)
{
    switch(handle->deviceState)
    {
        case EE_INIT:
            if(!I2CIdle(handle)) {
                handle->retry --;
                break;
            }
            handle->deviceState = EE_START;
            // fallthrough
        case EE_START:
            handle->I2CCON->SEN = 1;
            handle->deviceState = EE_START_WAIT;
            handle->retry = EE_RETRY;
            // fallthrough
        case EE_START_WAIT:
            if(handle->I2CCON->SEN) {
                handle->retry --;
                break;
            }
            handle->deviceState = next;
            handle->retry = EE_RETRY;
            break;
        case EE_RESEND:
            handle->I2CCON->PEN = 1;
            handle->resend ++;
            handle->retry = EE_RETRY;
            handle->deviceState = EE_INIT;
            break;
        default:
            handle->deviceState = EE_INIT;
    }
}

void EEReStart(EEPROM_HANDLE *handle, EEPROM_STATE_MACHINE next)
{
    switch(handle->deviceState)
    {
        case EE_RESTART:
            if(!I2CIdle(handle)) {
                handle->retry --;
                break;
            }
            handle->I2CCON->RSEN = 1;
            handle->deviceState = EE_RESTART_WAIT;
            handle->retry = EE_RETRY;
            // fallthrough
        case EE_RESTART_WAIT:
            if(handle->I2CCON->RSEN) {
                handle->retry --;
                break;
            }
            handle->deviceState = next;
            handle->retry = EE_RETRY;
            break;
        default:
            handle->deviceState = EE_INIT;
    }
}

BOOL EEStop(EEPROM_HANDLE *handle)
{
    if(!I2CIdle(handle)) {
        handle->retry --;
        return FALSE;
    }
    handle->I2CCON->PEN = 1;
    handle->deviceState = EE_INIT;
    handle->retry = EE_RETRY;
    return TRUE;
}

void EESend(EEPROM_HANDLE *handle, BYTE data, EEPROM_STATE_MACHINE next)
{
    if(handle->I2CSTAT->TBF || handle->I2CSTAT->TRSTAT) {
        handle->retry --;
        return;
    }
    *(handle->I2CTRN) = data;
    handle->deviceState = next;
    handle->retry = EE_RETRY;

}

void EESendWaitForCompletion(EEPROM_HANDLE *handle, EEPROM_STATE_MACHINE next)
{
    // wait for transmit completion
    if(handle->I2CSTAT->TRSTAT) {
        handle->retry --;
        return;
    }
    // if no ack, restart transaction
    if(handle->I2CSTAT->ACKSTAT) {
        handle->deviceState = EE_RESEND;
        return;
    }
    handle->deviceState = next;
    handle->retry = EE_RETRY;
}

void EESendIncrement(EEPROM_HANDLE *handle)
{
    handle->data++;
    handle->len --;
    if(handle->len > 0) {
        handle->deviceState = EE_SEND;
    } else {
        handle->deviceState = EE_STOP;
    }
}

void EERead(EEPROM_HANDLE *handle, EEPROM_STATE_MACHINE next)
{
    if(!I2CIdle(handle)) {
        handle->retry --;
        return;
    }
    handle->I2CCON->RCEN = 1;
    handle->deviceState = next;
}

void EEReadWait(EEPROM_HANDLE *handle)
{
    if(!handle->I2CSTAT->RBF) {
        handle->retry --;
        return;
    }
    *(handle->data) = *(handle->I2CRCV);
    handle->data++;
    handle->len --;
    if(handle->len > 0) {
        handle->I2CCON->ACKDT = 0;
        handle->deviceState = EE_RECEIVE;
    } else {
        handle->I2CCON->ACKDT = 1;
        handle->deviceState = EE_STOP;
    }
    handle->I2CCON->ACKEN = 1;
}

int EepromRead2(EEPROM_HANDLE *handle)
{
    int ret = 0;
    if(CheckRetry(handle)) return -1;
    
    switch(handle->deviceState)
    {
        case EE_INIT:
        case EE_RESEND:
        case EE_START:
        case EE_START_WAIT:
            EEStart(handle, EE_DEVICE);
            break;
        case EE_DEVICE:
            EESend(handle, handle->deviceAddress | I2C_WRITE, EE_DEVICE_WAIT);
            break;
        case EE_DEVICE_WAIT:
            EESendWaitForCompletion(handle, EE_SEND_ADDRESS);
            break;
        case EE_SEND_ADDRESS:
            EESend(handle, handle->address, EE_SEND_ADDRESS_WAIT);
            break;
        case EE_SEND_ADDRESS_WAIT:
            EESendWaitForCompletion(handle, EE_RESTART);
            break;
        case EE_RESTART:
        case EE_RESTART_WAIT:
            EEReStart(handle, EE_READ_BEGIN);
            break;
        case EE_READ_BEGIN:
            EESend(handle, handle->deviceAddress | I2C_READ, EE_READ_BEGIN_WAIT);
            break;
        case EE_READ_BEGIN_WAIT:
            EESendWaitForCompletion(handle, EE_RECEIVE);
            break;
        case EE_RECEIVE:
            EERead(handle, EE_RECEIVE_WAIT);
            break;
        case EE_RECEIVE_WAIT:
            EEReadWait(handle);
            break;
        case EE_STOP:
            ret = EEStop(handle);
            break;
        default:
            handle->deviceState = EE_INIT;
            ret = -1;
            break;
    }
    
    return ret;
     
}

int EepromWrite2(EEPROM_HANDLE *handle)
{
    int ret = 0;
    if(CheckRetry(handle)) return -1;
    
    switch(handle->deviceState)
    {
        case EE_INIT:
        case EE_RESEND:
        case EE_START:
        case EE_START_WAIT:
            EEStart(handle, EE_DEVICE);
            break;
        case EE_DEVICE:
            EESend(handle, handle->deviceAddress | I2C_WRITE, EE_DEVICE_WAIT);
            break;
        case EE_DEVICE_WAIT:
            EESendWaitForCompletion(handle, EE_SEND_ADDRESS);
            break;
        case EE_SEND_ADDRESS:
            EESend(handle, handle->address, EE_SEND_ADDRESS_WAIT);
            break;
        case EE_SEND_ADDRESS_WAIT:
            EESendWaitForCompletion(handle, EE_SEND);
            break;
        case EE_SEND:
            EESend(handle, *(handle->data), EE_SEND_WAIT);
            break;
        case EE_SEND_WAIT:
            EESendWaitForCompletion(handle, EE_SEND_INCREMENT);
            break;
        case EE_SEND_INCREMENT:
            EESendIncrement(handle);
            break;
        case EE_STOP:
            ret = EEStop(handle);
            break;
        default:
            handle->deviceState = EE_INIT;
            ret = -1;
            break;
    }
    
    return ret;
     
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