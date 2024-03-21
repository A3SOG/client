params ["_params", "_processId", "_fileName"];
_uav = nil;
_cam = nil;

_width = 30;
_height = 20.25;
_x = -2;
_y = 1;

missionNamespace setVariable [format ["%1%2", _processId, "cam"], nil];

_programWindow = [_x, _y, _width, _height, _fileName] call sog_client_tablet_fnc_drawWindow;
_renderSurface = ["RscPicture", "", 0, 0, 0, 0] call sog_client_tablet_fnc_addCtrl;
[_programWindow select 0, _renderSurface, [0, 0, _width, _height - 1.5]] call sog_client_tablet_fnc_addCtrlToWin;

_btnNormal = ["RscButton", "0", 0, 0, 0, 0] call sog_client_tablet_fnc_addCtrl;
[_programWindow select 0, _btnNormal, [0, 0, 1, 1]] call sog_client_tablet_fnc_addCtrlToWin;
_btnNormal ctrlAddEventHandler ["MouseButtonDown", {
    _camId = missionNamespace getVariable format ["%1%2", _this select 0, "_uavId"];
    _camId setPiPEffect [0];
}];
missionNamespace setVariable [format ["%1%2", _processId, "_btnNormal"], _btnNormal];

_btnNV = ["RscButton", "1", 0, 0, 0, 0] call sog_client_tablet_fnc_addCtrl;
[_programWindow select 0, _btnNV, [1.1, 0, 1, 1]] call sog_client_tablet_fnc_addCtrlToWin;
_btnNV ctrlAddEventHandler ["MouseButtonDown", {
    _camId = missionNamespace getVariable format ["%1%2", _this select 0, "_uavId"];
    _camId setPiPEffect [1];
}];
missionNamespace setVariable [format ["%1%2", _processId, "_btnNV"], _btnNV];

_btnWarm = ["RscButton", "2", 0, 0, 0, 0] call sog_client_tablet_fnc_addCtrl;
[_programWindow select 0, _btnWarm, [2.2, 0, 1, 1]] call sog_client_tablet_fnc_addCtrlToWin;
_btnWarm ctrlAddEventHandler ["MouseButtonDown", {
    _camId = missionNamespace getVariable format ["%1%2", _this select 0, "_uavId"];
    _camId setPiPEffect [2];
}];
missionNamespace setVariable [format ["%1%2", _processId, "_btnWarm"], _btnWarm];

_btnPlus = ["RscButton", "+", 0, 0, 0, 0] call sog_client_tablet_fnc_addCtrl;
[_programWindow select 0, _btnPlus, [1.1, 1.1, 1, 1]] call sog_client_tablet_fnc_addCtrlToWin;
_btnPlus ctrlAddEventHandler ["MouseButtonDown", {
    _id = missionNamespace getVariable format ["%1%2", _this select 0, "_camId"];
    _fov = missionNamespace getVariable format ["%1%2", _id, "_fov"];
    _fov = _fov - 0.1;
    missionNamespace setVariable [format ["%1%2", _id, "_fov"], _fov];
}];
missionNamespace setVariable [format ["%1%2", _processId, "_btnPlus"], _btnPlus];

_btnMinus = ["RscButton", "-", 0, 0, 0, 0] call sog_client_tablet_fnc_addCtrl;
[_programWindow select 0, _btnMinus, [0, 1.1, 1, 1]] call sog_client_tablet_fnc_addCtrlToWin;
_btnMinus ctrlAddEventHandler ["MouseButtonDown", {
    _id = missionNamespace getVariable format ["%1%2", _this select 0, "_camId"];
    _fov = missionNamespace getVariable format ["%1%2", _id, "_fov"];
    _fov = _fov + 0.1;
    missionNamespace setVariable [format ["%1%2", _id, "_fov"], _fov];
}];
missionNamespace setVariable [format ["%1%2", _processId, "_btnMinus"], _btnMinus];

_playerSelection = ["RscCombo", "", 0, 0, 0, 0] call sog_client_tablet_fnc_addCtrl;
[_programWindow select 0, _playerSelection, [0, 3.2, 10, 1]] call sog_client_tablet_fnc_addCtrlToWin;
_playerSelection ctrlAddEventHandler ["LBSelChanged", {
    _control = _this select 0;
    _selectedIndex = lbCurSel _control;

    if (_selectedIndex != -1) then {
        _allDrones = missionNamespace getVariable format ["%1%2", _control, "allDrones"];
        _renderSurface = missionNamespace getVariable format ["%1%2", _control, "renderSurface"];
        _processId = missionNamespace getVariable format ["%1%2", _control, "processId"];
        _oldCam = missionNamespace getVariable format ["%1%2", _processId, "cam"];
        if (_oldCam != nil) then {
            _oldCam cameraEffect ["terminate", "back"]; 
            camDestroy _oldCam;
        };

        _selectedDrone = (_allDrones select _selectedIndex);
        _droneId = str(netId _selectedDrone);

        // hint str(_renderSurface);
        _renderSurface ctrlSetText "#(argb,512,512,1)r2t(" + _playerId + ",1)";

        [_params, _selectedDrone, _processId, _renderSurface] call sog_client_tablet_uav_fnc_setActiveDrone;
    };
}];

[_playerSelection, _processId] spawn sog_client_tablet_uav_fnc_heartbeat;

_textHeight = ["RscText", "100m", 0, 0, 0, 0] call sog_client_tablet_fnc_addCtrl;
[_programWindow select 0, _textHeight, [4.4, 1.1, 3, 1]] call sog_client_tablet_fnc_addCtrlToWin;

_textDirection = ["RscText", "0", 0,0,0,0] call sog_client_tablet_fnc_addCtrl;
[_programWindow select 0, _textDirection, [7.8,1.1,4,1]] call sog_client_tablet_fnc_addCtrlToWin;

missionNamespace setVariable [format ["%1%2", _playerSelection, "renderSurface"], _renderSurface];
missionNamespace setVariable [format ["%1%2", _playerSelection, "processId"], _processId];
missionNamespace setVariable [format ["%1%2", _processId, "_textHeight"], _textHeight];
missionNamespace setVariable [format ["%1%2", _processId, "_textDirection"], _textDirection];

[_programWindow select 0, _processId, "processID"] call sog_client_os_fnc_addVarToCtrl;

_allDrones = [];
{
    _name = getText(configFile >> "cfgVehicles" >> typeOf _x >> "DisplayName");
    //hint _name;
    if (typeOf _x == "B_UAV_01_F") then {
        _allDrones = _allDrones + [_x];
        _playerSelection lbAdd (_name);
    };
} foreach vehicles;
missionNamespace setVariable [format ["%1%2", _playerSelection, "allDrones"], _allDrones];

_playerSelection lbSetCurSel 0;