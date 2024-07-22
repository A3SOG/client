#include "script_component.hpp"

/*
 * Author: Creedcoder, J. Schmidt
 * Server side callout handler/spawner.
 * 
 * Arguments:
 * 0: Type of callout <STRING>
 * 1: Params for callout <ARRAY>
 * 2: Minimum rating for callout <NUMBER> (default: nil)
 * 
 * Return Value:
 * None
 *
 * Example:
 * ["callout_type", [_reward, _punish, _time, etc.....], minRating] remoteExec ["sog_client_callout_fnc_handler", 2, false];
 * [] remoteExec ["sog_client_callout_fnc_handler", 2, false];
 * 
 * Public: Yes
 */

// _calloutType = _this select 0;
// _coParams = _this select 1;
// _minRating = _this select 2;
private _thread = 0;

// Trigger before the callout starts or what ever you need
// For example block accepting new callouts, lock shops, player save and so on
acceptCallouts = false;
publicVariable "acceptCallouts";

private _callouts = [["dd", "Drug Deal"], ["rd", "Reckless Driver"], ["sa", "Suspicious Activity"], ["sf", "Shot(s) Fired"]];

private _index = floor (random (count _callouts));
private _callout = _callouts select _index;
private _calloutType = _callout select 0;
private _calloutName = _callout select 1;

allIDsToRemove = [];
private _removeActions = {
    private _unit = _this select 0;
    { _unit removeAction _x } forEach allIDsToRemove;
};

// Start the callout
switch (_calloutType) do {
	case "dd": {
		hint format ["You have a new callout: %1. Do you accept?", _calloutName];

		private _0 = player addAction ["Accept Callout", {
			_thread = [] spawn sog_client_callout_fnc_dd;
			_removeActions = _this select 3;
			[(_this select 1)] call _removeActions;
			waitUntil { sleep 2; scriptDone _thread };
		}, _removeActions];
		private _1 = player addAction ["Ignore Callout", {
			[(_this select 2)] call sog_client_callout_fnc_ignore;
			_removeActions = _this select 3;
		}, _removeActions];
		allIDsToRemove pushBack _0;
		allIDsToRemove pushBack _1;
	};
	case "rd": {
		hint format ["You have a new callout: %1. Do you accept?", _calloutName];

		private _0 = player addAction ["Accept Callout", {
			_thread = [] spawn sog_client_callout_fnc_rd;
			_removeActions = _this select 3;
			[(_this select 1)] call _removeActions;
			waitUntil { sleep 2; scriptDone _thread };
		}, _removeActions];
		private _1 = player addAction ["Ignore Callout", {
			[(_this select 2)] call sog_client_callout_fnc_ignore;
			_removeActions = _this select 3;
		}, _removeActions];
		allIDsToRemove pushBack _0;
		allIDsToRemove pushBack _1;
	};
	case "sa": {
		hint format ["You have a new callout: %1. Do you accept?", _calloutName];

		private _0 = player addAction ["Accept Callout", {
			_thread = [] spawn sog_client_callout_fnc_sa;
			_removeActions = _this select 3;
			[(_this select 1)] call _removeActions;
			waitUntil { sleep 2; scriptDone _thread };
		}, _removeActions];
		private _1 = player addAction ["Ignore Callout", {
			[(_this select 2)] call sog_client_callout_fnc_ignore;
			_removeActions = _this select 3;
		}, _removeActions];
		allIDsToRemove pushBack _0;
		allIDsToRemove pushBack _1;
	};
	case "sf": {
		hint format ["You have a new callout: %1. Do you accept?", _calloutName];

		private _0 = player addAction ["Accept Callout", {
			_thread = [] spawn sog_client_callout_fnc_sf;
			_removeActions = _this select 3;
			[(_this select 1)] call _removeActions;
			waitUntil { sleep 2; scriptDone _thread };
		}, _removeActions];
		private _1 = player addAction ["Ignore Callout", {
			[(_this select 2)] call sog_client_callout_fnc_ignore;
			_removeActions = _this select 3;
		}, _removeActions];
		allIDsToRemove pushBack _0;
		allIDsToRemove pushBack _1;
	};
	default {
        diag_log format ["Unknown Callout Type: %1", _calloutType];
    };
};

diag_log "Callout Handler Done";

// Do Stuff what you need to be done after the callout
// For example allow accepting new callouts, open shops and so on

acceptCallouts = true;
publicVariable "acceptCallouts";