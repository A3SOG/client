#include "script_component.hpp"

private ["_data", "_dialog", "_list", "_target", "_targetValue", "_textBox", "_textMessage"];

_dialog = findDisplay 202303;
_list = _dialog displayCtrl 2023001;
_textBox = _dialog displayCtrl 2023006;
_targetValue = lbCurSel _list;
_data = _list lbData _targetValue;

if ((isNil {_data})) exitWith { hintSilent "You did not select a player!" };

{
	if (str (name (_x)) == str _data) then {
		_target = _x;
	};
} count (playableUnits);

hintSilent format ["Operator Selected. You have selected %1", _target];

if (isNil "_target") then {
	hintSilent "Please Select an Active Operator First!"
} else {
	_textMessage = ctrlText _textBox;
	[_target, _textMessage] remoteExec ["sog_server_misc_fnc_textMessage", 2];
	
	hintSilent format ["You have messaged %1 with the following message: \n \n %2", _target, _textMessage];
};

["dummy"] call sog_client_admin_fnc_adminRefresh;