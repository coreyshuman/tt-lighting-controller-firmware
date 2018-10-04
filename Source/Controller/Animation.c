#include "GenericTypeDefs.h"
#include "./HardwareProfile/HardwareProfile.h"
#include <stdlib.h>
#include <plib.h>
#include <string.h>
#include "./Controller/Config.h"
#include "./Controller/Lighting.h"
#include "./Controller/Animation.h"
#include "./Controller/Config.h"
#include "./Controller/Debug.h"


static BOOL ReadyToUpdate = 0;
static BYTE fanSpeed = 0;
static BYTE fanDir = 1;
static config_t *animConfigPtr = 0;
static BYTE AnimationBuffer[DEVICECOUNT][DEVICESIZEBYTES];
static BYTE AnimationSpeedCounter[DEVICECOUNT];
static BYTE AnimationFrame[DEVICECOUNT];

void AnimationInit(config_t* config)
{
    int i;
    
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
    AnimationUpdateBuffer();
    
    for(i=0; i<DEVICECOUNT; i++) {
        AnimationSpeedCounter[i] = animConfigPtr->ledSpeed[i];  
        AnimationFrame[i] = 0;
    }
    
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
    int i;
    BYTE *animPtr = (BYTE*)&AnimationBuffer[0][0];
    BYTE *colorPtr = (BYTE*)&(animConfigPtr->colors[0][0]);
    for(i = 0; i < DEVICECOUNT*DEVICESIZEBYTES; i++) {
        *animPtr++ = *colorPtr++;
    }
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
    BYTE frame = AnimationFrame[deviceIdx] % 12;
    
    
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

static float BreathBrightnessSteps[24] = {
  1.00f, 0.99f, 0.98f, 0.97f, 0.96f, 0.95f,
  0.92f, 0.90f, 0.88f, 0.86f, 0.83f, 0.79f,
  0.75f, 0.71f, 0.68f, 0.63f, 0.58f, 0.53f,
  0.47f, 0.40f, 0.30f, 0.20f, 0.10f, 0.05f  
};
void AnimBreath(BYTE deviceIdx) {
    BYTE i;
    BYTE frame = AnimationFrame[deviceIdx] % 24;
    BOOL dir = (AnimationFrame[deviceIdx] % 48) < 24;
    BYTE step = dir ? frame : 23 - frame;
    
    if(AnimationFrame[deviceIdx] == 48) {
        AnimationFrame[deviceIdx] = 0;
    }
    
    putDebug(step);
    
    for(i = 0; i < DEVICELEDCOUNT; i++)
    {
        BYTE* colorPtr = &AnimationBuffer[deviceIdx][i*3];
        SetDeviceLedColor(deviceIdx, i, (BYTE)((*colorPtr) * BreathBrightnessSteps[step]),
                (BYTE)((*(colorPtr+1)) * BreathBrightnessSteps[step]),
                (BYTE)((*(colorPtr+2)) * BreathBrightnessSteps[step]));
    }
}

// setup next frame
void AnimationUpdate(void)
{
    int i;
    if(ReadyToUpdate)
    {
        ReadyToUpdate = FALSE;
        
        for(i=0; i<DEVICECOUNT; i++) {
            if(-- AnimationSpeedCounter[i] <= 0) {
                AnimationSpeedCounter[i] = animConfigPtr->ledSpeed[i];    
                if(++AnimationFrame[i] >= MAX_ANIMATION_FRAMES) {
                    AnimationFrame[i] = 0;
                }
            }
            
            switch(animConfigPtr->ledMode[i]) {
                case ANIM_OFF:
                    AnimOff(i);
                    break;

                case ANIM_STEADY:
                    AnimSteady(i);
                    break;

                case ANIM_ROTATE:
                    AnimRotate(i);
                    break;
                    
                case ANIM_BREATH:
                    AnimBreath(i);
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