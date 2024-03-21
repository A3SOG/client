#include "script_component.hpp"

private ["_dialog", "_index", "_list", "_list2", "_namestr", "_payGrades"];

disableSerialization;
createDialog "RscAdmin";

_dialog = findDisplay 202303;
_list = _dialog displayCtrl 2023001;
_list2 = _dialog displayCtrl 2023003;

{
	if (str (side _x) == str (playerSide)) then {
		_namestr = name (_x);
		_index = _list lbAdd format["%1 - %2", name (_x), _x getVariable ["PayGrade", "na"]];
		_list lbSetData [_index, name (_x)];
	};
} count (allPlayers);

lbSetCurSel [2023001, 0];

_payGrades = (missionConfigFile >> "SOG_CfgPaygrades" >> "payGrades") call BIS_fnc_getCfgData;

{
	_index = _list2 lbAdd format ["%1 - $%2", (_x select 0), ((_x select 1) call sog_client_misc_fnc_formatNumber)];
	_list2 lbSetData [_index, str _x];
} forEach _payGrades;

lbSetCurSel [2023003, 0];
ctrlSetText [2023002, format ["$%1", (companyFunds call sog_client_misc_fnc_formatNumber)]];