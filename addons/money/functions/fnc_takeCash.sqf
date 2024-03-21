#include "script_component.hpp"

params ["_ct"];

private _amount = _ct getVariable ["Cash", 0];

["advance", "Cash", _amount] call sog_server_money_fnc_handleMoney;

_ct setVariable ["Cash", nil, true];
deleteVehicle _ct;