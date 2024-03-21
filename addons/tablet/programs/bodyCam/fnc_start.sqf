params ["_parameters", "_processId", "_fileName"];
_cam = nil;

_width = 23.25;
_height = 10.75;
_x = -2;
_y = 1;

missionNamespace setVariable [format ["%1%2", _processId, "_cam"], "none"];

if(count _parameters > 2) then {
    _x = parseNumber (_parameters select 2);
    _y = parseNumber (_parameters select 3);
};

_programWindow = [_x, _y, _width, _height, _fileName] call sog_client_tablet_fnc_drawWindow;
[_programWindow select 0, _processId, "processID"] call sog_client_os_fnc_addVarToCtrl;
missionNamespace setVariable [format ["%1%2", _processId, "window"], _programWindow];

_pos = ctrlPosition (_programWindow select 0);
_prog = ([_processId] call sog_client_os_fnc_getProgEntryById);
_prog set [7, [(_pos select 0) / GUI_GRID_W + GUI_GRID_X, (_pos select 1) / GUI_GRID_H + GUI_GRID_Y]];

_renderSurface = ["RscPicture", "", 0, 0, 0, 0] call sog_client_tablet_fnc_addCtrl;
[_win select 0, _renderSurface, [0, 0, 30, 15 - 1.5]] call sog_client_tablet_fnc_addCtrlToWin;

_direction = ["RscText", "", 0, 0, 0, 0] call sog_client_tablet_fnc_addCtrl;
[_win select 0, _direction, [11, 0, 4, 1]] call sog_client_tablet_fnc_addCtrlToWin;

_playerSelection = ["RscCombo", "", 0, 0, 0, 0] call sog_client_tablet_fnc_addCtrl;
[_win select 0, _playerSelection, [0, 0, 10, 1]] call sog_client_tablet_fnc_addCtrlToWin;
_playerSelection ctrlAddEventHandler ["LBSelChanged", {
    _control = _this select 0;
    _selectedIndex = lbCurSel _control;
    _allPlayers = missionNamespace getVariable format ["%1%2", _control, "players"];
    _renderSurface = missionNamespace getVariable format ["%1%2", _control, "renderSurface"];
    _processId = missionNamespace getVariable format ["%1%2", _control, "processId"];
    _oldCam = missionNamespace getVariable format ["%1%2", _processId, "_cam"];
    _programWindow = missionNamespace getVariable format ["%1%2", _control, "programWindow"];
    _direction = missionNamespace getVariable format ["%1%2", _control, "direction"];
    _selectedPlayer = (_allPlayers select _selectedIndex) select 0;
    
    // head direction: https://community.bistudio.com/wiki/eyeDirection
    //gab schon cam
    if (str(_oldCam) != str("none")) then {
        _playerId = str(netId _selectedPlayer);
        _oldCam attachTo [vehicle _selectedPlayer, [-0.05, 0.1, 0.08], "Head"];
        _oldCam camCommit 0;
        [_selectedPlayer, _oldCam, _processId, _direction] spawn sog_client_tablet_bodyCam_fnc_ckActCamPos;
    } else {
        //gab noch keine cam
        _playerId = str(netId _selectedPlayer);
        _renderSurface ctrlSetText "#(argb,512,512,1)r2t(" + str(_processId) + ",1)";
        
        _cam = "camera" camCreate [0, 0, 0]; 
        _cam cameraEffect ["Internal", "Back", str(_processId)];
        _cam attachTo [vehicle _selectedPlayer, [-0.05, 0.1, 0.05], "Head"];
        _cam camCommit 0;
        missionNamespace setVariable [format ["%1%2", _processId, "_cam"], _cam];
        missionNamespace setVariable [format ["%1%2", _processId, "playerId"], _playerId];
        [_selectedPlayer, _cam, _processId, _direction] spawn sog_client_tablet_bodyCam_fnc_ckActCamPos;
    };
}];

_allPlayers = [];
{
    if (isPlayer _x) then {
        _allPlayers pushBack [_x, name _x];
        _playerSelection lbAdd (name _x);
    };
} forEach playableUnits;

missionNamespace setVariable [format ["%1%2", _playerSelection, "players"], _allPlayers];
missionNamespace setVariable [format ["%1%2", _playerSelection, "processId"], _processId];
missionNamespace setVariable [format ["%1%2", _processId, "programActive"], "1"];
missionNamespace setVariable [format ["%1%2", _playerSelection, "renderSurface"], _renderSurface];
missionNamespace setVariable [format ["%1%2", _playerSelection, "programWindow"], _programWindow];
missionNamespace setVariable [format ["%1%2", _playerSelection, "direction"], _direction];

_playerSelection lbSetCurSel 0;

[_processId, _playerSelection] spawn sog_client_tablet_bodyCam_fnc_hearbeat;