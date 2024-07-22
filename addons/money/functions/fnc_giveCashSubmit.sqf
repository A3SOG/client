#include "script_component.hpp"

params ["_target", "_player"];

private _amount = parseNumber (ctrlText 1401);
private _playerCash = player getVariable ["Cash", 0];
private _targetCash = _target getVariable ["Cash", 0];

if (_amount > 0) then {
	if (_amount > _playerCash) exitWith { hintSilent "You do not have enough cash!" };

	private _newCash = _targetCash + _amount;
	_target setVariable ["Cash", _newCash, true];

	["deduct", "Cash", _amount] remoteExecCall ["sog_server_money_fnc_handleMoney", 2];
	[format ["%1 gave you %2", _player, _amount]] remoteExecCall ["hint", _target];
} else {
	hintSilent ("Enter an amount greater than zero!");
};

closeDialog 0;