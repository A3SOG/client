#include "script_component.hpp"

params ["_class", "_type"];

private _index = (SOG_Garage_Unlocks select _type) pushBackUnique _class;

if (_index > - 1) then {
	[[_class]] call sog_client_armory_fnc_addVirtualVehs;
};