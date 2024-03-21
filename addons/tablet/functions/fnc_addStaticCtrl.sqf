_type = _this select 0;
_text = _this select 1;
_x = (_this select 2) * GUI_GRID_W + GUI_GRID_X;
_y = (_this select 3) * GUI_GRID_H + GUI_GRID_Y;
_w = (_this select 4) * GUI_GRID_W;
_h = (_this select 5) * GUI_GRID_H;
_cidc = _this select 6;

_toCreate = SOG_Display ctrlCreate [_type, _cidc];

if (_text != "") then {
    _toCreate ctrlSetText _text;
};

_toCreate ctrlSetPosition [_x, _y, _w, _h];
_toCreate ctrlCommit 0;

missionNamespace setVariable [format ["%1%2", _toCreate, "width"], _w];
missionNamespace setVariable [format ["%1%2", _toCreate, "height"], _h];

_toCreate