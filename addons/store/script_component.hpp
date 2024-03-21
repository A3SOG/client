#define COMPONENT store
#define COMPONENT_BEAUTIFIED Store
#include "..\main\script_mod.hpp"

// #define DEBUG_MODE_FULL
#define DISABLE_COMPILE_CACHE

#ifdef DEBUG_ENABLED_STORE
    #define DEBUG_MODE_FULL
#endif
    #ifdef DEBUG_SETTINGS_STORE
    #define DEBUG_SETTINGS DEBUG_SETTINGS_STORE
#endif

#include "..\main\script_macros.hpp"