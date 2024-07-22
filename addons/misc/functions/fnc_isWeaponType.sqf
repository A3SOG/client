#include "script_component.hpp"

private _weapon = _this select 0;
private _type = _this select 1;
private _weaponType = getNumber (configFile >> "CfgWeapons" >> _weapon >> "type");

if (_type < 1 || _weaponType < 1) exitWith { false };

private _typeHolder = _type;
private _typeBits = [];

while { _typeHolder > 0 } do {
	_typeBits pushBack (_typeHolder % 2);
	_typeHolder = floor (_typeHolder / 2);
};

_typeHolder = _weaponType;
private _weaponTypeBits = [];

while { _typeHolder > 0 } do {
	_weaponTypeBits pushBack (_typeHolder % 2);
	_typeHolder = floor (_typeHolder / 2);
};

if (count _typeBits > count _weaponTypeBits) exitWith { false; };

private _result = true;

{
	if (_x == 1 && { weaponTypeBits select _forEachIndex == 0 }) exitWith { _result = false; };
} forEach _typeBits;
_result;