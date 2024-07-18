#include "script_component.hpp"

private ["_amount", "_amountPrice", "_bank", "_cash", "_class", "_data", "_dataArray", "_funds", "_garage", "_index", "_locker", "_pdbMode", "_price"];

_pdbMode = "PDB_MODE" call BIS_fnc_getParamValue;

_index = lbCurSel 2023002;
_data = lbData [2023002, _index];
_dataArray = call compile _data;
_class = _dataArray select 0;
_price = _dataArray select 1;

_amount = 1;
_amountPrice = _price * _amount;

_bank = player getVariable ["Cash_Bank", 0];
_cash = player getVariable ["Cash", 0];
_garage = player getVariable ["Garage", []];
_locker = player getVariable ["Locker", []];
_funds = companyFunds;

private _fnc_buyVehicle = {
	params [["_categoryType", "", [""]], ["_vehicleType", 0, [0]], ["_classname", "", [""]], ["_vehiclePrice", 0, [0]]];
	if (currentPaymentMethod == "Company Funds" && !((getPlayerUID player) in companyGenerals)) exitWith { hintSilent "You are not authorized to use Company Funds!" };
	if (currentPaymentMethod == "Company Funds" && (getPlayerUID player) in companyGenerals) then {
		if (_vehiclePrice > _funds) exitWith { hintSilent "You do not have enough funds!" };

		_garage pushBack [_categoryType, _classname];
		player setVariable ["Garage", _garage, true];

		["deduct", _vehiclePrice] remoteExecCall ["sog_server_money_fnc_handleFunds", 2];

		[_classname, _vehicleType] call sog_client_armory_fnc_addVehArmory;
		if (_pdbMode == 2) then { "ArmaSOGClient" callExtension ["save_unlock", ["garage", _classname, _vehicleType]]; };

		hintSilent "You have bought the vehicle!";
	} else {
		if (_vehiclePrice > _cash) exitWith { hintSilent "You do not have enough money!" };

		_garage pushBack [_categoryType, _classname];
		player setVariable ["Garage", _garage, true];

		["deduct", "Cash", _vehiclePrice, player] remoteExecCall ["sog_server_money_fnc_handleMoney", 2];

		[_classname, _vehicleType] call sog_client_armory_fnc_addVehArmory;
		if (_pdbMode == 2) then { "ArmaSOGClient" callExtension ["save_unlock", ["garage", _classname, _vehicleType]]; };

		hintSilent "You have bought the vehicle!";
	};
};

private _fnc_buyItem = {
	params [["_categoryType", "", [""]], ["_itemType", 0, [0]], ["_classname", "", [""]], ["_itemPrice", 0, [0]]];
	if (currentPaymentMethod == "Company Funds" && !((getPlayerUID player) in companyGenerals)) exitWith { hintSilent "You are not authorized to use Company Funds!" };
	if (currentPaymentMethod == "Company Funds" && (getPlayerUID player) in companyGenerals) then {
		if (_itemPrice > _funds) exitWith { hintSilent "You do not have enough funds!" };
		
		_locker pushBack [_categoryType, _classname];

		player setVariable ["Locker", _locker, true];

		["deduct", _itemPrice] remoteExecCall ["sog_server_money_fnc_handleFunds", 2];

		[_classname, _itemType] call sog_client_armory_fnc_addItemArmory;
		if (_pdbMode == 2) then { "ArmaSOGClient" callExtension ["save_unlock", ["armory", _classname, _itemType]]; };

		hintSilent "You have bought the item!";
	} else {
		if (_itemPrice > _cash) exitWith { hintSilent "You do not have enough money!" };

		_locker pushBack [_categoryType, _classname];
		player setVariable ["Locker", _locker, true];

		["deduct", "Cash", _itemPrice, player] remoteExecCall ["sog_server_money_fnc_handleMoney", 2];

		[_classname, _itemType] call sog_client_armory_fnc_addItemArmory;
		if (_pdbMode == 2) then { "ArmaSOGClient" callExtension ["save_unlock", ["armory", _classname, _itemType]]; };

		hintSilent "You have bought the item!";
	};
};

switch (selectedCategory) do {
	case "storeItems": {
		["storeItems", 0, _class, _price] call _fnc_buyItem;
	};
	case "storeMagazines": {
		if (currentPaymentMethod == "Company Funds" && !((getPlayerUID player) in companyGenerals)) exitWith { hintSilent "You are not authorized to use Company Funds!" };
		if (currentPaymentMethod == "Company Funds" && (getPlayerUID player) in companyGenerals) then {
			if (_price > _funds) exitWith { hintSilent "You do not have enough funds!" };

			["deduct", _price] remoteExecCall ["sog_server_money_fnc_handleFunds", 2];

			_locker = player getVariable ["Locker", []];
			_locker pushBack ["storeMagazines", [_class, getNumber (configfile >> "CfgMagazines" >> _class >> "count"), getNumber (configfile >> "CfgMagazines" >> _class >> "count")]];
			player setVariable ["Locker", _locker, true];

			[_class, 2] call sog_client_armory_fnc_addItemArmory;
			if (_pdbMode == 2) then { "ArmaSOGClient" callExtension ["save_unlock", ["armory", _class, 2]]; };

			hintSilent "You have bought the Item!";
		} else {
			if (_price > _cash) exitWith { hintSilent "You do not have enough money!" };

			["deduct", "Cash", _price, player] remoteExecCall ["sog_server_money_fnc_handleMoney", 2];

			_locker = player getVariable ["Locker", []];
			_locker pushBack ["storeMagazines", [_class, getNumber (configfile >> "CfgMagazines" >> _class >> "count"), getNumber (configfile >> "CfgMagazines" >> _class >> "count")]];
			player setVariable ["Locker", _locker, true];

			[_class, 2] call sog_client_armory_fnc_addItemArmory;
			if (_pdbMode == 2) then { "ArmaSOGClient" callExtension ["save_unlock", ["armory", _class, 2]]; };

			hintSilent "You have bought the Item!";
		};
	};
	case "storeWeapons": {
		["storeWeapons", 1, _class, _price] call _fnc_buyItem;
	};
	case "storeUniforms": {
		["storeUniforms", 0, _class, _price] call _fnc_buyItem;
	};
	case "storeVests": {
		["storeVests", 0, _class, _price] call _fnc_buyItem;
	};
	case "storeHeadgear": {
		["storeHeadgear", 0, _class, _price] call _fnc_buyItem;
	};
	case "storeBackpacks": {
		["storeBackpacks", 3, _class, _price] call _fnc_buyItem;	
	};
	case "storeAircraft": {
		["garageAircraft", 3, _class, _price] call _fnc_buyVehicle;
	};
	case "storeArmored": {
		["garageArmored", 1, _class, _price] call _fnc_buyVehicle;
	};
	case "storeChopper": {
		["garageChopper", 2, _class, _price] call _fnc_buyVehicle;
	};
	case "storeMarine": {
		["garageMarine", 4, _class, _price] call _fnc_buyVehicle;
	};
	case "storeStatic": {
		["garageStatic", 5, _class, _price] call _fnc_buyVehicle;
	};
	case "storeUAV": {
		["garageUAV", 3, _class, _price] call _fnc_buyVehicle;
	};
	case "storeUGV": {
		["garageUGV", 0, _class, _price] call _fnc_buyVehicle;
	};
	case "storeWheeled": {
		["garageWheeled", 0, _class, _price] call _fnc_buyVehicle;
	};
	default {
		hint "Error >> Item doesn't have a defined type";
		closeDialog 0;
	};
};