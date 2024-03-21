#include "script_component.hpp"

_payMultiplyer = "MULTIPLYR" call BIS_fnc_getParamValue;

// _payMultiplyer = getNumber (missionConfigFile >> "Params" >> "MULTIPLYR");
_plyscore = rating player;
_multiplyer = _plyscore * _payMultiplyer;

_bank = player getVariable ["Cash_Bank", 0];

_newBank = _bank + _multiplyer;
player setVariable ["Cash_Bank", _newBank, true];

hintSilent format ["Payday! You were paid $%1.00 for services rendered. The money has been direct deposited to your account.", _multiplyer];
["InformationGreen", ["Payday!"]] call BIS_fnc_showNotification;

player addRating - _plyscore;

ctrlSetText [2023002, format ["Bank: $%1", (_newBank call sog_client_misc_fnc_formatNumber)]];
ctrlSetText [2023000, format ["Pending: $%1", (0 call sog_client_misc_fnc_formatNumber)]];

ctrlEnable [1602, true];