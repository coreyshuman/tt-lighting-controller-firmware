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

// todo:
//   clock min/hour getting flipped sometimes?
//   flicker working great on left res, colors swapping on right?
//   general signal integrity issues?

// shared variables
static short AnimationFrame[DEVICECOUNT];
static BYTE AnimationBuffer[DEVICECOUNT][DEVICESIZEBYTES];
static BYTE AnimationSpeedCounter[DEVICECOUNT];
static BYTE AnimationMetric[DEVICECOUNT];
static BYTE ClockSecond;
static BYTE ClockMinute;
static BYTE ClockHour;
// private variables
static volatile BOOL frameBusy = TRUE;
static volatile BOOL frameReady = FALSE;
static BOOL customFrameMode = FALSE;
static BYTE fanSpeed = 0;
static BYTE fanDir = 1;
static config_t *animConfigPtr = 0;
static WORD animIntervalMsec = 0;

#define GetAnimationSpeed(x) animConfigPtr->ledSpeed[x]
#define GetAnimationMode(x) animConfigPtr->ledMode[i]

// animation development debug helpers
static BOOL debugIsAnimationPlay = TRUE;
static BOOL debugIsAnimationStep = FALSE;

BYTE* DebugGetCurrentAnimationBufferPointer() {
    return &AnimationBuffer[0][0];
}

BYTE* DebugGetCurrentAnimationFramePointer() {
    return &AnimationFrame[0];
}

void DebugSetPlayPause(BOOL play) {
    debugIsAnimationPlay = play;
}

void DebugStepAnimation() {
    debugIsAnimationStep = TRUE;
}

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
    AnimationUpdateBuffer(NULL);
    
    for(i=0; i<DEVICECOUNT; i++) {
        AnimationSpeedCounter[i] = animConfigPtr->ledSpeed[i];  
        AnimationFrame[i] = 0;
    }
    
    frameBusy = FALSE;
}

void AnimationSetInterval(WORD msec)
{
    // PR4 = 48,000,000 / 1,000 / 2 * msec
    PR4 = 24000 * msec;
    animIntervalMsec = msec;
}

void AnimationSetMetrics(BYTE metrics[])
{
    int i;
    for(i=0; i<DEVICECOUNT; i++) {
        AnimationMetric[i] = metrics[i];
        if(AnimationMetric[i] > 132) {
            AnimationMetric[i] = 132;
        }
    }
}

void AnimationSetTime(BYTE time[]) {
    ClockHour = time[0];
    ClockMinute = time[1];
    ClockSecond = time[2];
    
    if(ClockHour >= 12) {
        ClockHour = 11;
    }
    if(ClockMinute >= 60) {
        ClockMinute = 59;
    }
    if(ClockSecond >= 60) {
        ClockSecond = 59;
    }
}

void AnimationStart(void)
{
    T4CONSET = 0x8000; // Start 32-bit timer
}

void AnimationStop(void)
{
    T4CONCLR = 0x8000; // Stop 32-bit timer
}

// Optionally update the buffer from the provided dataset ptr.
// Otherwise write from the config data color array.
void AnimationUpdateBuffer(BYTE *frameData)
{
    int i;
    BYTE *animPtr = (BYTE*)&AnimationBuffer[0][0];
    frameData = (frameData == NULL) ? 
        (BYTE*)&(animConfigPtr->colors[0][0]) : frameData;
    for(i = 0; i < DEVICECOUNT*DEVICESIZEBYTES; i++) {
        *animPtr++ = *frameData++;
    }
}

// All LEDs off
void AnimOff(BYTE deviceIdx)
{
    int i;
    for(i = 0; i < DEVICELEDCOUNT; i++)
    {
        SetDeviceLedColorDW(deviceIdx, i, BLACK);
    }
}

// Each LED set to a constant color and brightness
void AnimSteady(BYTE deviceIdx)
{
    BYTE i;
    
    for(i = 0; i < DEVICELEDCOUNT; i++)
    {
        BYTE* colorPtr = &AnimationBuffer[deviceIdx][i*LEDSIZE];
        SetDeviceLedColor(deviceIdx, i, *colorPtr, *(colorPtr+1), *(colorPtr+2));
    }
}

// LED colors rotating around the ring
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
    
    if(AnimationFrame[deviceIdx] >= 48) {
        AnimationFrame[deviceIdx] = 0;
    }
    
    for(i = 0; i < DEVICELEDCOUNT; i++)
    {
        BYTE* colorPtr = &AnimationBuffer[deviceIdx][i*LEDSIZE];
        SetDeviceLedColor(deviceIdx, i, (BYTE)((*colorPtr) * BreathBrightnessSteps[step]),
                (BYTE)((*(colorPtr+1)) * BreathBrightnessSteps[step]),
                (BYTE)((*(colorPtr+2)) * BreathBrightnessSteps[step]));
    }
}

void AnimRipple(BYTE deviceIdx) {
    int i;
    
    if(AnimationFrame[deviceIdx] >= DEVICELEDCOUNT*DEVICELEDCOUNT) {
        AnimationFrame[deviceIdx] = 0;
    }
    
    BYTE location = AnimationFrame[deviceIdx] % DEVICELEDCOUNT;
    int colorIdx = (AnimationFrame[deviceIdx] / DEVICELEDCOUNT);
    BOOL colorWrapped = FALSE;
    
    ClearLedsForDevice(deviceIdx);
    for(i = location; i > location - 5; i--)
    {
        int idx = i;
        if(idx < 0) {
            idx += DEVICELEDCOUNT;
            if(!colorWrapped) {
                colorIdx -= 1;
                if(colorIdx < 0) {
                    colorIdx += DEVICELEDCOUNT;
                }
                colorWrapped = TRUE;
            }
        }
        BYTE* colorPtr = &AnimationBuffer[deviceIdx][colorIdx*LEDSIZE];
        int divisor = (location - i + 1);
        divisor *= divisor;
        SetDeviceLedColor(deviceIdx, idx, (BYTE)((*colorPtr) / divisor),
                    (BYTE)((*(colorPtr+1)) / divisor),
                    (BYTE)((*(colorPtr+2)) / divisor));
    }
}

void AnimRippleRev(BYTE deviceIdx) {
    int i;
    
    if(AnimationFrame[deviceIdx] >= DEVICELEDCOUNT*DEVICELEDCOUNT) {
        AnimationFrame[deviceIdx] = 0;
    }
    
    BYTE location = AnimationFrame[deviceIdx] % DEVICELEDCOUNT;
    int colorIdx = (AnimationFrame[deviceIdx] / DEVICELEDCOUNT);
    BOOL colorWrapped = FALSE;
    
    ClearLedsForDevice(deviceIdx);
    for(i = location; i < location + 5; i++)
    {
        int idx = i;
        if(idx >= DEVICELEDCOUNT) {
            idx -= DEVICELEDCOUNT;
            if(!colorWrapped) {
                colorIdx += 1;
                if(colorIdx >= DEVICELEDCOUNT) {
                    colorIdx -= DEVICELEDCOUNT;
                }
                colorWrapped = TRUE;
            }
        }
        BYTE* colorPtr = &AnimationBuffer[deviceIdx][colorIdx*LEDSIZE];
        int divisor = (i - location + 1);
        divisor *= divisor;
        SetDeviceLedColor(deviceIdx, idx, (BYTE)((*colorPtr) / divisor),
                    (BYTE)((*(colorPtr+1)) / divisor),
                    (BYTE)((*(colorPtr+2)) / divisor));
    }
}

void AnimRippleSpectrum(BYTE deviceIdx) {
    int i;
    
    if(AnimationFrame[deviceIdx] >= DEVICELEDCOUNT*DEVICELEDCOUNT) {
        AnimationFrame[deviceIdx] = 0;
    }
    
    BYTE location = AnimationFrame[deviceIdx] % DEVICELEDCOUNT;
    
    ClearLedsForDevice(deviceIdx);
    for(i = location; i > location - 5; i--)
    {
        int idx = i;
        if(idx < 0) {
            idx += DEVICELEDCOUNT;
        }
        BYTE* colorPtr = &AnimationBuffer[deviceIdx][idx*LEDSIZE];
        int divisor = (location - i + 1);
        divisor *= divisor;
        SetDeviceLedColor(deviceIdx, idx, (BYTE)((*colorPtr) / divisor),
                    (BYTE)((*(colorPtr+1)) / divisor),
                    (BYTE)((*(colorPtr+2)) / divisor));
    }
}

void AnimRippleSpectrumRev(BYTE deviceIdx) {
    int i;
    
    if(AnimationFrame[deviceIdx] >= DEVICELEDCOUNT*DEVICELEDCOUNT) {
        AnimationFrame[deviceIdx] = 0;
    }
    
    BYTE location = AnimationFrame[deviceIdx] % DEVICELEDCOUNT;
    
    ClearLedsForDevice(deviceIdx);
    for(i = location; i < location + 5; i++)
    {
        int idx = i;
        if(idx >= DEVICELEDCOUNT) {
            idx -= DEVICELEDCOUNT;
        }
        BYTE* colorPtr = &AnimationBuffer[deviceIdx][idx*LEDSIZE];
        int divisor = (i - location + 1);
        divisor *= divisor;
        SetDeviceLedColor(deviceIdx, idx, (BYTE)((*colorPtr) / divisor),
                    (BYTE)((*(colorPtr+1)) / divisor),
                    (BYTE)((*(colorPtr+2)) / divisor));
    }
}

// Show entire ring as constant color, cycling through each defined color
void AnimCycle(BYTE deviceIdx)
{
    BYTE i;
    BYTE frame = AnimationFrame[deviceIdx] % 12;
    
    BYTE* colorPtr = &AnimationBuffer[deviceIdx][frame * LEDSIZE];
    
    for(i = 0; i < DEVICELEDCOUNT; i++)
    {
        SetDeviceLedColor(deviceIdx, i, *colorPtr, *(colorPtr+1), *(colorPtr+2));
    }
}

// Alternate between off and ring spectrum
void AnimBlink(BYTE deviceIdx)
{
    BYTE i;
    BYTE frame = AnimationFrame[deviceIdx] % 24; 
    BOOL on = (frame % 2) == 1;
    
    if(on) {
        for(i = 0; i < DEVICELEDCOUNT; i++)
        {
            BYTE* colorPtr = &AnimationBuffer[deviceIdx][(frame/2) * LEDSIZE];
            SetDeviceLedColor(deviceIdx, i, *colorPtr, *(colorPtr+1), *(colorPtr+2));
        }
    } else {
        ClearLedsForDevice(deviceIdx);
    }
}

// fill ring with next color one led at a time, overwriting previous color
void AnimWipe(BYTE deviceIdx) {
    int i;

    if(AnimationFrame[deviceIdx] >= DEVICELEDCOUNT*DEVICELEDCOUNT) {
        AnimationFrame[deviceIdx] = 0;
    }
    
    BYTE location = AnimationFrame[deviceIdx] % DEVICELEDCOUNT;
    int colorIdx = (AnimationFrame[deviceIdx] / DEVICELEDCOUNT);
    
    ClearLedsForDevice(deviceIdx);
    
    BYTE* colorPtr = &AnimationBuffer[deviceIdx][colorIdx*LEDSIZE];
    for(i = location; i < DEVICELEDCOUNT; i++) {      
        SetDeviceLedColor(deviceIdx, i, *colorPtr, *(colorPtr+1), *(colorPtr+2));
    }
    
    colorIdx++;
    if(colorIdx >= DEVICELEDCOUNT) {
        colorIdx -= DEVICELEDCOUNT;
    }
    
    colorPtr = &AnimationBuffer[deviceIdx][colorIdx*LEDSIZE];
    for(i = 0; i < location; i++) {
        SetDeviceLedColor(deviceIdx, i, *colorPtr, *(colorPtr+1), *(colorPtr+2));
    }
}

// fill ring with next color based on metric range from 0 - 132
void AnimMetricSpectrum(BYTE deviceIdx) {
    int i;
    BYTE color[3];
    BYTE colorIdx = AnimationMetric[deviceIdx] / 12;
    BYTE colorBlend = AnimationMetric[deviceIdx] % 12;
    BYTE* colorPtr1 = &AnimationBuffer[deviceIdx][colorIdx*LEDSIZE];
    BYTE* colorPtr2 = &AnimationBuffer[deviceIdx][colorIdx*LEDSIZE+LEDSIZE];
    
    for(i = 0; i < 3; i++) {
        color[i] = (BYTE)(((double)*(colorPtr1+i) * (double)(12 - colorBlend)) / 12.0f);
        if(AnimationMetric[deviceIdx] < 132) {
            color[i] += (BYTE)(((double)*(colorPtr2+i) * (double)(colorBlend)) / 12.0f);
        }
    }
 
    for(i = 0; i < DEVICELEDCOUNT; i++) {      
        SetDeviceLedColor(deviceIdx, i, color[0], color[1], color[2]);
    }
}

// fill section of ring with spectrum color based on metric range from 0 - 132
void AnimMetricBar(BYTE deviceIdx, BYTE dir) {
    int i;
    BYTE barStrength = AnimationMetric[deviceIdx] / 12;
    
    ClearLedsForDevice(deviceIdx);
    
    if(dir == 1) {
        for(i = 0; i <= barStrength; i++) {    
            BYTE* colorPtr = &AnimationBuffer[deviceIdx][i*LEDSIZE];
            SetDeviceLedColor(deviceIdx, i, *colorPtr, *(colorPtr+1), *(colorPtr+2));
        }
    } else {
        for(i = DEVICELEDCOUNT-1; i >= 0; i--) {    
            BYTE* colorPtr = &AnimationBuffer[deviceIdx][i*LEDSIZE];
            SetDeviceLedColor(deviceIdx, i, *colorPtr, *(colorPtr+1), *(colorPtr+2));
        }       
    }
}

static float HeartbeatBrightnessSteps[14] = {
  1.00f, 1.00f, 1.00f, 1.00f, 1.00f, 1.00f,
  0.90f, 0.70f, 0.50f, 0.30f, 0.10f, 0.00f,
  0.30f, 0.70f
};
void AnimHeartbeat(BYTE deviceIdx) {
    BYTE i;
    BYTE frame = AnimationFrame[deviceIdx] % 14;
    
    if(AnimationFrame[deviceIdx] >= 14) {
        AnimationFrame[deviceIdx] = 0;
    }
    
    for(i = 0; i < DEVICELEDCOUNT; i++)
    {
        BYTE* colorPtr = &AnimationBuffer[deviceIdx][i*LEDSIZE];
        SetDeviceLedColor(deviceIdx, i, (BYTE)((*colorPtr) * HeartbeatBrightnessSteps[frame]),
                (BYTE)((*(colorPtr+1)) * HeartbeatBrightnessSteps[frame]),
                (BYTE)((*(colorPtr+2)) * HeartbeatBrightnessSteps[frame]));
    }
}

static BYTE RainBrightnessMemory[DEVICECOUNT][DEVICELEDCOUNT];
static BYTE RainColorMemory[DEVICECOUNT][DEVICELEDCOUNT];
// random rain effect. LEDs randomly choose a color and brightnesses then fade 
void AnimRain(BYTE deviceIdx) {
    BYTE i;
    
    for(i = 0; i < DEVICELEDCOUNT; i++) {
        if(RainBrightnessMemory[deviceIdx][i] == 0) {
            if(rand() % 20 >= (15 + (GetAnimationSpeed(deviceIdx) % 4))) {
                RainBrightnessMemory[deviceIdx][i] = (rand() % 100) * 2;
                RainColorMemory[deviceIdx][i] = rand() % DEVICELEDCOUNT;
            }
        } else if(RainBrightnessMemory[deviceIdx][i] > GetAnimationSpeed(deviceIdx)) {
            RainBrightnessMemory[deviceIdx][i] = RainBrightnessMemory[deviceIdx][i] - GetAnimationSpeed(deviceIdx);
        } else {
            RainBrightnessMemory[deviceIdx][i] = 0;
        }
        
        float brightness = (float)RainBrightnessMemory[deviceIdx][i] / 200.0f;
        BYTE* colorPtr = &AnimationBuffer[deviceIdx][RainColorMemory[deviceIdx][i]*LEDSIZE];
        SetDeviceLedColor(deviceIdx, i, (BYTE)((*colorPtr) * brightness),
                (BYTE)((*(colorPtr+1)) * brightness),
                (BYTE)((*(colorPtr+2)) * brightness));
        
    }  
}

// fill ring with next color stacking one led at a time
void AnimStack(BYTE deviceIdx, BYTE dir) {
    int i;
    BYTE currentFrame = AnimationFrame[deviceIdx];
    BYTE frameCounter = 0;
    char colorIdx = -1;
    BYTE location = 0;
    BYTE increment = DEVICELEDCOUNT;
    
    for(i = 0; i < DEVICELEDCOUNT; i++) {
        frameCounter += increment;
        if(currentFrame < frameCounter) {
            colorIdx = i;
            location = currentFrame - (frameCounter - increment);
            break;
        }
        
        increment -= 1;
    }
    if(colorIdx == -1) {
        AnimationFrame[deviceIdx] = 0;
        colorIdx = 0;
        location = 0;
    }

    ClearLedsForDevice(deviceIdx);
    
    // draw falling brick
    BYTE drawLocation = (dir == 1) ? location : DEVICELEDCOUNT - 1 - location;
    BYTE* colorPtr = &AnimationBuffer[deviceIdx][colorIdx*LEDSIZE];
    SetDeviceLedColor(deviceIdx, drawLocation, *colorPtr, *(colorPtr+1), *(colorPtr+2));
    
    // draw existing stack
    for(i = 0; i < colorIdx; i++) {
        drawLocation = (dir == 1) ? DEVICELEDCOUNT - 1 - i : i;
        colorPtr = &AnimationBuffer[deviceIdx][i*LEDSIZE];
        SetDeviceLedColor(deviceIdx, drawLocation, *colorPtr, *(colorPtr+1), *(colorPtr+2));
    }
}

// display an analog clock!
static UINT32 ClockTick;
static float ClockPulse;
static float ClockSecondAdjusted = (GetSystemClock()/2) * 1.166667f;
void AnimClock(BYTE deviceIdx) {
    int i;
    // use speed selection to offset (rotate) the clock
    BYTE offset = GetAnimationSpeed(deviceIdx);
    if(offset >= DEVICELEDCOUNT) {
        offset -= DEVICELEDCOUNT;
    }
    
    // check if 1 second has passed
    if(ReadCoreTimer() - ClockTick > (UINT32)(ClockSecondAdjusted)) {
        ClockTick = ReadCoreTimer();
        if(++ClockSecond >= 60) {
            ClockSecond = 0;
            if(++ClockMinute >= 60) {
                ClockMinute = 0;
                if(++ClockHour >= 12) {
                    ClockHour = 0;
                }
            }
        }
        ClockPulse = 0.40f;
    } else if(ClockPulse > 0.10f) {
        ClockPulse -= 0.01f;
    }
    
    // draw clock frame
    BYTE* colorPtr = &AnimationBuffer[deviceIdx][0];
    BYTE drawLocation = offset;
    for(i = 0; i < DEVICELEDCOUNT; i++) {
        float brightness;
        if(i == 0) {
            brightness = ClockPulse + 0.4f;
        } else if (i % 3 == 0) {
            brightness = ClockPulse + 0.25f;
        } else {
            brightness = ClockPulse;
        }
        
        SetDeviceLedColor(deviceIdx, drawLocation, (BYTE)(*colorPtr * brightness), 
                (BYTE)(*(colorPtr+1) * brightness), 
                (BYTE)(*(colorPtr+2) * brightness));
        if(++drawLocation >= DEVICELEDCOUNT) {
            drawLocation -= DEVICELEDCOUNT;
        }
    }
    
    // draw second
    BYTE timeDrawLocation = (DEVICELEDCOUNT - 1) - (ClockSecond / 5);
    timeDrawLocation += offset;
    if(timeDrawLocation >= DEVICELEDCOUNT) {
        timeDrawLocation -= DEVICELEDCOUNT;
    }
    colorPtr = &AnimationBuffer[deviceIdx][1*LEDSIZE];
    SetDeviceLedColor(deviceIdx, timeDrawLocation, *colorPtr, *(colorPtr+1), *(colorPtr+2));
    
    // draw minute
    timeDrawLocation = (DEVICELEDCOUNT - 1) - (ClockMinute / 5);
    timeDrawLocation += offset;
    if(timeDrawLocation >= DEVICELEDCOUNT) {
        timeDrawLocation -= DEVICELEDCOUNT;
    }
    colorPtr = &AnimationBuffer[deviceIdx][2*LEDSIZE];
    SetDeviceLedColor(deviceIdx, timeDrawLocation, *colorPtr, *(colorPtr+1), *(colorPtr+2));
    
    // draw hour
    timeDrawLocation = (DEVICELEDCOUNT - 1) - ClockHour;
    timeDrawLocation += offset;
    if(timeDrawLocation >= DEVICELEDCOUNT) {
        timeDrawLocation -= DEVICELEDCOUNT;
    }
    colorPtr = &AnimationBuffer[deviceIdx][3*LEDSIZE];
    SetDeviceLedColor(deviceIdx, timeDrawLocation, *colorPtr, *(colorPtr+1), *(colorPtr+2));
}

// random pulsing (arc reactor effect)
static float FlickerBrightness[DEVICECOUNT];
void AnimFlicker(BYTE deviceIdx) {
    BYTE i;
    
    if(rand() % 20 >= GetAnimationSpeed(deviceIdx)) {
        if(rand() % 2 == 0) {
            FlickerBrightness[deviceIdx] += ((float)(rand() % 7) / 100.0f);
        } else {
            FlickerBrightness[deviceIdx] -= ((float)(rand() % 7) / 100.0f);
        }
        if(FlickerBrightness[deviceIdx] < 0.10f) {
            FlickerBrightness[deviceIdx] = 0.30f;
        } else if(FlickerBrightness[deviceIdx] > 0.95f) {
            FlickerBrightness[deviceIdx] = 0.70f;
        }
    }
    
    float brightness = FlickerBrightness[deviceIdx];
    for(i = 0; i < DEVICELEDCOUNT; i++) {
        BYTE* colorPtr = &AnimationBuffer[deviceIdx][i*LEDSIZE];
        SetDeviceLedColor(deviceIdx, i, (BYTE)((*colorPtr) * brightness),
                (BYTE)((*(colorPtr+1)) * brightness),
                (BYTE)((*(colorPtr+2)) * brightness));
    }
}

void AnimationResetFrames() {
    int i;
     for(i=0; i<DEVICECOUNT; i++) {
        AnimationSpeedCounter[i] = animConfigPtr->ledSpeed[i];    
        AnimationFrame[i] = 0;
     }
}

void AnimationWriteCustomFrame(BYTE *frameData)
{
    TMR4 = 0;
    frameBusy = TRUE;
    frameReady = FALSE;
    customFrameMode = TRUE;
    PR4 = 24000 * 2000;
    AnimationResetFrames();
    //AnimationUpdateBuffer(frameData);
    LightingCopyBuffer(frameData); 
    LightingUpdate();
    TMR4 = 0;
}

// setup next frame
void AnimationUpdate(void)
{
    int i;
    if(!frameBusy && (debugIsAnimationPlay || debugIsAnimationStep))
    {
        frameBusy = TRUE;
        
        for(i=0; i<DEVICECOUNT; i++) {
            BYTE ledMode = GetAnimationMode(i);
            if(-- AnimationSpeedCounter[i] <= 0) {
                AnimationSpeedCounter[i] = GetAnimationSpeed(i);
                if( ledMode == ANIM_ROTATE_REV ||
                    ledMode == ANIM_RIPPLE_REV ||
                    ledMode == ANIM_RIPPLE_SPECTRUM_REV ||
                    ledMode == ANIM_WIPE_REV 
                ) {
                    if(--AnimationFrame[i] < 0) {
                        AnimationFrame[i] = MAX_ANIMATION_FRAMES - 1;
                    }
                } else {
                    if(++AnimationFrame[i] >= MAX_ANIMATION_FRAMES) {
                        AnimationFrame[i] = 0;
                    }
                }
            }
            
            switch(ledMode) {
                case ANIM_OFF:
                    AnimOff(i);
                    break;

                case ANIM_STEADY:
                    AnimSteady(i);
                    break;

                case ANIM_ROTATE:
                case ANIM_ROTATE_REV:
                    AnimRotate(i);
                    break;
                    
                case ANIM_BREATH:
                    AnimBreath(i);
                    break;
                    
                case ANIM_RIPPLE:
                case ANIM_RIPPLE_REV:
                    AnimRipple(i);
                    break;
                    
                case ANIM_RIPPLE_SPECTRUM:
                    AnimRippleSpectrum(i);
                    break;
                    
                case ANIM_RIPPLE_SPECTRUM_REV:
                    AnimRippleSpectrumRev(i);
                    break;
                    
                case ANIM_CYCLE:
                    AnimCycle(i);
                    break;
                    
                case ANIM_BLINK:
                    AnimBlink(i);
                    break;
                    
                case ANIM_WIPE:
                case ANIM_WIPE_REV:
                    AnimWipe(i);
                    break;
                    
                case ANIM_METRIC_SPECTRUM:
                    AnimMetricSpectrum(i);
                    break;
                    
                case ANIM_METRIC_BAR:
                    AnimMetricBar(i, 1);
                    break;
                case ANIM_METRIC_BAR_REV:
                    AnimMetricBar(i, 0);
                    break;
                    
                case ANIM_HEARTBEAT:
                    AnimHeartbeat(i);
                    break;
                    
                case ANIM_RAIN:
                    AnimRain(i);
                    break;
                    
                case ANIM_STACK:
                    AnimStack(i, 1);
                    break;
                case ANIM_STACK_REVERSE:
                    AnimStack(i, 0);
                    break;
                    
                case ANIM_CLOCK:
                    AnimClock(i);
                    break;
                    
                case ANIM_FLICKER:
                    AnimFlicker(i);
                    break;
            }                
        }
        frameReady = TRUE;
        debugIsAnimationStep = FALSE;
    }
}

void __ISR(_TIMER_5_VECTOR, IPL3SOFT) Timer5Handler(void)
{
    IFS0CLR = _IFS0_T5IF_MASK; // Clear the timer interrupt status flag
    if(customFrameMode) {
        customFrameMode = FALSE;
        frameBusy = FALSE;
        frameReady = FALSE;
        AnimationSetInterval(animIntervalMsec);
        AnimationUpdateBuffer(NULL);
        TMR4 = 0;
    } else if(frameReady) {
        frameReady = FALSE;
        LightingUpdate();
        frameBusy = FALSE;
    }
}