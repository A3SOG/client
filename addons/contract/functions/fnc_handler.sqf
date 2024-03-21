#include "script_component.hpp"

/*
 * Author: Creedcoder, J. Schmidt
 * Server side contract handler/spawner.
 * 
 * Arguments:
 * 0: Type of contract <STRING>
 * 1: Params for contract <ARRAY>
 * 2: Minimum rating for contract <NUMBER> (default: nil)
 * 
 * Return Value:
 * None
 *
 * Example:
 * ["contract_type", [_reward, _punish, _time, etc.....], minRating] remoteExec ["sog_client_contract_fnc_handler", 2, false];
 * 
 * Public: Yes
 */

_cntType = _this select 0;
_cntParams = _this select 1;
_minRating = _this select 2;
_thread = 0;

// Trigger before the contract starts or what ever you need
// For example block accepting new contracts, lock shops, player save and so on

acceptContract = false;
publicVariable "acceptContract";

if (isNil "companyRating") then { companyRating = 0; };
if (isNil "_minRating") then { _minRating = 0; };

_companyRating = companyRating;
if (_companyRating < _minRating) exitWith {
	hint format ["The company rating of %1 does not meet or exceed the minimum required rating of %2.", _companyRating, _minRating];
};

// Start the contract
switch (_cntType) do {
	case "attack": {
		private _thread = _cntParams spawn sog_client_contract_fnc_attack;
		waitUntil { sleep 2; scriptDone _thread };
	};
	case "defuse": {
		private _thread = _cntParams spawn sog_client_contract_fnc_defuse;
		waitUntil { sleep 2; scriptDone _thread };
	};
	case "destroy": {
		private _thread = _cntParams spawn sog_client_contract_fnc_destroy;
		waitUntil { sleep 2; scriptDone _thread };
	};
	case "hostage": {
		private _thread = _cntParams spawn sog_client_contract_fnc_hostage;
		waitUntil { sleep 2; scriptDone _thread };
	};
	case "hvt": {
		private _thread = _cntParams spawn sog_client_contract_fnc_hvt;
		waitUntil { sleep 2; scriptDone _thread };
	};
	default {
        diag_log format ["Unknown Contract Type: %1", _cntType];
    };
};

diag_log "Mision Handler Done";

// Do Stuff what you need to be done after the contract
// For example allow accepting new contracts, open shops and so on

acceptContract = true;
publicVariable "acceptContract";