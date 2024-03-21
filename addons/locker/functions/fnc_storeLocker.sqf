#include "script_component.hpp"

private ["_category", "_class", "_clear", "_data", "_dialog", "_index", "_itemList", "_itemList2", "_locker", "_selectedItem"];

_dialog = findDisplay 202301;
_itemList = _dialog displayCtrl 1501;
_itemList2 = _dialog displayCtrl 1500;
_selectedItem = lbCurSel _itemList;
_data = call compile format["%1", _itemList lbData _selectedItem];
if ((isNil {
	_data
})) exitWith {
	ctrlEnable [1601, true];
};
_category = _data select 0;
_class = _data select 1;
_clear = true;

switch (_category) do {
	case "storeItems": {
		_locker = player getVariable ["Locker", []];
		_locker pushBack [_category, _class];
		player setVariable ["Locker", _locker, true];
		if (_class == (currentMuzzle player)) then {
			player action ["SWITCHWEAPON", player, player, -1];
			player unassignItem _class;
			player removeWeapon _class;
		} else {
			player unassignItem _class;
			player removeItem _class;
		};
		playSound "FD_Finish_F";
	};
	case "storeMagazines": {
		_locker = player getVariable ["Locker", []];
		_locker pushBack [_category, _class];
		player setVariable ["Locker", _locker, true];
		_temp = magazinesAmmoFull player;
		switch (_class select 3) do {
			case "Uniform": {
				{
					if ((_x select 4) == "Uniform" && (_x select 0) == (_class select 0)) then {
						player removeItemFromUniform (_class select 0);
					};
				} count _temp;
				_temp deleteAt (_temp findIf {
					(_x select 0) == (_class select 0) && (_x select 1) == (_class select 1) && (_x select 4) == (_class select 3)
				});
				{
					if ((_x select 4) == "Uniform" && (_x select 0) == (_class select 0)) then {
						(uniformContainer player) addMagazineAmmoCargo [(_x select 0), 1, (_x select 1)];
					};
				} count _temp;
			};
			case "Vest": {
				{
					if ((_x select 4) == "Vest" && (_x select 0) == (_class select 0)) then {
						player removeItemFromVest (_class select 0);
					};
				} count _temp;
				_temp deleteAt (_temp findIf {
					(_x select 0) == (_class select 0) && (_x select 1) == (_class select 1) && (_x select 4) == (_class select 3)
				});
				{
					if ((_x select 4) == "Vest" && (_x select 0) == (_class select 0)) then {
						(vestContainer player) addMagazineAmmoCargo [(_x select 0), 1, (_x select 1)];
					};
				} count _temp;
			};
			case "Backpack": {
				{
					if ((_x select 4) == "Backpack" && (_x select 0) == (_class select 0)) then {
						player removeItemFromBackpack (_class select 0);
					};
				} count _temp;
				_temp deleteAt (_temp findIf {
					(_x select 0) == (_class select 0) && (_x select 1) == (_class select 1) && (_x select 4) == (_class select 3)
				});
				{
					if ((_x select 4) == "Backpack" && (_x select 0) == (_class select 0)) then {
						(backpackContainer player) addMagazineAmmoCargo [(_x select 0), 1, (_x select 1)];
					};
				} count _temp;
			};
		};
		playSound "FD_Finish_F";
	};
	case "storeWeapons": {
		_locker = player getVariable ["Locker", []];
		_locker pushBack [_category, _class];
		player setVariable ["Locker", _locker, true];
		_temp = weaponsItems player;
		{
			_wepClass = _x select 0;
			if (_wepClass == _class) then {
				_att1 = _x select 1;
				_att2 = _x select 2;
				_att3 = _x select 3;
				_mag = _x select 4;
				_mag2 = _x select 5;
				_att4 = _x select 6;
				{
					if (_x isNotEqualTo "") then {
						_locker pushBack ["storeItems", _x];
					};
					true;
				} count [_att1, _att2, _att3, _att4];
				{
					if (_x isNotEqualTo []) then {
						_locker pushBack ["storeMagazines", [(_x select 0), (_x select 1), getNumber (configfile >> "CfgMagazines" >> (_x select 0) >> "count")]];
					};
					true;
				} count [_mag, _mag2];
			};
			true;
		} count _temp;
		player removeWeapon _class;
		playSound "FD_Finish_F";
	};
	case "storeUniforms": {
		_locker = player getVariable ["Locker", []];

		{
			for "_i" from 1 to (_x select 1) do {
				_locker pushBack ["storeItems", (_x select 0)];
			};
		} count ((getItemCargo uniformContainer player) call sog_client_misc_fnc_cargoToPairs);
		{
			for "_i" from 1 to (_x select 1) do {
				_locker pushBack ["storeWeapons", (_x select 0)];
			};
		} count ((getWeaponCargo uniformContainer player) call sog_client_misc_fnc_cargoToPairs);
		{
			_locker pushBack ["storeMagazines", [(_x select 0), (_x select 1), getNumber (configfile >> "CfgMagazines" >> (_x select 0) >> "count")]];
		} count (magazinesAmmoCargo uniformContainer player);

		_locker pushBack [_category, _class];
		player setVariable ["Locker", _locker, true];
		removeUniform player;
		playSound "FD_Finish_F";
	};
	case "storeVests": {
		_locker = player getVariable ["Locker", []];

		{
			for "_i" from 1 to (_x select 1) do {
				_locker pushBack ["storeItems", (_x select 0)];
			};
		} count ((getItemCargo vestContainer player) call sog_client_misc_fnc_cargoToPairs);
		{
			for "_i" from 1 to (_x select 1) do {
				_locker pushBack ["storeWeapons", (_x select 0)];
			};
		} count ((getWeaponCargo vestContainer player) call sog_client_misc_fnc_cargoToPairs);
		{
			_locker pushBack ["storeMagazines", [(_x select 0), (_x select 1), getNumber (configfile >> "CfgMagazines" >> (_x select 0) >> "count")]];
			true;
		} count (magazinesAmmoCargo vestContainer player);

		_locker pushBack [_category, _class];
		player setVariable ["Locker", _locker, true];
		removeVest player;
		playSound "FD_Finish_F";
	};
	case "storeHeadgear": {
		_locker = player getVariable ["Locker", []];
		_locker pushBack [_category, _class];
		player setVariable ["Locker", _locker, true];
		removeHeadgear player;
		playSound "FD_Finish_F";
	};
	case "storeBackpacks": {
		_locker = player getVariable ["Locker", []];

		{
			for "_i" from 1 to (_x select 1) do {
				_locker pushBack ["storeItems", (_x select 0)];
			};
		} count ((getItemCargo backpackContainer player) call sog_client_misc_fnc_cargoToPairs);
		{
			for "_i" from 1 to (_x select 1) do {
				_locker pushBack ["storeWeapons", (_x select 0)];
			};
		} count ((getWeaponCargo backpackContainer player) call sog_client_misc_fnc_cargoToPairs);
		{
			_locker pushBack ["storeMagazines", [(_x select 0), (_x select 1), getNumber (configfile >> "CfgMagazines" >> (_x select 0) >> "count")]];
		} count (magazinesAmmoCargo backpackContainer player);

		_locker pushBack [_category, _class];
		player setVariable ["Locker", _locker, true];
		removeBackpack player;
		playSound "FD_Finish_F";
	};
};

if (_clear) then {
	lbClear _itemList;
	lbClear _itemList2;
	_itemList lbSetCurSel -1;
	_itemList2 lbSetCurSel -1;

	[] call sog_client_locker_fnc_fetchLocker;
	[] call sog_client_locker_fnc_fetchPlayer;

	ctrlEnable [1601, true];
};