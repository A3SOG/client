#define COMPONENT locker
#define COMPONENT_BEAUTIFIED Locker
#include "..\main\script_mod.hpp"

// #define DEBUG_MODE_FULL
#define DISABLE_COMPILE_CACHE

#ifdef DEBUG_ENABLED_LOCKER
    #define DEBUG_MODE_FULL
#endif
    #ifdef DEBUG_SETTINGS_LOCKER
    #define DEBUG_SETTINGS DEBUG_SETTINGS_LOCKER
#endif

#include "..\main\script_macros.hpp"