#include "script_component.hpp"

/*
 * Author: Creedcoder, J. Schmidt
 * Registers an attack task.
 *
 * Arguments:
 * 0: ID of the task <STRING>
 * 1: Amount of targets escaped to fail the task <NUMBER>
 * 2: Amount of targets eliminated to complete the task <NUMBER>
 * 3: Should the mission end (MissionSuccess) if the task is successful <BOOL> (default: false)
 * 4: Should the mission end (MissionFailed) if the task is failed <BOOL> (default: false)
 * 5: Amount of funds the company recieves if the task is successful <NUMBER> (default: 0)
 * 6: Amount of rating the company and player lose if the task is failed <NUMBER> (default: 0)
 * 7: Amount of rating the company and player recieve if the task is successful <NUMBER> (default: 0)
 * 8: Amount of time before target(s) escape <NUMBER> (default: nil)
 *
 * Return Value:
 * None
 *
 * Example:
 * ["task_name", 1, 2, 1500000, -75, 375, false, false] spawn sog_client_contract_fnc_attack;
 * ["task_name", 1, 2, 1500000, -75, 375, false, false, 45] spawn sog_client_contract_fnc_attack;
 *
 * Public: Yes
 */

// Mission Parameters from Contract via Mission Handler
params [["_taskID", ""], ["_limitFail", -1], ["_limitSuccess", -1], ["_companyFunds", 0], ["_ratingFail", 0], ["_ratingSuccess", 0], ["_endSuccess", false], ["_endFail", false], "_time"];

private _result = 0;

private _targets = sog_client_contract_allTargets select { (_x getVariable ["assignedTask", ""]) == _taskID };

// Mission Initialization.
if (!isNil "_time") then {
	// Mission Watchdog checks for example Timeout, killed Targets
	private _startTime = floor(time);
	waitUntil {
		sleep 1; // Use sleep on server side!

		// Timeout check
		private _currTime = floor(time);
		if (_currTime - _startTime >= _time) then { _result = 1; };

		// Check if targets are killed
		private _targetsAlive = ({ !alive _x } count _targets);

		// Trigger Conditions
		(_result == 1) OR (_targetsAlive >= _limitSuccess)
	};
} else {
	// Mission Watchdog checks for example Killed targets
	waitUntil {
		sleep 1; // Use sleep on server side!

		// Check if targets are killed
		private _targetsAlive = ({ !alive _x } count _targets);

		// Trigger Conditions
		(_targetsAlive >= _limitSuccess)
	};
};

if (_result == 1) then {
	// Mission Failed
	// Clean-up Targets

	{ deleteVehicle _x } forEach _targets;

	// Do stuff after the Mission is failed
	// Like trigger next mission step via Mission Handler, punishment or so on

	[_taskID, "FAILED"] call BIS_fnc_taskSetState;

	if (_endFail) then {
		["MissionFail", false, playerSide] remoteExecCall ["BIS_fnc_endMission"];
	};

	["deduct", _ratingFail] remoteExecCall ["sog_server_rating_fnc_handleRating", 2];

	sleep 1;

	{ [_x, _ratingFail] remoteExec ["addRating", -2] } forEach allPlayers;
} else {
	// Mission Complete
	// Clean-up Targets

	{ deleteVehicle _x } forEach _targets;

	// Do stuff after the Mission is completed
	// Like trigger next mission step via Mission Handler, rewards or so on

	[_taskID, "SUCCEEDED"] call BIS_fnc_taskSetState;

	if (_endSuccess) then {
		["MissionSuccess", true, playerSide] remoteExecCall ["BIS_fnc_endMission"];
	};

	["advance", _ratingSuccess] remoteExecCall ["sog_server_rating_fnc_handleRating", 2];

	sleep 1;

	{ [_x, _ratingSuccess] remoteExec ["addRating", -2] } forEach allPlayers;

	["advance", _companyFunds] remoteExecCall ["sog_server_money_fnc_handleFunds", 2];
};

// Reset Mission Spot
// Like delete Markers or other stuff for example Logging