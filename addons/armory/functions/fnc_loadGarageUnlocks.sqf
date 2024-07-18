#include "script_component.hpp"

_data = _this;
diag_log text format ["SOG_Client: 'sog_client_armory_fnc_loadGarageUnlocks' Data '%1'", _data];

if (_data isEqualTo [""]) then {
	GVAR(garageUnlocks) = [[],[],[],[],[],[]];
} else {
	GVAR(garageUnlocks) = _data select 0;
};

{
	[_x] call sog_client_armory_fnc_addVirtualVehs;
} forEach GVAR(garageUnlocks);