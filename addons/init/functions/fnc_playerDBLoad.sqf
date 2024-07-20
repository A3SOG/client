#include "script_component.hpp"

/*
	@file Title: ArmaDragonflyClient Framework by Creedcoder, J.Schmidt
	@file Version: 0.1
	@file Name: fnc_loadPlayer.sqf
	@file Author: Creedcoder, J.Schmidt
	@file edit: 03.25.2024
	Copyright © 2024 Creedcoder, J.Schmidt, All rights reserved

	Do not edit without permission!

	This work is licensed under the Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License.
	To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-nd/4.0/ or send a letter to Creative Commons,
	444 Castro Street, Suite 900, Mountain View, California, 94041, USA.

	Load Player from DB:
*/

// ["hgetall", "", "", -1, [], "sog_client_init_fnc_handlePlayerLoad", "null", true] spawn dragonfly_db_fnc_addTask;
// ["hgetallid", getPlayerUID player, "", -1, [], "sog_client_init_fnc_handlePlayerLoad", netId player, true] remoteExec ["dragonfly_db_fnc_addTask", 2, false];
[[netId player, getPlayerUID player], {["hgetallid", _this select 1, "", -1, [], "sog_client_init_fnc_handlePlayerLoad", _this select 0, true] remoteExec ["dragonfly_db_fnc_addTask", 2, false]}] remoteExec ["call", 2];