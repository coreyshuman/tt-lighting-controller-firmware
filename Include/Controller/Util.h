

#ifndef _UTIL_H    /* Guard against multiple inclusion */
#define _UTIL_H




/* Provide C++ Compatibility */
#ifdef __cplusplus
extern "C" {
#endif

UINT16 CalculateCrc(UINT8 *data, UINT32 len);
void DelayMs(UINT32 msecs);

    /* Provide C++ Compatibility */
#ifdef __cplusplus
}
#endif

#endif 

