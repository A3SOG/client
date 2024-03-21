#include "script_component.hpp"

params ["_condition"];
private ["_amount", "_cash", "_count", "_data", "_dialog", "_list", "_target", "_targetValue"];

_dialog = findDisplay 202303;
_list = _dialog displayCtrl 2023001;
_targetValue = lbCurSel _list;
_data = _list lbData _targetValue;
_amount = round (parseNumber (ctrlText 2023005));

if ((isNil {_data})) exitWith { hint "You did not select a player!" };

{
	if (str (name (_x)) == str _data) then {
		_target = _x;
	};
} count (playableUnits);

switch (_condition) do {
  case ("advance"): {
    _cash = _target getVariable ["Cash_Bank", 0];

    if (_amount > companyFunds) exitWith { hintSilent "Not enough money in the company bank!" };

    _target setVariable ["Cash_Bank", _cash + _amount, true];

    ["deduct", _amount] call sog_client_admin_fnc_adminRefresh;
    ["deduct", _amount] remoteExecCall ["sog_server_money_fnc_handleFunds", 2];
  };
  case ("advanceAll"): {
    _count = count (playableUnits);

    if ((10000 * _count) > companyFunds) exitWith { hintSilent "Not enough money in the company bank!" };

    {
      _x setVariable ["Cash_Bank", (_x getVariable ["Cash_Bank", 0]) + 10000, true];
    } count (playableUnits);

    ["deduct", (10000 * _count)] call sog_client_admin_fnc_adminRefresh;
    ["deduct", (10000 * _count)] remoteExecCall ["sog_server_money_fnc_handleFunds", 2];
  };
  case ("deduct"): {
    _cash = _target getVariable ["Cash_Bank", 0];

    if (_amount > _cash) exitWith { hintSilent "Not enough money in the player's bank!" };

    _target setVariable ["Cash_Bank", _cash - _amount, true];

    ["advance", _amount] call sog_client_admin_fnc_adminRefresh;
    ["advance", _amount] remoteExecCall ["sog_server_money_fnc_handleFunds", 2];
  };
  case ("payday"): {
    private ["_totalPayment", "_paymentToDo", "_payGrades", "_player", "_payGrade", "_payGradeIndex", "_payGradeBonus", "_bonus"];

    _totalPayment = 0;
    _paymentToDo = [];
    _payGrades = (missionConfigFile >> "SOG_CfgPaygrades" >> "payGrades") call BIS_fnc_getCfgData;
    // _payGrades = (configFile >> "sog_client_admin" >> "payGrades") call BIS_fnc_getCfgData;

    {
      _player = _x;
      _payGrade = _player getVariable ["PayGrade", "na"];

      {
        _x params ["_payGradeIndex", "_payGradeBonus"];

        if ((_x select 0) == _payGrade) then {
          _paymentToDo pushBack [_player, _payGradeBonus];
          _totalPayment = _totalPayment + _payGradeBonus;
        }
      } forEach _payGrades;
    } count (playableUnits);

    if (_totalPayment > companyFunds) exitWith { hintSilent "Not enough money in the company bank!" };

    {
      _x params ["_player", "_bonus"];
      _player setVariable ["Cash_Bank", (_player getVariable ["Cash_Bank", 0]) + _bonus, true];
    } count _paymentToDo;

    ["deduct", _totalPayment] call sog_client_admin_fnc_adminRefresh;
    ["deduct", _totalPayment] remoteExecCall ["sog_server_money_fnc_handleFunds", 2];
  };
};

ctrlSetText [2023005, ""];