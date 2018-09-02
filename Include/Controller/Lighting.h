#ifndef LIGHTING_H
#define	LIGHTING_H

#define INNERBITDELAY   0x78
#define DEVICESIZE      36      // bytes
#define DEVICELEDCOUNT  12
#define DEVICECOUNT     5       
#define LEDSIZE         3       // bytes

typedef enum _ANIMATION_MODE {
    OFF = 0,
    STEADY,
    ROTATE
} ANIMATION_MODE;

extern BYTE *LedDrawBuffer;
extern BYTE *LedWriteBuffer;
extern BOOL LedBusy;

void LightingInit(void);
void LightingUpdate(void);

void ClearLeds(void);
void SetDeviceLedColor(BYTE devIndex, BYTE ledIndex, DWORD color);
void SetDeviceSolidColor(BYTE devIndex, DWORD color);

#endif