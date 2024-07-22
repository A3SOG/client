#include "script_component.hpp"

/*
 * Author: Creedcoder, J. Schmidt
 * Registers Entity and starts heartbeat.
 *
 * Arguments:
 * 0: The entity <OBJECT>
 * 1: Type of the entity <STRING>
 * 2: The countdown timer <NUMBER>
 *
 * Return Value:
 * None
 *
 * Example:
 * [_entity, "entity_type", 30] spawn sog_client_contract_fnc_heartBeat;
 *
 * Public: Yes
 */

params [["_entity", nil, [objNull, 0, [], sideUnknown, grpnull, ""]], ["_typeOf", "", [""]], ["_time", 0, [0]]];

switch (_typeOf) do {
    case "hostage": {
		_entity setCaptive true;
		_entity enableAIFeature ["MOVE", false];
		_entity playMove "acts_executionvictim_loop";

		waitUntil {
			sleep 1;
			private _nearPlayers = allPlayers inAreaArray [ASLtoAGL getPosASL _entity, 2, 2, 0, false, 2];
			count _nearPlayers > 0
		};

		private _nearPlayer = _nearPlayers select 0;

		[_entity] joinSilent (group _nearPlayer);

		_entity setCaptive false;
		_entity enableAIFeature ["MOVE", true];
		_entity playMove "acts_executionvictim_unbow";
    };
    case "hvt": {
        waitUntil {
			sleep 1;
			private _nearPlayers = allPlayers inAreaArray [ASLtoAGL getPosASL _entity, 2, 2, 0, false, 2];
			count _nearPlayers > 0
		};

		_entity setCaptive true;
		doStop _entity;
    };
    case "ied": {
        _time = _time -1;
        sleep 1;

        // hintSilent parseText format ["<t size='2' color='#ff0000' shadow='2'>%1</t>", _time];

        if (!alive _entity) exitWith {};

        if (_time > 10) then { _entity say3D "SOG_timerBeep" };
        if (_time <= 10 && _time > 5) then { _entity say3D "SOG_timerBeepShort" };
        if (_time <= 5) then { _entity say3D "SOG_timerEnd" };
        if (_time <= 0) exitWith { _entity setDamage 1 };
    };
};