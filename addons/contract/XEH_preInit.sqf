#include "script_component.hpp"
ADDON = false;

PREP_RECOMPILE_START;
#include "XEH_PREP.hpp"
PREP_RECOMPILE_END;

ADDON = true;

// Init global variables
GVAR(allHostages) = [];
GVAR(allHVTs) = [];
GVAR(allIEDs) = [];
GVAR(allObjects) = [];
GVAR(allShooters) = [];
GVAR(allTargets) = [];