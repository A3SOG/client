#include "script_component.hpp"

params ["_number", "_msg"];
private _pNumber = player getVariable ["SOG_Phone_Number", "unknown"];

{
	private _tmpNumber = _x getVariable ["SOG_Phone_Number", "unknown"];

	if (_tmpNumber isEqualTo _number) then {
		[_pNumber] remoteExec ["sog_client_phone_fnc_newMsg", _x, false];
	};
} forEach playableUnits;

// ["listadd", _number, "", -1, [_pNumber, _msg], "", "null", false] spawn dragonfly_db_fnc_addTask;
["listadd", _number, "", -1, [_pNumber, _msg], "", "null", false] remoteExec ["dragonfly_db_fnc_addTask", 2, false];