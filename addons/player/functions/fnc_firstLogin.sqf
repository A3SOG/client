#include "script_component.hpp"

private ["_isFTP", "_pdbMode", "_player", "_uid"];

_player = _this select 0;
_isFTP = _player getVariable ["IsFTP", 0];
_uid = getPlayerUID _player;

_pdbMode = "PDB_MODE" call BIS_fnc_getParamValue;

if (_isFTP == 1) then {
	// titleText ["\n Welcome To Your First Day on the Job. You have been issued a Pistol, 6 x 9mm Ammo, a Pistol Belt, and a small amount of RP and credit from OPSG. These are the only free things you will get for this identity, so save them, and use them wisely. You are responsible for all purchases going forward.", "PLAIN DOWN", 30];

	_player forceAddUniform "U_BG_Guerrilla_6_1";
	_player addVest "V_Rangemaster_belt";
	_player addItem "SOG_Phone";

	if (_pdbMode == 2) then {
		// ["store_playerData.store_playerDataFirstLogin"] call py3_fnc_callExtension;
		"ArmaSOGClient" callExtension ["first_login", []];
	};

	for "_i" from 1 to 6 do {
		_player addItemToVest "16Rnd_9x21_Mag";
	};

	_player setVariable ["Cash_Bank", 2000, true];
	_player setVariable ["SOG_Holstered", 1, true];
	_player setVariable ["PayGrade", "E1", true];
	_player setVariable ["SOG_Holster", ["hgun_P07_F", "16Rnd_9x21_Mag", ["", "", "", ""], 15], true];
	_player addRating 500;

	_number = "0160" + (_uid select [count (toArray _uid) - 6, 6]);
	_email = _number + "@spearnet.mil";
	
	_player setVariable ["SOG_Phone_Number", _number, true];
	_player setVariable ["SOG_Email", _email, true];

	SOG_AddressBook pushBackUnique [(name _player), (_player getVariable ["SOG_Phone_Number", "unk"]), (_player getVariable ["SOG_Email", "unk"])];
	profileNamespace setVariable ["SOG_AddressBook", SOG_AddressBook];

	private _messages = [
		"Welcome to your first day on the job. You have been issued a Pistol, 6 x 9mm Ammo, a Pistol Belt, and a small amount of RP and credit from OPSG. These are the only free things you will get for this identity, so save them, and use them wisely. You are responsible for all purchases going forward.",
		"Cash in your RP at any laptop by Access the Bank, Sign In, and then Submit Time. Do this before leaving the game session!"
	];

	private _welcomeEmail = format ["Welcome to your first day on the job. You have been issued a phone with a new number of %1 and an email address of %2", _number, _email];

	private _phoneNumber = player getVariable ["SOG_Phone_Number", "unk"];
	private _phoneEmail = player getVariable ["SOG_Email", "unk"];

	["Field Cmdr", _welcomeEmail] spawn sog_client_phone_fnc_newEmail;
	[_phoneEmail, [["Field Cmdr <fieldCmdr@spearnet.mil>", "Job Orientation", _welcomeEmail]]] remoteExec ["sog_server_phone_fnc_addEmail", 2, false];

	{
		["Field Cmdr", _x] spawn sog_client_phone_fnc_newMsg;
		[_phoneNumber, [["Field Cmdr", _x]]] remoteExec ["sog_server_phone_fnc_addMsg", 2, false];
	} forEach _messages;

	["ScoreAdded", [format ["Welcome to the Team %1!", name _player], 500]] call BIS_fnc_showNotification;

	// hintSilent "Cash in your RP at any laptop by Access the Bank, Sign In, and then Submit Time. Do this before leaving the game session!";

	_handle = [] spawn {
		["SOG_Phone", 0] call sog_client_armory_fnc_addItemArmory;
		uiSleep 0.2;
		["SOG_Tablet", 0] call sog_client_armory_fnc_addItemArmory;
		uiSleep 0.2;
		["ItemCompass", 0] call sog_client_armory_fnc_addItemArmory;
		uiSleep 0.2;
		["ItemGPS", 0] call sog_client_armory_fnc_addItemArmory;
		uiSleep 0.2;
		["ItemMap", 0] call sog_client_armory_fnc_addItemArmory;
		uiSleep 0.2;
		["ItemRadio", 0] call sog_client_armory_fnc_addItemArmory;
		uiSleep 0.2;
		["ItemWatch", 0] call sog_client_armory_fnc_addItemArmory;
		uiSleep 0.2;
		["U_BG_Guerrilla_6_1", 0] call sog_client_armory_fnc_addItemArmory;
		uiSleep 0.2;
		["V_Rangemaster_belt", 0] call sog_client_armory_fnc_addItemArmory;
		uiSleep 0.2;
		["hgun_P07_F", 1] call sog_client_armory_fnc_addItemArmory;
		uiSleep 0.2;
		["16Rnd_9x21_Mag", 2] call sog_client_armory_fnc_addItemArmory;
		uiSleep 0.2;
		["B_Quadbike_01_F", 0] call sog_client_armory_fnc_addVehArmory;
	};
} else {
	titleText [format ["Welcome back %1. Your persistent locker, bank, cash and profile have been loaded.", name _player], "PLAIN DOWN"];
};