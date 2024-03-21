_explorer = [GUI_LEFT + 2, GUI_TOP + 2, "\z\sog_client\addons\os\ui\data\driveC.paa", "", 1.1] call sog_client_tablet_fnc_addDesktopIcon;
(_explorer select 0) ctrlAddEventHandler ["MouseButtonDblClick", {
    _newWindow = [5, 5, 20, 12, "Explorer - C:\"] call sog_client_tablet_fnc_drawWindow;
    ["", _newWindow] call sog_client_tablet_fnc_changeExpPath;
}];

// _cmd = [GUI_LEFT + 8, GUI_TOP + 2, "\z\sog_client\addons\os\ui\data\pws.paa", "cmd", 0.9] call sog_client_tablet_fnc_addDesktopIcon;
// (_cmd select 0) ctrlAddEventHandler ["MouseButtonDblClick", {
    // _newWindow = [5, 5, 20, 12, "cmd"] call sog_client_tablet_fnc_drawWindow;
    // [_newWindow select 0, coalaConsole, [0, 0, 20, 10.5]] call sog_client_tablet_fnc_addCtrlToWin;
    //
// }];


_browser = [GUI_LEFT + 8, GUI_TOP + 2, "\z\sog_client\addons\os\ui\data\browserA.paa", "", 0] call sog_client_tablet_fnc_addDesktopIcon;
(_browser select 0) ctrlAddEventHandler ["MouseButtonDblClick", {
    _width = 46.5;
    _height = 21.5;
    _x = -2;
    _y = 1;

    _standartURL = "https://spearnet.mil/portal";
    _newWindow = [_x, _y, _width, _height, "Portal - Home"] call sog_client_tablet_fnc_drawWindow;

    _backgroundCtrl = ["RscText", "", 0, 0, 0, 0] call sog_client_tablet_fnc_addCtrl;
    _backgroundCtrl ctrlSetBackgroundColor [1, 1, 1, 1];
    [_newWindow select 0, _backgroundCtrl, [0, 0, _width - 0, _height - 0]] call sog_client_tablet_fnc_addCtrlToWin;

    _fdic = ["RscPicture", "\z\sog_client\addons\os\ui\data\fdic.paa", 0, 0, 0, 0] call sog_client_tablet_fnc_addCtrl;
    [_newWindow select 0, _fdic, [16, 5, _width - 32, _height - 18]] call sog_client_tablet_fnc_addCtrlToWin;
    _fdic ctrlEnable true;
    _fdic ctrlAddEventHandler ["MouseButtonDown", {
        [_this select 0] call sog_client_os_fnc_closeWin;
        [] spawn "\z\sog_client\addons\tablet\drawing\windowFDIC.sqf";
    }];

    _gms = ["RscPicture", "\z\sog_client\addons\os\ui\data\gms.paa", 0, 0, 0, 0] call sog_client_tablet_fnc_addCtrl;
    [_newWindow select 0, _gms, [16, 9, _width - 32, _height - 18]] call sog_client_tablet_fnc_addCtrlToWin;
    _gms ctrlEnable true;
    _gms ctrlAddEventHandler ["MouseButtonDown", {
        [_this select 0] call sog_client_os_fnc_closeWin;
        [] spawn "\z\sog_client\addons\tablet\drawing\windowGMS.sqf";
    }];

    _fms = ["RscPicture", "\z\sog_client\addons\os\ui\data\fms.paa", 0, 0, 0, 0] call sog_client_tablet_fnc_addCtrl;
    [_newWindow select 0, _fms, [16, 13, _width - 32, _height - 18]] call sog_client_tablet_fnc_addCtrlToWin;
    _fms ctrlEnable true;
    _fms ctrlAddEventHandler ["MouseButtonDown", {
        [_this select 0] call sog_client_os_fnc_closeWin;
        [] spawn "\z\sog_client\addons\tablet\drawing\windowFMS.sqf";
    }];

    _url = ["RscEdit", _standartURL, 0, 0, 0, 0] call sog_client_tablet_fnc_addCtrl;
    _url ctrlSetBackgroundColor [0.25, 0.25, 0.25, 1];
    _url ctrlSetTextColor [1, 1, 1, 1];
    [_newWindow select 0, _url, [0.1, 0.2, _width - 5.5, 1.5]] call sog_client_tablet_fnc_addCtrlToWin;

    _changeSiteButton = ["RscButton", "Go", 0, 0, 0, 0] call sog_client_tablet_fnc_addCtrl;
    _changeSiteButton ctrlSetBackgroundColor [0.1, 0.1, 0.1, 1];
    [_newWindow select 0, _changeSiteButton, [_width - 5.4, 0.2, 5.4, 1.5]] call sog_client_tablet_fnc_addCtrlToWin;

    missionNamespace setVariable [ format["%1url", str(_changeSiteButton)], _url];

    _allControls = [];

    {
        _x setVariable ["otherElements", _allControls];
        _x ctrlCommit 0;
        [_x, _allControls] call sog_client_os_fnc_addVarToCtrl;
        [_x, "Basic", "type"] call sog_client_os_fnc_addVarToCtrl;
    } forEach _allControls;
    
    _allControls;
}];

call sog_client_tablet_fnc_drawTaskBar;