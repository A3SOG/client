#include "script_component.hpp"

/*
 * Author: Creedcoder, J. Schmidt
 * Registers an hostage task.
 *
 * Arguments:
 * 0: ID of the task <STRING>
 * 1: Amount of hostages KIA to fail the task <NUMBER>
 * 2: Amount of hostages rescued to complete the task <NUMBER>
 * 3: Marker name for the extraction zone <STRING>
 * 4: Subcategory of task <ARRAY> (default: [false, true])
 * 5: Should the mission end (MissionSuccess) if the task is successful <BOOL> (default: false)
 * 6: Should the mission end (MissionFailed) if the task is failed <BOOL> (default: false)
 * 7: Amount of funds the company recieves if the task is successful <NUMBER> (default: 0)
 * 8: Amount of rating the company and player lose if the task is failed <NUMBER> (default: 0)
 * 9: Amount of rating the company and player recieve if the task is successful <NUMBER> (default: 0)
 * 10: Amount of time before hostage(s) die <NUMBER> (default: nil)
 * 11: Marker name for the cbrn zone <STRING> (default: nil)
 *
 * Return Value:
 * None
 *
 * Example:
 * ["task_name", 1, 2, "marker_name", 1500000, -75, 500, [false, true], false, false] spawn sog_client_contract_fnc_hostage;
 * ["task_name", 1, 2, "marker_name", 1500000, -75, 500, [false, true], false, false, 45] spawn sog_client_contract_fnc_hostage;
 * ["task_name", 1, 2, "marker_name", 1500000, -75, 500, [true, false], false, false, 45, "marker_name"] spawn sog_client_contract_fnc_hostage;
 *
 * Public: Yes
 */

// Mission Parameters from Contract via Mission Handler
params [["_taskID", ""], ["_limitFail", -1], ["_limitSuccess", -1], ["_extZone", ""], ["_companyFunds", 0], ["_ratingFail", 0], ["_ratingSuccess", 0], ["_type", [["_cbrn", false], ["_hostage", true]]], ["_endSuccess", false], ["_endFail", false], "_time", ["_cbrnZone", ""]];

private _cbrn = (_this select 8) select 0;
private _hostage = (_this select 8) select 1;
private _nearPlayers = [];
private _result = 0;

// Get the hostages
private _hostages = sog_client_contract_allHostages select { (_x getVariable ["assignedTask", ""]) == _taskID };

// Get the shooters
private _shooters = sog_client_contract_allShooters select { (_x getVariable ["assignedTask", ""]) == _taskID };

// Mission Initialization.
if (!isNil "_time") then {
	// Mission Watchdog checks for example Timeout, killed Hostages, killed Shooters
	private _startTime = floor(time);
	waitUntil {
		sleep 1; // Use sleep on server side!

		// Check if hostages are killed
		private _hostagesAlive = ({ !alive _x } count _hostages);
		if (_hostagesAlive >= _limitFail) then { _result = 1; };

		// Check if hostages are in extraction zone
		private _hostagesInZone = ({ _x inArea _extZone } count _hostages);

		// Check if hostages are captive
		private _hostagesCaptive = ({ !captive _x } count _hostages);

		// Check if shooters are killed
		private _shootersAlive = ({ alive _x } count _shooters);

		// Timeout check
		private _currTime = floor(time);
		if ((_hostagesCaptive < _limitSuccess) && (_currTime - _startTime >= _time)) then { _result = 1; };

		// Trigger Conditions
		(_result == 1) OR (_hostagesInZone >= _limitSuccess) OR ((!isNil "_shooters") && (_shootersAlive <= 0))
	};
} else {
	// Mission Watchdog checks for example killed Hostages, killed Shooters
	waitUntil {
		sleep 1; // Use sleep on server side!

		// Check if hostages are killed
		private _hostagesAlive = ({ !alive _x } count _hostages);
		if (_hostagesAlive >= _limitFail) then { _result = 1; };

		// Check if hostages are in extraction zone
		private _hostagesInZone = ({ _x inArea _extZone } count _hostages);

		// Check if shooters are killed
		private _shootersAlive = ({ alive _x } count _shooters);

		// Trigger Conditions
		(_result == 1) OR (_hostagesInZone >= _limitSuccess) OR ((!isNil "_shooters") && (_shootersAlive <= 0))
	};
};

if (_result == 1) then {
	// Mission Failed

	// Do stuff after the Mission is failed
	// Like trigger next mission step via Mission Handler, punishment or so on

	// Check if contract is typeOf CBRN
	if (_cbrn) then {
		"SmokeShellYellow" createVehicle getMarkerPos _cbrnZone;

		sleep 5;

		{ 
			if (captive _x) then {
				_x setDamage 0.9;
				_x playMove "acts_executionvictim_kill_end";

				sleep 2.75;

				_x setDamage 1;
			}
		} forEach _hostages;
	};

	// Check if contract is typeOf Hostage(s)
	if (_hostage) then {
		{
			_x enableAIFeature ["MOVE", true];
			_x playMove "";
		} forEach _shooters;

		sleep 1;

		{ _x setCaptive false; } forEach _hostages;

		sleep 5;
	};

	// Clean-up Hostages and Shooters

	{ deleteVehicle _x } forEach _hostages;
	{ deleteVehicle _x } forEach _shooters;

	[_taskID, "FAILED"] call BIS_fnc_taskSetState;

	if (_endFail) then {
		["MissionFail", false, playerSide] remoteExecCall BIS_fnc_endMission;
	};

	["deduct", _ratingFail] remoteExecCall ["sog_server_rating_fnc_handleRating", 2];

	sleep 1;

	{ [_x, _ratingFail] remoteExec ["addRating", -2] } forEach allPlayers;
} else {
	// Mission Complete
	// Clean-up Hostages and Shooters

	{ deleteVehicle _x } forEach _hostages;
	{ deleteVehicle _x } forEach _shooters;

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