#include "Include\GenericTypeDefs.h"
#include "Include\HardwareProfile\HardwareProfile.h"
#include <stdlib.h>
#include <plib.h>
#include "Controller/Eeprom.h"

static char eepromDebug[960];
static int eepromDebugLen;
static EEPROM_STATE_MACHINE eepromDebugLastState = 0xFF;

void putDebug(char d) {
    if(eepromDebugLen >= 960) {
        return;
    }
    eepromDebug[eepromDebugLen++] = d;
}

void resetDebug() {
    eepromDebugLen = 0;
    eepromDebugLastState = 0xFF;
}

int getDebug(char *d) {
    int i;
    for(i=0; i < eepromDebugLen; i++) {
        d[i] = eepromDebug[i];
    }
    return eepromDebugLen;
}

int EepromInit(EEPROM_HANDLE *handle, I2C_MODULE id, DWORD clock, WORD deviceAddress, BOOL address16bit)
{
    WORD *dataPtr;
    switch(id)
    {
        case I2C1:
            handle->I2CCON = (__I2C1ACONbits_t *)&I2C1CON;
            handle->I2CSTAT = (__I2C1STATbits_t *)&I2C1STAT;
            handle->I2CTRN = (BYTE*)&I2C1TRN;
            handle->I2CRCV = (BYTE*)&I2C1RCV;
            TRISBbits.TRISB8 = 0;
            TRISBbits.TRISB9 = 0;
            break;
        case I2C2:
            handle->I2CCON = (__I2C1ACONbits_t *)&I2C2CON;
            handle->I2CSTAT = (__I2C1STATbits_t *)&I2C2STAT;
            handle->I2CTRN = (BYTE*)&I2C2TRN;
            handle->I2CRCV = (BYTE*)&I2C2RCV;
            TRISBbits.TRISB2 = 0;
            TRISBbits.TRISB3 = 0;
            ANSELBbits.ANSB2 = 0;
            ANSELBbits.ANSB3 = 0;
            break;
        default:
            return 0;
    }
    dataPtr = (WORD*)handle->I2CCON;
    handle->deviceState = EE_INIT;
    handle->id = id;
    handle->deviceAddress = deviceAddress & 0xF7;
    handle->address16bit = address16bit;
    handle->pageSize = 8;
    handle->pageCount = 0;
    handle->retry = EE_RETRY_COUNT;
    handle->resend = EE_RESEND_COUNT;
    *dataPtr = (WORD)0;
    handle->clock = I2CSetFrequency(id, GetPeripheralClock(), clock);
    *dataPtr = (WORD)I2C_ENABLE_HIGH_SPEED;
    *dataPtr = *dataPtr | (WORD)0x8000;
    
    resetDebug();
    return 1;
}

BOOL I2CIdle(EEPROM_HANDLE *handle)
{
    return (!handle->I2CCON->SEN && !handle->I2CCON->PEN && !handle->I2CSTAT->TRSTAT && !handle->I2CCON->ACKEN);
}

void EEStart(EEPROM_HANDLE *handle, EEPROM_STATE_MACHINE next)
{
    volatile int wait;
    switch(handle->deviceState)
    {
        case EE_INIT:
            if(!I2CIdle(handle)) {
                handle->retry --;
                break;
            }
            handle->deviceState = EE_START;
            handle->pageCount = 0;
            // fallthrough
        case EE_START:
            handle->I2CCON->SEN = 1;
            handle->deviceState = EE_START_WAIT;
            handle->retry = EE_RETRY_COUNT;
            // fallthrough
        case EE_START_WAIT:
            if(handle->I2CCON->SEN || handle->I2CCON->RSEN) {
                handle->retry --;
                break;
            }
            handle->deviceState = next;
            handle->retry = EE_RETRY_COUNT;
            break;
        case EE_RESEND:
            handle->I2CCON->RSEN = 1;
            handle->resend --;
            handle->retry = EE_RETRY_COUNT;
            handle->deviceState = EE_START_WAIT;
            wait = 8000;
            while(wait-- > 0); // wait ~1ms so we don't spam the eeprom
            break;
        default:
            handle->deviceState = EE_ERROR;
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
            handle->retry = EE_RETRY_COUNT;
            // fallthrough
        case EE_RESTART_WAIT:
            if(handle->I2CCON->RSEN) {
                handle->retry --;
                break;
            }
            handle->deviceState = next;
            handle->retry = EE_RETRY_COUNT;
            break;
        default:
            handle->deviceState = EE_ERROR;
            putDebug('$');
            break;
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
    handle->retry = EE_RETRY_COUNT;
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
    handle->retry = EE_RETRY_COUNT;

}

// Wait for slave to ack data. If polling enabled, master will retry if no
//  ack was received.
void EESendWaitForCompletion(EEPROM_HANDLE *handle, BOOL polling, EEPROM_STATE_MACHINE next)
{
    // wait for transmit completion
    if(handle->I2CSTAT->TRSTAT) {
        handle->retry --;
        return;
    }
    // if no ack, error out
    if(handle->I2CSTAT->ACKSTAT) {
        if(polling) {
            handle->deviceState = EE_RESEND;
        } else {
            handle->deviceState = EE_ERROR;
            putDebug('%');
        }
        return;
    }
    handle->deviceState = next;
    handle->retry = EE_RETRY_COUNT;
}

void EESendIncrement(EEPROM_HANDLE *handle)
{
    handle->data ++;
    handle->len --;
    handle->pageCount ++;
    if(handle->len > 0) {
        if(handle->pageCount >= handle->pageSize) {
            handle->address += handle->pageSize;
            handle->resend = EE_ACK_POLLING_COUNT;
            handle->retry = EE_RETRY_COUNT;
            handle->deviceState = EE_SEND_PAGE_BOUNDARY;
        } else {
            handle->deviceState = EE_SEND;
        }
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
    handle->retry = EE_RETRY_COUNT;
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
    handle->retry = EE_RETRY_COUNT;
}

BOOL CheckRetry(EEPROM_HANDLE *handle) {
    if(handle->retry <= 0 || handle->resend <= 0 || handle->deviceState == EE_ERROR) {
        EEStop(handle);
        putDebug('!');
        return TRUE;
    }
    return FALSE;
}

int EepromRead(EEPROM_HANDLE *handle)
{
    // cts debug
    if(handle->deviceState != eepromDebugLastState) {
        eepromDebugLastState = handle->deviceState;
        putDebug(handle->deviceState);
    }
    int ret = 0;
    if(CheckRetry(handle)) return EEPROM_FAIL;
    
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
            EESendWaitForCompletion(handle, TRUE, EE_SEND_ADDRESS);
            break;
        case EE_SEND_ADDRESS:
            EESend(handle, handle->address, EE_SEND_ADDRESS_WAIT);
            break;
        case EE_SEND_ADDRESS_WAIT:
            EESendWaitForCompletion(handle, FALSE, EE_RESTART);
            break;
        case EE_RESTART:
        case EE_RESTART_WAIT:
            EEReStart(handle, EE_READ_BEGIN);
            break;
        case EE_READ_BEGIN:
            EESend(handle, handle->deviceAddress | I2C_READ, EE_READ_BEGIN_WAIT);
            break;
        case EE_READ_BEGIN_WAIT:
            EESendWaitForCompletion(handle, FALSE, EE_RECEIVE);
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
            handle->deviceState = EE_ERROR;
            putDebug('"');
            break;
    }
    
    return ret;
     
}

int EepromWrite(EEPROM_HANDLE *handle)
{
    // cts debug
    if(handle->deviceState != eepromDebugLastState) {
        eepromDebugLastState = handle->deviceState;
        putDebug(handle->deviceState);
    }
    
    int ret = 0;
    if(CheckRetry(handle)) return EEPROM_FAIL;
    
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
            EESendWaitForCompletion(handle, TRUE, EE_SEND_ADDRESS);
            break;
        case EE_SEND_ADDRESS:
            EESend(handle, handle->address, EE_SEND_ADDRESS_WAIT);
            break;
        case EE_SEND_ADDRESS_WAIT:
            EESendWaitForCompletion(handle, FALSE, EE_SEND);
            break;
        case EE_SEND:
            EESend(handle, *(handle->data), EE_SEND_WAIT);
            break;
        case EE_SEND_WAIT:
            EESendWaitForCompletion(handle, FALSE, EE_SEND_INCREMENT);
            break;
        case EE_SEND_INCREMENT:
            EESendIncrement(handle);
            break;
        case EE_SEND_PAGE_BOUNDARY:
            EEStop(handle);
            break;
        case EE_STOP:
            ret = EEStop(handle);
            break;
        default:
            handle->deviceState = EE_ERROR;
            putDebug('#');
            break;
    }
    
    return ret;
     
}
