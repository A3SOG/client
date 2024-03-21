_ctrl = _this select 0;
_toAddCtrl = _this select 1;
_allCtrls = missionNamespace getVariable str(_ctrl);
_allCtrls = _allCtrls + [_toAddCtrl];
_win = [_ctrl] call sog_client_os_fnc_getWinFromCtrl;

[_toAddCtrl, "added", "type"] call sog_client_os_fnc_addVarToCtrl;

{
    _x setVariable ["otherElements", _allCtrls];
    [_x, _allCtrls] call sog_client_os_fnc_addVarToCtrl;
} forEach _win;

if (count _this > 2) then {
    _pos = _this select 2;
    _zeroPos = ctrlPosition (_allCtrls select 0);
    _newX = (_zeroPos select 0) + ((_pos select 0) * GUI_GRID_W);
    _newY = (_zeroPos select 1) + (1.5 * GUI_GRID_H) + ((_pos select 1) * GUI_GRID_H);
    _newW = (_pos select 2) * GUI_GRID_W;
    _newH = (_pos select 3) * GUI_GRID_H;

    _toAddCtrl ctrlSetPosition[_newX, _newY, _newW, _newH];
    [_toAddCtrl, (_zeroPos select 0) + (_pos select 0), (_zeroPos select 1) + (_pos select 1)] call sog_client_tablet_fnc_setXYVersatz;

    _toAddCtrl ctrlCommit 0;
};