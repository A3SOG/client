#include "script_component.hpp"

if (_this isEqualTo [""]) exitwith {};

private _tmp = call compile format ["%1", _this];
if ((typeName _tmp) isEqualTo "SCALAR") exitWith {};

SOG_Phone_MSG = _this;

["You got a new message.", "green", 3] call sog_client_misc_fnc_notify;