#include "script_component.hpp"

if (SOG_Armory_Type == 0) then {
	["Open", [false, SOG_Armory_Box, player]] call BIS_fnc_arsenal;
} else {
	[SOG_Armory_Box, player, false] call ace_arsenal_fnc_openBox;
};