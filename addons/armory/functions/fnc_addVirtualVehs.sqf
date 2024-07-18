#include "script_component.hpp"

params [["_vehicles", []]];
private ["_cars", "_armor", "_helis", "_planes", "_naval", "_static"];

_cars = GVAR(garageUnlocks) select 0;
_armor = GVAR(garageUnlocks) select 1;
_helis = GVAR(garageUnlocks) select 2;
_planes = GVAR(garageUnlocks) select 3;
_naval = GVAR(garageUnlocks) select 4;
_static = GVAR(garageUnlocks) select 5;

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