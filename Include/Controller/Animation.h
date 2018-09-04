#ifndef _ANIMATION_H    /* Guard against multiple inclusion */
#define _ANIMATION_H

#include "Config.h"

#define ANIMATION_INTERVAL      100 // ms
#define MAX_ANIMATION_FRAMES    60

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
} COLORS;



/* Provide C++ Compatibility */
#ifdef __cplusplus
extern "C" {
#endif
    
void AnimationInit(config_t* config);
void AnimationSetInterval(WORD msec);
void AnimationStart(void);
void AnimationStop(void);
void AnimationUpdateBuffer(void);

    /* Provide C++ Compatibility */
#ifdef __cplusplus
}
#endif

#endif