#include "script_component.hpp"

if (_this isEqualTo [""]) exitwith {};

private _tmp = call compile format ["%1", _this];
if ((typeName _tmp) isEqualTo "SCALAR") exitWith {};

SOG_Email = _this;

["You got an email while away.", "cyan", 3] call sog_client_misc_fnc_notify;