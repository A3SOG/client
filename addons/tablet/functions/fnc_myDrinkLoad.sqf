SOG_VideoPlayer = nil;
SOG_LifeFeed = nil;
SOG_Display = nil;
SOG_Console = nil;

private ["_display", "_idc", "_ctrl"];
_display = _this select 0;
SOG_Display = _display;
_idc = -1;

_ctrl = _display displayCtrl _idc;
_this select 0 displayCtrl -1 ctrlEnable false;

GUI_GRID_W = 0.025;
GUI_GRID_H = 0.04;
GUI_GRID_X = 0;
GUI_GRID_Y = 0;
sogMouseX = 0;
sogMouseY = 0;
isMouseDown = 0;
SOG_WindowId = 1801;

GUI_TOP = 1;
GUI_LEFT = -2;
GUI_WIDTH = 46.5;
GUI_HEIGHT = 21.75;
GUI_RIGHT = (GUI_WIDTH + GUI_LEFT) * GUI_GRID_W;
GUI_BOTTOM = (GUI_HEIGHT + GUI_TOP) * GUI_GRID_H;

SOG_Display displayAddEventHandler ["MouseMoving", {
    [_this] call sog_client_tablet_fnc_ckMoveWin;
    sogMouseX = _this select 1;
    sogMouseY = _this select 2;
}];

SOG_Display displayAddEventHandler ["MouseButtonUp", {
    isMouseDown = 0;
}];

[] call sog_client_tablet_fnc_drawBgImage;
[] call sog_client_tablet_fnc_drawDesktop;

_keyDown = _display displayAddEventHandler ["KeyDown", {
    _key = _this select 1;

    ctrlSetText [2001, "got here 0"];

    if ((_key == 28)) then {
        _input = ctrlText 1400;
        _cmd = [_input] call sog_client_os_fnc_getLastInsert;
        [_cmd] call sog_client_os_exeCmd;
        _consoleText = ctrlText 1400;
        [_consoleText] call sog_client_os_fnc_removeTopLine;
    };
}];

_keyUp = _display displayAddEventHandler ["KeyUp", {}];