#include "script_component.hpp"

/*
	@file Title: ArmaDragonflyClient Framework by Creedcoder, J.Schmidt
	@file Version: 0.1
	@file Name: fnc_firstLogin.sqf
	@file Author: Creedcoder, J.Schmidt
	@file edit: 03.25.2024
	Copyright © 2024 Creedcoder, J.Schmidt, All rights reserved

	Do not edit without permission!

	This work is licensed under the Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License.
	To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-nd/4.0/ or send a letter to Creative Commons,
	444 Castro Street, Suite 900, Mountain View, California, 94041, USA.

	Player Save Armory Unlocks:
*/

params ["_unlockType"];

switch (_unlockType) do {
    case "armory": {
        switch (SOG_PDB_Mode) do {
            case 0: {
                profileNamespace setVariable ["ArsenalUnlocks", GVAR(arsenalUnlocks)];
            };
            case 1: {
                // ["hset", "", "armory_unlocks", -1, GVAR(arsenalUnlocks), "", "null", false] spawn dragonfly_db_fnc_addTask;
                ["hsetid", getPlayerUID player, "armory_unlocks", -1, GVAR(arsenalUnlocks), "", "null", false] remoteExec ["dragonfly_db_fnc_addTask", 2, false];
            };
            case 2: {
                "ArmaSOGClient" callExtension ["save_unlock", ["armory", _class, _type]];
            };
            default {
                profileNamespace setVariable ["ArsenalUnlocks", GVAR(arsenalUnlocks)];
            };
        };
    };
    case "garage": {
        switch (SOG_PDB_Mode) do {
            case 0: {
                profileNamespace setVariable ["GarageUnlocks", GVAR(garageUnlocks)];
            };
            case 1: {
                // ["hset", "", "garage_unlocks", -1, GVAR(garageUnlocks), "", "null", false] spawn dragonfly_db_fnc_addTask;
                ["hsetid", getPlayerUID player, "garage_unlocks", -1, GVAR(garageUnlocks), "", "null", false] remoteExec ["dragonfly_db_fnc_addTask", 2, false];
            };
            case 2: {
                "ArmaSOGClient" callExtension ["save_unlock", ["garage", _class, _type]];
            };
            default {
                profileNamespace setVariable ["GarageUnlocks", GVAR(garageUnlocks)];
            };
        };
    };
};