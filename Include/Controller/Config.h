#ifndef _CONFIG_H    /* Guard against multiple inclusion */
#define _CONFIG_H

typedef struct __attribute__((__packed__)) _config_t {
    WORD crc;
    WORD length;
    BYTE fanSpeed[5];
    BYTE ledMode[5];
    BYTE colors[5][36];
} config_t ;

extern config_t Config;

/* Provide C++ Compatibility */
#ifdef __cplusplus
extern "C" {
#endif

    

    void ConfigInit(void);


    /* Provide C++ Compatibility */
#ifdef __cplusplus
}
#endif

#endif

