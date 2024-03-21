#include "script_component.hpp"

params ["_email", "_msg"];

{
	if (_x getVariable ["SOG_Email", "unk"] == _email) then {
		[player getVariable ["SOG_Email", "unk"]] remoteExec ["sog_client_phone_fnc_newEmail", _x, false];
	};
} count (playableUnits);

[_email, [[player getVariable ["SOG_Email", "unk"], _msg]]] remoteExec ["sog_server_phone_fnc_addEmail", 2, false];