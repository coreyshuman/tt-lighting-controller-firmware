

#ifndef _DEBUG_H    /* Guard against multiple inclusion */
#define _DEBUG_H



/* Provide C++ Compatibility */
#ifdef __cplusplus
extern "C" {
#endif

void putDebug(char d);
void resetDebug();
int getDebug(char *d);
   
    /* Provide C++ Compatibility */
#ifdef __cplusplus
}
#endif

#endif /* _DEBUG_H */

