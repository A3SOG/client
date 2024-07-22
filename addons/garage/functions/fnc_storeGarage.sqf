#include "script_component.hpp"

private _dialog = findDisplay 202304;
private _itemList = _dialog displayCtrl 1501;
private _itemList2 = _dialog displayCtrl 1500;
private _selectedItem = lbCurSel _itemList;
private _data = call compile format["%1", _itemList lbData _selectedItem];

if ((isNil {_data})) exitWith { ctrlEnable [1601, true]; };

private _category = _data select 0;
private _class = _data select 1;
private _veh = _data select 2;

private _garage = player getVariable ["Garage", []];
_garage pushBack [_category, _class];
player setVariable ["Garage", _garage, true];

lbClear _itemList;
lbClear _itemList2;
_itemList lbSetCurSel -1;
_itemList2 lbSetCurSel -1;

_veh spawn {
	deleteVehicle (objectfromNetID _this);
	waitUntil { isNull (objectFromNetId _this) };

	sleep 0.5;

	[] call sog_client_garage_fnc_fetchGarage;
	[] call sog_client_garage_fnc_fetchVehicle;
	ctrlEnable [1601, true];
};
playSound "FD_Finish_F";