#include "script_component.hpp"

[] call sog_client_phone_fnc_initVar;

waitUntil { !isNull player && player == player };
waitUntil { !isNil "BIS_fnc_init" };
waitUntil { !(isNull (findDisplay 46)) };

[] call sog_client_phone_fnc_initAddAction;