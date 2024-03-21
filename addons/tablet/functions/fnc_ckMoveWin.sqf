if (isMouseDown == 1) then {
    _sogActiveCtrl = missionNamespace getVariable "SOG_ActiveCtrl";
    _toMove = _sogActiveCtrl select 0;
    _pos = ctrlPosition _toMove;

    _width = missionNamespace getVariable format ["%1%2", _toMove, "width"];
    _height = missionNamespace getVariable format ["%1%2", _toMove, "height"];

    _movementSpeed = 0.36 / diag_fps;

    _newX = (_pos select 0) + (sogMouseX * _movementSpeed);
    _newY = (_pos select 1) + (sogMouseY * (_movementSpeed * 1.28));

    if (_newX + _width > GUI_RIGHT) then {
        _newX = GUI_RIGHT - _width;
    };
    if (_newX < GUI_LEFT * GUI_GRID_W) then {
        _newX = GUI_LEFT * GUI_GRID_W;
    };
    if (_newY + _height > GUI_BOTTOM) then {
        _newY = GUI_BOTTOM - _height;
    };
    if (_newY < GUI_TOP * GUI_GRID_H) then {
        _newY = GUI_TOP * GUI_GRID_H;
    };
    _toMove ctrlSetPosition [_newX, _newY, _pos select 2, _pos select 3];
    _toMove ctrlCommit 0;

    {
        if (_x != _toMove) then {
            _xVersatz = missionNamespace getVariable format ["%1xPlus", str(_x)];
            _yVersatz = missionNamespace getVariable format ["%1yPlus", str(_x)];
            _subPos = ctrlPosition _x;
            _controlType = [_x, "type"] call sog_client_os_fnc_getVarToCtrl;
            if (_controlType == "basic") then {
                _x ctrlSetPosition [_newX + _xVersatz, _newY + _yVersatz, _subPos select 2, _subPos select 3];
            } else {
                _x ctrlSetPosition [_newX + _xVersatz, _newY + _yVersatz + (1.45 * GUI_GRID_H), _subPos select 2, _subPos select 3];
            };
            _x ctrlCommit 0;
        };

        if (ctrlText _x == "cmd") then {
            [_x] call sog_client_os_fnc_focusWin;
        };
    } forEach _sogActiveCtrl;

    _processId = [_toMove, "processID"] call sog_client_os_fnc_getVarToCtrl;
    _prog = ([_processId] call sog_client_os_fnc_getProgEntryById);
    _prog set [7, [_newX / GUI_GRID_W + GUI_GRID_X, _newY / GUI_GRID_H + GUI_GRID_Y]];
};