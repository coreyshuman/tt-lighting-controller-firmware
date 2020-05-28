#include "./Controller/Debug.h"

static char Debug[960];
static int DebugLen;

void DebugPut(char d) {
    if(DebugLen >= 960) {
        return;
    }
    Debug[DebugLen++] = d;
}

void DebugReset() {
    DebugLen = 0;
}

int DebugGet(char *d) {
    int i;
    for(i=0; i < DebugLen; i++) {
        d[i] = Debug[i];
    }
    return DebugLen;
}

