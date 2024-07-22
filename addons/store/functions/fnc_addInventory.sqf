#include "script_component.hpp"

private _dialog = findDisplay 202302;
private _itemList = _dialog displayCtrl 2023002;

lbClear _itemList;

currentProductList = [];
currentSelectionArray = _this select 0;

{
	private _class = ((currentSelectionArray select _forEachIndex) select 0);
	private _price = ((currentSelectionArray select _forEachIndex) select 1);
	private _mod = ((currentSelectionArray select _forEachIndex) select 2);
	
	if (_mod == currentMod) then {
		currentProductList pushBack [_class, _price, _mod];
		switch (selectedCategory) do {
			case "storeBackpacks": {
				private _itemListIndex = _itemList lbAdd (getText (configFile >> "CfgVehicles" >> _class >> "displayName"));
				_itemList lbSetData [_itemListIndex, format ["%1", [_class, _price, _mod]]];
				_itemList lbSetPicture [_itemListIndex, (getText (configFile >> "CfgVehicles" >> _class >> "picture"))];
			};
			case "storeGoggles": {
				private _itemListIndex = _itemList lbAdd (getText (configFile >> "CfgWeapons" >> _class >> "displayName"));
				_itemList lbSetData [_itemListIndex, format ["%1", [_class, _price, _mod]]];
				_itemList lbSetPicture [_itemListIndex, (getText (configFile >> "CfgWeapons" >> _class >> "picture"))];
			};
			case "storeHeadgear": {
				private _itemListIndex = _itemList lbAdd (getText (configFile >> "CfgWeapons" >> _class >> "displayName"));
				_itemList lbSetData [_itemListIndex, format ["%1", [_class, _price, _mod]]];
				_itemList lbSetPicture [_itemListIndex, (getText (configFile >> "CfgWeapons" >> _class >> "picture"))];
			};
			case "storeItems": {
				private _itemListIndex = _itemList lbAdd (getText (configFile >> "CfgWeapons" >> _class >> "displayName"));
				_itemList lbSetData [_itemListIndex, format ["%1", [_class, _price, _mod]]];
				_itemList lbSetPicture [_itemListIndex, (getText (configFile >> "CfgWeapons" >> _class >> "picture"))];
			};
			case "storeMagazines": {
				private _itemListIndex = _itemList lbAdd (getText (configFile >> "CfgMagazines" >> _class >> "displayName"));
				_itemList lbSetData [_itemListIndex, format ["%1", [_class, _price, _mod]]];
				_itemList lbSetPicture [_itemListIndex, (getText (configFile >> "CfgMagazines" >> _class >> "picture"))];
			};
			case "storeUniforms": {
				private _itemListIndex = _itemList lbAdd (getText (configFile >> "CfgWeapons" >> _class >> "displayName"));
				_itemList lbSetData [_itemListIndex, format ["%1", [_class, _price, _mod]]];
				_itemList lbSetPicture [_itemListIndex, (getText (configFile >> "CfgWeapons" >> _class >> "picture"))];
			};
			case "storeVests": {
				private _itemListIndex = _itemList lbAdd (getText (configFile >> "CfgWeapons" >> _class >> "displayName"));
				_itemList lbSetData [_itemListIndex, format ["%1", [_class, _price, _mod]]];
				_itemList lbSetPicture [_itemListIndex, (getText (configFile >> "CfgWeapons" >> _class >> "picture"))];
			};
			case "storeWeapons": {
				private _itemListIndex = _itemList lbAdd (getText (configFile >> "CfgWeapons" >> _class >> "displayName"));
				_itemList lbSetData [_itemListIndex, format ["%1", [_class, _price, _mod]]];
				_itemList lbSetPicture [_itemListIndex, (getText (configFile >> "CfgWeapons" >> _class >> "picture"))];
			};

			case "storeAircraft": {
				private _itemListIndex = _itemList lbAdd (getText (configFile >> "CfgVehicles" >> _class >> "displayName"));
				_itemList lbSetData [_itemListIndex, format ["%1", [_class, _price, _mod]]];
				_itemList lbSetPicture [_itemListIndex, (getText (configFile >> "CfgVehicles" >> _class >> "picture"))];
			};
			case "storeArmored": {
				private _itemListIndex = _itemList lbAdd (getText (configFile >> "CfgVehicles" >> _class >> "displayName"));
				_itemList lbSetData [_itemListIndex, format ["%1", [_class, _price, _mod]]];
				_itemList lbSetPicture [_itemListIndex, (getText (configFile >> "CfgVehicles" >> _class >> "picture"))];
			};
			case "storeChopper": {
				private _itemListIndex = _itemList lbAdd (getText (configFile >> "CfgVehicles" >> _class >> "displayName"));
				_itemList lbSetData [_itemListIndex, format ["%1", [_class, _price, _mod]]];
				_itemList lbSetPicture [_itemListIndex, (getText (configFile >> "CfgVehicles" >> _class >> "picture"))];
			};
			case "storeMarine": {
				private _itemListIndex = _itemList lbAdd (getText (configFile >> "CfgVehicles" >> _class >> "displayName"));
				_itemList lbSetData [_itemListIndex, format ["%1", [_class, _price, _mod]]];
				_itemList lbSetPicture [_itemListIndex, (getText (configFile >> "CfgVehicles" >> _class >> "picture"))];
			};
			case "storeStatic": {
				private _itemListIndex = _itemList lbAdd (getText (configFile >> "CfgVehicles" >> _class >> "displayName"));
				_itemList lbSetData [_itemListIndex, format ["%1", [_class, _price, _mod]]];
				_itemList lbSetPicture [_itemListIndex, (getText (configFile >> "CfgVehicles" >> _class >> "picture"))];
			};
			case "storeUAV": {
				private _itemListIndex = _itemList lbAdd (getText (configFile >> "CfgVehicles" >> _class >> "displayName"));
				_itemList lbSetData [_itemListIndex, format ["%1", [_class, _price, _mod]]];
				_itemList lbSetPicture [_itemListIndex, (getText (configFile >> "CfgVehicles" >> _class >> "picture"))];
			};
			case "storeUGV": {
				private _itemListIndex = _itemList lbAdd (getText (configFile >> "CfgVehicles" >> _class >> "displayName"));
				_itemList lbSetData [_itemListIndex, format ["%1", [_class, _price, _mod]]];
				_itemList lbSetPicture [_itemListIndex, (getText (configFile >> "CfgVehicles" >> _class >> "picture"))];
			};
			case "storeWheeled": {
				private _itemListIndex = _itemList lbAdd (getText (configFile >> "CfgVehicles" >> _class >> "displayName"));
				_itemList lbSetData [_itemListIndex, format ["%1", [_class, _price, _mod]]];
				_itemList lbSetPicture [_itemListIndex, (getText (configFile >> "CfgVehicles" >> _class >> "picture"))];
			};
			default {
				private _itemListIndex = _itemList lbAdd (getText (configFile >> "CfgWeapons" >> _class >> "displayName"));
				_itemList lbSetData [_itemListIndex, format ["%1", [_class, _price, _mod]]];
				_itemList lbSetPicture [_itemListIndex, (getText (configFile >> "CfgWeapons" >> _class >> "picture"))];
			};
		};
	};
} forEach currentSelectionArray;

_itemList lbSetCurSel 0;