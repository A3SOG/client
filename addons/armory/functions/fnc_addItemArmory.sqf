#include "script_component.hpp"

params [["_class", "", [""]], ["_type", 0, [0]]];

private _index = (GVAR(arsenalUnlocks) select _type) pushBackUnique _class;

if (_index > - 1) then {
	if (SOG_Armory_Type == 0) then {
		[SOG_Armory_Box, [_class], false, true, 1, _type] call BIS_fnc_addVirtualItemCargo;
	} else {
		[SOG_Armory_Box, [_class]] call ace_arsenal_fnc_addVirtualItems;
	};
};