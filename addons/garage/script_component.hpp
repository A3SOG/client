#define COMPONENT garage
#define COMPONENT_BEAUTIFIED Garage
#include "..\main\script_mod.hpp"

// #define DEBUG_MODE_FULL
#define DISABLE_COMPILE_CACHE

#ifdef DEBUG_ENABLED_GARAGE
    #define DEBUG_MODE_FULL
#endif
    #ifdef DEBUG_SETTINGS_GARAGE
    #define DEBUG_SETTINGS DEBUG_SETTINGS_GARAGE
#endif

#include "..\main\script_macros.hpp"