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

params [["_entity", nil, [objNull, 0, [], sideUnknown, grpnull, ""]], ["_taskID", "", [""]], ["_time", 0, [0]]];

// Check if IED is defined
// if (isNull _entity) exitWith {
//     [COMPONENT_NAME, "ERROR", "IED is not found", true] call sog_server_main_fnc_log
// };

// Check if taskID is defined
// if (_taskID == "") exitWith {
//     [COMPONENT_NAME, "ERROR", "Task ID is empty", true] call sog_server_main_fnc_log
// };

// Assigns IED to taskID
// SETVAR(_entity, GVAR(assignedTask), _taskID);
_entity setVariable ["assignedTask", _taskID];

// Add IED to IED array
// private _index = GVAR(allIEDs) pushBackUnique _entity;
private _index = sog_client_contract_allIEDs pushBackUnique _entity;

// Log
// [COMPONENT_NAME, "DEBUG", format ["Object (%1) is registered as an IED. IED array: %2", _entity, str GVAR(allIEDs)]] call sog_server_main_fnc_log;

// if (_index == -1) then {
//     [COMPONENT_NAME, "WARNING", format ["Object (%1) is already an IED", _entity], true] call sog_server_main_fnc_log;
// };

// Countdown timer
while { (_time > 0) && alive _entity } do {
    [_entity, "ied", _time] spawn sog_client_contract_fnc_heartBeat;
};