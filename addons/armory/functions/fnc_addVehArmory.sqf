#include "script_component.hpp"

params ["_class", "_type"];

private _index = (SOG_Garage_Unlocks select _type) pushBackUnique _class;

if (_index > - 1) then {
	[[_class]] call sog_client_armory_fnc_addVirtualVehs;

	switch (SOG_PDB_Mode) do {
		case 0: {
			profileNamespace setVariable ["SOG_Garage_Unlocks", SOG_Garage_Unlocks];
		};
		case 1: {
			_key = getPlayerUID player;
			[_key + "_Garage_Unlocks", str SOG_Garage_Unlocks] remoteExec ["db_fnc_save", 2, false];
		};
		case 2: {
			"ArmaSOGClient" callExtension ["save_unlock", ["garage", _class, _type]];
		};
		default {
			profileNamespace setVariable ["SOG_Garage_Unlocks", SOG_Garage_Unlocks];
		};
	};
};