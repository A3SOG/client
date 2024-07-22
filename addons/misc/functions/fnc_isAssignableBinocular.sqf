#include "script_component.hpp"

private _player = _this select 0;
private _item = _this select 1;
private _isAssignable = true;

if ([_item, 4096] call sog_client_misc_fnc_isWeaponType && { getNumber (configFile >> "CfgWeapons" >> _item >> "ItemInfo" >> "type") != 616 }) then {
	{
		if ([_x, 4096] call sog_client_misc_fnc_isWeaponType && { getNumber (configFile >> "CfgWeapons" >> _x >> "ItemInfo" >> "type") != 616 }) exitWith { _isAssignable = false; };
	} forEach assignedItems _player;
} else {
	_isAssignable = false;
};
_isAssignable;