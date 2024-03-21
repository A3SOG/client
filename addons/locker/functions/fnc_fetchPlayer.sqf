#include "script_component.hpp"

private ["_cat", "_class", "_data", "_dialog", "_itemList", "_itemListIndex"];

_dialog = findDisplay 202301;
_itemList = _dialog displayCtrl 1501;

_data = [];
_data pushBack ["storeUniforms", uniform player];
_data pushBack ["storeVests", vest player];
_data pushBack ["storeBackpacks", backpack player];
_data pushBack ["storeHeadgear", headgear player];

_data pushBack ["storeWeapons", primaryWeapon player];
_data pushBack ["storeWeapons", secondaryWeapon player];
_data pushBack ["storeWeapons", handgunWeapon player];

{
	_data pushBack ["storeItems", _x]
} forEach assignedItems player + items player;

{
	_magClass = _x select 0;
	_ammoCount = _x select 1;
	_magLocation = _x select 4;
	_ammoFull = getNumber(configfile >> "CfgMagazines" >> _magClass >> "count");
	if(_magLocation in ["Uniform","Vest","Backpack"]) then {
		_data pushBack ["storeMagazines", [_magClass, _ammoCount, _ammoFull, _magLocation]];
	};
} forEach magazinesAmmoFull player;

_data = _data select {!(_x in [["storeUniforms", ""], ["storeVests", ""], ["storeBackpacks", ""], ["storeHeadgear", ""], ["storeWeapons", ""], ["storeItems", ""], ["storeMagazines", ""]])};

{
	_cat = _x select 0;
	_class = _x select 1;

	switch (_cat) do {
		case "storeItems": {
			_itemListIndex = _itemList lbAdd (getText (configFile >> "CfgWeapons" >> _class >> "displayName"));
			_itemList lbSetData [_itemListIndex, format ["%1", [_cat, _class]]];
			_itemList lbSetPicture [_itemListIndex, (getText (configFile >> "CfgWeapons" >> _class >> "picture"))];
		};
		case "storeWeapons": {
			_itemListIndex = _itemList lbAdd (getText (configFile >> "CfgWeapons" >> _class >> "displayName"));
			_itemList lbSetData [_itemListIndex, format ["%1", [_cat, _class]]];
			_itemList lbSetPicture [_itemListIndex, (getText (configFile >> "CfgWeapons" >> _class >> "picture"))];
		};
		case "storeUniforms": {
			_itemListIndex = _itemList lbAdd (getText (configFile >> "CfgWeapons" >> _class >> "displayName"));
			_itemList lbSetData [_itemListIndex, format ["%1", [_cat, _class]]];
			_itemList lbSetPicture [_itemListIndex, (getText (configFile >> "CfgWeapons" >> _class >> "picture"))];
		};
		case "storeVests": {
			_itemListIndex = _itemList lbAdd (getText (configFile >> "CfgWeapons" >> _class >> "displayName"));
			_itemList lbSetData [_itemListIndex, format ["%1", [_cat, _class]]];
			_itemList lbSetPicture [_itemListIndex, (getText (configFile >> "CfgWeapons" >> _class >> "picture"))];
		};
		case "storeHeadgear": {
			_itemListIndex = _itemList lbAdd (getText (configFile >> "CfgWeapons" >> _class >> "displayName"));
			_itemList lbSetData [_itemListIndex, format ["%1", [_cat, _class]]];
			_itemList lbSetPicture [_itemListIndex, (getText (configFile >> "CfgWeapons" >> _class >> "picture"))];
		};
		case "storeMagazines": {
			_itemListIndex = _itemList lbAdd format["%1 - %2/%3 - %4",(getText (configFile >> "CfgMagazines" >> (_class select 0) >> "displayName")), (_class select 1), (_class select 2), (_class select 3)];
			_itemList lbSetData [_itemListIndex, format ["%1", [_cat, _class]]];
			_itemList lbSetPicture [_itemListIndex, (getText (configFile >> "CfgMagazines" >> (_class select 0) >> "picture"))];
		};
		case "storeBackpacks": {
			_itemListIndex = _itemList lbAdd (getText (configFile >> "CfgVehicles" >> _class >> "displayName"));
			_itemList lbSetData [_itemListIndex, format ["%1", [_cat, _class]]];
			_itemList lbSetPicture [_itemListIndex, (getText (configFile >> "CfgVehicles" >> _class >> "picture"))];
		};
	};
} forEach _data;