#include "script_component.hpp"

private _dialog = findDisplay 202303;
private _list = _dialog displayCtrl 2023001;
private _textBox = _dialog displayCtrl 2023006;
private _targetValue = lbCurSel _list;
private _data = _list lbData _targetValue;

if ((isNil {_data})) exitWith { hintSilent "You did not select a player!" };

{
	if (str (name (_x)) == str _data) then {
		private _target = _x;
	};
} count (playableUnits);

hintSilent format ["Player Selected. You have selected %1", _target];

if (isNil "_target") then {
	hintSilent "Please Select an Active Player First!"
} else {
	private _textMessage = ctrlText _textBox;
	[_target, _textMessage] remoteExec ["sog_server_misc_fnc_textMessage", 2];
	
	hintSilent format ["You have messaged %1 with the following message: \n \n %2", _target, _textMessage];
};

["dummy"] call sog_client_admin_fnc_adminRefresh;