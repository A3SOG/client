#define COMPONENT service
#define COMPONENT_BEAUTIFIED Service
#include "..\main\script_mod.hpp"

// #define DEBUG_MODE_FULL
#define DISABLE_COMPILE_CACHE

#ifdef DEBUG_ENABLED_SERVICE
    #define DEBUG_MODE_FULL
#endif
    #ifdef DEBUG_SETTINGS_SERVICE
    #define DEBUG_SETTINGS DEBUG_SETTINGS_SERVICE
#endif

#include "..\main\script_macros.hpp"