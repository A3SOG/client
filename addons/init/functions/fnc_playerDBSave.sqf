#include "script_component.hpp"

/*
	@file Title: ArmaDragonflyClient Framework by Creedcoder, J.Schmidt
	@file Version: 0.1
	@file Name: fnc_savePlayer.sqf
	@file Author: Creedcoder, J.Schmidt
	@file edit: 03.25.2024
	Copyright © 2024 Creedcoder, J.Schmidt, All rights reserved

	Do not edit without permission!

	This work is licensed under the Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License.
	To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-nd/4.0/ or send a letter to Creative Commons,
	444 Castro Street, Suite 900, Mountain View, California, 94041, USA.

	Save Player to DB:
*/

private _data = [
getPlayerUID player,
"armory_unlocks", [sog_client_armory_arsenalUnlocks],
"garage_unlocks", [sog_client_armory_garageUnlocks],
"locker", [player getVariable ["Locker", []]],
"garage", [player getVariable ["Garage", []]],
"cash", [player getVariable ["Cash", 0]],
"bank", [player getVariable ["Cash_Bank", 0]],
"number", [player getVariable ["SOG_Phone_Number", "unknown"]],
"email", [player getVariable ["SOG_Email", "unknown@spearnet.mil"]],
"paygrade", [player getVariable ["Paygrade", "E1"]],
"reputation", [rating player],
"loadout", [getUnitLoadout player],
"holster", [player getVariable ["SOG_HolsterWeapon", true]],
"position", [getPosASLVisual player],
"direction", [getDirVisual player]
];

if (vehicle player == player) then {
    _data pushBack "currentWeapon";
    _data pushBack [currentMuzzle player];
    _data pushBack "stance";
    // _data pushBack [animationState player];
    _data pushBack [stance player];
};

// ["hsetBulk", "", "", -1, _data, "", "null", false] spawn dragonfly_db_fnc_addTask;
["hsetidbulk", "", "", -1, _data, "", netId player, false] remoteExec ["dragonfly_db_fnc_addTask", 2, false];
_data