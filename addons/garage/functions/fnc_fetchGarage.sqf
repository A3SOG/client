#include "script_component.hpp"

private _dialog = findDisplay 202304;
private _itemList = _dialog displayCtrl 1500;
lbClear _itemList;

{
	private _cat = _x select 0;
	private _class = _x select 1;

	private _itemListIndex = _itemList lbAdd (getText (configFile >> "CfgVehicles" >> _class >> "displayName"));
	_itemList lbSetData [_itemListIndex, format ["%1", [_cat, _class]]];
	_itemList lbSetPicture [_itemListIndex, (getText (configFile >> "CfgVehicles" >> _class >> "picture"))];
} forEach (player getVariable ["Garage", []]);