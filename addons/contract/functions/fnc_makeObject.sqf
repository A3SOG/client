#include "script_component.hpp"

/*
 * Author: Creedcoder, J. Schmidt
 * Registers an item as an object.
 *
 * Arguments:
 * 0: The object <OBJECT>
 * 1: ID of the task <STRING>
 *
 * Return Value:
 * None
 *
 * Example:
 * [this, "task_name"] spawn sog_client_contract_fnc_makeObject;
 *
 * Public: Yes
 */

params [["_object", objNull], ["_taskID", ""]];

// Check if item is defined
// if (isNull _object) exitWith {
//     [COMPONENT_NAME, "ERROR", "Item is not found", true] call sog_server_main_fnc_log
// };

// Check if taskID is defined
// if (_taskID == "") exitWith {
//     [COMPONENT_NAME, "ERROR", "Task ID is empty", true] call sog_server_main_fnc_log
// };

// Assign object to taskID
// SETVAR(_object, GVAR(assignedTask), _taskID);
_object setVariable ["assignedTask", _taskID];

// Add object to object array
// private _index = GVAR(allObjs) pushBackUnique _object;
private _index = sog_client_contract_allObjects pushBackUnique _object;

// Log
// [COMPONENT_NAME, "DEBUG", format ["Item (%1) is registered as an object. Object array: %2", _object, str GVAR(allObjects)]] call sog_server_main_fnc_log;

// if (_index == -1) then {
//     [COMPONENT_NAME, "WARNING", format ["Item (%1) is already an object", _object], true] call sog_server_main_fnc_log;
// };