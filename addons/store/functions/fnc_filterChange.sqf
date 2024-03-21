#include "script_component.hpp"

private ["_control", "_index", "_selectedCategory", "_selectedCategoryTitle"];

_control = _this select 0;
_index = _this select 1;
_selectedCategory = _control lbData _index;
_selectedCategoryTitle = _control lbText _index;

{
	if (_index == _forEachIndex) then {
		selectedCategory = _selectedCategory;
		selectedCategoryTitle = _selectedCategoryTitle;
	};
} forEach storeCategories;

switch (selectedCategory) do {
	case "storeBackpacks": {
		[missionNamespace getVariable selectedCategory] call sog_client_store_fnc_addInventory;
	};
	case "storeGoggles": {
		[missionNamespace getVariable selectedCategory] call sog_client_store_fnc_addInventory;
	};
	case "storeHeadgear": {
		[missionNamespace getVariable selectedCategory] call sog_client_store_fnc_addInventory;
	};
	case "storeItems": {
		[missionNamespace getVariable selectedCategory] call sog_client_store_fnc_addInventory;
	};
	case "storeMagazines": {
		[missionNamespace getVariable selectedCategory] call sog_client_store_fnc_addInventory;
	};
	case "storeUniforms": {
		[missionNamespace getVariable selectedCategory] call sog_client_store_fnc_addInventory;
	};
	case "storeVests": {
		[missionNamespace getVariable selectedCategory] call sog_client_store_fnc_addInventory;
	};
	case "storeWeapons": {
		[missionNamespace getVariable selectedCategory] call sog_client_store_fnc_addInventory;
	};
	case "storeAircraft": {
		[missionNamespace getVariable selectedCategory] call sog_client_store_fnc_addInventory;
	};
	case "storeArmored": {
		[missionNamespace getVariable selectedCategory] call sog_client_store_fnc_addInventory;
	};
	case "storeChopper": {
		[missionNamespace getVariable selectedCategory] call sog_client_store_fnc_addInventory;
	};
	case "storeMarine": {
		[missionNamespace getVariable selectedCategory] call sog_client_store_fnc_addInventory;
	};
	case "storeStatic": {
		[missionNamespace getVariable selectedCategory] call sog_client_store_fnc_addInventory;
	};
	case "storeUAV": {
		[missionNamespace getVariable selectedCategory] call sog_client_store_fnc_addInventory;
	};
	case "storeUGV": {
		[missionNamespace getVariable selectedCategory] call sog_client_store_fnc_addInventory;
	};
	case "storeWheeled": {
		[missionNamespace getVariable selectedCategory] call sog_client_store_fnc_addInventory;
	};
	default {
		[missionNamespace getVariable selectedCategory] call sog_client_store_fnc_addInventory;
	};
};

hintSilent format ["Category filter changed. \n Only type %1 products will be shown.", selectedCategoryTitle];