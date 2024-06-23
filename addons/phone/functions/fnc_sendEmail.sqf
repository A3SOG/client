#include "script_component.hpp"

params ["_email", "_msg"];

{
	if (_x getVariable ["SOG_Email", "unknown@spearnet.mil"] == _email) then {
		[player getVariable ["SOG_Email", "unknown@spearnet.mil"]] remoteExec ["sog_client_phone_fnc_newEmail", _x, false];
	};
} count (playableUnits);

[_email, [[player getVariable ["SOG_Email", "unknown@spearnet.mil"], _msg]]] call dragonfly_db_fnc_listAdd;

// [_email, [[player getVariable ["SOG_Email", "unknown@spearnet.mil"], _msg]]] remoteExec ["sog_server_phone_fnc_addEmail", 2, false];