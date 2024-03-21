#include "script_component.hpp"

private ["_check", "_class", "_data", "_dataArray", "_index", "_locker", "_pdbMode", "_price"];

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

switch (selectedCategory) do {
	case "storeItems": {
		if (_price > _cash) exitWith {
			hintSilent "You do not have enough money!"
		};

		["deduct", "Cash", _price, player] remoteExecCall ["sog_server_money_fnc_handleMoney", 2];

		_locker = player getVariable ["Locker", []];
		_locker pushBack ["storeItems", _class];
		player setVariable ["Locker", _locker, true];

		[_class, 0] call sog_client_armory_fnc_addItemArmory;
		// if (_pdbMode == 2) then { ["store_playerData.store_playerDataStoreUnlocks", ["armory", [_class, 0]]] call py3_fnc_callExtension; };
		if (_pdbMode == 2) then { "ArmaSOGClient" callExtension ["save_unlock", ["armory", _class, 0]]; };

		hintSilent "You have bought the item!";
	};
	case "storeMagazines": {
		if (_price > _cash) exitWith {
			hintSilent "You do not have enough money!"
		};

		["deduct", "Cash", _price, player] remoteExecCall ["sog_server_money_fnc_handleMoney", 2];

		_locker = player getVariable ["Locker", []];
		_locker pushBack ["storeMagazines", [_class, getNumber (configfile >> "CfgMagazines" >> _class >> "count"), getNumber (configfile >> "CfgMagazines" >> _class >> "count")]];
		player setVariable ["Locker", _locker, true];

		[_class, 2] call sog_client_armory_fnc_addItemArmory;
		// if (_pdbMode == 2) then { ["store_playerData.store_playerDataStoreUnlocks", ["armory", [_class, 2]]] call py3_fnc_callExtension; };
		if (_pdbMode == 2) then { "ArmaSOGClient" callExtension ["save_unlock", ["armory", _class, 2]]; };

		hintSilent "You have bought the magazine!";
	};
	case "storeWeapons": {
		if (_price > _cash) exitWith {
			hintSilent "You do not have enough money!"
		};

		["deduct", "Cash", _price, player] remoteExecCall ["sog_server_money_fnc_handleMoney", 2];

		_locker = player getVariable ["Locker", []];
		_locker pushBack ["storeWeapons", _class];
		player setVariable ["Locker", _locker, true];

		[_class, 1] call sog_client_armory_fnc_addItemArmory;
		// if (_pdbMode == 2) then { ["store_playerData.store_playerDataStoreUnlocks", ["armory", [_class, 1]]] call py3_fnc_callExtension; };
		if (_pdbMode == 2) then { "ArmaSOGClient" callExtension ["save_unlock", ["armory", _class, 1]]; };

		hintSilent "You have bought the weapon!";
	};
	case "storeUniforms": {
		if (_price > _cash) exitWith {
			hintSilent "You do not have enough money!"
		};

		["deduct", "Cash", _price, player] remoteExecCall ["sog_server_money_fnc_handleMoney", 2];

		_locker = player getVariable ["Locker", []];
		_locker pushBack ["storeUniforms", _class];
		player setVariable ["Locker", _locker, true];

		[_class, 0] call sog_client_armory_fnc_addItemArmory;
		// if (_pdbMode == 2) then { ["store_playerData.store_playerDataStoreUnlocks", ["armory", [_class, 0]]] call py3_fnc_callExtension; };
		if (_pdbMode == 2) then { "ArmaSOGClient" callExtension ["save_unlock", ["armory", _class, 0]]; };

		hintSilent "You have bought the uniform!";
	};
	case "storeVests": {
		if (_price > _cash) exitWith {
			hintSilent "You do not have enough money!"
		};

		["deduct", "Cash", _price, player] remoteExecCall ["sog_server_money_fnc_handleMoney", 2];

		_locker = player getVariable ["Locker", []];
		_locker pushBack ["storeVests", _class];
		player setVariable ["Locker", _locker, true];

		[_class, 0] call sog_client_armory_fnc_addItemArmory;
		// if (_pdbMode == 2) then { ["store_playerData.store_playerDataStoreUnlocks", ["armory", [_class, 0]]] call py3_fnc_callExtension; };
		if (_pdbMode == 2) then { "ArmaSOGClient" callExtension ["save_unlock", ["armory", _class, 0]]; };

		hintSilent "You have bought the vest!";
	};
	case "storeHeadgear": {
		if (_price > _cash) exitWith {
			hintSilent "You do not have enough money!"
		};

		["deduct", "Cash", _price, player] remoteExecCall ["sog_server_money_fnc_handleMoney", 2];

		_locker = player getVariable ["Locker", []];
		_locker pushBack ["storeHeadgear", _class];
		player setVariable ["Locker", _locker, true];

		[_class, 0] call sog_client_armory_fnc_addItemArmory;
		// if (_pdbMode == 2) then { ["store_playerData.store_playerDataStoreUnlocks", ["armory", [_class, 0]]] call py3_fnc_callExtension; };
		if (_pdbMode == 2) then { "ArmaSOGClient" callExtension ["save_unlock", ["armory", _class, 0]]; };

		hintSilent "You have bought the headgear!";
	};
	case "storeBackpacks": {
		if (_price > _cash) exitWith {
			hintSilent "You do not have enough money!"
		};

		["deduct", "Cash", _price, player] remoteExecCall ["sog_server_money_fnc_handleMoney", 2];

		_locker = player getVariable ["Locker", []];
		_locker pushBack ["storeBackpacks", _class];
		player setVariable ["Locker", _locker, true];

		[_class, 3] call sog_client_armory_fnc_addItemArmory;
		// if (_pdbMode == 2) then { ["store_playerData.store_playerDataStoreUnlocks", ["armory", [_class, 3]]] call py3_fnc_callExtension; };
		if (_pdbMode == 2) then { "ArmaSOGClient" callExtension ["save_unlock", ["armory", _class, 3]]; };

		hintSilent "You have bought the backpack!";
	};
	case "storeAircraft": {
		if (_price > _cash) exitWith {
			hintSilent "You do not have enough money!"
		};

		["deduct", "Cash", _price, player] remoteExecCall ["sog_server_money_fnc_handleMoney", 2];

		_garage = player getVariable ["Garage", []];
		_garage pushBack ["garageAircraft", _class];
		player setVariable ["Garage", _garage, true];

		[_class, 3] call sog_client_armory_fnc_addVehArmory;
		// ["store_playerData.store_playerDataStoreUnlocks", ["garage", [_class, 3]]] call py3_fnc_callExtension;
		if (_pdbMode == 2) then { "ArmaSOGClient" callExtension ["save_unlock", ["garage", _class, 3]]; };

		hintSilent "You have bought the vehicle!";
	};
	case "storeArmored": {
		if (_price > _cash) exitWith {
			hintSilent "You do not have enough money!"
		};

		["deduct", "Cash", _price, player] remoteExecCall ["sog_server_money_fnc_handleMoney", 2];

		_garage = player getVariable ["Garage", []];
		_garage pushBack ["garageArmored", _class];
		player setVariable ["Garage", _garage, true];

		[_class, 1] call sog_client_armory_fnc_addVehArmory;
		// if (_pdbMode == 2) then { ["store_playerData.store_playerDataStoreUnlocks", ["garage", [_class, 1]]] call py3_fnc_callExtension; };
		if (_pdbMode == 2) then { "ArmaSOGClient" callExtension ["save_unlock", ["garage", _class, 1]]; };

		hintSilent "You have bought the vehicle!";
	};
	case "storeChopper": {
		if (_price > _cash) exitWith {
			hintSilent "You do not have enough money!"
		};

		["deduct", "Cash", _price, player] remoteExecCall ["sog_server_money_fnc_handleMoney", 2];

		_garage = player getVariable ["Garage", []];
		_garage pushBack ["garageChopper", _class];
		player setVariable ["Garage", _garage, true];

		[_class, 2] call sog_client_armory_fnc_addVehArmory;
		// if (_pdbMode == 2) then { ["store_playerData.store_playerDataStoreUnlocks", ["garage", [_class, 2]]] call py3_fnc_callExtension; };
		if (_pdbMode == 2) then { "ArmaSOGClient" callExtension ["save_unlock", ["garage", _class, 2]]; };

		hintSilent "You have bought the vehicle!";
	};
	case "storeMarine": {
		if (_price > _cash) exitWith {
			hintSilent "You do not have enough money!"
		};

		[_price] remoteExecCall ["SOG_fnc_removeCash", 2];

		_garage = player getVariable ["Garage", []];
		_garage pushBack ["garageMarine", _class];
		player setVariable ["Garage", _garage, true];

		[_class, 4] call sog_client_armory_fnc_addVehArmory;
		// if (_pdbMode == 2) then { ["store_playerData.store_playerDataStoreUnlocks", ["garage", [_class, 4]]] call py3_fnc_callExtension; };
		if (_pdbMode == 2) then { "ArmaSOGClient" callExtension ["save_unlock", ["garage", _class, 4]]; };

		hintSilent "You have bought the vehicle!";
	};
	case "storeStatic": {
		if (_price > _cash) exitWith {
			hintSilent "You do not have enough money!"
		};

		["deduct", "Cash", _price, player] remoteExecCall ["sog_server_money_fnc_handleMoney", 2];

		_garage = player getVariable ["Garage", []];
		_garage pushBack ["garageStatic", _class];
		player setVariable ["Garage", _garage, true];

		[_class, 5] call sog_client_armory_fnc_addVehArmory;
		// if (_pdbMode == 2) then { ["store_playerData.store_playerDataStoreUnlocks", ["garage", [_class, 5]]] call py3_fnc_callExtension; };
		if (_pdbMode == 2) then { "ArmaSOGClient" callExtension ["save_unlock", ["garage", _class, 5]]; };

		hintSilent "You have bought the vehicle!";
	};
	case "storeUAV": {
		if (_price > _cash) exitWith {
			hintSilent "You do not have enough money!"
		};

		["deduct", "Cash", _price, player] remoteExecCall ["sog_server_money_fnc_handleMoney", 2];

		_garage = player getVariable ["Garage", []];
		_garage pushBack ["garageUAV", _class];
		player setVariable ["Garage", _garage, true];

		[_class, 3] call sog_client_armory_fnc_addVehArmory;
		// if (_pdbMode == 2) then { ["store_playerData.store_playerDataStoreUnlocks", ["garage", [_class, 3]]] call py3_fnc_callExtension; };
		if (_pdbMode == 2) then { "ArmaSOGClient" callExtension ["save_unlock", ["garage", _class, 3]]; };

		hintSilent "You have bought the vehicle!";
	};
	case "storeUGV": {
		if (_price > _cash) exitWith {
			hintSilent "You do not have enough money!"
		};

		["deduct", "Cash", _price, player] remoteExecCall ["sog_server_money_fnc_handleMoney", 2];

		_garage = player getVariable ["Garage", []];
		_garage pushBack ["garageUGV", _class];
		player setVariable ["Garage", _garage, true];

		[_class, 0] call sog_client_armory_fnc_addVehArmory;
		// if (_pdbMode == 2) then { ["store_playerData.store_playerDataStoreUnlocks", ["garage", [_class, 0]]] call py3_fnc_callExtension; };
		if (_pdbMode == 2) then { "ArmaSOGClient" callExtension ["save_unlock", ["garage", _class, 0]]; };

		hintSilent "You have bought the vehicle!";
	};
	case "storeWheeled": {
		if (_price > _cash) exitWith {
			hintSilent "You do not have enough money!"
		};

		["deduct", "Cash", _price, player] remoteExecCall ["sog_server_money_fnc_handleMoney", 2];

		_garage = player getVariable ["Garage", []];
		_garage pushBack ["garageWheeled", _class];
		player setVariable ["Garage", _garage, true];

		[_class, 0] call sog_client_armory_fnc_addVehArmory;
		// if (_pdbMode == 2) then { ["store_playerData.store_playerDataStoreUnlocks", ["garage", [_class, 0]]] call py3_fnc_callExtension; };
		if (_pdbMode == 2) then { "ArmaSOGClient" callExtension ["save_unlock", ["garage", _class, 0]]; };

		hintSilent "You have bought the vehicle!";
	};
	default {
		hint "Error >> Item doesn't have a defined type";
		closeDialog 0;
	};
};