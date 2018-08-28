#include "Include\GenericTypeDefs.h"
#include "Include\HardwareProfile\HardwareProfile.h"
#include <stdlib.h>
#include <plib.h>
#include "Include\Controller\Config.h"

config_t Config;

void ConfigInit(void)
{
    CalculateCrc(NULL, NULL);
}

BOOL VerifyConfig(void)
{
    
}