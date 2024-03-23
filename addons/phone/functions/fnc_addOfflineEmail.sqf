#include "script_component.hpp"

if (count _this == 0) exitwith {};

SOG_Email = _this;
// hint "You got a new email while you were away";
["You got a new email.", "cyan", 3] call sog_client_misc_fnc_notify;