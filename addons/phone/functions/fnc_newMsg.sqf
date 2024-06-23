#include "script_component.hpp"

_number = (_this select 0);
{
	if (_number == (_x select 1)) then {
		_number = (_x select 0);
	};
} forEach SOG_Addressbook;

// hintSilent format ["You got a new message from %1", _number];
[format ["You got a new message from %1.", _number], "green", 3] call sog_client_misc_fnc_notify;

playSound "SOG_newMsg";

uiSleep 1;

[player getVariable ["SOG_Phone_Number", "unknown"], "sog_client_phone_fnc_addMsg"] call dragonfly_db_fnc_listLoad;
// [player getVariable ["SOG_Phone_Number", "unknown"], player, "sog_client_phone_fnc_addMsg", true] remoteExec ["db_fnc_listload", 2, false];