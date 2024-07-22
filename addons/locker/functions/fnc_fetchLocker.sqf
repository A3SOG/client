#include "script_component.hpp"

private _dialog = findDisplay 202301;
private _itemList = _dialog displayCtrl 1500;

{
	private _cat = _x select 0;
	private _class = _x select 1;

	switch (_cat) do {
		case "storeItems": {
			private _itemListIndex = _itemList lbAdd (getText (configFile >> "CfgWeapons" >> _class >> "displayName"));
			_itemList lbSetData [_itemListIndex, format ["%1", [_cat, _class]]];
			_itemList lbSetPicture [_itemListIndex, (getText (configFile >> "CfgWeapons" >> _class >> "picture"))];
		};
		case "storeWeapons": {
			private _itemListIndex = _itemList lbAdd (getText (configFile >> "CfgWeapons" >> _class >> "displayName"));
			_itemList lbSetData [_itemListIndex, format ["%1", [_cat, _class]]];
			_itemList lbSetPicture [_itemListIndex, (getText (configFile >> "CfgWeapons" >> _class >> "picture"))];
		};
		case "storeUniforms": {
			private _itemListIndex = _itemList lbAdd (getText (configFile >> "CfgWeapons" >> _class >> "displayName"));
			_itemList lbSetData [_itemListIndex, format ["%1", [_cat, _class]]];
			_itemList lbSetPicture [_itemListIndex, (getText (configFile >> "CfgWeapons" >> _class >> "picture"))];
		};
		case "storeVests": {
			private _itemListIndex = _itemList lbAdd (getText (configFile >> "CfgWeapons" >> _class >> "displayName"));
			_itemList lbSetData [_itemListIndex, format ["%1", [_cat, _class]]];
			_itemList lbSetPicture [_itemListIndex, (getText (configFile >> "CfgWeapons" >> _class >> "picture"))];
		};
		case "storeHeadgear": {
			private _itemListIndex = _itemList lbAdd (getText (configFile >> "CfgWeapons" >> _class >> "displayName"));
			_itemList lbSetData [_itemListIndex, format ["%1", [_cat, _class]]];
			_itemList lbSetPicture [_itemListIndex, (getText (configFile >> "CfgWeapons" >> _class >> "picture"))];
		};
		case "storeMagazines": {
			private _itemListIndex = _itemList lbAdd format["%1 - %2/%3", (getText (configFile >> "CfgMagazines" >> (_class select 0) >> "displayName")), (_class select 1), (_class select 2)];
			_itemList lbSetData [_itemListIndex, format ["%1", [_cat, _class]]];
			_itemList lbSetPicture [_itemListIndex, (getText (configFile >> "CfgMagazines" >> (_class select 0) >> "picture"))];
		};
		case "storeBackpacks": {
			private _itemListIndex = _itemList lbAdd (getText (configFile >> "CfgVehicles" >> _class >> "displayName"));
			_itemList lbSetData [_itemListIndex, format ["%1", [_cat, _class]]];
			_itemList lbSetPicture [_itemListIndex, (getText (configFile >> "CfgVehicles" >> _class >> "picture"))];
		};
	};
} forEach (player getVariable ["Locker", []]);