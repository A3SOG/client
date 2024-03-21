#include "script_component.hpp"

selectedModIndex = _this select 1;
{
	if (selectedModIndex == _forEachIndex) then {
		currentMod = _x;
	};
} forEach storeModset;

if (selectedCategory != "INDEX") then {
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
};

hintSilent format ["Manufacture (mod) filter changed. \n Only type %1 products will be shown.", currentMod];