#include "script_component.hpp"

if (_this isEqualTo []) then {
	SOG_Garage_Unlocks = [[],[],[],[],[],[]];
} else {
	SOG_Garage_Unlocks = _this;
};

{
	[_x] call sog_client_armory_fnc_addVirtualVehs;
} forEach SOG_Garage_Unlocks;