#include "script_component.hpp"

_dialog = findDisplay 202304;
_itemList = _dialog displayCtrl 1500;
lbClear _itemList;

{
	_cat = _x select 0;
	_class = _x select 1;

	_itemListIndex = _itemList lbAdd (getText (configFile >> "CfgVehicles" >> _class >> "displayName"));
	_itemList lbSetData [_itemListIndex, format ["%1", [_cat, _class]]];
	_itemList lbSetPicture [_itemListIndex, (getText (configFile >> "CfgVehicles" >> _class >> "picture"))];
} forEach (player getVariable ["Garage", []]);