#include "script_component.hpp"

GVAR(defusedCount) = 0;

["ace_explosives_defuse", {
	GVAR(defusedCount) = GVAR(defusedCount) + 1;
}] call CFUNC(addEventHandler);