#define COMPONENT contract
#define COMPONENT_BEAUTIFIED Contract
#include "..\main\script_mod.hpp"

// #define DEBUG_MODE_FULL
#define DISABLE_COMPILE_CACHE

#ifdef DEBUG_ENABLED_CONTRACT
    #define DEBUG_MODE_FULL
#endif
    #ifdef DEBUG_SETTINGS_CONTRACT
    #define DEBUG_SETTINGS DEBUG_SETTINGS_CONTRACT
#endif

#include "..\main\script_macros.hpp"