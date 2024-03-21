#include "script_component.hpp"

/*
 * Author: Creedcoder, J. Schmidt
 * Registers an hvt task.
 *
 * Arguments:
 * 0: ID of the task <STRING>
 * 1: Amount of HVTs KIA to fail the task <NUMBER>
 * 2: Amount of HVTs Captured or KIA to complete the task <NUMBER>
 * 3: Marker name for the extraction zone <STRING>
 * 4: Subcategory of task <ARRAY> (default: [true, false])
 * 5: Should the mission end (MissionSuccess) if the task is successful <BOOL> (default: false)
 * 6: Should the mission end (MissionFailed) if the task is failed <BOOL> (default: false)
 * 7: Amount of funds the company recieves if the task is successful <NUMBER> (default: 0)
 * 8: Amount of rating the company and player lose if the task is failed <NUMBER> (default: 0)
 * 9: Amount of rating the company and player recieve if the task is successful <NUMBER> (default: 0)
 * 10: Amount of time before hvt(s) die <NUMBER> (default: nil)
 *
 * Return Value:
 * None
 *
 * Example:
 * ["task_name", 1, 1, "marker_name", 500000, -75, 300, [true, false], false, false] spawn sog_client_contract_fnc_hvt;
 * ["task_name", -1, 1, "", 500000, -75, 300, [false, true], false, false] spawn sog_client_contract_fnc_hvt;
 * ["task_name", 1, 1, "marker_name", 500000, -75, 300, [true, false], false, false, 45] spawn sog_client_contract_fnc_hvt;
 * ["task_name", -1, 1, "", 500000, -75, 300, [false, true], false, false, 45] spawn sog_client_contract_fnc_hvt;
 *
 * Public: Yes
 */

// Mission Parameters from Contract via Mission Handler
params [["_taskID", ""], ["_limitFail", -1], ["_limitSuccess", -1], ["_extZone", ""], ["_companyFunds", 0], ["_ratingFail", 0], ["_ratingSuccess", 0], ["_type", [["_capture", true], ["_eliminate", false]]], ["_endSuccess", false], ["_endFail", false], "_time"];

private _capture = (_this select 7) select 0;
private _eliminate = (_this select 7) select 1;
private _nearPlayers = [];
private _result = 0;
private _hvts = sog_client_contract_allHVTs select { (_x getVariable ["assignedTask", ""]) == _taskID };

// Mission Initialization.
if (!isNil "_time") then {
	// Mission Watchdog checks for example Timeout, Captured/Killed HVTs
	_startTime = floor(time);
	waitUntil {
		sleep 1; // Use sleep on server side!

		// Check if hvts are killed
		_hvtsAlive = ({ !alive _x } count _hvts);
		if (_capture && (_hvtsAlive >= _limitFail)) then { _result = 1; };

		// Check if hvts are in extraction zone
		_hvtsInZone = ({ _x inArea _extZone } count _hvts);

		// Check if hvts are captive
		_hvtsCaptive = ({ captive _x } count _hvts);

		// Timeout check
		_currTime = floor(time);
		if ((_hvtsCaptive < _limitSuccess) && (_currTime - _startTime >= _time)) then { _result = 1; };

		// Trigger Conditions
		(_result == 1) OR (_hvtsInZone >= _limitSuccess) OR (_hvtsAlive >= _limitSuccess)
	};
} else {
	// Mission Watchdog checks for example Captured/Killed HVTs
	waitUntil {
		sleep 1; // Use sleep on server side!

		// Check if hvts are killed
		_hvtsAlive = ({ !alive _x } count _hvts);
		if (_capture && (_hvtsAlive >= _limitFail)) then { _result = 1; };

		// Check if hvts are in extraction zone
		_hvtsInZone = ({ _x inArea _extZone } count _hvts);

		// Check if hvts are captive
		_hvtsCaptive = ({ captive _x } count _hvts);

		// Trigger Conditions
		(_result == 1) OR (_hvtsInZone >= _limitSuccess) OR (_hvtsAlive >= _limitSuccess)
	};
};

if (_result == 1) then {
	// Mission Failed
	// Clean-up HVTs
	{ deleteVehicle _x } forEach _hvts;

	// Do stuff after the Mission is failed
	// Like trigger next mission step via Mission Handler, punishment or so on

	[_taskID, "FAILED"] call BIS_fnc_taskSetState;

	if (_endFail) then {
		["MissionFail", false, playerSide] remoteExecCall BIS_fnc_endMission;
	};

	["deduct", _ratingFail] remoteExecCall ["sog_server_rating_fnc_handleRating", 2];

	sleep 1;

	{ [_x, _ratingFail] remoteExec ["addRating", -2] } forEach allPlayers;
} else {
	// Mission Complete
	// Clean-up HVTs

	{ deleteVehicle _x } forEach _hvts;

	// Do stuff after the Mission is completed
	// Like trigger next mission step via Mission Handler, rewards or so on

	[_taskID, "SUCCEEDED"] call BIS_fnc_taskSetState;

	if (_endSuccess) then {
		["MissionSuccess", true, playerSide] remoteExecCall BIS_fnc_endMission;
	};

	["advance", _ratingSuccess] remoteExecCall ["sog_server_rating_fnc_handleRating", 2];

	sleep 1;

	{ [_x, _ratingSuccess] remoteExec ["addRating", -2] } forEach allPlayers;

	["advance", _companyFunds] remoteExecCall ["sog_server_money_fnc_handleFunds", 2];
};

// Reset Mission Spot
// Like delete Markers or other stuff for example Logging