private _removeActions = {
    _unit = _this;
    { _unit removeAction _x } forEach allIDsToRemove;
};
player call _removeActions;

sleep 0.1;

[] remoteExec ["sog_client_callout_fnc_handler", 2, false];