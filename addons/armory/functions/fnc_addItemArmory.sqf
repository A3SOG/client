#include "script_component.hpp"

params ["_class", "_type"];

private _index = (SOG_Armory_Unlocks select _type) pushBackUnique _class;

if (_index > - 1) then {
	if (SOG_Armory_Type == 0) then {
		[SOG_Armory_Box, [_class], false, true, 1, _type] call BIS_fnc_addVirtualItemCargo;
	} else {
		[SOG_Armory_Box, [_class]] call ace_arsenal_fnc_addVirtualItems;
	};

	switch (SOG_PDB_Mode) do {
		case 0: {
			profileNamespace setVariable ["SOG_Armory_Unlocks", SOG_Armory_Unlocks];
		};
		case 1: {
			// _key = getPlayerUID player;
			// [_key + "_Armory_Unlocks", str SOG_Armory_Unlocks] remoteExec ["db_fnc_save", 2, false];
			["armory", SOG_Armory_Unlocks] call dragonfly_db_fnc_hashSet;
		};
		case 2: {
			"ArmaSOGClient" callExtension ["save_unlock", ["armory", _class, _type]];
		};
		default {
			profileNamespace setVariable ["SOG_Armory_Unlocks", SOG_Armory_Unlocks];
		};
	};
};