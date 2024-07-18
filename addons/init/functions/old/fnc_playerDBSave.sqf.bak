private ["_name", "_uid", "_data", "_magsUniform", "_magsVest", "_magsBackpack", "_allCargoMags", "_removeCargoMag", "_mag", "_container", "_cargoMag", "_cargoCount", "_cargoContainer", "_partialMags", "_loadedMags", "_ammo", "_loadedInWeapon", "_fullMagsUniform", "_fullMagsVest", "_fullMagsBackpack", "_value", "_array", "_weapon", "_type", "_weaponType", "_typeHolder", "_typeBits", "_weaponTypeBits", "_result", "_player", "_item", "_isAssignable"];

_uid = getPlayerUID player;
_data = [];

_data pushBack ["Garage", player getVariable ["Garage", []]];
_data pushBack ["Locker", player getVariable ["Locker", []]];
_data pushBack ["Cash", player getVariable ["Cash", 0]];
_data pushBack ["Cash_Bank", player getVariable ["Cash_Bank", 0]];
_data pushBack ["Paygrade", player getVariable ["PayGrade", "E1"]];
_data pushBack ["Holster", [player getVariable ["SOG_Holstered", 0], player getVariable ["SOG_Holster", []]]];
_data pushBack ["Phone_Number", player getVariable ["SOG_Phone_Number", "unk"]];
_data pushBack ["Email", player getVariable ["SOG_Email", "unk"]];

_data pushBack ["Rating", rating player];
_data pushBack ["Position", getPosASLVisual player];
_data pushBack ["Direction", getDirVisual player];

if (vehicle player == player) then {
	_data pushBack ["CurrentWeapon", format ["%1", currentMuzzle player]];
	_data pushBack ["Stance", animationState player];
};

_data pushBack ["Uniform", uniform player];
_data pushBack ["Vest", vest player];
_data pushBack ["Backpack", backpack player];
_data pushBack ["Goggles", goggles player];
_data pushBack ["Headgear", headgear player];

_data pushBack ["PrimaryWeapon", primaryWeapon player];
_data pushBack ["SecondaryWeapon", secondaryWeapon player];
_data pushBack ["HandgunWeapon", handgunWeapon player];

_data pushBack ["PrimaryWeaponItems", primaryWeaponItems player];
_data pushBack ["SecondaryWeaponItems", secondaryWeaponItems player];
_data pushBack ["HandgunItems", handgunItems player];

_data pushBack ["AssignedItems", assignedItems player];

_MagsUniform = [];
{
	_mag = _x select 0;
	_ammo = _x select 1;
	if (_ammo > 0) then {
		_MagsUniform pushBack [_mag, 1, _ammo];
	};
} forEach magazinesAmmoCargo uniformContainer player;

_MagsVest = [];
{
	_mag = _x select 0;
	_ammo = _x select 1;
	if (_ammo > 0) then {
		_MagsVest pushBack [_mag, 1, _ammo];
	};
} forEach magazinesAmmoCargo vestContainer player;

_MagsBackpack = [];
{
	_mag = _x select 0;
	_ammo = _x select 1;
	if (_ammo > 0) then {
		_MagsBackpack pushBack [_mag, 1, _ammo];
	};
} forEach magazinesAmmoCargo backpackContainer player;

_loadedMags = [];
{
	_mag = _x select 0;
	_ammo = _x select 1;
	_loaded = _x select 2;
	_type = _x select 3;
	_location = _x select 4;

	if (_loaded && _ammo > 0 && _type != 0) then {
		_loadedMags pushBack [_mag, _ammo];
	};
} forEach magazinesAmmoFull player;

_data pushBack ["UniformWeapons", (getWeaponCargo uniformContainer player) call sog_client_misc_fnc_cargoToPairs];
_data pushBack ["UniformItems", (getItemCargo uniformContainer player) call sog_client_misc_fnc_cargoToPairs];
_data pushBack ["UniformMagazines", _MagsUniform];

_data pushBack ["VestWeapons", (getWeaponCargo vestContainer player) call sog_client_misc_fnc_cargoToPairs];
_data pushBack ["VestItems", (getItemCargo vestContainer player) call sog_client_misc_fnc_cargoToPairs];
_data pushBack ["VestMagazines", _MagsVest];

_data pushBack ["BackpackWeapons", (getWeaponCargo backpackContainer player) call sog_client_misc_fnc_cargoToPairs];
_data pushBack ["BackpackItems", (getItemCargo backpackContainer player) call sog_client_misc_fnc_cargoToPairs];
_data pushBack ["BackpackMagazines", _MagsBackpack];

_data pushBack ["LoadedMagazines", _loadedMags];

_key = _uid;
[_key, str _data] remoteExec ["db_fnc_save", 2, false];