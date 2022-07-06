#ifndef LIGHTING_H
#define	LIGHTING_H

#define INNERBITDELAY   26      // 26 / 48MHz = 0.541us

extern BYTE *LedDrawBuffer;
extern BYTE *LedWriteBuffer;
extern BOOL LedBusy;

void LightingInit(void);
void LightingUpdate(void);

void ClearLeds(void);
void ClearLedsForDevice(BYTE devIndex);
void SetDeviceLedColor(BYTE devIndex, BYTE ledIndex, BYTE green, BYTE red, BYTE blue);
void SetDeviceLedColorDW(BYTE devIndex, BYTE ledIndex, DWORD color);
void SetDeviceSolidColor(BYTE devIndex, DWORD color);
void LightingCopyBuffer(BYTE* buf);

#endif