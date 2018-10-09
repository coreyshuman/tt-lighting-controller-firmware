
#define BOOT_EXCEPTION      0xAAAAAAAA
#define APP_EXCEPTION       0x5A5A5A5A

typedef struct {
    DWORD status;
    DWORD code;
    DWORD address;
} EXCEPTION_RESULT;

static enum {
    EXCEP_IRQ = 0,            // interrupt
    EXCEP_AdEL = 4,            // address error exception (load or ifetch)
    EXCEP_AdES,                // address error exception (store)
    EXCEP_IBE,                // bus error (ifetch)
    EXCEP_DBE,                // bus error (load/store)
    EXCEP_Sys,                // syscall
    EXCEP_Bp,                // breakpoint
    EXCEP_RI,                // reserved instruction
    EXCEP_CpU,                // coprocessor unusable
    EXCEP_Overflow,            // arithmetic overflow
    EXCEP_Trap,                // trap (possible divide by zero)
    EXCEP_IS1 = 16,            // implementation specific
    EXCEP_CEU,                // CorExtend Unusable
    EXCEP_C2E                // coprocessor 2
} _excep_code;

extern EXCEPTION_RESULT _exception_result;