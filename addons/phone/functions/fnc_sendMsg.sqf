#include "script_component.hpp"

params ["_number", "_msg"];

{
	if ((_x getVariable ["SOG_Phone_Number", "unknown"]) == _number) then {
		[player getVariable ["SOG_Phone_Number", "unknown"]] remoteExec ["sog_client_phone_fnc_newMsg", _x, false];
	};
} count (playableUnits);

// [_number, [player getVariable ["SOG_Phone_Number", "unknown"], _msg]] remoteExec ["sog_server_phone_fnc_addMsg", 2, false];
// ["listadd", _number, "", -1, [player getVariable ["SOG_Phone_Number", "unknown"], _msg], "sog_server_phone_fnc_addMsg", "null", false] spawn dragonfly_db_fnc_addTask;
["listadd", _number, "", -1, [player getVariable ["SOG_Phone_Number", "unknown"], _msg], "", "null", false] remoteExec ["dragonfly_db_fnc_addTask", 2, false];
// [[_number, _msg, player getVariable ["SOG_Phone_Number", "unknown"]], {["listadd", _this select 0, "", -1, [_this select 2, _this select 1], "", "null", false] remoteExec ["dragonfly_db_fnc_addTask", 2, false]}] remoteExec ["call", 2];