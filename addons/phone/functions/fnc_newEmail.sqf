#include "script_component.hpp"

_email = (_this select 0);
{
	if (_email == (_x select 1)) then {
		_email = (_x select 0);
	};
} forEach SOG_Addressbook;

// hintSilent format ["You got a new email from %1", _email];
[format ["You got a new email from %1.", _email], "cyan", 3] call sog_client_misc_fnc_notify;

playSound "SOG_newMsg";

uiSleep 1;

[player getVariable ["SOG_Email", "unk"], player, "sog_client_phone_fnc_addEmail", true] remoteExec ["db_fnc_listload", 2, false];