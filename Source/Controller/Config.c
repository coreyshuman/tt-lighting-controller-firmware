#include "GenericTypeDefs.h"
#include "./HardwareProfile/HardwareProfile.h"
#include <stdlib.h>
#include <plib.h>
#include "./Controller/Config.h"
#include "./Controller/Animation.h"
#include "./Controller/Debug.h"

static DWORD DefaultColors[] = {PINK, WINE, RED, ORANGE, SUNSET, YELLOW, LIME, GREEN, TEAL, BLUE, INDIGO, VIOLET};
//static DWORD DefaultColors[] = {BLACK, WINE, BLACK, BLACK, BLACK, BLACK, LIME, BLACK, BLACK, BLACK, BLACK, BLACK};

static config_t Config;
static EEPROM_HANDLE *configEepromHandle;

EEPROM_STATUS ReadWriteEepromConfig(EEPROM_HANDLE *eeHandle, config_t *config, BOOL write);
BOOL VerifyConfig(EEPROM_HANDLE *eeHandle, config_t *config);
EEPROM_STATUS ReadConfig(EEPROM_HANDLE *eeHandle, config_t *config);
EEPROM_STATUS WriteConfig(EEPROM_HANDLE *eeHandle, config_t *config);

BOOL VerifyConfig(EEPROM_HANDLE *eeHandle, config_t *config)
{
    EEPROM_STATUS eepromStatus = ReadConfig(eeHandle, config);
    
    if(eepromStatus == EEPROM_SUCCESS) {
        if(config->length > 256) {
            config->length = 2;
        }
        UINT16 crc = CalculateCrc(((UINT8 *)config)+2, config->length - 2);
        if(crc == config->crc && config->length == ConfigSize) {
            // future - check length for possible config updates
            return TRUE;
        } else {
            return FALSE;
        }
    } else {
        return FALSE;
    }
}

void SetDefaultConfig(config_t *config)
{
    BYTE i, j;
    config->length = ConfigSize;
    for(i=0; i<DEVICECOUNT; i++) {
        config->fanSpeed[i] = 50;
        config->ledMode[i] = 2;
        config->ledSpeed[i] = 10;
        config->unused1 = 0;
        for(j=0; j<DEVICESIZEBYTES; j++) {
            BYTE ledIdx = j / 3;
            BYTE colorIdx = j % 3;
            BYTE *color = (BYTE*)(&DefaultColors[0]) + (ledIdx*sizeof(BLACK)) + colorIdx;
            config->colors[i][j] = *color;
        }
    }
    config->crc = CalculateCrc(((UINT8 *)config)+2, ConfigSize-2);
}

EEPROM_STATUS ReadConfig(EEPROM_HANDLE *eeHandle, config_t *config)
{
    return ReadWriteEepromConfig(eeHandle, config, FALSE);
}

EEPROM_STATUS WriteConfig(EEPROM_HANDLE *eeHandle, config_t *config)
{
    return ReadWriteEepromConfig(eeHandle, config, TRUE);
}

EEPROM_STATUS ReadWriteEepromConfig(EEPROM_HANDLE *eeHandle, config_t *config, BOOL write)
{
    EEPROM_STATUS eepromStatus = EEPROM_IN_PROGRESS;
    BYTE retry = 3;
    
    eeHandle->address = 0;
    eeHandle->len = ConfigSize;
    eeHandle->data = (unsigned char *)config;
    
    while(retry-- > 0) {
        while(eepromStatus == EEPROM_IN_PROGRESS) {
            eepromStatus = write ? EepromWrite(eeHandle) : EepromRead(eeHandle);
        }
        if(eepromStatus != EEPROM_FAIL) {
            DelayMs(20);
            break;
        }
    }
    
    return eepromStatus;
}



/************ Public Functions ****************/
config_t* ConfigInit(EEPROM_HANDLE *eepromHandle)
{
    configEepromHandle = eepromHandle;
    if(VerifyConfig(configEepromHandle, &Config)) {
        // success, do nothing
    } else {
        SetDefaultConfig(&Config);
        WriteConfig(configEepromHandle, &Config);
    }
    
    return &Config;
}

BOOL ConfigUpdate(void)
{
    Config.length = ConfigSize;
    Config.crc = CalculateCrc(((UINT8 *)&Config)+2, ConfigSize-2);
    return WriteConfig(configEepromHandle, &Config) == EEPROM_SUCCESS;
}

void ConfigDefault(void)
{
    SetDefaultConfig(&Config);
}