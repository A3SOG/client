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

params [["_unit", objNull], ["_taskID", ""]];

private _nearPlayers = [];

// Check stuff
// if (isNull _unit) exitWith {[COMPONENT_NAME, "ERROR", "Unit is not found", true] call sog_server_main_fnc_log};
// if (_taskID == "") exitWith {[COMPONENT_NAME, "ERROR", "Task ID is empty", true] call sog_server_main_fnc_log};

// Register hostage
// SETVAR(_unit,GVAR(assignedTask),_taskID);
_unit setVariable ["assignedTask", _taskID];

// Add unit to hostage array
// private _index = GVAR(allHostages) pushBackUnique _unit;
private _index = sog_client_contract_allHostages pushBackUnique _unit;

// Log
// [COMPONENT_NAME, "DEBUG", format [
// 	"Unit (%1) is registered as a hostage. Hostage array: %2", _unit, str GVAR(allHostages)
// ]] call sog_server_main_fnc_log;

// if (_index == -1) then {
// 	[COMPONENT_NAME, "WARNING", format ["Unit (%1) is already a hostage", _unit], true] call sog_server_main_fnc_log;
// };

// Animation Loop
if (alive _unit) then {
	_unit setCaptive true;
	_unit enableAIFeature ["MOVE", false];
	_unit playMove "acts_executionvictim_loop";

	waitUntil {
		sleep 1;
		_nearPlayers = allPlayers inAreaArray [ASLtoAGL getPosASL _unit, 2, 2, 0, false, 2];
		count _nearPlayers > 0
	};

	private _nearPlayer = _nearPlayers select 0;

	[_unit] joinSilent (group _nearPlayer);

	_unit setCaptive false;
	_unit enableAIFeature ["MOVE", true];
	_unit playMove "acts_executionvictim_unbow";
};