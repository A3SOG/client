params ["_file", "_processId"];

_win = [1, 1, 30, 15, _file select 0] call sog_client_tablet_fnc_drawWindow;
[_win select 0, _processId, "processID"] call sog_client_os_fnc_addVarToCtrl;

_renderSurface = ["RscPicture", "", 0, 0, 0, 0] call sog_client_tablet_fnc_addCtrl;
[_win select 0, _renderSurface, [0, 0, 30, 15 - 1.5]] call sog_client_tablet_fnc_addCtrlToWin;
_renderSurface ctrlSetText format["%1", _file select 5];

missionNamespace setVariable ["SOG_ImageViewer", _renderSurface, true];