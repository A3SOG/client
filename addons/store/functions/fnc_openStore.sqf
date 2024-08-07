#include "script_component.hpp"

params ["_ct"];

disableSerialization;
createDialog "RscStore";

private _myDialog = findDisplay 202302;
private _ctrl01 = _myDialog displayCtrl 2023004;
private _ctrl02 = _myDialog displayCtrl 2023005;
private _ctrl03 = _myDialog displayCtrl 2023006;
private _array = _ct getVariable "isStore";

storeCategories = _array select 0;
storeModset = _array select 1;
storePaymentMethods = _array select 2;
storeName = _array select 3;
storeBackpacks = _array select 4;
storeGoggles = _array select 5;
storeHeadgear = _array select 6;
storeItems = _array select 7;
storeMagazines = _array select 8;
storeUniforms = _array select 9;
storeVests = _array select 10;
storeWeapons = _array select 11;
storeAircraft = _array select 12;
storeArmored = _array select 13;
storeChopper = _array select 14;
storeMarine = _array select 15;
storeStatic = _array select 16;
storeUAV = _array select 17;
storeUGV = _array select 18;
storeWheeled = _array select 19;
storeRestrictedCategories = _array select 20;

// ctrlSetText [2023000, storeName];

if ((getPlayerUID player) in companyGenerals) then {
	storeCategories insert [-1, storeRestrictedCategories, true];

	{
		private _paymentMethodsListIndex = _ctrl03 lbAdd _x;
	} forEach storePaymentMethods;
	_ctrl03 lbSetCurSel 0;
};

{
	private _modListIndex = _ctrl01 lbAdd _x;
} forEach storeModset;
_ctrl01 lbSetCurSel 2;

{
	private _title = _x select 0;
	private _category = _x select 1;
	private _catListIndex = _ctrl02 lbAdd _title;
	_ctrl02 lbSetData [_catListIndex, format ["%1", _category]];
} forEach storeCategories;
_ctrl02 lbSetCurSel 7;

[missionNamespace getVariable selectedCategory] call sog_client_store_fnc_addInventory;