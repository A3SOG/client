#include "script_component.hpp"

private ["_category", "_class", "_clear", "_data", "_dialog", "_index", "_itemList", "_itemList2", "_garage", "_selectedItem"];

_dialog = findDisplay 202304;
_itemList = _dialog displayCtrl 1500;
_itemList2 = _dialog displayCtrl 1501;
_selectedItem = lbCurSel _itemList;
_data = call compile format["%1", _itemList lbData _selectedItem];

if ((isNil {_data})) exitWith { ctrlEnable [1600, true]; };

_category = _data select 0;
_class = _data select 1;

_locations = (missionConfigFile >> "SOG_CfgGarages" >> "locations") call BIS_fnc_getCfgData;
// _locations = (configFile >> "CfgPatches" >> "sog_client_garage" >> "locations") call BIS_fnc_getCfgData;
{
	if ((_x select 0) == _category) then {
		_veh = createVehicle [_class, (_x select 1)];
		_veh setVariable ["Garage", _category, true];
		_veh setDir (_x select 2);
		//[_veh, (_x select 2)] remoteExec ["setDir"];
	};
} count _locations;

lbClear _itemList;
lbClear _itemList2;
_itemList lbSetCurSel -1;
_itemList2 lbSetCurSel -1;
_garage = player getVariable ["Garage", []];
_index = _garage findIf { _x isEqualTo _data };
_garage deleteAt _index;
player setVariable ["Garage", _garage, true];

[] call sog_client_garage_fnc_fetchGarage;
[] call sog_client_garage_fnc_fetchVehicle;

ctrlEnable [1600, true];