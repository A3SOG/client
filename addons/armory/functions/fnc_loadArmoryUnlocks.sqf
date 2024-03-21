#include "script_component.hpp"

if (_this isEqualTo []) then {
	SOG_Armory_Unlocks = [[],[],[],[]];
} else {
	SOG_Armory_Unlocks = _this;
};

if (SOG_Armory_Type == 0) then {
	{
		[SOG_Armory_Box, _x, false, true, 1, _forEachIndex] call BIS_fnc_addVirtualItemCargo;
	} foreach SOG_Armory_Unlocks;
} else {
	{
		[SOG_Armory_Box, _x] call ace_arsenal_fnc_addVirtualItems;
	} foreach SOG_Armory_Unlocks;
};