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

	Player First Login Check:
*/

private _player = _this select 0;
private _uid = getPlayerUID _player;

_player setUnitLoadout [[],[],["hgun_P07_F","","","",["16Rnd_9x21_Mag",17],[],""],["U_BG_Guerrilla_6_1",[["SOG_Phone",1]]],["V_Rangemaster_belt",[["16Rnd_9x21_Mag",5,17]]],[],"","",[],["","","","","",""]];

_player setVariable ["Cash_Bank", 2000, true];
_player setVariable ["SOG_HolsterWeapon", true, true];
_player setVariable ["PayGrade", "E1", true];
_player addRating 500;

_number = "0160" + (_uid select [count (toArray _uid) - 6, 6]);
_email = _number + "@spearnet.mil";

_player setVariable ["SOG_Phone_Number", _number, true];
_player setVariable ["SOG_Email", _email, true];

SOG_AddressBook pushBackUnique [(name _player), (_player getVariable ["SOG_Phone_Number", "unknown"]), (_player getVariable ["SOG_Email", "unknown@spearnet.mil"])];
profileNamespace setVariable ["SOG_AddressBook", SOG_AddressBook];

private _messages = [
	"Welcome to your first day on the job. You have been issued a Pistol, 6 x 9mm Ammo, a Pistol Belt, and a small amount of RP and credit from OPSG. These are the only free things you will get for this identity, so save them, and use them wisely. You are responsible for all purchases going forward.",
	"Cash in your RP at any laptop by Access the Bank, Sign In, and then Submit Time. Do this before leaving the game session!"
];

private _welcomeEmail = format ["Welcome to your first day on the job. You have been issued a phone with a new number of %1 and an email address of %2", _number, _email];

private _phoneNumber = _player getVariable ["SOG_Phone_Number", "unknown"];
private _phoneEmail = _player getVariable ["SOG_Email", "unknown@spearnet.mil"];

["Field Cmdr", _welcomeEmail] spawn sog_client_phone_fnc_newEmail;
// ["listadd", _phoneEmail, "", -1, ["Field Cmdr <fieldCmdr@spearnet.mil>", "Job Orientation", _welcomeEmail], "sog_server_phone_fnc_addEmail", "null", false] spawn dragonfly_db_fnc_addTask;
// ["listadd", _phoneEmail, "", -1, ["Field Cmdr <fieldCmdr@spearnet.mil>", "Job Orientation", _welcomeEmail], "sog_server_phone_fnc_addEmail", netId _player, false] remoteExec ["dragonfly_db_fnc_addTask", 2, false];
[_phoneEmail, ["Field Cmdr <fieldCmdr@spearnet.mil>", "Job Orientation", _welcomeEmail]] remoteExec ["sog_server_phone_fnc_addEmail", 2, false];

uiSleep 1;

{
	["Field Cmdr", _x] spawn sog_client_phone_fnc_newMsg;
	// ["listadd", _phoneNumber, "", -1, ["Field Cmdr", _x], "", "null", false] spawn dragonfly_db_fnc_addTask;
	// ["listadd", _phoneNumber, "", -1, ["Field Cmdr", _x], "", netId _player, false] remoteExec ["dragonfly_db_fnc_addTask", 2, false];
	[_phoneNumber, ["Field Cmdr", _x]] remoteExec ["sog_server_phone_fnc_addMsg", 2, false];
} forEach _messages;

private _arsenalUnlocks = [["SOG_Phone", 0], ["SOG_Tablet", 0], ["ItemCompass", 0], ["ItemGPS", 0], ["ItemMap", 0], ["ItemRadio", 0], ["ItemWatch", 0], ["U_BG_Guerrilla_6_1", 0], ["V_Rangemaster_belt", 0], ["hgun_P07_F", 1]];
private _garageUnlocks = [["B_Quadbike_01_F", 0]];

{
	_classname = _x select 0;
	_typeOf = _x select 1;
	[_classname, _typeOf] call sog_client_armory_fnc_addItemArmory;
	uiSleep 0.2;
} forEach _arsenalUnlocks;

uiSleep 1;

{
	_classname = _x select 0;
	_typeOf = _x select 1;
	[_classname, _typeOf] call sog_client_armory_fnc_addVehArmory;
	uiSleep 0.2;
} forEach _garageUnlocks;

uiSleep 1;
["armory"] call sog_client_armory_fnc_saveArmoryUnlocks;

uiSleep 1;
["garage"] call sog_client_armory_fnc_saveArmoryUnlocks;

uiSleep 1;
[] call sog_client_init_fnc_playerDBSave;
_player setVariable ["value_loadDone", true];

cutText ["", "PLAIN", 1];

uiSleep 1;
// ["listrng", _player getVariable ["SOG_Email", "unknown@spearnet.mil"], "", -1, [], "sog_client_phone_fnc_addEmail", netId _player, true] spawn dragonfly_db_fnc_addTask;
["listrng", _player getVariable ["SOG_Email", "unknown@spearnet.mil"], "", -1, [], "sog_client_phone_fnc_addEmail", netId _player, true] remoteExec ["dragonfly_db_fnc_addTask", 2, false];

uiSleep 1;
// ["listrng", _player getVariable ["SOG_Phone_Number", "unknown"], "", -1, [], "sog_client_phone_fnc_addMsg", netId _player, true] spawn dragonfly_db_fnc_addTask;
["listrng", _player getVariable ["SOG_Phone_Number", "unknown"], "", -1, [], "sog_client_phone_fnc_addMsg", netId _player, true] remoteExec ["dragonfly_db_fnc_addTask", 2, false];