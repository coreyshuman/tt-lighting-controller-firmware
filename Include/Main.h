#ifndef __MAIN_H__
#define __MAIN_H__

#define PROGRAM_FLASH_END_ADRESS (0x9D000000+BMXPFMSZ-1)



//-------User configurable macros begin---------

/* APP_FLASH_BASE_ADDRESS and APP_FLASH_END_ADDRESS reserves program Flash for the application*/ 
/* Rule: 
 		1)The memory regions kseg0_program_mem, kseg0_boot_mem, exception_mem and 
 		kseg1_boot_mem of the application linker script must fall with in APP_FLASH_BASE_ADDRESS 
 		and APP_FLASH_END_ADDRESS
 		 
 		2)The base address and end address must align on  4K address boundary */
 		
#define APP_FLASH_BASE_ADDRESS 	0x9D006000 
#define APP_FLASH_END_ADDRESS   PROGRAM_FLASH_END_ADRESS

/* Address of  the Flash from where the application starts executing */
/* Rule: Set APP_FLASH_BASE_ADDRESS to _RESET_ADDR value of application linker script*/

// For PIC32MX1xx and PIC32MX2xx Controllers only
#define USER_APP_RESET_ADDRESS 	(0x9D006000 + 0x1000)



//-------User configurable macros end-----------
#include "Include\Usb\Usb_Tasks.h"

#endif
