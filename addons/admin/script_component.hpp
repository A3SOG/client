#define COMPONENT admin
#define COMPONENT_BEAUTIFIED Admin
#include "..\main\script_mod.hpp"

// #define DEBUG_MODE_FULL
#define DISABLE_COMPILE_CACHE

#ifdef DEBUG_ENABLED_ADMIN
    #define DEBUG_MODE_FULL
#endif
    #ifdef DEBUG_SETTINGS_ADMIN
    #define DEBUG_SETTINGS DEBUG_SETTINGS_ADMIN
#endif

#include "..\main\script_macros.hpp"