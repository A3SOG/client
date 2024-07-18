#include "script_component.hpp"

_data = _this;
diag_log text format ["SOG_Client: 'sog_client_armory_fnc_loadArmoryUnlocks' Data '%1'", _data];

if (_data isEqualTo [""]) then {
	GVAR(arsenalUnlocks) = [[],[],[],[]];
} else {
	GVAR(arsenalUnlocks) = _data select 0;
};

if (SOG_Armory_Type == 0) then {
	{
		[SOG_Armory_Box, _x, false, true, 1, _forEachIndex] call BIS_fnc_addVirtualItemCargo;
	} foreach GVAR(arsenalUnlocks);
} else {
	{
		[SOG_Armory_Box, _x] call ace_arsenal_fnc_addVirtualItems;
	} foreach GVAR(arsenalUnlocks);
};