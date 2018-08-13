
#include "Include\GenericTypeDefs.h"
#include "Include\HardwareProfile\HardwareProfile.h"
#include <stdlib.h>
#include <plib.h>
#include "Lighting.h"
#include "Animation.h"

// LedWriteBuffer
BYTE AnimationFrame;
BOOL ReadyToUpdate;

// 00 blue red green
enum _colors {
    PINK =      0x00808040,
    WINE =      0x00208000,
    RED =       0x00008000,
    ORANGE =    0x00008040,
    SUNSET =    0x00004080,
    YELLOW =    0x00207080,
    LIME =      0x00004080,
    GREEN =     0x00000080,
    TEAL =      0x00800080,
    BLUE =      0x00800000,
    INDIGO =    0x00802000,
    VIOLET =    0x00804000,
    WHITE =     0x00ffffff,
    BLACK =     0x00000000
} COLORS;

void AnimationInit(void)
{
    T4CON = 0x0; // Stop any 16/32-bit Timer4 operation
    T5CON = 0x0; // Stop any 16-bit Timer5 operation
    T4CONSET = 0x0018; // 32-bit mode, internal clock, 1:2 prescale
    TMR4 = 0x0; // Clear contents of the TMR4 and TMR5
    PR4 = 0xFFFFFFFF; // Load PR4 and PR5 registers with 32-bit value
    
    // setup timer 5 interrupt
    IPC5bits.T5IP = 3;
    IPC5bits.T5IS = 1;
    IFS0CLR = _IFS0_T5IF_MASK; // Clear the timer interrupt status flag
    IEC0SET = _IEC0_T5IE_MASK; // Enable timer interrupts
    
    AnimationFrame = 0;
    ReadyToUpdate = TRUE;
}

void AnimationSetInterval(WORD msec)
{
    // PR4 = 48,000,000 / 1,000 / 2 * msec
    PR4 = 24000 * msec;
}

void AnimationStart(void)
{
    T4CONSET = 0x8000; // Start 32-bit timer
}

void AnimationStop(void)
{
    T4CONCLR = 0x8000; // Stop 32-bit timer
}

void RotateColors(void)
{
    BYTE i, y;
    //DWORD colors[] = {PINK, WINE, RED, ORANGE, SUNSET, YELLOW, LIME, GREEN, TEAL, BLUE, INDIGO, VIOLET};
    DWORD colors[] = {VIOLET, BLACK, BLACK, BLACK, BLACK, BLACK, LIME, BLACK, BLACK, BLACK, BLACK, BLACK};
    if(AnimationFrame >= 12)
    {
        AnimationFrame = 0;
    }
    
    for(i = 0; i < DEVICELEDCOUNT; i++)
    {
        BYTE idx = i + AnimationFrame;
        if(idx >= 12)
        {
            idx -= 12;
        }
        for(y = 0; y < DEVICECOUNT; y++)
        {
            SetDeviceLedColor(y, i, colors[idx]);
        }
    }
}

// setup next frame
void AnimationUpdate(void)
{
    if(ReadyToUpdate)
    {
        AnimationFrame++;
        RotateColors();
        ReadyToUpdate = FALSE;
    }
}

void __ISR(_TIMER_5_VECTOR, IPL3SOFT) Timer5Handler(void)
{
    IFS0CLR = _IFS0_T5IF_MASK; // Clear the timer interrupt status flag
    LightingUpdate();
    ReadyToUpdate = TRUE;
}