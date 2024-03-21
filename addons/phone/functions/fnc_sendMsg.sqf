#include "script_component.hpp"

params ["_number", "_msg"];

{
	if (_x getVariable ["SOG_Phone_Number", "unk"] == _number) then {
		[player getVariable ["SOG_Phone_Number", "unk"]] remoteExec ["sog_client_phone_fnc_newMsg", _x, false];
	};
} count (playableUnits);

[_number, [[player getVariable ["SOG_Phone_Number", "unk"], _msg]]] remoteExec ["sog_server_phone_fnc_addMsg", 2, false];