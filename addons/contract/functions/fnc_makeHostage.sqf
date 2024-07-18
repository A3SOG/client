#include "script_component.hpp"

/*
 * Author: Creedcoder, J. Schmidt
 * Registers an AI unit as a hostage/POW.
 *
 * Arguments:
 * 0: The AI unit <OBJECT>
 * 1: ID of the task <STRING>
 *
 * Return Value:
 * None
 *
 * Example:
 * [this, "task_name"] spawn sog_client_contract_fnc_makeHostage;
 *
 * Public: Yes
 */

params [["_entity", nil, [objNull, 0, [], sideUnknown, grpnull, ""]], ["_taskID", "", [""]]];

private _nearPlayers = [];

// Check stuff
// if (isNull _entity) exitWith {[COMPONENT_NAME, "ERROR", "Unit is not found", true] call sog_server_main_fnc_log};
// if (_taskID == "") exitWith {[COMPONENT_NAME, "ERROR", "Task ID is empty", true] call sog_server_main_fnc_log};

// Register hostage
// SETVAR(_entity,GVAR(assignedTask),_taskID);
_entity setVariable ["assignedTask", _taskID];

// Add unit to hostage array
// private _index = GVAR(allHostages) pushBackUnique _entity;
private _index = sog_client_contract_allHostages pushBackUnique _entity;

// Log
// [COMPONENT_NAME, "DEBUG", format [
// 	"Unit (%1) is registered as a hostage. Hostage array: %2", _entity, str GVAR(allHostages)
// ]] call sog_server_main_fnc_log;

// if (_index == -1) then {
// 	[COMPONENT_NAME, "WARNING", format ["Unit (%1) is already a hostage", _entity], true] call sog_server_main_fnc_log;
// };

// Animation Loop
if (alive _entity) then {
	[_entity, "hostage"] spawn sog_client_contract_fnc_heartBeat;
};