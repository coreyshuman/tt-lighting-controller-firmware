#ifndef __HARDWAREPROFILE_PIC32MX_THERMALTAKE_H__
#define __HARDWAREPROFILE_PIC32MX_THERMALTAKE_H__



 	/*******************************************************************/
    /******** USB stack hardware selection options *********************/
    /*******************************************************************/
    //This section is the set of definitions required by the MCHPFSUSB
    //  framework.  These definitions tell the firmware what mode it is
    //  running in, and where it can find the results to some information
    //  that the stack needs.
    //These definitions are required by every application developed with
    //  this revision of the MCHPFSUSB framework.  Please review each
    //  option carefully and determine which options are desired/required
    //  for your application.

    //#define USE_SELF_POWER_SENSE_IO
    #define tris_self_power     TRISAbits.TRISA2    // Input
    #define self_power          1

    //#define USE_USB_BUS_SENSE_IO
    #define tris_usb_bus_sense  TRISBbits.TRISB5    // Input
    #define USB_BUS_SENSE       1 

    /*******************************************************************/
    /*******************************************************************/
    /*******************************************************************/
    /******** Application specific definitions *************************/
    /*******************************************************************/
    /*******************************************************************/
    /*******************************************************************/

    /** Board definition ***********************************************/
    //These definitions will tell the main() function which board is
    //  currently selected.  This will allow the application to add
    //  the correct configuration bits as well use the correct
    //  initialization functions for the board.  These definitions are only
    //  required for this demo.  They are not required in
    //  final application design.


	
	#define mLED              LATBbits.LATB4
	// Blinks LED 1 on USB Starter kit
	#define BlinkLED() (mLED = ((ReadCoreTimer() & 0x0800000) != 0))
	#define InitLED() do{	\
							/*AD1PCFG = 0;*/ \
							TRISBbits.TRISB4 = 0; TRISAbits.TRISA8 = 0; \
							LATBbits.LATB4 = 1; LATAbits.LATA8 = 1;  \
						}while(0)					
	
	// Dipswitch #4
	#define ReadSwitchStatus() (PORTReadBits(IOPORT_B, BIT_1) & BIT_1)
   // Error indication.	
	#define Error()   do{LATBbits.LATB4 = 0; LATAbits.LATA8 = 1;} while(0);

	

#endif
