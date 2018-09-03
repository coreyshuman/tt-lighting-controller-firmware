#ifndef _CONFIG_H    /* Guard against multiple inclusion */
#define _CONFIG_H

#include "Eeprom.h"

#define DEVICESIZEBYTES      36      // bytes
#define DEVICELEDCOUNT  12
#define DEVICECOUNT     5       
#define LEDSIZE         3       // bytes

typedef struct __attribute__((__packed__)) _config_t {
    WORD crc;
    WORD length;
    BYTE fanSpeed[DEVICECOUNT];
    BYTE ledMode[DEVICECOUNT];
    BYTE colors[DEVICECOUNT][DEVICESIZEBYTES];
} config_t ;

#define ConfigSize sizeof(config_t)

/* Provide C++ Compatibility */
#ifdef __cplusplus
extern "C" {
#endif

    

    config_t* ConfigInit(EEPROM_HANDLE *eepromHandle);
    BOOL ConfigUpdate(void);


    /* Provide C++ Compatibility */
#ifdef __cplusplus
}
#endif

#endif

