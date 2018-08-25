#include "Include\GenericTypeDefs.h"
#include "Include\HardwareProfile\HardwareProfile.h"
#include <stdlib.h>
#include <plib.h>
#include "Fan.h"

#define FAN_SPEED_NUM       (TIMER_2_FREQ * 60u / 2u)



WORD CalcFanPeriod(BYTE percent);

void PwmSetup(void)
{
    TRISCbits.TRISC1 = 0;
    TRISAbits.TRISA8 = 0;
    TRISBbits.TRISB4 = 0;
    TRISCbits.TRISC3 = 0;
    TRISCbits.TRISC4 = 0;
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
        *ocCon[i] = 0x0000;
        *rcpxr[i] = rcpxrVal[i];
        *ocR[i] = 0x01e0;
        *ocRs[i] = 0x01e0;
        *ocCon[i] = 0x800E;
    }
}

void InputCaptureSetup(void)
{
    TRISAbits.TRISA9 = 1;
    TRISAbits.TRISA4 = 1;
    TRISBbits.TRISB7 = 1;
    TRISBbits.TRISB9 = 1;
    TRISCbits.TRISC6 = 1;
    // set IC output pins: 
    //  fan1 - ic3 - ra9
    //  fan2 - ic1 - ra4
    //  fan3 - ic4 - rb7
    //  fan4 - ic2 - rb9
    //  fan5 - ic5 - rc6
    BYTE *rcpxr[5] = {&IC1R, &IC2R, &IC3R, &IC4R, &IC5R};
    BYTE rcpxrVal[5] = {0b0010, 0b0100, 0b0111, 0b0100, 0b0101};
    // Enable Input Capture modules using timer 3 and edge detect mode
    DWORD *icCon[5] = {&IC1CON, &IC2CON, &IC3CON, &IC4CON, &IC5CON};
    int i;
    for(i=0; i<5; i++)
    {
        *icCon[i] = 0x0000;    // disable input capture modules
        *rcpxr[i] = rcpxrVal[i];
        *icCon[i] = 0x8081;
    }
}

void FanInit(void)
{
    // TMR 2 used for input capture
    T2CON = 0x0; // Stop the timer and clear the control register
    TMR2 = 0x0; // Clear the timer register
    T2CONbits.TCKPS = 7; // divisor = 256
    PR2 = 0xFFFF;
    // TMR 3 used for output compare
    T3CON = 0x0; // Stop the timer and clear the control register,
    // prescaler at 1:1,internal clock source
    TMR3 = 0x0; // Clear the timer register
    PR3 = 0x0780-1; // Set period (25000hz = 48000000/TIMER_3_FREQ)
    
    PwmSetup();
    InputCaptureSetup();
    
    IPC3bits.T3IP = 5;
    IPC3bits.T3IS = 3;
    IFS0CLR = _IFS0_T3IF_MASK; // Clear the timer interrupt status flag
    IEC0SET = _IEC0_T3IE_MASK; // Enable timer interrupts
    
    T3CONSET = 0x8000; // Enable Timer3
    T2CONSET = 0x8000; // Enable Timer2
}

DWORD fan1period = 1;
WORD fan1speed = 0;
DWORD fan1LastSample = 0;
void FanLoop(void)
{
    while(IC3CONbits.ICBNE)
    {
        DWORD val = IC3BUF;
        DWORD tmp;
        if(val < fan1LastSample)
        {
            tmp = 0xFFFF - fan1LastSample + val + 1;
        }
        else
        {
            tmp = val - fan1LastSample;
        }
        fan1period = (fan1period + tmp) >> 1;
        fan1LastSample = val;
        //fan1period = val;
    }
    if(fan1period == 0)
    {
        fan1period = 1;
    }
    // fan1speed = 187500 / ticks * 60 
    fan1speed = (WORD)(FAN_SPEED_NUM / fan1period);
    
}

void FanSetSpeed(BYTE fanIdx, BYTE speed)
{
    if(speed > 100) speed = 100;
    if(fanIdx >= 5) return;
    DWORD *fanRegister = 0;
    switch(fanIdx)
    {
        case 0:
            fanRegister = &OC5RS;
            break;
        case 1:
            fanRegister = &OC2RS;
            break;
        case 2:
            fanRegister = &OC1RS;
            break;
        case 3:
            fanRegister = &OC4RS;
            break;
        case 4:
            fanRegister = &OC3RS;
            break;
    }
    *fanRegister = CalcFanPeriod(speed);
}

/*
void __ISR(_OUTPUT_COMPARE_5_VECTOR, IPL6SOFT) OC5IntHandler(void)
{
    IFS0CLR = _IFS0_OC5IF_MASK; // Clear the OC5 interrupt flag
}
 */

void __ISR(_TIMER_3_VECTOR, IPL5SOFT) Timer3Handler(void)
{
    IFS0CLR = _IFS0_T3IF_MASK; 
}

// percent is 0 to 100
WORD CalcFanPeriod(BYTE percent)
{
    return (percent * 0x0780) / 100;
}