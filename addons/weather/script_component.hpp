#define COMPONENT weather
#define COMPONENT_BEAUTIFIED Weather
#include "..\main\script_mod.hpp"

// #define DEBUG_MODE_FULL
#define DISABLE_COMPILE_CACHE

#ifdef DEBUG_ENABLED_WEATHER
    #define DEBUG_MODE_FULL
#endif
    #ifdef DEBUG_SETTINGS_WEATHER
    #define DEBUG_SETTINGS DEBUG_SETTINGS_WEATHER
#endif

#include "..\main\script_macros.hpp"