_type = _this select 0;
_text = _this select 1;
_x = (_this select 2) * GUI_GRID_W + GUI_GRID_X;
_y = (_this select 3) * GUI_GRID_H + GUI_GRID_Y;
_w = (_this select 4) * GUI_GRID_W;
_h = (_this select 5) * GUI_GRID_H;

_toCreate = SOG_Display ctrlCreate [_type, SOG_WinId];
missionNamespace setVariable ["SOG_LatestCIDC", SOG_WinId, true];
// diag_log format ["%1", SOG_WinId];
// hint format ["%1", SOG_WinId];
SOG_WinId = SOG_WinId + 1;

if (_text != "") then {
    _toCreate ctrlSetText _text;
};

_toCreate ctrlSetPosition [_x, _y, _w, _h];

if (count _this > 6) then {
    _toCreate ctrlAddEventHandler ["MouseEnter", {
        (_this select 0) ctrlSetBackgroundColor [1, 1, 1, 0.3];
        (_this select 0) ctrlCommit 0;
    }];
    _toCreate ctrlAddEventHandler ["MouseExit", {
        (_this select 0) ctrlSetBackgroundColor [0, 0, 0, 0];
        (_this select 0) ctrlCommit 0;
    }];
};

_toCreate ctrlCommit 0;

missionNamespace setVariable [format ["%1%2", _toCreate, "width"], _w];
missionNamespace setVariable [format ["%1%2", _toCreate, "height"], _h];

_toCreate;