#define COMPONENT callout
#define COMPONENT_BEAUTIFIED Callout
#include "..\main\script_mod.hpp"

// #define DEBUG_MODE_FULL
#define DISABLE_COMPILE_CACHE

#ifdef DEBUG_ENABLED_CALLOUT
    #define DEBUG_MODE_FULL
#endif
    #ifdef DEBUG_SETTINGS_CALLOUT
    #define DEBUG_SETTINGS DEBUG_SETTINGS_CALLOUT
#endif

#include "..\main\script_macros.hpp"