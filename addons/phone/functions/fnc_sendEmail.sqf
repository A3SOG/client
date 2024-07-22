#include "script_component.hpp"

params ["_email", "_msg"];
private _pEmail = player getVariable ["SOG_Email", "unknown@spearnet.mil"];

{
	private _tmpEmail = _x getVariable ["SOG_Email", "unknown"];

	if (_tmpEmail isEqualTo _email) then {
		[_pEmail] remoteExec ["sog_client_phone_fnc_newEmail", _x, false];
	};
} forEach playableUnits;

// ["listadd", _email, "", -1, [_pEmail, _msg]], "sog_server_phone_fnc_addEmail", "null", false] spawn dragonfly_db_fnc_addTask;
["listadd", _email, "", -1, [_pEmail, _msg], "", "null", false] remoteExec ["dragonfly_db_fnc_addTask", 2, false];