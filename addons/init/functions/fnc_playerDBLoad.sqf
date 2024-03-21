private ["_name", "_uid", "_data", "_magsUniform", "_magsVest", "_magsBackpack", "_allCargoMags", "_removeCargoMag", "_mag", "_container", "_cargoMag", "_cargoCount", "_cargoContainer", "_partialMags", "_loadedMags", "_ammo", "_loadedInWeapon", "_fullMagsUniform", "_fullMagsVest", "_fullMagsBackpack", "_value", "_array", "_weapon", "_type", "_weaponType", "_typeHolder", "_typeBits", "_weaponTypeBits", "_result", "_player", "_item", "_isAssignable", "_isFTP"];

removeAllWeapons player;
removeAllAssignedItems player;
removeUniform player;
removeVest player;
removeBackpack player;
removeGoggles player;
removeHeadgear player;

_data = _this;
if (count _data == 0) exitwith {
	player setVariable ["IsFTP", 1, true];

	2 cutText ["No Save Found!", "PLAIN DOWN", 1];
	[player] call sog_client_player_fnc_firstLogin;

	value_loadDone = true;
};

_isFTP = player getVariable ["IsFTP", 0];
[player] call sog_client_player_fnc_firstLogin;

{
	_name = _x select 0;
	_value = _x select 1;

	switch (_name) do {
		case "Garage": { player setVariable ["Garage", _value, true] };
		case "Locker": { player setVariable ["Locker", _value, true] };
		case "Paygrade": { player setVariable ["PayGrade", _value, true] };
		case "Cash_Bank": { player setVariable ["Cash_Bank", _value, true] };
		case "Cash": { player setVariable ["Cash", _value, true] };
		case "Holster": { player setVariable ["SOG_Holstered", _value select 0, true]; player setVariable ["SOG_Holster", _value select 1, true]; };
		case "Phone_Number": { player setVariable ["SOG_Phone_Number", _value, true] };
		case "Email": { player setVariable ["SOG_Email", _value, true] };
		case "Rating": { player addRating _value };
		case "Position": { player setPosASL _value };
		case "Direction": { player setDir _value };
		case "Uniform":	{ player forceAddUniform _value;};
		case "Vest": { if (_value != "") then { player addVest _value } };
		case "Backpack": { if (_value != "") then { player addBackpack _value } };
		case "Goggles": { if (_value != "") then { player addGoggles _value } };
		case "Headgear": {player addHeadgear _value;};
		case "LoadedMagazines": { { player addMagazine _x } forEach _value };
		case "PrimaryWeapon": { player addWeapon _value; removeAllPrimaryWeaponItems player };
		case "SecondaryWeapon": { player addWeapon _value };
		case "HandgunWeapon": { player addWeapon _value; removeAllHandgunItems player };
		case "PrimaryWeaponItems": { { if (_x != "") then { player addPrimaryWeaponItem _x } } forEach _value };
		case "SecondaryWeaponItems": { { if (_x != "") then { player addSecondaryWeaponItem _x } } forEach _value };
		case "HandgunItems": { { if (_x != "") then { player addHandgunItem _x } } forEach _value };
		case "AssignedItems":
		{
			{
				if ([player, _x] call sog_client_misc_fnc_isAssignableBinocular) then {
					player addWeapon _x;
				} else {
					player linkItem _x;
				};
			} forEach _value;
		};
		case "CurrentWeapon": { player selectWeapon _value };
		case "Stance": { player switchMove _value};
		case "UniformWeapons": { { (uniformContainer player) addWeaponCargoGlobal _x } forEach _value };
		case "UniformItems": { { (uniformContainer player) addItemCargoGlobal _x } forEach _value };
		case "UniformMagazines": { { (uniformContainer player) addMagazineAmmoCargo _x } forEach _value };
		case "VestWeapons": { { (vestContainer player) addWeaponCargoGlobal _x } forEach _value };
		case "VestItems": { { (vestContainer player) addItemCargoGlobal _x } forEach _value };
		case "VestMagazines": { { (vestContainer player) addMagazineAmmoCargo _x } forEach _value };
		case "BackpackWeapons": { { (backpackContainer player) addWeaponCargoGlobal _x } forEach _value };
		case "BackpackItems": { { (backpackContainer player) addItemCargoGlobal _x } forEach _value };
		case "BackpackMagazines": { { (backpackContainer player) addMagazineAmmoCargo _x } forEach _value };
	};
} foreach _data;

if (needReload player == 1) then { reload player };
value_loadDone = true;

_pAlt = ((getPosATLVisual player) select 2);
_pVelZ = (velocity player select 2);

if ((_pAlt > 5) && (_pVelZ < 0)) then {
	player setVelocity [0, 0, 0];
	player setPosATL [getPosATLVisual player select 0, getPosATLVisual player select 1, 1];
	hint "You logged off mid air. You was moved to safe position on the ground.";
};

[player getVariable ["SOG_Phone_Number", "unk"], player, "sog_client_phone_fnc_addOfflineMsg", true] remoteExec ["db_fnc_listload", 2, false];
[player getVariable ["SOG_Email", "unk"], player, "sog_client_phone_fnc_addOfflineEmail", true] remoteExec ["db_fnc_listload", 2, false];