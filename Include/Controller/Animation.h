#ifndef _ANIMATION_H    /* Guard against multiple inclusion */
#define _ANIMATION_H

#include "Config.h"

#define ANIMATION_INTERVAL      50 // ms
#define MAX_ANIMATION_FRAMES    144

// 00 blue red green
enum _colors {
    PINK =      0x00408000,
    WINE =      0x00208000,
    RED =       0x00008000,
    ORANGE =    0x00008020,
    SUNSET =    0x00008040,
    YELLOW =    0x00008070,
    LIME =      0x00004080,
    GREEN =     0x00000080,
    TEAL =      0x00800080,
    BLUE =      0x00800000,
    INDIGO =    0x00802000,
    VIOLET =    0x00604000,
    WHITE =     0x00ffffff,
    BLACK =     0x00000000
};

typedef enum _ANIMATION_MODE {
    ANIM_OFF = 0,
    ANIM_STEADY,
    ANIM_ROTATE,
    ANIM_BREATH,
    ANIM_RIPPLE,
    ANIM_ROTATE_REV,
    ANIM_RIPPLE_REV,
    ANIM_RIPPLE_SPECTRUM,
    ANIM_RIPPLE_SPECTRUM_REV,
    ANIM_CYCLE,
    ANIM_BLINK,
    ANIM_WIPE,
    ANIM_WIPE_REV,
    ANIM_METRIC_SPECTRUM,
    ANIM_METRIC_BAR,
    ANIM_METRIC_BAR_REV,
    ANIM_HEARTBEAT,
    ANIM_RAIN,
    ANIM_STACK,
    ANIM_STACK_REVERSE,
    ANIM_CLOCK,
    ANIM_FLICKER,
    ANIM_CROSS,
    ANIM_CROSS_REV
            
} ANIMATION_MODE;

/* Provide C++ Compatibility */
#ifdef __cplusplus
extern "C" {
#endif
    
void AnimationInit(config_t* config);
void AnimationSetInterval(WORD msec);
void AnimationSetMetrics(BYTE metrics[]);
void AnimationStart(void);
void AnimationStop(void);
void AnimationUpdate(void);
void AnimationUpdateBuffer(BYTE *frameData);
void AnimationWriteCustomFrame(BYTE *frameData);
void AnimationSetTime(BYTE time[]);

BYTE* DebugGetCurrentAnimationBufferPointer(void);
short* DebugGetCurrentAnimationFramePointer(void);
void DebugSetPlayPause(BOOL play);
void DebugStepAnimation(void);

    /* Provide C++ Compatibility */
#ifdef __cplusplus
}
#endif

#endif