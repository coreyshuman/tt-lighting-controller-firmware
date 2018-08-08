
#include "Include\GenericTypeDefs.h"
#include "Include\HardwareProfile\HardwareProfile.h"
#include <stdlib.h>
#include <plib.h>
#include "main.h"

#define DELAY1  0x78
#define DELAY2  0x1000

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

#define SWITCH_PRESSED 0

#ifdef __cplusplus
extern "C" {
#endif

#ifdef __cplusplus
}
#endif

void PIXEL_Initialize(void);


INT main(void)
{
	UINT pbClk;

	// Setup configuration
	pbClk = SYSTEMConfig(SYS_FREQ, SYS_CFG_WAIT_STATES | SYS_CFG_PCACHE);
    INTConfigureSystem(INT_SYSTEM_CONFIG_MULT_VECTOR);
    INTEnableInterrupts();
	
	InitLED();
    
    // Initialize the transport layer - UART/USB/Ethernet
    TRANS_LAYER_Init(pbClk);
    
    PIXEL_Initialize();

    while(1) // main loop
    {
        BlinkLED();
        TRANS_LAYER_Task(); // Run Transport layer tasks
    }

    // Close transport layer.
    TRANS_LAYER_Close();
	
	return 0;
}			

DWORD data[5][12];

DWORD byteIndex = 0x0;
DWORD bitIndex = 0x100;
DWORD shiftAmount = 8;
DWORD dPtr[5];
BOOL pause = FALSE;
DWORD testByte1;
BYTE testByte2;
BYTE testByte3;

void PIXEL_Initialize(void) 
{
    ANSELA = 0;
    TRISCCLR = 0x0384;
    TRISBCLR = 0x0100;
    
    T2CON = 0x0; // Stop the timer and clear the control register,
    // prescaler at 1:1,internal clock source
    TMR2 = 0x0; // Clear the timer register
    PR2 = DELAY1; // Load the period register
    IPC2bits.T2IP = 2;
    IPC2bits.T2IS = 1;
    // Can be done in a single operation by assigning PC2SET = 0x0000000D
    IFS0CLR = _IFS0_T2IF_MASK; // Clear the timer interrupt status flag
    IEC0SET = _IEC0_T2IE_MASK; // Enable timer interrupts
    
    
    data[0][0] = 0x40000040;
    data[0][1] = 0x40404040;
    data[0][2] = 0x40404040;
    data[1][0] = 0x40000040;
    data[1][1] = 0x00400000;
    data[1][2] = 0x00004000;
    data[2][0] = 0x00004000;
    data[2][1] = 0x40000040;
    data[2][2] = 0x00400000;
    data[3][0] = 0x00400000;
    data[3][1] = 0x00004000;
    data[3][2] = 0x40000040;
    data[4][0] = 0x40400000;
    data[4][1] = 0x40400000;
    data[4][2] = 0x40400000;
    
    T2CONbits.TON = 1;
}



void __ISR(_TIMER_2_VECTOR, ipl2) Timer1Handler(void)
{
    IFS0CLR = _IFS0_T2IF_MASK; // Clear the timer interrupt status flag
    if(pause) {
        T2CONbits.TON = 0;
        TMR2 = 0x0;
        PR2 = DELAY1;
        pause = FALSE;
        T2CONbits.TON = 1;
    }
    
    asm volatile (
        "LA $t5, data \n"
        "LA $t0, shiftAmount \n"
        "LW $t7, shiftAmount \n"
        "ADDI $t7, $t7, -1 \n"      // decrement shiftAmount
        "SW $t7, 0($t0) \n"         // save shiftAmount
        "LW $t0, byteIndex \n"
        "ADD $t5, $t5, $t0 \n"         // byte offset
        "LB $t0, 0($t5) \n"         // load data 1
        "LB $t1, 48($t5) \n"         // load data 2
        "LB $t2, 96($t5) \n"         // load data 3
        "LB $t3, 144($t5) \n"         // load data 4
        "LB $t4, 192($t5) \n"         // load data 5
        "LI $v0, 0x0000 \n"
        "LI $v1, 0x0100 \n"
        "LA $t6, LATCCLR \n"
        "LA $t8, LATBCLR \n"
        "LI $t5, 0x0384 \n"         // bit mask for outputs
        "SW $t5, 0($t6) \n"         // set output high
        
    
        // output 1
        "SRLV $t6, $t0, $t7 \n"      // shift bit to [0]
        "ANDI $t6, $t6, 0x1 \n"        // mask bit [0]
        "SLL $t6, $t6, 0x09 \n"     // shift bit to rc[9] location
        "OR $v0, $v0, $t6 \n"       // OR into t0
        // output 2
        "SRLV $t6, $t1, $t7 \n"      // shift bit to [0]
        "ANDI $t6, $t6, 0x1 \n"        // mask bit [0]
        "SLL $t6, $t6, 0x02 \n"     // shift bit to rc[2] location
        "OR $v0, $v0, $t6 \n"       // OR into t0
        // init output 3
        "SW $v1, 0($t8) \n"         // set output high
        // output 4
        "SRLV $t6, $t3, $t7 \n"      // shift bit to [0]
        "ANDI $t6, $t6, 0x1 \n"        // mask bit [0]
        "SLL $t6, $t6, 0x07 \n"     // shift bit to rc[7] location
        "OR $v0, $v0, $t6 \n"       // OR into t0
        // output 5
        "SRLV $t6, $t4, $t7 \n"      // shift bit to [0]
        "ANDI $t6, $t6, 0x1 \n"        // mask bit [0]
        "SLL $t6, $t6, 0x08 \n"     // shift bit to rc[8] location
        "OR $v0, $v0, $t6 \n"       // OR into t0
        
        // update hi/lo status for 1,2,4,5
        "XOR $v0, $v0, $t5 \n"       // xor to invert bit status
        "LA $t1, LATCSET \n"
        "SW $v0, 0($t1) \n"
        // 8 bits
        // output 3
        "SRLV $t6, $t2, $t7 \n"      // shift bit to [0]
        "ANDI $t6, $t6, 0x1 \n"        // mask bit [0]
        "SLL $v0, $t6, 0x08 \n"     // shift bit to rb[8] location
        "XOR $v0, $v0, $v1 \n"       // xor to invert bit status
        "LA $t1, LATBSET \n"
        "SW $v0, 0($t1) \n"
    
        // end bit for 1,2,4,5
        "LA $t1, LATCSET \n"
        "SW $t5, 0($t1) \n"         // set all bits low
        "NOP \n"
        "NOP \n"
        "NOP \n"
        "NOP \n"
        "NOP \n"
        "NOP \n"
        // end bit for 3
        "LA $t1, LATBSET \n"
        "SW $v1, 0($t1) \n"
        
    );
     
    //testByte1++;
    //testByte2++;
    if(shiftAmount == 0) {
        byteIndex += 1;
        if(byteIndex == 12) {
            T2CONbits.TON = 0;
            byteIndex = 0;
            LATAbits.LATA8 = ~LATAbits.LATA8;
            TMR2 = 0x0;
            PR2 = DELAY2;
            pause = TRUE;
            T2CONbits.TON = 1;
        }
        shiftAmount = 8;
    }
    
    
}