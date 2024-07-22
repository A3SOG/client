#include "script_component.hpp"

_data = _this;
if (_data isEqualTo [""]) then {
	GVAR(garageUnlocks) = [[],[],[],[],[],[]];
} else {
	GVAR(garageUnlocks) = _data select 0;
};

{
	[_x] call sog_client_armory_fnc_addVirtualVehs;
} forEach GVAR(garageUnlocks);