#include "script_component.hpp"

private ["_bank", "_cash"];

disableSerialization;
createDialog "RscBank";

_bank = player getVariable ["Cash_Bank", 0];
_cash = player getVariable ["Cash", 0];

_payMultiplyer = "MULTIPLYR" call BIS_fnc_getParamValue;

// _payMultiplyer = getNumber (missionConfigFile >> "Params" >> "MULTIPLYR" >> "default");
_plyscore = rating player;
_pending = _plyscore * _payMultiplyer;

ctrlSetText [2023000, format ["Pending: $%1", (_pending call sog_client_misc_fnc_formatNumber)]];
ctrlSetText [2023001, format ["Account: %1", name player]];
ctrlSetText [2023002, format ["Bank: $%1", (_bank call sog_client_misc_fnc_formatNumber)]];
ctrlSetText [2023003, format ["Cash: $%1", (_cash call sog_client_misc_fnc_formatNumber)]];