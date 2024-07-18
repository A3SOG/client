#include "script_component.hpp"

/*
 * Author: Creedcoder, J. Schmidt
 * Registers an AI unit as a target.
 *
 * Arguments:
 * 0: The AI unit <OBJECT>
 * 1: ID of the task <STRING>
 *
 * Return Value:
 * None
 *
 * Example:
 * [this, "task_name"] spawn sog_client_contract_fnc_makeTarget;
 *
 * Public: Yes
 */

params [["_entity", nil, [objNull, 0, [], sideUnknown, grpnull, ""]], ["_taskID", "", [""]]];

// Check if unit is defined
// if (isNull _entity) exitWith {[COMPONENT_NAME, "ERROR", "Unit is not found", true] call sog_server_main_fnc_log};

// Check if taskID is defined
// if (_taskID == "") exitWith {[COMPONENT_NAME, "ERROR", "Task ID is empty", true] call sog_server_main_fnc_log};

// Assign unit to taskID
// SETVAR(_entity,GVAR(assignedTask),_taskID);
_entity setVariable ["assignedTask", _taskID];

// Add unit to target array
// private _index = GVAR(allTargets) pushBackUnique _entity;
private _index = sog_client_contract_allTargets pushBackUnique _entity;

// Log
// [COMPONENT_NAME, "DEBUG", format ["Unit (%1) is registered as a target. Target array: %2", _entity, str GVAR(allTargets)]] call sog_server_main_fnc_log;

// if (_index == -1) then {
//     [COMPONENT_NAME, "WARNING", format ["Unit (%1) is already a target", _entity], true] call sog_server_main_fnc_log;
// };