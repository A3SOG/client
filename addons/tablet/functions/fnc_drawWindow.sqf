_width = 20;
_height = 12;

if (count _this > 2) then {
    _width = _this select 2;
    if (count _this > 3) then {
        _height = _this select 3;
    };
};

_windowBackground = ["RscPicture", "\z\sog_client\addons\os\ui\data\winBg.paa", (_this select 0), (_this select 1), _width, _height] call sog_client_tablet_fnc_addCtrl;
[_windowBackground, 0, 0] call sog_client_tablet_fnc_setXYVersatz;

_topBar = ["RscBackground", "", (_this select 0), (_this select 1), _width, 1.5] call sog_client_tablet_fnc_addCtrl;
[_topBar, 0, 0] call sog_client_tablet_fnc_setXYVersatz;
_topBar ctrlEnable true;
_r = 24;
_g = 31;
_b = 28;
_topBar ctrlSetBackgroundColor [_r/255, _g/255, _b/255, 1];
_topBar ctrlSetForegroundColor [_r/255, _g/255, _b/255, 1];
_topBar ctrlAddEventHandler ["MouseButtonDown", {
    isMouseDown = 1;
    [_this select 0] call sog_client_os_fnc_focusWin;
    _sogActiveCtrl = [_this select 0] call sog_client_os_fnc_getWinFromCtrl;
    missionNamespace setVariable ["sogActiveCtrl", _sogActiveCtrl];
}];

_windowName = ["RscText", (_this select 4), (_this select 0), (_this select 1), _width - 1.5, 1.5] call sog_client_tablet_fnc_addCtrl;
[_windowName, 0, 0] call sog_client_tablet_fnc_setXYVersatz;
_windowName ctrlEnable true;
_windowName ctrlSetBackgroundColor [0, 0.5, 0.75, 1];
_windowName ctrlAddEventHandler ["MouseButtonDown", {
    isMouseDown = 1;
    [_this select 0] call sog_client_os_fnc_focusWin;
    _sogActiveCtrl = [_this select 0] call sog_client_os_fnc_getWinFromCtrl;
    missionNamespace setVariable ["sogActiveCtrl", _sogActiveCtrl];
}];

_close = ["RscText", " X", ((_this select 0) + (_width - 1.5)), (_this select 1), 1.5, 1.5] call sog_client_tablet_fnc_addCtrl;
[_close, _width - 1.5, 0] call sog_client_tablet_fnc_setXYVersatz;
_close ctrlSetBackgroundColor [0.9, 0, 0, 1];
_close ctrlSetActiveColor [1, 0, 0, 1];
_close ctrlEnable true;
_close ctrlAddEventHandler ["MouseButtonDown", {
    [_this select 0] call sog_client_os_fnc_closeWin;
}];

_allControls = [_windowBackground, _topBar, _close, _windowName];

{
    _x setVariable ["otherElements", _allControls];
    _x ctrlCommit 0;
    [_x, _allControls] call sog_client_os_fnc_addVarToCtrl;
    [_x, "Basic", "type"] call sog_client_os_fnc_addVarToCtrl;
} forEach _allControls;

_allControls;