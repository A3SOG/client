#include "script_component.hpp"

params [["_vehicles", []]];
private ["_cars", "_armor", "_helis", "_planes", "_naval", "_static"];

_cars = SOG_Garage_Unlocks select 0;
_armor = SOG_Garage_Unlocks select 1;
_helis = SOG_Garage_Unlocks select 2;
_planes = SOG_Garage_Unlocks select 3;
_naval = SOG_Garage_Unlocks select 4;
_static = SOG_Garage_Unlocks select 5;

{
	switch true do {
		case (_x isKindOf "Car"): {
			if ((_x isKindOf "Tank") || (_x isKindOf "Wheeled_APC_F")) exitWith {};
			_cars pushBackUnique _x;
		};
		case (_x isKindOf "Tank"): {
			_armor pushBackUnique _x;
		};
		case (_x isKindOf "Helicopter"): {
			_helis pushBackUnique _x;
		};
		case (_x isKindOf "Plane"): {
			_planes pushBackUnique _x;
		};
		case (_x isKindOf "Ship"): {
			_naval pushBackUnique _x;
		};
		case (_x isKindOf "Static"): {
			_static pushBackUnique _x;
		};
	};
} forEach _vehicles;

SOG_CarUnlocks = [];
SOG_ArmorUnlocks = [];
SOG_HeliUnlocks = [];
SOG_PlaneUnlocks = [];
SOG_NavalUnlocks = [];
SOG_StaticUnlocks = [];

{
	SOG_CarUnlocks append [getText (configFile >> "CfgVehicles" >> _x >> "model"), [configFile >> "CfgVehicles" >> _x]];
} forEach _cars;

{
	SOG_ArmorUnlocks append [getText (configFile >> "CfgVehicles" >> _x >> "model"), [configFile >> "CfgVehicles" >> _x]];
} forEach _armor;

{
	SOG_HeliUnlocks append [getText (configFile >> "CfgVehicles" >> _x >> "model"), [configFile >> "CfgVehicles" >> _x]];
} forEach _helis;

{
	SOG_PlaneUnlocks append [getText (configFile >> "CfgVehicles" >> _x >> "model"), [configFile >> "CfgVehicles" >> _x]];
} forEach _planes;

{
	SOG_NavalUnlocks append [getText (configFile >> "CfgVehicles" >> _x >> "model"), [configFile >> "CfgVehicles" >> _x]];
} forEach _naval;

{
	SOG_StaticUnlocks append [getText (configFile >> "CfgVehicles" >> _x >> "model"), [configFile >> "CfgVehicles" >> _x]];
} forEach _static;

switch (SOG_PDB_Mode) do {
	case 0: {
		profileNamespace setVariable ["SOG_Garage_Unlocks", SOG_Garage_Unlocks];
	};
	case 1: {
		_key = getPlayerUID player;
		[_key + "_Garage_Unlocks", str SOG_Garage_Unlocks] remoteExec ["db_fnc_save", 2, false];
	};
	default {
		profileNamespace setVariable ["SOG_Garage_Unlocks", SOG_Garage_Unlocks];
	};
};