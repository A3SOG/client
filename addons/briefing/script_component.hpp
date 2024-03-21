#define COMPONENT briefing
#define COMPONENT_BEAUTIFIED Briefing
#include "..\main\script_mod.hpp"

// #define DEBUG_MODE_FULL
#define DISABLE_COMPILE_CACHE

#ifdef DEBUG_ENABLED_BRIEFING
    #define DEBUG_MODE_FULL
#endif
    #ifdef DEBUG_SETTINGS_BRIEFING
    #define DEBUG_SETTINGS DEBUG_SETTINGS_BRIEFING
#endif

#include "..\main\script_macros.hpp"