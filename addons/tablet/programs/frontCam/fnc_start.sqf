_processId = _this select 1;
_fileName = _this select 2;

_width = 23.25;
_height = 10.75;
_x = -2;
_y = 1;

_win = [_x, _y, _width, _height, _fileName] call sog_client_tablet_fnc_drawWindow;
_renderSurface = ["RscPicture", "", 0, 0, 0, 0] call sog_client_tablet_fnc_addCtrl;
[_win select 0, _renderSurface, [0, 0, _width, _height - 1.5]] call sog_client_tablet_fnc_addCtrlToWin;

[_win select 0, _processId, "processID"] call sog_client_os_fnc_addVarToCtrl;

/* create render surface */
_renderSurface ctrlSetText "#(argb,512,512,1)r2t(frontcam,1)";

/* create camera and stream to render surface */
_cam = "camera" camCreate (getPos player);
_cam cameraEffect ["Internal", "Back", "frontcam"];
_cam camSetTarget player;
_cam attachTo [player, [0.1, 0.75, 1.5]];
_cam camSetFov 0.8;
_cam camCommit 0;

missionNamespace setVariable [format ["%1%2", _processId, "_cam"], _cam];