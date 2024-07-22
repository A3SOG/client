#include "script_component.hpp"

/*
 * Function: sog_client_init_handlePlayerLoad
 * Author: Creedcoder, J.Schmidt
 * Edit: 07.15.2024
 * Copyright © 2024 Creedcoder, J.Schmidt, All rights reserved
 *
 * Do not edit without permission!
 *
 * This work is licensed under the Creative Commons Attribution-NonCommercial-NoDerivative 4.0 International License.
 * To view a copy of this license, vist https://creativecommons.org/licenses/by-nc-nd/4.0/ or send a letter to Creative Commons,
 * PO Box 1866, Mountain View, CA 94042
 *
 * [Description]
 * Handle player load from DB.
 *
 * Arguments:
 * 0: Data from key [<ARRAY|STRING|NUMBER|BOOL>] (default: [])
 *
 * Return Value:
 * N/A
 *
 * Examples:
 * [[_data]] call sog_client_init_handlePlayerLoad (Server or Singleplayer Only)
 * [[_data]] remoteExecCall ["sog_client_init_handlePlayerLoad", 2, false] (Multiplayer Only)
 *
 * Public: Yes
 */

private _data = _this;

if (_data isEqualTo [""]) then {
    2 cutText ["No Save Found!", "PLAIN DOWN", 1];
    [player] spawn sog_client_player_fnc_firstLogin;
} else {
    [format ["Welcome back %1. Your persistent locker, bank, cash and profile have been loaded.", name player, 5], "blue-grey"] call sog_client_misc_fnc_notify;

    for "_i" from 0 to (count _data - 1) step 2 do {
        private _key = _data select _i;
        private _value = _data select (_i + 1);

        if (_value isEqualType []) then {
            _value = _value select 0;
        };

        switch (_key) do {
            case "reputation": {
                player setVariable ["Reputation", _value];
                player addRating _value;
            };
            case "loadout": {
                player setVariable ["Loadout", _value];
                player setUnitLoadout _value;
            };
            case "direction": {
                player setVariable ["Direction", _value];
                player setDir _value;
            };
            case "cash": {
                player setVariable ["Cash", _value];
            };
            case "bank": {
                player setVariable ["Cash_Bank", _value];
            };
            case "armory_unlocks": {
                sog_client_armory_arsenalUnlocks = _value;
            };
            case "garage_unlocks": {
                sog_client_armory_garageUnlocks = _value;
            };
            case "locker": {
                player setVariable ["Locker", _value];
            };
            case "garage": {
                player setVariable ["Garage", _value];
            };
            case "email": {
                player setVariable ["SOG_Email", _value];
            };
            case "number": {
                player setVariable ["SOG_Phone_Number", _value];
            };
            case "paygrade": {
                player setVariable ["Paygrade", _value];
            };
            case "stance": {
                player setVariable ["Stance", _value];
                player playAction _value;
            };
            case "holster": {
                player setVariable ["SOG_HolsterWeapon", _value];
                if (_value) then {
                    [player] call ace_weaponselect_fnc_putWeaponAway;
                };
            };
            case "position": {
                player setVariable ["Position", _value];
                player setPosASL _value;

                private _pAlt = ((getPosATLVisual player) select 2);
                private _pVelZ = ((velocity player) select 2);
                if (_pAlt > 5 && _pVelZ < 0) then {
                    player setVelocity [0, 0, 0];
                    player setPosATL [((getPosATLVisual player) select 0), ((getPosATLVisual player) select 1), 1];
                    hint "You logged off mid air. You were moved to a safe position on the ground.";
                };
            };
        };
    };

    if (needReload player == 1) then { reload player };
    player setVariable ["value_loadDone", true];

    // [player getVariable ["SOG_Email", "unknown@spearnet.mil"], player, "sog_client_phone_fnc_addOfflineEmail", true] remoteExec ["db_fnc_listload", 2, false];
    // ["listrng", player getVariable ["SOG_Email", "unknown@spearnet.mil"], "", -1, [], "sog_client_phone_fnc_addOfflineEmail", "null", true] spawn dragonfly_db_fnc_addTask;
    ["listrng", player getVariable ["SOG_Email", "unknown@spearnet.mil"], "", -1, [], "sog_client_phone_fnc_addOfflineEmail", netId player, true] remoteExec ["dragonfly_db_fnc_addTask", 2, false];

    // [player getVariable ["SOG_Phone_Number", "unknown"], player, "sog_client_phone_fnc_addOfflineMsg", true] remoteExec ["db_fnc_listload", 2, false];
    // ["listrng", player getVariable ["SOG_Phone_Number", "unknown"], "", -1, [], "sog_client_phone_fnc_addOfflineMsg", "null", true] spawn dragonfly_db_fnc_addTask;
    ["listrng", player getVariable ["SOG_Phone_Number", "unknown"], "", -1, [], "sog_client_phone_fnc_addOfflineMsg", netId player, true] remoteExec ["dragonfly_db_fnc_addTask", 2, false];
};