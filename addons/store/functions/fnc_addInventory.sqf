#include "script_component.hpp"

private ["_class", "_dialog", "_itemList", "_itemListIndex", "_locker", "_mod", "_price"];

_dialog = findDisplay 202302;
_itemList = _dialog displayCtrl 2023002;

lbClear _itemList;

currentProductList = [];
currentSelectionArray = _this select 0;

{
	_class = ((currentSelectionArray select _forEachIndex) select 0);
	_price = ((currentSelectionArray select _forEachIndex) select 1);
	_mod = ((currentSelectionArray select _forEachIndex) select 2);
	
	if (_mod == currentMod) then {
		currentProductList pushBack [_class, _price, _mod];
		switch (selectedCategory) do {
			case "storeBackpacks": {
				_itemListIndex = _itemList lbAdd (getText (configFile >> "CfgVehicles" >> _class >> "displayName"));
				_itemList lbSetData [_itemListIndex, format ["%1", [_class, _price, _mod]]];
				_itemList lbSetPicture [_itemListIndex, (getText (configFile >> "CfgVehicles" >> _class >> "picture"))];
			};
			case "storeGoggles": {
				_itemListIndex = _itemList lbAdd (getText (configFile >> "CfgWeapons" >> _class >> "displayName"));
				_itemList lbSetData [_itemListIndex, format ["%1", [_class, _price, _mod]]];
				_itemList lbSetPicture [_itemListIndex, (getText (configFile >> "CfgWeapons" >> _class >> "picture"))];
			};
			case "storeHeadgear": {
				_itemListIndex = _itemList lbAdd (getText (configFile >> "CfgWeapons" >> _class >> "displayName"));
				_itemList lbSetData [_itemListIndex, format ["%1", [_class, _price, _mod]]];
				_itemList lbSetPicture [_itemListIndex, (getText (configFile >> "CfgWeapons" >> _class >> "picture"))];
			};
			case "storeItems": {
				_itemListIndex = _itemList lbAdd (getText (configFile >> "CfgWeapons" >> _class >> "displayName"));
				_itemList lbSetData [_itemListIndex, format ["%1", [_class, _price, _mod]]];
				_itemList lbSetPicture [_itemListIndex, (getText (configFile >> "CfgWeapons" >> _class >> "picture"))];
			};
			case "storeMagazines": {
				_itemListIndex = _itemList lbAdd (getText (configFile >> "CfgMagazines" >> _class >> "displayName"));
				_itemList lbSetData [_itemListIndex, format ["%1", [_class, _price, _mod]]];
				_itemList lbSetPicture [_itemListIndex, (getText (configFile >> "CfgMagazines" >> _class >> "picture"))];
			};
			case "storeUniforms": {
				_itemListIndex = _itemList lbAdd (getText (configFile >> "CfgWeapons" >> _class >> "displayName"));
				_itemList lbSetData [_itemListIndex, format ["%1", [_class, _price, _mod]]];
				_itemList lbSetPicture [_itemListIndex, (getText (configFile >> "CfgWeapons" >> _class >> "picture"))];
			};
			case "storeVests": {
				_itemListIndex = _itemList lbAdd (getText (configFile >> "CfgWeapons" >> _class >> "displayName"));
				_itemList lbSetData [_itemListIndex, format ["%1", [_class, _price, _mod]]];
				_itemList lbSetPicture [_itemListIndex, (getText (configFile >> "CfgWeapons" >> _class >> "picture"))];
			};
			case "storeWeapons": {
				_itemListIndex = _itemList lbAdd (getText (configFile >> "CfgWeapons" >> _class >> "displayName"));
				_itemList lbSetData [_itemListIndex, format ["%1", [_class, _price, _mod]]];
				_itemList lbSetPicture [_itemListIndex, (getText (configFile >> "CfgWeapons" >> _class >> "picture"))];
			};

			case "storeAircraft": {
				_itemListIndex = _itemList lbAdd (getText (configFile >> "CfgVehicles" >> _class >> "displayName"));
				_itemList lbSetData [_itemListIndex, format ["%1", [_class, _price, _mod]]];
				_itemList lbSetPicture [_itemListIndex, (getText (configFile >> "CfgVehicles" >> _class >> "picture"))];
			};
			case "storeArmored": {
				_itemListIndex = _itemList lbAdd (getText (configFile >> "CfgVehicles" >> _class >> "displayName"));
				_itemList lbSetData [_itemListIndex, format ["%1", [_class, _price, _mod]]];
				_itemList lbSetPicture [_itemListIndex, (getText (configFile >> "CfgVehicles" >> _class >> "picture"))];
			};
			case "storeChopper": {
				_itemListIndex = _itemList lbAdd (getText (configFile >> "CfgVehicles" >> _class >> "displayName"));
				_itemList lbSetData [_itemListIndex, format ["%1", [_class, _price, _mod]]];
				_itemList lbSetPicture [_itemListIndex, (getText (configFile >> "CfgVehicles" >> _class >> "picture"))];
			};
			case "storeMarine": {
				_itemListIndex = _itemList lbAdd (getText (configFile >> "CfgVehicles" >> _class >> "displayName"));
				_itemList lbSetData [_itemListIndex, format ["%1", [_class, _price, _mod]]];
				_itemList lbSetPicture [_itemListIndex, (getText (configFile >> "CfgVehicles" >> _class >> "picture"))];
			};
			case "storeStatic": {
				_itemListIndex = _itemList lbAdd (getText (configFile >> "CfgVehicles" >> _class >> "displayName"));
				_itemList lbSetData [_itemListIndex, format ["%1", [_class, _price, _mod]]];
				_itemList lbSetPicture [_itemListIndex, (getText (configFile >> "CfgVehicles" >> _class >> "picture"))];
			};
			case "storeUAV": {
				_itemListIndex = _itemList lbAdd (getText (configFile >> "CfgVehicles" >> _class >> "displayName"));
				_itemList lbSetData [_itemListIndex, format ["%1", [_class, _price, _mod]]];
				_itemList lbSetPicture [_itemListIndex, (getText (configFile >> "CfgVehicles" >> _class >> "picture"))];
			};
			case "storeUGV": {
				_itemListIndex = _itemList lbAdd (getText (configFile >> "CfgVehicles" >> _class >> "displayName"));
				_itemList lbSetData [_itemListIndex, format ["%1", [_class, _price, _mod]]];
				_itemList lbSetPicture [_itemListIndex, (getText (configFile >> "CfgVehicles" >> _class >> "picture"))];
			};
			case "storeWheeled": {
				_itemListIndex = _itemList lbAdd (getText (configFile >> "CfgVehicles" >> _class >> "displayName"));
				_itemList lbSetData [_itemListIndex, format ["%1", [_class, _price, _mod]]];
				_itemList lbSetPicture [_itemListIndex, (getText (configFile >> "CfgVehicles" >> _class >> "picture"))];
			};
			default {
				_itemListIndex = _itemList lbAdd (getText (configFile >> "CfgWeapons" >> _class >> "displayName"));
				_itemList lbSetData [_itemListIndex, format ["%1", [_class, _price, _mod]]];
				_itemList lbSetPicture [_itemListIndex, (getText (configFile >> "CfgWeapons" >> _class >> "picture"))];
			};
		};
	};
} forEach currentSelectionArray;

_itemList lbSetCurSel 0;