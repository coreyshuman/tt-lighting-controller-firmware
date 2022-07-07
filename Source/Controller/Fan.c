#include "GenericTypeDefs.h"
#include "./HardwareProfile/HardwareProfile.h"
#include <stdlib.h>
#include <plib.h>
#include "./Controller/Config.h"
#include "./Controller/Fan.h"

static volatile __IC1CONbits_t *icCONbits[5] = {(__IC1CONbits_t*)&IC3CONbits, (__IC1CONbits_t*)&IC1CONbits, (__IC1CONbits_t*)&IC4CONbits, (__IC1CONbits_t*)&IC2CONbits, (__IC1CONbits_t*)&IC5CONbits};
static volatile DWORD *icBUF[5] = {(DWORD*)&IC3BUF, (DWORD*)&IC1BUF, (DWORD*)&IC4BUF, (DWORD*)&IC2BUF, (DWORD*)&IC5BUF};

static DWORD FanRpmNumerator = TIMER_2_FREQ * 120u; // timer hz * 60s/min / 2 pulse/rev * 4 pulse/capture
static BYTE FanUpdateIndex = 0;
static DWORD FanCaptureTicks[5];
static DWORD FanLastSample[5];
static WORD FanNoUpdateCount[5];

// shared variables
WORD FanSpeed[5];


WORD CalcFanPeriod(BYTE percent);

void PwmSetup(void)
{
    // The following code example will set the Output Compare modules
    // for PWM mode with FAULT pin disabled, a 25% duty cycle and a
    // PWM frequency of 25 kHz at Fosc = 48 MHz. Timer3 is selected as
    // the clock for the PWM time base and Timer3 interrupts
    // are enabled.
    
    DWORD *ocCon[5] = {(DWORD*)&OC1CON, (DWORD*)&OC2CON, (DWORD*)&OC3CON, (DWORD*)&OC4CON, (DWORD*)&OC5CON};
    DWORD *ocR[5] = {(DWORD*)&OC1R, (DWORD*)&OC2R, (DWORD*)&OC3R, (DWORD*)&OC4R, (DWORD*)&OC5R};
    DWORD *ocRs[5] = {(DWORD*)&OC1RS, (DWORD*)&OC2RS, (DWORD*)&OC3RS, (DWORD*)&OC4RS, (DWORD*)&OC5RS};
    
    BYTE *rcpxr[5] = {(BYTE*)&RPC1R, (BYTE*)&RPA8R, (BYTE*)&RPB4R, (BYTE*)&RPC3R, (BYTE*)&RPC4R};
    BYTE rcpxrVal[5] = {0b0110, 0b0101, 0b0101, 0b0101, 0b0101};
    int i = 0;
    for(i = 0; i < 5; i++)
    {
        *ocCon[i] = 0x0000;
        *rcpxr[i] = rcpxrVal[i];
        *ocR[i] = 0x01e0;
        *ocRs[i] = 0x01e0;
        *ocCon[i] = 0x800E;
        
        FanCaptureTicks[i] = 0;
        FanLastSample[i] = 0;
        FanSpeed[i] = 0;
        FanNoUpdateCount[i] = 0;
    }
}

void InputCaptureSetup(void)
{
    BYTE *rcpxr[5] = {(BYTE*)&IC1R, (BYTE*)&IC2R, (BYTE*)&IC3R, (BYTE*)&IC4R, (BYTE*)&IC5R};
    BYTE rcpxrVal[5] = {0b0010, 0b0100, 0b0111, 0b0100, 0b0101};
    // Enable Input Capture modules using timer 3 and edge detect mode
    DWORD *icCon[5] = {(DWORD*)&IC1CON, (DWORD*)&IC2CON, (DWORD*)&IC3CON, (DWORD*)&IC4CON, (DWORD*)&IC5CON};
    int i;
    for(i=0; i<5; i++)
    {
        *icCon[i] = 0x0000;         // disable input capture modules
        *rcpxr[i] = rcpxrVal[i];    // assign input capture pin
        *icCon[i] = IC_TIMER2_SRC | IC_EVERY_4_RISE_EDGE | IC_ON;
    }
}

void FanInit(void)
{
    // TMR 2 used for input capture
    T2CON = 0x0; // Stop the timer and clear the control register
    TMR2 = 0x0; // Clear the timer register
    T2CONbits.TCKPS = 7; // divisor = 256, TIMER_2_DIV
    PR2 = 0xFFFF;
    // TMR 3 used for output compare
    T3CON = 0x0; // Stop the timer and clear the control register,
    // prescaler at 1:1,internal clock source
    TMR3 = 0x0; // Clear the timer register
    // Set period (25000hz = 48000000/TIMER_3_FREQ)
    PR3 = GetSystemClock() / TIMER_3_FREQ - 1; 
    
    PwmSetup();
    InputCaptureSetup();
    
    //IPC3bits.T3IP = 5;
    //IPC3bits.T3IS = 3;
    //IFS0CLR = _IFS0_T3IF_MASK; // Clear the timer interrupt status flag
    //IEC0SET = _IEC0_T3IE_MASK; // Enable timer interrupts
    
    T3CONSET = 0x8000; // Enable Timer3
}

void FanCaptureEnable()
{
    T2CONSET = 0x8000; // Enable Timer2
}

void FanCaptureDisable()
{
    T2CONCLR = 0x8000; // Disable Timer2
}



void FanLoop(void)
{
    int i = FanUpdateIndex;
    
    // no captures available
    if(!icCONbits[i]->ICBNE) {
        FanNoUpdateCount[i]++;
    } 

    // loop to get all buffered measurements
    while(icCONbits[i]->ICBNE) {
        FanNoUpdateCount[i] = 0;
        DWORD val = *icBUF[i];
        DWORD tmp;
        if(val < FanLastSample[i])
        {
            tmp = 0xFFFF - FanLastSample[i] + val + 1;
        }
        else
        {
            tmp = val - FanLastSample[i];
        }
        FanCaptureTicks[i] = (FanCaptureTicks[i] + tmp) >> 1; // average over 2 samples
        FanLastSample[i] = val;
    }

    if(FanNoUpdateCount[i] > 50000) {
        FanCaptureTicks[i] = 0;
    }
    if(FanCaptureTicks[i] == 0) {
        FanSpeed[i] = 0;
    } else {
        // Fan RPM = timer_period / timer_ticks * 60s/min / 4pulse/revolution
        FanSpeed[i] = (WORD)(FanRpmNumerator / FanCaptureTicks[i]);
    }
    
    if(++ FanUpdateIndex == 5) {
        FanUpdateIndex = 0;
    }
}

void FanSetSpeeds(BYTE speeds[])
{
    int i;
    for(i=0; i<DEVICECOUNT; i++) {
        FanSetSpeed(i, speeds[i]);
    }
}

void FanSetSpeed(BYTE fanIdx, BYTE speed)
{
    if(speed > 100) speed = 100;
    if(fanIdx >= 5) return;
    DWORD *fanRegister = 0;
    switch(fanIdx)
    {
        case 0:
            fanRegister = (DWORD *)&OC5RS;
            break;
        case 1:
            fanRegister = (DWORD *)&OC2RS;
            break;
        case 2:
            fanRegister = (DWORD *)&OC1RS;
            break;
        case 3:
            fanRegister = (DWORD *)&OC4RS;
            break;
        case 4:
            fanRegister = (DWORD *)&OC3RS;
            break;
    }
    *fanRegister = CalcFanPeriod(100 - speed);
}

// percent is 0 to 100
WORD CalcFanPeriod(BYTE percent)
{
    return (percent * 0x0780) / 100;
}
