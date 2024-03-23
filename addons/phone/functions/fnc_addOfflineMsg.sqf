#include "script_component.hpp"

if (count _this == 0) exitwith {};

SOG_Phone_MSG = _this;
// hint "You got a new message while you were away";
["You got a new message.", "green", 3] call sog_client_misc_fnc_notify;