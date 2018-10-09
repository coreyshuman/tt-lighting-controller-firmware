#include <stdlib.h>
#include <plib.h>
#include "./Common.h"
#include "./Exception.h"

EXCEPTION_RESULT _exception_result __attribute__((persistent, address(EXCEPTION_DATA_ADDRESS)));

// this function overrides the normal _weak_ generic handler
void _general_exception_handler(void)
{
    asm volatile("mfc0 %0,$13" : "=r" (_exception_result.code));
    asm volatile("mfc0 %0,$14" : "=r" (_exception_result.address));
    _exception_result.code = (_exception_result.code & 0x0000007C) >> 2;
#if defined(_BOOTLOADER)
    _exception_result.status = BOOT_EXCEPTION;   
#else
    _exception_result.status = APP_EXCEPTION;   
#endif
    SoftReset();
    while(1);
}