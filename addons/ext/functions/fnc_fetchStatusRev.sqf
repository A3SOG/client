/*
Handles player status update event

Parameters:
_this select 0 - Event name <STRING>
_this select 1 - Player UID <STRING>
_this select 2 - New player status <STRING>

Returns:
None
*/

params [["_event", ""], ["_uid", ""], ["_status", ""]];

// Validate params
if (isNil "_uid") exitWith {
   ["No UID provided"] call BIS_fnc_log;
};

if (isNil "_status") exitWith {
   ["No status provided"] call BIS_fnc_log;
};

["Received status update event: %1", _this] call BIS_fnc_logFormat;

private _success = false;

// Validate status
if !(_status isEqualType "") exitWith {
   ["Invalid status"] call BIS_fnc_log;
};

SOG_tempDb = []; // Initialize empty database
private _statusUpdateSuccess = [SOG_tempDb, ["players", _uid, "status"], _status] call BIS_fnc_dbValueSet;

if !(_statusUpdateSuccess) then {
   ["Failed to update status for UID %1", _uid] call BIS_fnc_logFormat;
} else {
   _success = true;
   missionNamespace setVariable ["SOG_tempDb", SOG_tempDb, true];
   ["Updated status to %1 for UID %2", _status, _uid] call BIS_fnc_logFormat;
};