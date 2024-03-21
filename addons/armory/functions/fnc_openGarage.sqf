#include "script_component.hpp"

// _pos = player getPos [10, getDir player];
_locations = (missionConfigFile >> "SOG_CfgGarages" >> "locations") call BIS_fnc_getCfgData;
{
	SOG_VehSpawnPos = (_x select 1) getPos [5, (_x select 2)];
} count _locations;

// BIS_fnc_garage_center = createVehicle ["Land_HelipadEmpty_F", _pos, [], 0, "CAN_COLLIDE"];
BIS_fnc_garage_center = createVehicle ["Land_HelipadEmpty_F", SOG_VehSpawnPos, [], 0, "NONE"];

[missionNamespace, "garageOpened", {
	params ["_display", "_toggleSpace"];

	missionNamespace setVariable ["BIS_fnc_garage_data", [
		SOG_CarUnlocks,
		SOG_ArmorUnlocks,
		SOG_HeliUnlocks,
		SOG_PlaneUnlocks,
		SOG_NavalUnlocks,
		SOG_StaticUnlocks
	]];

	{
		lbClear (_display displayCtrl (960 + _forEachIndex));
	} forEach BIS_fnc_garage_data;

	["ListAdd", [_display]] call BIS_fnc_garage;
}] call BIS_fnc_addScriptedEventHandler;

BIS_fnc_garage_centerType = getText (configFile >> "CfgVehicles" >> "B_Quadbike_01_F" >> "model");
// BIS_fnc_garage_centerType = getText (configFile >> "CfgVehicles" >> "B_SOG_tahoe_UNM_PMC_01" >> "model");

["Open", true] call BIS_fnc_garage;

[missionNamespace, "garageClosed", {
	_nearestObjects = BIS_fnc_garage_center nearEntities [["Car","Tank","Air","Ship"], 15];

	if (!isNil "_nearestObjects") then {
		_obj = _nearestObjects select 0;
		_veh = typeOf _obj;
		_textures = getObjectTextures _obj;
		_animationNames = animationNames _obj;
		{ deleteVehicle _x } forEach _nearestObjects;
		_createVehicle = createVehicle [_veh, SOG_VehSpawnPos, [], 0, "CAN_COLLIDE"];

		_createVehicle setVariable ["Garage", "garageWheeled", true]; // To be done setup correct category for selected vehicle type.

		if (count _textures > 0) then {
			_count = 0;
			{
				_createVehicle setObjectTextureGlobal [_count, _x];
				_count = _count + 1;
			} forEach _textures;
		};

		if (count _animationNames > 0) then {
			_animationPhase = [];

			for "_i" from 0 to count _animationNames -1 do {
				_animationPhase pushBack [_animationNames select _i, _obj animationPhase (_animationNames select _i)];
				{ _createVehicle animate _x; } forEach _animationPhase;
			};
		};
	};
}] call BIS_fnc_addScriptedEventHandler;