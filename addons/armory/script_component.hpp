#define COMPONENT armory
#define COMPONENT_BEAUTIFIED Armory
#include "..\main\script_mod.hpp"

// #define DEBUG_MODE_FULL
#define DISABLE_COMPILE_CACHE

#ifdef DEBUG_ENABLED_ARMORY
    #define DEBUG_MODE_FULL
#endif
    #ifdef DEBUG_SETTINGS_ARMORY
    #define DEBUG_SETTINGS DEBUG_SETTINGS_ARMORY
#endif

#include "..\main\script_macros.hpp"