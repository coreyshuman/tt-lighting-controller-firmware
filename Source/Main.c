
#include "Include\GenericTypeDefs.h"
#include "Include\HardwareProfile\HardwareProfile.h"
#include <stdlib.h>
#include <plib.h>
#include "Main.h"
#include "Include\Controller\Controller.h"

/*** DEVCFG0 ***/
#pragma config DEBUG =      ON
#pragma config JTAGEN =     OFF
#pragma config ICESEL =     ICS_PGx4
#pragma config PWP =        OFF
#pragma config BWP =        OFF
#pragma config CP =         OFF

/*** DEVCFG1 ***/
#pragma config FNOSC =      PRIPLL
#pragma config FSOSCEN =    OFF
#pragma config IESO =       OFF
#pragma config POSCMOD =    HS
#pragma config OSCIOFNC =   OFF
#pragma config FPBDIV =     DIV_1
#pragma config FCKSM =      CSDCMD
#pragma config WDTPS =      PS1048576
#pragma config FWDTEN =     OFF
#pragma config WINDIS =     OFF
#pragma config FWDTWINSZ =  WINSZ_50

/*** DEVCFG2 ***/
#pragma config FPLLIDIV =   DIV_3
#pragma config FPLLMUL =    MUL_24
#pragma config FPLLODIV =   DIV_2
#pragma config UPLLIDIV =   DIV_3
#pragma config UPLLEN =     ON

/*** DEVCFG3 ***/
//#pragma config USERID =     0x0000
#pragma config PMDL1WAY =   ON
#pragma config IOL1WAY =    ON
#pragma config FUSBIDIO =   OFF
#pragma config FVBUSONIO =  OFF

INT main(void)
{
	UINT pbClk;

	// Setup configuration
	pbClk = SYSTEMConfig(SYS_FREQ, SYS_CFG_WAIT_STATES | SYS_CFG_PCACHE);
    INTConfigureSystem(INT_SYSTEM_CONFIG_MULT_VECTOR);
    INTEnableInterrupts();
    
    // no analog inputs
    ANSELA = 0;
    ANSELB = 0;
    ANSELC = 0;
    
    // Dip switch inputs
    TRISAbits.TRISA0 = 1;
    TRISAbits.TRISA1 = 1;
    TRISBbits.TRISB0 = 1;
    TRISBbits.TRISB1 = 1;
    
    // set LED output pins:
    //  led 1 - rc9
    //  led 2 - rc2
    //  led 3 - rb8
    //  led 4 - rc7
    //  led 5 - rc8
    TRISCCLR = 0x0384;
    TRISBCLR = 0x0100;
    
    // set OC output pins: 
    //  fan1 - oc5 - rc1
    //  fan2 - oc2 - ra8
    //  fan3 - oc1 - rb4
    //  fan4 - oc4 - rc3
    //  fan5 - oc3 - rc4
    TRISCbits.TRISC1 = 0;
    TRISAbits.TRISA8 = 0;
    TRISBbits.TRISB4 = 0;
    TRISCbits.TRISC3 = 0;
    TRISCbits.TRISC4 = 0;
    
    // set IC output pins: 
    //  fan1 - ic3 - ra9
    //  fan2 - ic1 - ra4
    //  fan3 - ic4 - rb7
    //  fan4 - ic2 - rb9
    //  fan5 - ic5 - rc6
    TRISAbits.TRISA9 = 1;
    TRISAbits.TRISA4 = 1;
    TRISBbits.TRISB7 = 1;
    TRISBbits.TRISB9 = 1;
    TRISCbits.TRISC6 = 1;
    
    // Initialize USB
    TRANS_LAYER_Init(pbClk);
    
    ControllerInitialize();

    while(1) // main loop
    {
        TRANS_LAYER_Task(); // Run Transport layer tasks
        ControllerLoop();
    }

    // Close transport layer.
    TRANS_LAYER_Close();
	
	return 0;
}			







