#include "./Controller/Debug.h"

static char Debug[960];
static int DebugLen;

void putDebug(char d) {
    if(DebugLen >= 960) {
        return;
    }
    Debug[DebugLen++] = d;
}

void resetDebug() {
    DebugLen = 0;
}

int getDebug(char *d) {
    int i;
    for(i=0; i < DebugLen; i++) {
        d[i] = Debug[i];
    }
    return DebugLen;
}

