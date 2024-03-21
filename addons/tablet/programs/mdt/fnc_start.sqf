params ["_params", "_processId", "_fileName"];

_width = 46.5;
_height = 21.5;
_x = -2;
_y = 1;

if (count _params > 2) then {
    _x = parseNumber (_params select 2);
    _y = parseNumber (_params select 3);
};

_programWindow = [_x, _y, _width, _height, _fileName] call sog_client_tablet_fnc_drawWindow;
[_programWindow select 0, _processId, "processID"] call sog_client_os_fnc_addVarToCtrl;

_pos = ctrlPosition (_programWindow select 0);
_prog = ([_processId] call sog_client_os_fnc_getProgEntryById);
_prog set [7, [(_pos select 0) / GUI_GRID_W + GUI_GRID_X, (_pos select 1) / GUI_GRID_H + GUI_GRID_Y]];

_backgroundCtrl = ["RscText", "", 0, 0, 0, 0] call sog_client_tablet_fnc_addCtrl;
_backgroundCtrl ctrlSetBackgroundColor [0.1, 0.1, 0.1, 1];
[_programWindow select 0, _backgroundCtrl, [0, 0, _width - 0, _height - 1.25]] call sog_client_tablet_fnc_addCtrlToWin;

_map = ["RscMapControl", "", 0, 0, 0, 0, 001] call sog_client_tablet_fnc_addStaticCtrl;
ctrlShow [001, false];
[_programWindow select 0, _map, [8, 1.5, 30, _height - 4.25]] call sog_client_tablet_fnc_addCtrlToWin;
_map ctrlAddEventHandler ["Draw", {
    {
        _items = items _x;
        _devices = ["SOG_Tablet"];
        if (((playerSide == side _x) || (side player == side _x)) && ((_devices findIf { _x in _items } > -1) || ((commander vehicle _x == _x) && (vehicle _x != _x)))) then {
            _name = name _x;
            if ((commander vehicle _x == _x) && (vehicle _x != _x)) then {
                _name = format["%1 - %2", _name, getText (configFile >> "CfgVehicles" >> typeOf (vehicle _x) >> "displayname")];
            };
            _this select 0 drawIcon [getText (configFile >> "CfgVehicles" >> typeOf (vehicle _x) >> "icon"), [0, 0, 0.7, 0.7], getPos _x, 40, 40, getDir _x, _name, 1, 0.05, "TahomaB", "right"];
        };
    } forEach playableUnits;
}];

_list = ["RscListBox", "", 0, 0, 0, 0, 002] call sog_client_tablet_fnc_addStaticCtrl;
_list ctrlSetBackgroundColor [0.1, 0.1, 0.1, 0.75];
ctrlShow [002, false];
{
    if ('SOG_Tablet' in (items _x)) then {
        _index1 = lbAdd [002, (name _x)];
    };
} forEach playableUnits;
[_win select 0, _list, [8, 1.5, 30, 15 - 4.25]] call sog_client_tablet_fnc_addCtrlToWin;


_btn1 = ["RscButton", "Busy", 0, 0, 0, 0] call sog_client_tablet_fnc_addCtrl;
_btn1 ctrlSetBackgroundColor [1, 0.5, 0, 1];
_btn1 ctrlSetTextColor [1, 1, 1, 1];
[_programWindow select 0, _btn1, [8, 0.25, 5, 1]] call sog_client_tablet_fnc_addCtrlToWin;
_btn1 ctrlAddEventHandler ["MouseButtonDown", {
    private _uid = getPlayerUID player;
    "ArmaSOGClient" callExtension ["send_status", [_uid, "busy"]];
}];

_btn2 = ["RscButton", "Unavailable", 0, 0, 0, 0] call sog_client_tablet_fnc_addCtrl;
_btn2 ctrlSetBackgroundColor [1, 0, 0, 1];
_btn2 ctrlSetTextColor [1, 1, 1, 1];
[_programWindow select 0, _btn2, [13, 0.25, 5, 1]] call sog_client_tablet_fnc_addCtrlToWin;
_btn2 ctrlAddEventHandler ["MouseButtonDown", {
    private _uid = getPlayerUID player;
    "ArmaSOGClient" callExtension ["send_status", [_uid, "unavailable"]];
}];

_btn3 = ["RscButton", "Available", 0, 0, 0, 0] call sog_client_tablet_fnc_addCtrl;
_btn3 ctrlSetBackgroundColor [0, 0.5, 0.5, 1];
_btn3 ctrlSetTextColor [1, 1, 1, 1];
[_programWindow select 0, _btn3, [18, 0.25, 5, 1]] call sog_client_tablet_fnc_addCtrlToWin;
_btn3 ctrlAddEventHandler ["MouseButtonDown", {
    private _uid = getPlayerUID player;
    "ArmaSOGClient" callExtension ["send_status", [_uid, "available"]];
}];

_btn4 = ["RscButton", "Enroute", 0, 0, 0, 0] call sog_client_tablet_fnc_addCtrl;
_btn4 ctrlSetBackgroundColor [0, 0, 1, 1];
_btn4 ctrlSetTextColor [1, 1, 1, 1];
[_programWindow select 0, _btn4, [23, 0.25, 5, 1]] call sog_client_tablet_fnc_addCtrlToWin;
_btn4 ctrlAddEventHandler ["MouseButtonDown", {
    private _uid = getPlayerUID player;
    "ArmaSOGClient" callExtension ["send_status", [_uid, "enroute"]];
}];

_btn5 = ["RscButton", "On Scene", 0, 0, 0, 0] call sog_client_tablet_fnc_addCtrl;
_btn5 ctrlSetBackgroundColor [0, 1, 0, 1];
_btn5 ctrlSetTextColor [1, 1, 1, 1];
[_programWindow select 0, _btn5, [28, 0.25, 5, 1]] call sog_client_tablet_fnc_addCtrlToWin;
_btn5 ctrlAddEventHandler ["MouseButtonDown", {
    private _uid = getPlayerUID player;
    "ArmaSOGClient" callExtension ["send_status", [_uid, "onscene"]];
}];

_btn6 = ["RscButton", "Panic", 0, 0, 0, 0] call sog_client_tablet_fnc_addCtrl;
_btn6 ctrlSetBackgroundColor [1, 0.27, 0, 1];
_btn6 ctrlSetTextColor [1, 1, 1, 1];
[_programWindow select 0, _btn6, [33, 0.25, 5, 1]] call sog_client_tablet_fnc_addCtrlToWin;
_btn6 ctrlAddEventHandler ["MouseButtonDown", {
    private _uid = getPlayerUID player;
    "ArmaSOGClient" callExtension ["send_status", [_uid, "panic"]];
}];

_btn7 = ["RscButton", "Dashboard", 0, 0, 0, 0] call sog_client_tablet_fnc_addCtrl;
_btn7 ctrlSetBackgroundColor [0.5, 0.5, 0.5, 1];
_btn7 ctrlSetTextColor [1, 1, 1, 1];
[_programWindow select 0, _btn7, [0.25, 19, 5, 1]] call sog_client_tablet_fnc_addCtrlToWin;
_btn7 ctrlAddEventHandler ["MouseButtonDown", {
    ctrlShow [001, false];
    ctrlShow [002, false];
}];

_btn8 = ["RscButton", "Live Map", 0, 0, 0, 0] call sog_client_tablet_fnc_addCtrl;
_btn8 ctrlSetBackgroundColor [0.5, 0.5, 0.5, 1];
_btn8 ctrlSetTextColor [1, 1, 1, 1];
[_programWindow select 0, _btn8, [5.25, 19, 5, 1]] call sog_client_tablet_fnc_addCtrlToWin;
_btn8 ctrlAddEventHandler ["MouseButtonDown", {
    ctrlShow [001, true];
    ctrlShow [002, false];
}];

_btn9 = ["RscButton", "Active Units", 0, 0, 0, 0] call sog_client_tablet_fnc_addCtrl;
_btn9 ctrlSetBackgroundColor [0.5, 0.5, 0.5, 1];
_btn9 ctrlSetTextColor [1, 1, 1, 1];
[_programWindow select 0, _btn9, [10.25, 19, 5, 1]] call sog_client_tablet_fnc_addCtrlToWin;
_btn9 ctrlAddEventHandler ["MouseButtonDown", {
    ctrlShow [001, false];
    ctrlShow [002, true];
}];

_btn10 = ["RscButton", "Active Contracts", 0, 0, 0, 0] call sog_client_tablet_fnc_addCtrl;
_btn10 ctrlSetBackgroundColor [0.5, 0.5, 0.5, 1];
_btn10 ctrlSetTextColor [1, 1, 1, 1];
[_programWindow select 0, _btn10, [15.25, 19, 6, 1]] call sog_client_tablet_fnc_addCtrlToWin;
_btn10 ctrlAddEventHandler ["MouseButtonDown", {
    ctrlShow [001, false];
    ctrlShow [002, false];
}];

_btn11 = ["RscButton", "Messages", 0, 0, 0, 0] call sog_client_tablet_fnc_addCtrl;
_btn11 ctrlSetBackgroundColor [0.5, 0.5, 0.5, 1];
_btn11 ctrlSetTextColor [1, 1, 1, 1];
[_programWindow select 0, _btn11, [21.25, 19, 5, 1]] call sog_client_tablet_fnc_addCtrlToWin;
_btn11 ctrlAddEventHandler ["MouseButtonDown", {
    ctrlShow [001, false];
    ctrlShow [002, false];
}];