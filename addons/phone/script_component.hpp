#define COMPONENT phone
#define COMPONENT_BEAUTIFIED Phone
#include "..\main\script_mod.hpp"

// #define DEBUG_MODE_FULL
#define DISABLE_COMPILE_CACHE

#ifdef DEBUG_ENABLED_PHONE
    #define DEBUG_MODE_FULL
#endif
    #ifdef DEBUG_SETTINGS_PHONE
    #define DEBUG_SETTINGS DEBUG_SETTINGS_PHONE
#endif

#include "..\main\script_macros.hpp"