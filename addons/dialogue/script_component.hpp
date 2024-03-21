#define COMPONENT dialogue
#define COMPONENT_BEAUTIFIED Dialogue
#include "..\main\script_mod.hpp"

// #define DEBUG_MODE_FULL
#define DISABLE_COMPILE_CACHE

#ifdef DEBUG_ENABLED_DIALOGUE
    #define DEBUG_MODE_FULL
#endif
    #ifdef DEBUG_SETTINGS_DIALOGUE
    #define DEBUG_SETTINGS DEBUG_SETTINGS_DIALOGUE
#endif

#include "..\main\script_macros.hpp"