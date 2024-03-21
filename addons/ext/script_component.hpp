#define COMPONENT ext
#define COMPONENT_BEAUTIFIED Ext
#include "..\main\script_mod.hpp"

// #define DEBUG_MODE_FULL
#define DISABLE_COMPILE_CACHE

#ifdef DEBUG_ENABLED_EXT
    #define DEBUG_MODE_FULL
#endif
    #ifdef DEBUG_SETTINGS_EXT
    #define DEBUG_SETTINGS DEBUG_SETTINGS_EXT
#endif

#include "..\main\script_macros.hpp"