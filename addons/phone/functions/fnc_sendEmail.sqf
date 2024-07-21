#include "script_component.hpp"

params ["_email", "_msg"];

{
	if ((_x getVariable ["SOG_Email", "unknown@spearnet.mil"]) == _email) then {
		[player getVariable ["SOG_Email", "unknown@spearnet.mil"]] remoteExec ["sog_client_phone_fnc_newEmail", _x, false];
	};
} count (playableUnits);

// [_email, [player getVariable ["SOG_Email", "unknown@spearnet.mil"], _msg]] remoteExec ["sog_server_phone_fnc_addEmail", 2, false];
// ["listadd", _email, "", -1, [player getVariable ["SOG_Email", "unknown@spearnet.mil"], _msg]], "sog_server_phone_fnc_addEmail", "null", false] spawn dragonfly_db_fnc_addTask;
["listadd", _email, "", -1, [player getVariable ["SOG_Email", "unknown@spearnet.mil"], _msg], "", "null", false] remoteExec ["dragonfly_db_fnc_addTask", 2, false];