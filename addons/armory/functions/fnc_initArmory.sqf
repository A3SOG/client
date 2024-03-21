#include "script_component.hpp"

SOG_Armory_Box = "ReammoBox_F" createVehicleLocal [0, 0, -999];
[SOG_Armory_Box, false, false] call ace_arsenal_fnc_initBox;

SOG_PDB_Mode = "PDB_MODE" call BIS_fnc_getParamValue;
SOG_Armory_Type = "ARS_TYPE" call BIS_fnc_getParamValue;

switch (SOG_PDB_Mode) do {
	case 0: {
		SOG_Armory_Unlocks = profileNamespace getVariable ["SOG_Armory_Unlocks", [[],[],[],[]]];
		SOG_Garage_Unlocks = profileNamespace getVariable ["SOG_Garage_Unlocks", [[],[],[],[],[],[]]];

		if (SOG_Armory_Type == 0) then {
			{
				[SOG_Armory_Box, _x, false, true, 1, _forEachIndex] call BIS_fnc_addVirtualItemCargo;
			} foreach SOG_Armory_Unlocks;
		} else {
			{
				[SOG_Armory_Box, _x] call ace_arsenal_fnc_addVirtualItems;
			} foreach SOG_Armory_Unlocks;
		};

		{
			[_x] call sog_client_armory_fnc_addVirtualVehs;
		} forEach SOG_Garage_Unlocks;
	};
	case 1: {
		_key = getPlayerUID player;

		_fnc1 = "sog_client_armory_fnc_loadArmoryUnlocks";
		[_key + "_Armory_Unlocks", player, _fnc1, false] remoteExec ["db_fnc_load", 2, false];

		_fnc2 = "sog_client_armory_fnc_loadGarageUnlocks";
		[_key + "_Garage_Unlocks", player, _fnc2, false] remoteExec ["db_fnc_load", 2, false];
	};
	case 2: {
		// SOG_Armory_Unlocks = ["store_playerData.fetchUnlocks", ["armory"]] call py3_fnc_callExtension;
		// SOG_Garage_Unlocks = ["store_playerData.fetchUnlocks", ["garage"]] call py3_fnc_callExtension;

		_handler = 0 spawn {
			SOG_Armory_Unlocks = "ArmaSOGClient" callExtension ["fetch_unlocks", ["armory"]];
			sleep 0.1;
			SOG_Garage_Unlocks = "ArmaSOGClient" callExtension ["fetch_unlocks", ["garage"]];

			if (SOG_Armory_Type == 0) then {
				{
					[SOG_Armory_Box, _x, false, true, 1, _forEachIndex] call BIS_fnc_addVirtualItemCargo;
				} foreach SOG_Armory_Unlocks;
			} else {
				{
					[SOG_Armory_Box, _x] call ace_arsenal_fnc_addVirtualItems;
				} foreach SOG_Armory_Unlocks;
			};

			{
				[_x] call sog_client_armory_fnc_addVirtualVehs;
			} forEach SOG_Garage_Unlocks;
		};
	};
	default {
		SOG_Armory_Unlocks = profileNamespace getVariable ["SOG_Armory_Unlocks", [[],[],[],[]]];
		SOG_Garage_Unlocks = profileNamespace getVariable ["SOG_Garage_Unlocks", [[],[],[],[],[],[]]];

		if (SOG_Armory_Type == 0) then {
			{
				[SOG_Armory_Box, _x, false, true, 1, _forEachIndex] call BIS_fnc_addVirtualItemCargo;
			} foreach SOG_Armory_Unlocks;
		} else {
			{
				[SOG_Armory_Box, _x] call ace_arsenal_fnc_addVirtualItems;
			} foreach SOG_Armory_Unlocks;
		};

		{
			[_x] call sog_client_armory_fnc_addVirtualVehs;
		} forEach SOG_Garage_Unlocks;
	};
};