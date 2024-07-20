#include "script_component.hpp"

/*
	@file Title: ArmaDragonflyClient Framework by Creedcoder, J.Schmidt
	@file Version: 0.1
	@file Name: fnc_hashSet.sqf
	@file Author: Creedcoder, J.Schmidt
	@file edit: 03.25.2024
	Copyright © 2024 Creedcoder, J.Schmidt, All rights reserved

	Do not edit without permission!

	This work is licensed under the Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License.
	To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-nd/4.0/ or send a letter to Creative Commons,
	444 Castro Street, Suite 900, Mountain View, California, 94041, USA.

	Init Player:
*/

waitUntil { !isNull player };
waitUntil { player == player };
waitUntil { alive player };

removeAllWeapons player;
removeAllAssignedItems player;
removeUniform player;
removeVest player;
removeBackpack player;
removeGoggles player;
removeHeadgear player;

_armoryDone = player getVariable ["value_armoryDone", false];

waitUntil { value_serverDone && _armoryDone };

cutText ["Loading In...", "BLACK", 1];
value_loadDone = false;

// ["hgetall", "", "", -1, [], "sog_client_init_fnc_handlePlayerLoad", "null", true] spawn dragonfly_db_fnc_addTask;
["hgetallid", getPlayerUID player, "", -1, [], "sog_client_init_fnc_handlePlayerLoad", netId player, true] remoteExec ["dragonfly_db_fnc_addTask", 2, false];
// [[netId player, getPlayerUID player], {["hgetallid", _this select 1, "", -1, [], "sog_client_init_fnc_handlePlayerLoad", _this select 0, true] remoteExec ["dragonfly_db_fnc_addTask", 2, false]}] remoteExec ["call", 2];

waitUntil { value_loadDone };

[] spawn sog_client_init_fnc_playerSaveLoop;

cutText ["", "PLAIN", 1];

[] spawn sog_client_interaction_fnc_initInteraction;

waitUntil { !(isNull (findDisplay 46)) };
(findDisplay 46) displayAddEventHandler ["KeyDown", {
	switch (_this select 1) do {
		// Interaction Interface (default key TAB)
		case ((configFile >> "CfgPatches" >> "sog_client_main" >> "interactionKey") call BIS_fnc_getCfgData): {
			[] call sog_client_interaction_fnc_openInteraction;
			false;
		};
		// Holster/Unholster (default key H)
		case ((configFile >> "CfgPatches" >> "sog_client_main" >> "holsterKey") call BIS_fnc_getCfgData): {
			if ((currentWeapon player) != "" && !(player getVariable ["SOG_HolsterWeapon", true])) then {
				player action ["SwitchWeapon", player, player, 299];
				player setVariable ["SOG_HolsterWeapon", true, true];
			} else {
				private _weapon = switch (true) do {
					case ((primaryWeapon player) != ""): { primaryWeapon player };
					case ((handgunWeapon player) != ""): { handgunWeapon player };
					case ((secondaryWeapon player) != ""): { secondaryWeapon player };
					default {""};
				};
				if (_weapon != "") then { player selectWeapon _weapon };
				player setVariable ["SOG_HolsterWeapon", false, true];
			};
			false;
		};
		// Open Phone (default key P)
		case ((configFile >> "CfgPatches" >> "sog_client_main" >> "phoneKey") call BIS_fnc_getCfgData): {
			[] spawn sog_client_phone_fnc_openPhone;
			false;
		};
		default {
			false;
		};
	};
}];
