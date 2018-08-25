#include "Fan.h"
#include "Lighting.h"
#include "Animation.h"

#define CONTROLLER_BUFF_SIZE 100
#define MAJOR_VERSION        1
#define MINOR_VERSION        3

#define SOH 01
#define EOT 04
#define DLE 16

#ifdef __cplusplus
extern "C" {
#endif
extern WORD fan1speed;
    
void ControllerInit(void);
void ControllerLoop(void);

void ControllerBuildRxFrame(UINT8 *data, INT16 dataLen);
UINT ControllerGetTransmitFrame(UINT8 *data);
#ifdef __cplusplus
}
#endif