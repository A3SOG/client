#include "script_component.hpp"

private ["_SOG_Holster", "_SOG_Holstered"];

_SOG_Holster = player getVariable ["SOG_Holster", []];
_SOG_Holstered = player getVariable ["SOG_Holstered", 0];

if (_SOG_Holstered == 1) then {
	player addMagazine [(_SOG_Holster select 1), (_SOG_Holster select 3)];
	player addWeapon (_SOG_Holster select 0);

	{
		player addHandgunItem _x;
	} forEach (_SOG_Holster select 2);

	_SOG_Holstered = 0;
	_SOG_Holster = [];
} else {
	if (handgunWeapon player isEqualTo "") exitWith {};

	_SOG_Holster = [handgunWeapon player, (handgunMagazine player) select 0, handgunItems player, player ammo (handgunWeapon player)];
	player removeWeapon (handgunWeapon player);
	_SOG_Holstered = 1;
};

player setVariable ["SOG_Holster", _SOG_Holster, true];
player setVariable ["SOG_Holstered", _SOG_Holstered, true];