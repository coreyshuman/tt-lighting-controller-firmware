#include "GenericTypeDefs.h"
#include "./HardwareProfile/HardwareProfile.h"
#include <stdlib.h>
#include <plib.h>
#include "./Controller/Config.h"
#include "./Controller/Lighting.h"

// support 12 x 5 leds for chaining led strips
#define NUM_LED_STRIPS_SUPPORTED 5

static BYTE LedBufferA[DEVICECOUNT][DEVICESIZEBYTES];
static BYTE LedBufferB[DEVICECOUNT][DEVICESIZEBYTES];
BYTE *LedDrawBuffer = (BYTE*)&LedBufferA;
BYTE *LedWriteBuffer = (BYTE*)&LedBufferB;
BOOL LedBusy = FALSE;
static DWORD byteIndex = 0x0;
static DWORD bitIndex = 0x100;
static DWORD shiftAmount = 8;
static BYTE ledStripLoop = NUM_LED_STRIPS_SUPPORTED; 

void LightingInit(void) 
{
    T1CON = 0x0; // Stop the timer and clear the control register,
    // prescaler at 1:1,internal clock source
    TMR1 = 0x0; // Clear the timer register
    PR1 = INNERBITDELAY; // Load the period register
    IPC1bits.T1IP = 7;
    IPC1bits.T1IS = 3;
    // Can be done in a single operation by assigning PC2SET = 0x0000000D
    IFS0CLR = _IFS0_T1IF_MASK; // Clear the timer interrupt status flag
    IEC0SET = _IEC0_T1IE_MASK; // Enable timer interrupts
}

void SwapBuffer(void)
{
    if(LedDrawBuffer == (BYTE*)LedBufferA) 
    {
        LedDrawBuffer = (BYTE*)LedBufferB;
        LedWriteBuffer = (BYTE*)LedBufferA;
    }
    else
    {
        LedDrawBuffer = (BYTE*)LedBufferA;
        LedWriteBuffer = (BYTE*)LedBufferB;
    }
}

void LightingUpdate(void)
{
    SwapBuffer();
    TMR1 = 0x0;
    T1CONbits.TON = 1;
    LedBusy = TRUE;
}

void ClearLeds(void)
{
    int i = 0;
    BYTE *ledWrite = LedWriteBuffer;
    for(i=0; i<DEVICESIZEBYTES*DEVICECOUNT; i++)
    {
        *ledWrite++ = 0x00;
    }
}

// Use DWord Ptr for improved performance
void ClearLedsForDevice(BYTE devIndex)
{
    int i = 0;
    DWORD *ledWrite = (DWORD*)(LedWriteBuffer + (devIndex * DEVICESIZEBYTES));
    for(i=0; i<DEVICESIZEBYTES / sizeof(DWORD); i++)
    {
        *ledWrite++ = 0x00000000;
    }
}

void SetDeviceLedColor(BYTE devIndex, BYTE ledIndex, BYTE green, BYTE red, BYTE blue)
{
    WORD offset = devIndex*DEVICESIZEBYTES + ledIndex * LEDSIZE;
    BYTE * ledWrite = LedWriteBuffer + offset;
    *ledWrite++ = green;
    *ledWrite++ = red;
    *ledWrite++ = blue;
}

void SetDeviceLedColorDW(BYTE devIndex, BYTE ledIndex, DWORD color)
{
    WORD offset = devIndex*DEVICESIZEBYTES + ledIndex * LEDSIZE;
    BYTE * ledWrite = LedWriteBuffer + offset;
    *ledWrite++ = color & 0xFF;
    *ledWrite++ = color >> 8 & 0xFF;
    *ledWrite++ = color >> 16 & 0xFF;
}

void SetDeviceSolidColor(BYTE devIndex, DWORD color)
{
    BYTE i;
    for(i = 0; i < DEVICESIZEBYTES; i++) 
    {
        SetDeviceLedColorDW(devIndex, i, color);
    }
}

void LightingCopyBuffer(BYTE* buf) 
{
    int i;
    BYTE * ledWrite = LedWriteBuffer;
    for(i = 0; i < DEVICECOUNT * DEVICESIZEBYTES; i++) {
        *ledWrite++ = *buf++;
    }
}

void __ISR(_TIMER_1_VECTOR, IPL7SOFT) Timer1Handler(void)
{
    INTDisableInterrupts();
    
    // Time-critical protocol clocked to WS2812B LED data lines
    // Timed for 48 MHz instruction clock
    asm volatile (
        "LW $t5, LedDrawBuffer \n"
        "LA $t0, shiftAmount \n"
        "LW $t7, shiftAmount \n"
        "ADDI $t7, $t7, -1 \n"      // decrement shiftAmount
        "SW $t7, 0($t0) \n"         // save shiftAmount
        "LW $t0, byteIndex \n"
        "ADD $t5, $t5, $t0 \n"      // byte offset
        "LB $t0, 0($t5) \n"         // load data 1
        "LB $t1, 36($t5) \n"        // load data 2
        "LB $t2, 72($t5) \n"        // load data 3
        "LB $t3, 108($t5) \n"       // load data 4
        "LB $t4, 144($t5) \n"       // load data 5
        "LA $t6, LATCCLR \n"
        "LI $t5, 0x0384 \n"         // bit mask for LATC outputs
    
        // Start data bit, set outputs 1,2,4,5 high
        // LATC Clock 0
        "SW $t5, 0($t6) \n"         // set LATC output high
    
        "LI $v0, 0x0000 \n"
        "LI $v1, 0x0100 \n"         // bit mask for LATB output
        "LA $t8, LATBCLR \n"
        
        // Start data bit, set output 3 high
        // LATB Clock 0
        "SW $v1, 0($t8) \n"         // set LATB output high
    
        // output 1, read bit
        "SRLV $t6, $t0, $t7 \n"     // shift bit to [0]
        "ANDI $t6, $t6, 0x1 \n"     // mask bit [0]
        "SLL $t6, $t6, 0x09 \n"     // shift bit to rc[9] location
        "OR $v0, $v0, $t6 \n"       // OR into v0
        // output 2, read bit
        "SRLV $t6, $t1, $t7 \n"     // shift bit to [0]
        "ANDI $t6, $t6, 0x1 \n"     // mask bit [0]
        "SLL $t6, $t6, 0x02 \n"     // shift bit to rc[2] location
        "OR $v0, $v0, $t6 \n"       // OR into v0
        
        // output 4, read bit
        "SRLV $t6, $t3, $t7 \n"     // shift bit to [0]
        "ANDI $t6, $t6, 0x1 \n"     // mask bit [0]
        "SLL $t6, $t6, 0x07 \n"     // shift bit to rc[7] location
        "OR $v0, $v0, $t6 \n"       // OR into v0
        // output 5, read bit
        "SRLV $t6, $t4, $t7 \n"     // shift bit to [0]
        "ANDI $t6, $t6, 0x1 \n"     // mask bit [0]
        "SLL $t6, $t6, 0x08 \n"     // shift bit to rc[8] location
        "OR $v0, $v0, $t6 \n"       // OR into v0
        
        // update data bit hi/lo status for output 1,2,4,5
        "XOR $v0, $v0, $t5 \n"      // xor to invert bit status
        "LA $t1, LATCSET \n"
         // LATC Clock 23 = 0.479us
        "SW $v0, 0($t1) \n"

        // output 3, read bit
        "SRLV $t6, $t2, $t7 \n"     // shift bit to [0]
        "ANDI $t6, $t6, 0x1 \n"     // mask bit [0]
        "SLL $v0, $t6, 0x08 \n"     // shift bit to rb[8] location
    
        // update data bit hi/lo status for output 3
        "XOR $v0, $v0, $v1 \n"      // xor to invert bit status
        "LA $t1, LATBSET \n"
        // LATB Clock 25 = 0.521us
        "SW $v0, 0($t1) \n"
    
        // end data bit, set low for output 1,2,4,5
        "LA $t1, LATCSET \n"
        "NOP \n"
        "NOP \n"
        // LATC Clock 33 = 0.688us
        "SW $t5, 0($t1) \n"         // set all outputs low
        "NOP \n"
        "NOP \n"
        "NOP \n"
        // end data bit, set low for output 3
        "LA $t1, LATBSET \n"
        // LATB Clock 34 = 0.708us
        "SW $v1, 0($t1) \n"
        
        // 0.708us of 1.25us elapsed
        // Interrupt should refire in 0.55us to 0.55us
    );
    
    // update index, shift amount, and led strip count
    // This workload time is variable, but stays within WS2182B spec
    if(shiftAmount == 0) {
        shiftAmount = 8;
        if(++ byteIndex == 36) {
            byteIndex = 0;
            if(-- ledStripLoop == 0) {
                // data complete, turn off timer
                T1CONbits.TON = 0;
                LedBusy = FALSE;
                ledStripLoop = NUM_LED_STRIPS_SUPPORTED;
            }
        }
    }
    
    TMR1 = 0x0;
    IFS0CLR = _IFS0_T1IF_MASK; // Clear the timer interrupt status flag
    INTEnableInterrupts();
}