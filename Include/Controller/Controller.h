#include "Util.h"
#include "Eeprom.h"
#include "Config.h"
#include "Fan.h"
#include "Lighting.h"
#include "Animation.h"

#define CONTROLLER_BUFF_SIZE 512        // should be multiple of 64
#define MAJOR_VERSION        1
#define MINOR_VERSION        3

typedef enum _CONTROL_ERROR_CODES {
    RESPONSE_TOO_LONG = 0x00,
    RECEIVE_TOO_LONG,
    EEPROM_FAILED,
    USB_PACKET_OVERFLOW = 0xF0,
    INVALID_MULTIPACKET,
    UNKNOWN_COMMAND = 0xFF
} CONTROL_ERROR_CODES;

enum _CONTROL_CMD {
    CMD_READ_CONFIG = 0x30,
    CMD_READ_FANSPEED = 0x35,
    CMD_READ_EEPROM = 0x38,
    CMD_WRITE_EEPROM = 0x39,
    CMD_ERROR_OCCURED = 0x40
} CONTROL_CMD;

#ifdef __cplusplus
extern "C" {
#endif
extern WORD fan1speed;
    
void ControllerInit(void);
void ControllerLoop(void);

void ControllerBuildRxFrames(UINT8 *data, INT16 dataLen);
UINT ControllerGetTransmitFrame(UINT8 *data);
#ifdef __cplusplus
}
#endif