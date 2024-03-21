#include "script_component.hpp"

params ["_condition", "_amount"];
private ["_dialog", "_index", "_list", "_namestr", "_newFunds", "_newFunds"];

_newFunds = 0;
switch (_condition) do {
	case ("deduct"): {
		_newFunds = companyFunds - _amount;
		ctrlSetText [2023002, format ["$%1", (_newFunds call sog_client_misc_fnc_formatNumber)]];
	};
	case ("advance"): {
		_newFunds = companyFunds + _amount;
		ctrlSetText [2023002, format ["$%1", (_newFunds call sog_client_misc_fnc_formatNumber)]];
	};
	default {
		_dialog = findDisplay 202303;
		_list = _dialog displayCtrl 2023001;

		lbClear _list;

		{
			if (str (side _x) == str (playerSide)) then {
				_namestr = name (_x);
				_index = _list lbAdd format["%1 - %2", name (_x), _x getVariable ["PayGrade", "na"]];
				_list lbSetData [_index, name (_x)];
			};
		} count (playableUnits);

		lbSetCurSel [2023001, 0];
		ctrlSetText [2023005, ""];
		ctrlSetText [2023006, ""];
	};
};

_dialog = findDisplay 202303;
_list = _dialog displayCtrl 2023001;

lbClear _list;

{
	if (str (side _x) == str (playerSide)) then {
		_namestr = name (_x);
		_index = _list lbAdd format["%1 - %2", name (_x), _x getVariable ["PayGrade", "na"]];
		_list lbSetData [_index, name (_x)];
	};
} count (playableUnits);

lbSetCurSel [2023001, 0];
ctrlSetText [2023005, ""];
ctrlSetText [2023006, ""];