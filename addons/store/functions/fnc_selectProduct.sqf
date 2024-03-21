#include "script_component.hpp"

private ["_dialog", "_itemDescription"];

_dialog = findDisplay 202302;
_itemDescription = _dialog displayCtrl 2023001;

_i = _this select 1;
focusedProductClass = ((currentProductList select _i) select 0);
focusedProductPrice = ((currentProductList select _i) select 1);

switch (selectedCategory) do {
	case "storeBackpacks": {
		focusedProductName = getText (configFile >> "CfgVehicles" >> focusedProductClass >> "displayName");
		ctrlSetText [2023003, getText (configFile >> "CfgVehicles" >> focusedProductClass >> "picture")];
	};
	case "storeGoggles": {
		focusedProductName = getText (configFile >> "CfgWeapons" >> focusedProductClass >> "displayName");
		ctrlSetText [2023003, getText (configFile >> "CfgWeapons" >> focusedProductClass >> "picture")];
	};
	case "storeHeadgear": {
		focusedProductName = getText (configFile >> "CfgWeapons" >> focusedProductClass >> "displayName");
		ctrlSetText [2023003, getText (configFile >> "CfgWeapons" >> focusedProductClass >> "picture")];
	};
	case "storeItems": {
		focusedProductName = getText (configFile >> "CfgWeapons" >> focusedProductClass >> "displayName");
		ctrlSetText [2023003, getText (configFile >> "CfgWeapons" >> focusedProductClass >> "picture")];
	};
	case "storeMagazines": {
		focusedProductName = getText (configFile >> "CfgMagazines" >> focusedProductClass >> "displayName");
		ctrlSetText [2023003, getText (configFile >> "CfgMagazines" >> focusedProductClass >> "picture")];
	};
	case "storeUniforms": {
		focusedProductName = getText (configFile >> "CfgWeapons" >> focusedProductClass >> "displayName");
		ctrlSetText [2023003, getText (configFile >> "CfgWeapons" >> focusedProductClass >> "picture")];
	};
	case "storeVests": {
		focusedProductName = getText (configFile >> "CfgWeapons" >> focusedProductClass >> "displayName");
		ctrlSetText [2023003, getText (configFile >> "CfgWeapons" >> focusedProductClass >> "picture")];
	};
	case "storeWeapons": {
		focusedProductName = getText (configFile >> "CfgWeapons" >> focusedProductClass >> "displayName");
		ctrlSetText [2023003, getText (configFile >> "CfgWeapons" >> focusedProductClass >> "picture")];
	};
	case "storeAircraft": {
		focusedProductName = getText (configFile >> "CfgVehicles" >> focusedProductClass >> "displayName");
		ctrlSetText [2023003, getText (configFile >> "CfgVehicles" >> focusedProductClass >> "picture")];
	};
	case "storeArmored": {
		focusedProductName = getText (configFile >> "CfgVehicles" >> focusedProductClass >> "displayName");
		ctrlSetText [2023003, getText (configFile >> "CfgVehicles" >> focusedProductClass >> "picture")];
	};
	case "storeChopper": {
		focusedProductName = getText (configFile >> "CfgVehicles" >> focusedProductClass >> "displayName");
		ctrlSetText [2023003, getText (configFile >> "CfgVehicles" >> focusedProductClass >> "picture")];
	};
	case "storeMarine": {
		focusedProductName = getText (configFile >> "CfgVehicles" >> focusedProductClass >> "displayName");
		ctrlSetText [2023003, getText (configFile >> "CfgVehicles" >> focusedProductClass >> "picture")];
	};
	case "storeStatic": {
		focusedProductName = getText (configFile >> "CfgVehicles" >> focusedProductClass >> "displayName");
		ctrlSetText [2023003, getText (configFile >> "CfgVehicles" >> focusedProductClass >> "picture")];
	};
	case "storeUAV": {
		focusedProductName = getText (configFile >> "CfgVehicles" >> focusedProductClass >> "displayName");
		ctrlSetText [2023003, getText (configFile >> "CfgVehicles" >> focusedProductClass >> "picture")];
	};
	case "storeUGV": {
		focusedProductName = getText (configFile >> "CfgVehicles" >> focusedProductClass >> "displayName");
		ctrlSetText [2023003, getText (configFile >> "CfgVehicles" >> focusedProductClass >> "picture")];
	};
	case "storeWheeled": {
		focusedProductName = getText (configFile >> "CfgVehicles" >> focusedProductClass >> "displayName");
		ctrlSetText [2023003, getText (configFile >> "CfgVehicles" >> focusedProductClass >> "picture")];
	};
	default {
		focusedProductName = getText (configFile >> "CfgWeapons" >> focusedProductClass >> "displayName");
		ctrlSetText [2023003, getText (configFile >> "CfgWeapons" >> focusedProductClass >> "picture")];
	};
};

_itemDescription ctrlSetStructuredText parseText format ["<t color='#000000'>%1<br /><br />Price: $%2<br />", focusedProductName, focusedProductPrice];