#include "script_component.hpp"

/*
 * Author: Creedcoder, J. Schmidt
 * Registers an IED and starts countdown timer.
 *
 * Arguments:
 * 0: The object <OBJECT>
 * 1: ID of the task <STRING>
 * 2: The Countdown Timer <NUMBER>
 *
 * Return Value:
 * None
 *
 * Example:
 * [this, "task_name", 30] spawn sog_client_contract_fnc_makeIED;
 *
 * Public: Yes
 */

params [["_ied", objNull], ["_taskID", ""], "_time"];

// Check if IED is defined
// if (isNull _ied) exitWith {
//     [COMPONENT_NAME, "ERROR", "IED is not found", true] call sog_server_main_fnc_log
// };

// Check if taskID is defined
// if (_taskID == "") exitWith {
//     [COMPONENT_NAME, "ERROR", "Task ID is empty", true] call sog_server_main_fnc_log
// };

// Assigns IED to taskID
// SETVAR(_ied, GVAR(assignedTask), _taskID);
_ied setVariable ["assignedTask", _taskID];

// Add IED to IED array
// private _index = GVAR(allIEDs) pushBackUnique _ied;
private _index = sog_client_contract_allIEDs pushBackUnique _ied;

// Log
// [COMPONENT_NAME, "DEBUG", format ["Object (%1) is registered as an IED. IED array: %2", _ied, str GVAR(allIEDs)]] call sog_server_main_fnc_log;

// if (_index == -1) then {
//     [COMPONENT_NAME, "WARNING", format ["Object (%1) is already an IED", _ied], true] call sog_server_main_fnc_log;
// };

// Countdown timer
while { (_time > 0) && alive _ied } do {
    _time = _time -1;
    sleep 1;

    // hintSilent parseText format ["<t size='2' color='#ff0000' shadow='2'>%1</t>", _time];

    if (!alive _ied) exitWith {};

    if (_time > 10) then { _ied say3D "SOG_timerBeep" };
    if (_time <= 10 && _time > 5) then { _ied say3D "SOG_timerBeepShort" };
    if (_time <= 5) then { _ied say3D "SOG_timerEnd" };
    if (_time <= 0) exitWith { _ied setDamage 1 };
};