

#ifndef _FAN_H    /* Guard against multiple inclusion */
#define _FAN_H



/* Provide C++ Compatibility */
#ifdef __cplusplus
extern "C" {
#endif

    void FanInit(void);
    void FanLoop(void);
    void FanSetSpeed(BYTE fanIdx, BYTE speed);
    void FanSetSpeeds(BYTE speeds[]);
    void FanCaptureEnable();
    void FanCaptureDisable();
    

    /* Provide C++ Compatibility */
#ifdef __cplusplus
}
#endif

#endif /* _EXAMPLE_FILE_NAME_H */

/* *****************************************************************************
 End of File
 */
