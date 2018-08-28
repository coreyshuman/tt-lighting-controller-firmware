
#include "Include\GenericTypeDefs.h"
#include "Include\HardwareProfile\HardwareProfile.h"
#include <stdlib.h>
#include <plib.h>
#include <string.h>
#include "Lighting.h"
#include "Animation.h"
#include "Config.h"


static BYTE AnimationFrame;
static BOOL ReadyToUpdate;
static BYTE fanSpeed = 0;
static BYTE fanDir = 1;

static BYTE AnimationBuffer[DEVICECOUNT][DEVICESIZE];

void AnimationInit(config_t* config)
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
    
    memcpy((void *)&AnimationBuffer, (const void*)&config->colors, sizeof(AnimationBuffer));
    
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

extern DWORD fan1speed;
extern DWORD fan1period;
void RotateColors(void)
{
    BYTE i, y;
    
    
    if(AnimationFrame >= 12)
    {
        AnimationFrame = 0;
    }
    
    //ClearLeds();
    
    for(i = 0; i < DEVICELEDCOUNT; i++)
    {
        BYTE idx = i*3 + AnimationFrame*3;
        if(idx >= 36)
        {
            idx -= 36;
        }
        for(y = 0; y < DEVICECOUNT; y++)
        {
            idx += y * DEVICESIZE;
            SetDeviceLedColor(y, i, (DWORD)AnimationBuffer[idx] | (DWORD)AnimationBuffer[idx+1] << 8 | (DWORD)AnimationBuffer[idx+2] << 16);
        }
    }

    if(fanSpeed == 0) {
        fanDir = 1;
    } 
    else if (fanSpeed == 100) {
        fanDir = 0;
    }
    if(fanDir > 0)
    {
        fanSpeed += 5;
    }
    else
    {
        fanSpeed -= 5;
    }
    FanSetSpeed(0, fanSpeed);
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