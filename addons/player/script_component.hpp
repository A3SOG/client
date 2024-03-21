#define COMPONENT player
#define COMPONENT_BEAUTIFIED Player
#include "..\main\script_mod.hpp"

// #define DEBUG_MODE_FULL
#define DISABLE_COMPILE_CACHE

#ifdef DEBUG_ENABLED_PLAYER
    #define DEBUG_MODE_FULL
#endif
    #ifdef DEBUG_SETTINGS_PLAYER
    #define DEBUG_SETTINGS DEBUG_SETTINGS_PLAYER
#endif

#include "..\main\script_macros.hpp"