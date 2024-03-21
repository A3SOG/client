#include "script_component.hpp"

/*
 * Author: Creedcoder, J. Schmidt
 * Registers an AI unit as a hvt.
 *
 * Arguments:
 * 0: The AI unit <OBJECT>
 * 1: ID of the task <STRING>
 *
 * Return Value:
 * None
 *
 * Example:
 * [this, "task_name"] spawn sog_client_contract_fnc_makeHVT;
 *
 * Public: Yes
 */

params [["_unit", objNull], ["_taskID", ""]];

// Check stuff
// if (isNull _unit) exitWith {[COMPONENT_NAME, "ERROR", "Unit is not found", true] call sog_server_main_fnc_log};
// if (_taskID == "") exitWith {[COMPONENT_NAME, "ERROR", "Task ID is empty", true] call sog_server_main_fnc_log};

// Register hvt
// SETVAR(_unit,GVAR(assignedTask),_taskID);
_unit setVariable ["assignedTask", _taskID];

// Add unit to hvt array
// private _index = GVAR(allHVTs) pushBackUnique _unit;
private _index = sog_client_contract_allHVTs pushBackUnique _unit;

if (alive _unit) then {

	waitUntil {
		sleep 1;
		_nearPlayers = allPlayers inAreaArray [ASLtoAGL getPosASL _unit, 2, 2, 0, false, 2];
		count _nearPlayers > 0
	};

	_unit setCaptive true;
	doStop _unit;
};

// Log
// [COMPONENT_NAME, "DEBUG", format [
// 	"Unit (%1) is registered as a hvt. HVT array: %2", _unit, str GVAR(allHVTs)
// ]] call sog_server_main_fnc_log;

// if (_index == -1) then {
// 	[COMPONENT_NAME, "WARNING", format ["Unit (%1) is already a hvt", _unit], true] call sog_server_main_fnc_log;
// };