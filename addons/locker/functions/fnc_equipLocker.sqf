#include "script_component.hpp"

private ["_category", "_class", "_clear", "_data", "_dialog", "_index", "_itemList", "_itemList2", "_locker", "_selectedItem"];

_dialog = findDisplay 202301;
_itemList = _dialog displayCtrl 1500;
_itemList2 = _dialog displayCtrl 1501;
_selectedItem = lbCurSel _itemList;
_data = call compile format["%1", _itemList lbData _selectedItem];

if ((isNil {_data})) exitWith { ctrlEnable [1600, true]; };

_category = _data select 0;
_class = _data select 1;
_clear = true;

switch (_category) do {
	case "storeItems": {
		if (player canAdd _class) then {
			player addItem _class;
			playSound "FD_Finish_F";
		} else {
			_clear = false;
			hintsilent "You don't have enough space left!";
			playSound "FD_CP_Not_Clear_F";
		};
	};
	case "storeMagazines": {
		if (player canAdd (_class select 0)) then {
			player addMagazine [(_class select 0),(_class select 1)];
			playSound "FD_Finish_F";
		} else {
			_clear = false;
			hintsilent "You don't have enough space left!";
			playSound "FD_CP_Not_Clear_F";
		};
	};
	case "storeWeapons": {
		if (!(getNumber (configFile >> "CfgWeapons" >> _class >> "type") == 131072) &&
			(!(getNumber (configFile >> "CfgWeapons" >> _class >> "type") == 1) || primaryWeapon player == "") &&
			{!(getNumber (configFile >> "CfgWeapons" >> _class >> "type") == 2) || handgunWeapon player == ""} &&
			{!(getNumber (configFile >> "CfgWeapons" >> _class >> "type") == 4) || secondaryWeapon player == ""}) then {
			player addWeapon _class;
			playSound "FD_Finish_F";
		} else {
			if (player canAdd _class) then {
				if (isClass (configFile >> "CfgMagazines" >> _class)) then {
					player addMagazine _class;
					playSound "FD_Finish_F";
				} else {
					player addItem _class;
					playSound "FD_Finish_F";
				};
			} else {
				_clear = false;
				hintsilent "You don't have enough space left!";
				playSound "FD_CP_Not_Clear_F";
			};
		};
	};
	case "storeUniforms": { player forceAddUniform _class; playSound "FD_Finish_F"; };
	case "storeVests": { player addVest _class; playSound "FD_Finish_F"; };
	case "storeHeadgear": { player addHeadgear _class; playSound "FD_Finish_F"; };
	case "storeBackpacks": { player addBackpack _class; playSound "FD_Finish_F"; };
};

if (_clear) then {
	lbClear _itemList;
	lbClear _itemList2;
	_itemList lbSetCurSel -1;
	_itemList2 lbSetCurSel -1;
	_locker = player getVariable ["Locker", []];
	_index = _locker findIf { _x isEqualTo _data };
	_locker deleteAt _index;
	player setVariable ["Locker", _locker, true];

	[] call sog_client_locker_fnc_fetchLocker;
	[] call sog_client_locker_fnc_fetchPlayer;

	ctrlEnable [1600, true];
};