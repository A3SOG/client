params ["_command", "_newWindow"];

_width = 20;
_height = 12;
_x = 10;
_y = 6;

[_newWindow select 0] call sog_client_os_fnc_closeWin;
_newWindow = [_x, _y, _width, _height, "Explorer - C:\"] call sog_client_tablet_fnc_drawWindow;

[_command] call sog_client_os_fnc_exeCmdNonShell;
_folders = ["ls"] call sog_client_os_fnc_exeCmdNonShell;

_yIndex = 0;
_breaker = 3;
_counter = 0;

_folders = [[".."]] + _folders;
{
    _cur = (_folders select _forEachIndex);

    _imageName = "folder";
    if (count _cur > 6) then {
        if (_cur select 6 == "exe") then {
            _imageName = "exe";
        };
        if (_cur select 6 == "picture") then {
            _imageName = "picture";
        };
        if (_cur select 6 == "desktop") then {
            _imageName = "desktop";
        };
        if (_cur select 6 == "documents") then {
            _imageName = "documents";
        };
        if (_cur select 6 == "downloads") then {
            _imageName = "downloads";
        };
        if (_cur select 6 == "music") then {
            _imageName = "music";
        };
        if (_cur select 6 == "pictures") then {
            _imageName = "pictures";
        };
        if (_cur select 6 == "videos") then {
            _imageName = "videos";
        };
        if (_cur select 6 == "video") then {
            _imageName = "video";
        };
    };

    _folderCtrl = ["RscPicture", MISSION_ROOT + "CoalaOs\Images\" + _imageName + ".paa", 0, 0, 0, 0] call sog_client_tablet_fnc_addCtrl;
    _folderCtrl ctrlEnable true;
    [_folderCtrl, _cur, "folderStructure"] call sog_client_os_fnc_addVarToCtrl;
    _folderCtrl ctrlAddEventHandler ["MouseButtonDblClick", {
        _folderInfo = [_this select 0, "folderStructure"] call sog_client_os_fnc_getVarToCtrl;
        if (count _folderInfo > 4) then {
            if (_folderInfo select 4 == 1) then {
                _folders = [_this select 0] call sog_client_os_fnc_getWinFromCtrl;
                [format["cd %1", (_folderInfo select 0)], _folders] call sog_client_tablet_fnc_changeExpPath;
            } else {
                [format["open %1", (_folderInfo select 0)]] call sog_client_os_fnc_exeCmdNonShell;
            };
        } else {
            _folders = [_this select 0] call sog_client_os_fnc_getWinFromCtrl;
            [format["cd %1", (_folderInfo select 0)], _folders] call sog_client_tablet_fnc_changeExpPath;
        };
    }];

    _name = (_cur select 0);
    _folderCtrlText = ["RscText", _name, 0, 0, 0, 0] call sog_client_tablet_fnc_addCtrl;
    _folderCtrlText ctrlSetFontHeight 0.03;
    _folderCtrlText ctrlSetTextColor [0, 0, 0, 1];
    _folderCtrlText ctrlSetTooltip _name;

    [_newWindow select 0, _folderCtrl, [0.5 + _counter * 4 + 1 * _counter, _yIndex * 5 + 0.2, 4, 4]] call sog_client_tablet_fnc_addCtrlToWin;
    [_newWindow select 0, _folderCtrlText, [0.5 + _counter * 4 + 1 * _counter, _yIndex * 5 + 3.8, 4, 1]] call sog_client_tablet_fnc_addCtrlToWin;

    if (_breaker == _counter) then {
        _yIndex = _yIndex + 1;
        _counter = 0;
    } else {
        _counter = _counter + 1;
    };
} forEach _folders;