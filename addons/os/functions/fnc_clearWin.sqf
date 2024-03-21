_winCtrl = _this select 0;
_ctrls = [_winCtrl] call sog_client_os_fnc_getWinFromCtrl;
{
    _controlType = [_x, "type"] call sog_client_os_fnc_getVarToCtrl;
    if (_controLType == "added") then {
        ctrlDelete _x;
    };
} forEach _ctrls;