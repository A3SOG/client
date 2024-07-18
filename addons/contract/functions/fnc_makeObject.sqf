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

params [["_entity", nil, [objNull, 0, [], sideUnknown, grpnull, ""]], ["_taskID", "", [""]]];

// Check if item is defined
// if (isNull _entity) exitWith {
//     [COMPONENT_NAME, "ERROR", "Item is not found", true] call sog_server_main_fnc_log
// };

// Check if taskID is defined
// if (_taskID == "") exitWith {
//     [COMPONENT_NAME, "ERROR", "Task ID is empty", true] call sog_server_main_fnc_log
// };

// Assign object to taskID
// SETVAR(_entity, GVAR(assignedTask), _taskID);
_entity setVariable ["assignedTask", _taskID];

// Add object to object array
// private _index = GVAR(allEntities) pushBackUnique _entity;
private _index = sog_client_contract_allEntities pushBackUnique _entity;

// Log
// [COMPONENT_NAME, "DEBUG", format ["Item (%1) is registered as an object. Object array: %2", _entity, str GVAR(allEntities)]] call sog_server_main_fnc_log;

// if (_index == -1) then {
//     [COMPONENT_NAME, "WARNING", format ["Item (%1) is already an object", _entity], true] call sog_server_main_fnc_log;
// };