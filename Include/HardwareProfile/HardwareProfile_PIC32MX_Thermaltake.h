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

    
    /**************************** App Stuff ********************************/
#define TIMER_2_FREQ    187500u
#define TIMER_3_FREQ    25000u
				
	
	#define ReadSwitchStatus() (PORTReadBits(IOPORT_B, BIT_1) & BIT_1)
   // Error indication.	
	#define Error()   do{LATBbits.LATB4 = 0; LATAbits.LATA8 = 1;} while(0);

	

#endif
