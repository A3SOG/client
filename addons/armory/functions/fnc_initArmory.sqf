#include "script_component.hpp"

SOG_Armory_Box = "ReammoBox_F" createVehicleLocal [0, 0, -999];
[SOG_Armory_Box, false, false] call ace_arsenal_fnc_initBox;

SOG_PDB_Mode = "PDB_MODE" call BIS_fnc_getParamValue;
SOG_Armory_Type = "ARS_TYPE" call BIS_fnc_getParamValue;

player setVariable ["value_armoryDone", false];

switch (SOG_PDB_Mode) do {
	case 0: {
		GVAR(arsenalUnlocks) = profileNamespace getVariable ["ArsenalUnlocks", []];
		GVAR(garageUnlocks) = profileNamespace getVariable ["GarageUnlocks", []];

		if (SOG_Armory_Type == 0) then {
			{
				[SOG_Armory_Box, _x, false, true, 1, _forEachIndex] call BIS_fnc_addVirtualItemCargo;
			} foreach GVAR(arsenalUnlocks);
		} else {
			{
				[SOG_Armory_Box, _x] call ace_arsenal_fnc_addVirtualItems;
			} foreach GVAR(arsenalUnlocks);
		};

		{
			[_x] call sog_client_armory_fnc_addVirtualVehs;
		} forEach GVAR(garageUnlocks);

		player setVariable ["value_armoryDone", true];
	};
	case 1: {
		_handler = 0 spawn {
			waitUntil { value_serverDone };

			// _key = getPlayerUID player;
			// [_key + "_Armory_Unlocks", player, "sog_client_armory_fnc_loadArmoryUnlocks", false] remoteExec ["db_fnc_load", 2, false];
			// ["hget", "", "armory_unlocks", -1, [], "sog_client_armory_fnc_loadArmoryUnlocks", "null", false] spawn dragonfly_db_fnc_addTask;
			["hgetid", getPlayerUID player, "armory_unlocks", -1, [], "sog_client_armory_fnc_loadArmoryUnlocks", netId player, false] remoteExec ["dragonfly_db_fnc_addTask", 2, false];
			// [[netId player, getPlayerUID player], {["hgetid", _this select 1, "armory_unlocks", -1, [], "sog_client_armory_fnc_loadArmoryUnlocks", _this select 0, false] remoteExec ["dragonfly_db_fnc_addTask", 2, false]}] remoteExec ["call", 2];

			uiSleep 1;

			// [_key + "_Garage_Unlocks", player, "sog_client_armory_fnc_loadGarageUnlocks", false] remoteExec ["db_fnc_load", 2, false];
			// ["hget", "", "garage_unlocks", -1, [], "sog_client_armory_fnc_loadGarageUnlocks", "null", false] spawn dragonfly_db_fnc_addTask;
			["hgetid", getPlayerUID player, "garage_unlocks", -1, [], "sog_client_armory_fnc_loadGarageUnlocks", netId player, false] remoteExec ["dragonfly_db_fnc_addTask", 2, false];
			// [[netId player, getPlayerUID player], {["hgetid", _this select 1, "garage_unlocks", -1, [], "sog_client_armory_fnc_loadGarageUnlocks", _this select 0, false] remoteExec ["dragonfly_db_fnc_addTask", 2, false]}] remoteExec ["call", 2];

			uiSleep 1;
			player setVariable ["value_armoryDone", true];
		};
	};
	case 2: {
		_handler = 0 spawn {
			uiSleep 0.2;
			GVAR(arsenalUnlocks) = "ArmaSOGClient" callExtension ["fetch_unlocks", ["armory"]];
			uiSleep 0.2;
			GVAR(garageUnlocks) = "ArmaSOGClient" callExtension ["fetch_unlocks", ["garage"]];

			if (SOG_Armory_Type == 0) then {
				{
					[SOG_Armory_Box, _x, false, true, 1, _forEachIndex] call BIS_fnc_addVirtualItemCargo;
				} foreach GVAR(arsenalUnlocks);
			} else {
				{
					[SOG_Armory_Box, _x] call ace_arsenal_fnc_addVirtualItems;
				} foreach GVAR(arsenalUnlocks);
			};

			{
				[_x] call sog_client_armory_fnc_addVirtualVehs;
			} forEach GVAR(garageUnlocks);

			player setVariable ["value_armoryDone", true];
		};
	};
	default {
		GVAR(arsenalUnlocks) = profileNamespace getVariable ["ArsenalUnlocks", []];
		GVAR(garageUnlocks) = profileNamespace getVariable ["GarageUnlocks", []];

		if (SOG_Armory_Type == 0) then {
			{
				[SOG_Armory_Box, _x, false, true, 1, _forEachIndex] call BIS_fnc_addVirtualItemCargo;
			} foreach GVAR(arsenalUnlocks);
		} else {
			{
				[SOG_Armory_Box, _x] call ace_arsenal_fnc_addVirtualItems;
			} foreach GVAR(arsenalUnlocks);
		};

		{
			[_x] call sog_client_armory_fnc_addVirtualVehs;
		} forEach GVAR(garageUnlocks);

		player setVariable ["value_armoryDone", true];
	};
};
