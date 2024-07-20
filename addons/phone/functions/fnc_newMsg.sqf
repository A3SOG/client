#include "script_component.hpp"

_number = (_this select 0);
{
	if (_number == (_x select 1)) then {
		_number = (_x select 0);
	};
} forEach SOG_Addressbook;

[format ["You got a new message from %1.", _number], "green", 3] call sog_client_misc_fnc_notify;

playSound "SOG_newMsg";

uiSleep 1;

// [player getVariable ["SOG_Phone_Number", "unknown"], player, "sog_client_phone_fnc_addMsg", true] remoteExec ["db_fnc_listload", 2, false];
// ["listrng", player getVariable ["SOG_Phone_Number", "unknown"], "", -1, [], "sog_client_phone_fnc_addMsg", "null", true] spawn dragonfly_db_fnc_addTask;
["listrng", player getVariable ["SOG_Phone_Number", "unknown"], "", -1, [], "sog_client_phone_fnc_addMsg", netId player, true] remoteExec ["dragonfly_db_fnc_addTask", 2, false];
// [[netId player, player getVariable ["SOG_Phone_Number", "unknown"]], {["listrng", _this select 1, "", -1, [], "sog_client_phone_addMsg", _this select 0, true] remoteExec ["dragonfly_db_fnc_addTask", 2, false]}] remoteExec ["call", 2];