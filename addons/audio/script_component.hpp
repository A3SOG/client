#define COMPONENT audio
#define COMPONENT_BEAUTIFIED Audio
#include "..\main\script_mod.hpp"

// #define DEBUG_MODE_FULL
#define DISABLE_COMPILE_CACHE

#ifdef DEBUG_ENABLED_AUDIO
    #define DEBUG_MODE_FULL
#endif
    #ifdef DEBUG_SETTINGS_AUDIO
    #define DEBUG_SETTINGS DEBUG_SETTINGS_AUDIO
#endif

#include "..\main\script_macros.hpp"