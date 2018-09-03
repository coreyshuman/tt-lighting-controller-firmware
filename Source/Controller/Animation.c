#include "Include\GenericTypeDefs.h"
#include "Include\HardwareProfile\HardwareProfile.h"
#include <stdlib.h>
#include <plib.h>
#include <string.h>
#include "Config.h"
#include "Lighting.h"
#include "Animation.h"
#include "Config.h"


static BYTE AnimationFrame;
static BOOL ReadyToUpdate;
static BYTE fanSpeed = 0;
static BYTE fanDir = 1;
static config_t *animConfigPtr;
static BYTE AnimationBuffer[DEVICECOUNT][DEVICESIZEBYTES];

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
    
    animConfigPtr = config;
    memcpy((void *)&AnimationBuffer[0][0], (const void*)&(config->colors[0][0]), DEVICECOUNT*DEVICESIZEBYTES);
    
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

void AnimationUpdateBuffer(void)
{
    memcpy((void *)&AnimationBuffer[0][0], (const void*)&(animConfigPtr->colors[0][0]), DEVICECOUNT*DEVICESIZEBYTES);
}

void AnimOff(BYTE deviceIdx)
{
    int i;
    for(i = 0; i < DEVICELEDCOUNT; i++)
    {
        SetDeviceLedColorDW(deviceIdx, i, BLACK);
    }
}

void AnimSteady(BYTE deviceIdx)
{
    BYTE i;
    
    for(i = 0; i < DEVICELEDCOUNT; i++)
    {
        BYTE* colorPtr = &AnimationBuffer[deviceIdx][i*3];
        SetDeviceLedColor(deviceIdx, i, *colorPtr, *(colorPtr+1), *(colorPtr+2));
    }
}

void AnimRotate(BYTE deviceIdx)
{
    BYTE i;
    BYTE frame = AnimationFrame % 12;
    
    for(i = 0; i < DEVICELEDCOUNT; i++)
    {
        BYTE idxOffset = i*3 + frame*3;
        if(idxOffset >= 36)
        {
            idxOffset -= 36;
        }
        idxOffset;
        BYTE* colorPtr = &AnimationBuffer[deviceIdx][idxOffset];
        SetDeviceLedColor(deviceIdx, i, *colorPtr, *(colorPtr+1), *(colorPtr+2));
    }
}

// setup next frame
void AnimationUpdate(void)
{
    int i;
    if(ReadyToUpdate)
    {
        AnimationFrame++;
        ReadyToUpdate = FALSE;
        
        for(i=0; i<DEVICECOUNT; i++) {
            switch(animConfigPtr->ledMode[i]) {
                case OFF:
                    AnimOff(i);
                    break;
                    
                case STEADY:
                    AnimSteady(i);
                    break;
                    
                case ROTATE:
                    AnimRotate(i);
                    break;
            }
        }
    }
}

void __ISR(_TIMER_5_VECTOR, IPL3SOFT) Timer5Handler(void)
{
    IFS0CLR = _IFS0_T5IF_MASK; // Clear the timer interrupt status flag
    LightingUpdate();
    ReadyToUpdate = TRUE;
}