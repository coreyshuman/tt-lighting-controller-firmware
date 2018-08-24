
#include "Include\GenericTypeDefs.h"
#include "Include\HardwareProfile\HardwareProfile.h"
#include <stdlib.h>
#include <plib.h>
#include "Controller.h"

void ControllerInitialize(void) 
{
    LightingInit();
    AnimationInit();
    FanInit();
    
    AnimationSetInterval(500);
    
    AnimationUpdate();
    AnimationStart();
}

void ControllerLoop(void)
{
    if(LedBusy) return;
    
    AnimationUpdate();
    FanLoop();
}