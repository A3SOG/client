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