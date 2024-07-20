#include "script_component.hpp"

_email = (_this select 0);
{
	if (_email == (_x select 1)) then {
		_email = (_x select 0);
	};
} forEach SOG_Addressbook;

[format ["You got a new email from %1.", _email], "cyan", 3] call sog_client_misc_fnc_notify;

playSound "SOG_newMsg";

uiSleep 1;

// [player getVariable ["SOG_Email", "unknown@spearnet.mil"], player, "sog_client_phone_fnc_addEmail", true] remoteExec ["db_fnc_listload", 2, false];
// ["listrng", player getVariable ["SOG_Email", "unknown@spearnet.mil"], "", -1, [], "sog_client_phone_fnc_addEmail", "null", true] spawn dragonfly_db_fnc_addTask;
["listrng", player getVariable ["SOG_Email", "unknown@spearnet.mil"], "", -1, [], "sog_client_phone_fnc_addEmail", netId player, true] remoteExec ["dragonfly_db_fnc_addTask", 2, false];
// [[netId player, player getVariable ["SOG_Email", "unknown@spearnet.mil"]], {["listrng", _this select 1, "", -1, [], "sog_client_phone_addEmail", _this select 0, true] remoteExec ["dragonfly_db_fnc_addTask", 2, false]}] remoteExec ["call", 2];