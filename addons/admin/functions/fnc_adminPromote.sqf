#include "script_component.hpp"

params [["_condition", "", [""]]];

private _dialog = findDisplay 202303;
private _list = _dialog displayCtrl 2023001;
private _list2 = _dialog displayCtrl 2023003;
private _targetValue = lbCurSel _list;
private _rankValue = lbCurSel _list2;
private _data = _list lbData _targetValue;
private _data2 = call compile format ["%1", (_list2 lbData _rankValue)];

if ((isNil {_data})) exitWith { hintSilent "You did not select a player!" };
{
	if (str (name (_x)) == str _data) then {
		private _target = _x;
	};
} forEach playableUnits;

switch (_condition) do {
	case ("promote"): {
		_target setVariable ["PayGrade", (_data2 select 0), true];
	};
	case ("demote"): {
		_target setVariable ["PayGrade", (_data2 select 0), true];
	};
};

["dummy"] call sog_client_admin_fnc_adminRefresh;