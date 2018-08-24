#include "Include\GenericTypeDefs.h"
#include "Include\HardwareProfile\HardwareProfile.h"
#include <stdlib.h>
#include <plib.h>
#include "Fan.h"

BYTE fanSpeed = 0;
BYTE fanDir = 1;

WORD CalcFanPeriod(BYTE percent);

void FanInit(void)
{
    // setup pins
    TRISCbits.TRISC1 = 0;
    TRISAbits.TRISA8 = 0;
    TRISBbits.TRISB4 = 0;
    TRISCbits.TRISC3 = 0;
    TRISCbits.TRISC4 = 0;

    T3CON = 0x0; // Stop the timer and clear the control register,
    // prescaler at 1:1,internal clock source
    TMR3 = 0x0; // Clear the timer register
    PR3 = 0x0780-1; // Set period
    
    // The following code example will set the Output Compare modules
    // for PWM mode with FAULT pin disabled, a 25% duty cycle and a
    // PWM frequency of 25 kHz at Fosc = 48 MHz. Timer3 is selected as
    // the clock for the PWM time base and Timer3 interrupts
    // are enabled.
    
    DWORD *ocCon[5] = {&OC1CON, &OC2CON, &OC3CON, &OC4CON, &OC5CON};
    DWORD *ocR[5] = {&OC1R, &OC2R, &OC3R, &OC4R, &OC5R};
    DWORD *ocRs[5] = {&OC1RS, &OC2RS, &OC3RS, &OC4RS, &OC5RS};
    // set OC output pins: 
    //  fan1 - oc5 - rc1
    //  fan2 - oc2 - ra8
    //  fan3 - oc1 - rb4
    //  fan4 - oc4 - rc3
    //  fan5 - oc3 - rc4
    BYTE *rcpxr[5] = {&RPC1R, &RPA8R, &RPB4R, &RPC3R, &RPC4R};
    BYTE rcpxrVal[5] = {0b0110, 0b0101, 0b0101, 0b0101, 0b0101};
    int i = 0;
    for(i = 0; i < 5; i++)
    {
        *rcpxr[i] = rcpxrVal[i];
        *ocCon[i] = 0x0000;
        *ocR[i] = 0x01e0;
        *ocRs[i] = 0x01e0;
        *ocCon[i] = 0x800E;
    }
    
    /*
    OC5CON = 0x0000; // Turn off OC5 while doing setup.
    OC5R = 0x001e0; // Initialize primary Compare Register
    OC5RS = 0x01e0; // Initialize secondary Compare Register
    OC5CONSET = 0x000E;
   */
    
    IPC3bits.T3IP = 5;
    IPC3bits.T3IS = 3;
    IFS0CLR = _IFS0_T3IF_MASK; // Clear the timer interrupt status flag
    IEC0SET = _IEC0_T3IE_MASK; // Enable timer interrupts
    
    T3CONSET = 0x8000; // Enable Timer3
}

void FanLoop(void)
{
    
}


void __ISR(_OUTPUT_COMPARE_5_VECTOR, IPL6SOFT) OC5IntHandler(void)
{
    IFS0CLR = _IFS0_OC5IF_MASK; // Clear the OC5 interrupt flag
}

void __ISR(_TIMER_3_VECTOR, IPL5SOFT) Timer3Handler(void)
{
    
    if(fanSpeed == 0) {
        fanDir = 1;
    } 
    else if (fanSpeed == 100) {
        fanDir = 0;
    }
    if(fanDir > 0)
    {
        fanSpeed ++;
    }
    else
    {
        fanSpeed --;
    }
    OC1RS = OC2RS = OC3RS = OC4RS = OC5RS = CalcFanPeriod(fanSpeed);
    
    IFS0CLR = _IFS0_T3IF_MASK; 
}

// percent is 0 to 100
WORD CalcFanPeriod(BYTE percent)
{
    return (percent * 0x0780) / 100;
}