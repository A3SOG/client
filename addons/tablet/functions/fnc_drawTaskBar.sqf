_taskBar = ["RscBackground", "", GUI_LEFT - 0, GUI_HEIGHT - 0.5, GUI_WIDTH + 0, 1.5] call sog_client_tablet_fnc_addCtrl;
_r = 24;
_g = 31;
_b = 28;
_taskBar ctrlSetBackgroundColor [_r/255, _g/255, _b/255, 1];
_taskBar ctrlSetForegroundColor [_r/255, _g/255, _b/255, 1];

_taskBarTime = ["RscText", "", (GUI_LEFT + GUI_WIDTH) - 3.5, GUI_HEIGHT - 0.5, 5, 1.5] call sog_client_tablet_fnc_addCtrl;

[_taskBarTime] spawn sog_client_os_fnc_initTime;