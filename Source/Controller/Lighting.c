
#include "Include\GenericTypeDefs.h"
#include "Include\HardwareProfile\HardwareProfile.h"
#include <stdlib.h>
#include <plib.h>
#include "Include\Controller\Lighting.h"

DWORD LedBufferA[5][9];
DWORD LedBufferB[5][9];
BYTE *LedDrawBuffer = (BYTE*)LedBufferA;
BYTE *LedWriteBuffer = (BYTE*)LedBufferB;
BOOL LedBusy = FALSE;

DWORD byteIndex = 0x0;
DWORD bitIndex = 0x100;
DWORD shiftAmount = 8;

void LightingInit(void) 
{
    ANSELA = 0;
    TRISCCLR = 0x0384;
    TRISBCLR = 0x0100;
    
    T2CON = 0x0; // Stop the timer and clear the control register,
    // prescaler at 1:1,internal clock source
    TMR2 = 0x0; // Clear the timer register
    PR2 = INNERBITDELAY; // Load the period register
    IPC2bits.T2IP = 7;
    IPC2bits.T2IS = 3;
    // Can be done in a single operation by assigning PC2SET = 0x0000000D
    IFS0CLR = _IFS0_T2IF_MASK; // Clear the timer interrupt status flag
    IEC0SET = _IEC0_T2IE_MASK; // Enable timer interrupts
    
    T2CONbits.TON = 1;
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
    TMR2 = 0x0;
    //PR2 = INNERBITDELAY;
    T2CONbits.TON = 1;
    LedBusy = TRUE;
}

void SetDeviceLedColor(BYTE devIndex, BYTE ledIndex, DWORD color)
{
    WORD offset = devIndex*DEVICESIZE + ledIndex * LEDSIZE;
    BYTE * ledWrite = LedWriteBuffer + offset;
    *ledWrite++ = color & 0xFF;
    *ledWrite++ = color >> 8 & 0xFF;
    *ledWrite++ = color >> 16 & 0xFF;
}

void SetDeviceSolidColor(BYTE devIndex, DWORD color)
{
    BYTE i;
    for(i = 0; i < DEVICESIZE; i++) 
    {
        SetDeviceLedColor(devIndex, i, color);
    }
}

void __ISR(_TIMER_2_VECTOR, IPL7SOFT) Timer1Handler(void)
{
    IFS0CLR = _IFS0_T2IF_MASK; // Clear the timer interrupt status flag
    
    asm volatile (
        "LW $t5, LedDrawBuffer \n"
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
    
    if(shiftAmount == 0) {
        byteIndex += 1;
        if(byteIndex == 36) {
            T2CONbits.TON = 0;
            byteIndex = 0;
            LedBusy = FALSE;
        }
        shiftAmount = 8;
    }
}