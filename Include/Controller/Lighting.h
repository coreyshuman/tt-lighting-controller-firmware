#ifndef LIGHTING_H
#define	LIGHTING_H

#define INNERBITDELAY   0x72

typedef enum _ANIMATION_MODE {
    OFF = 0,
    STEADY,
    ROTATE,
    BREATH
} ANIMATION_MODE;

extern BYTE *LedDrawBuffer;
extern BYTE *LedWriteBuffer;
extern BOOL LedBusy;

void LightingInit(void);
void LightingUpdate(void);

void ClearLeds(void);
void SetDeviceLedColor(BYTE devIndex, BYTE ledIndex, BYTE green, BYTE red, BYTE blue);
void SetDeviceLedColorDW(BYTE devIndex, BYTE ledIndex, DWORD color);
void SetDeviceSolidColor(BYTE devIndex, DWORD color);

#endif