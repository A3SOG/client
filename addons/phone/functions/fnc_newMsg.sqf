#include "script_component.hpp"

_number = (_this select 0);
{
	if (_number == (_x select 1)) then {
		_number = (_x select 0);
	};
} forEach SOG_Addressbook;

hintSilent format ["You got a new message from %1", _number];

playSound "SOG_newMsg";

uiSleep 1;

[player getVariable ["SOG_Phone_Number", "unk"], player, "sog_client_phone_fnc_addMsg", true] remoteExec ["db_fnc_listload", 2, false];