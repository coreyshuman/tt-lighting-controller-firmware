#include "Util.h"
#include "Eeprom.h"
#include "Config.h"
#include "Fan.h"
#include "Lighting.h"
#include "Animation.h"

// Each USB packet can hold 60 bytes of data, plus 4 bytes of overhead.
// Each USB packet MUST be 64 bytes in length (USB interrupt spec.)
// The numbers below allow for 16 packets of data to be stored at once.
// N = 16 keeps both buffers multiples of 64.
#define CONTROLLER_BUFF_SIZE 960        // (60 * N), N = 16
#define USB_BUFFER_SIZE      960 + 64  //  (60 * N) + (4 * N), N = 16
#define MAJOR_VERSION        1
#define MINOR_VERSION        3

typedef enum _CONTROL_ERROR_CODES {
    RESPONSE_TOO_LONG = 0x01,
    RECEIVE_TOO_LONG,
    EEPROM_FAILED,
    USB_PACKET_OVERFLOW = 0xF0,
    INVALID_MULTIPACKET,
    CRC_INVALID,
    UNKNOWN_COMMAND = 0xFF
} CONTROL_ERROR_CODES;

enum _CONTROL_CMD {
    CMD_READ_EE_DEBUG = 0x10,
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

void ControllerBuildRxFrame(UINT8 *data, INT16 dataLen);
UINT ControllerGetTransmitFrames(UINT8 *data);
#ifdef __cplusplus
}
#endif