params ["_params", "_processId", "_fileName"];

_width = 40;
_height = 25;
_x = 1;
_y = 1;

if (count _params > 2) then {
    _x = parseNumber (_params select 2);
    _y = parseNumber (_params select 3);
};

_win = [_x, _y, _width, _height, _fileName] call sog_client_tablet_fnc_drawWindow;
[(_win select 0), _processId, "processID"] call sog_client_os_fnc_addVarToCtrl;

_pos = ctrlposition (_win select 0);
_prog = ([_processId] call sog_client_os_fnc_getProgEntryById);
_prog set [7, [(_pos select 0) / GUI_GRID_W + GUI_GRID_X, (_pos select 1) / GUI_GRID_H + GUI_GRID_Y]];

_map = ["RscMapControl", "", 0,0,0,0] call sog_client_tablet_fnc_addCtrl;
[_win select 0, _map, [0,0,_width,_height - 1.5]] call sog_client_tablet_fnc_addCtrlToWin;

_map ctrlAddEventHandler ["Draw", {
    {
        _items = items _x;
        _devices = ["SOG_Tablet"];
        if (((playerSide == side _x) || (side player == side _x)) && ((_device findIf { _x in _items } > -1) || ((commander vehicle _x == _x) && (vehicle _x != _x)))) then {
            _name = name _x;

            if((commander vehicle _x == _x) && (vehicle _x != _x)) then {
                _name = format["%1 - %2", _name, getText (configFile >> "CfgVehicles" >> typeOf (vehicle _x) >> "displayname")];
            };

            _this select 0 drawIcon [getText (configFile >> "CfgVehicles" >> typeOf (vehicle _x) >> "icon"), [0,0,0.7,0.7], getPos _x, 40, 40, getDir _x, _name, 1, 0.05, "TahomaB", "right"];
        };
    } foreach playableUnits;
}];
_map ctrlAddEventHandler ["MouseButtonDblClick", {
    //TODO: Find a way to add markers that can be deleted by user on map....... cannot find a solution right now..
    
    /*_WorldCoord = (_this select 0) posScreenToWorld [_this select 2,_this select 3];
    hint format["%1 %2", str(_WorldCoord select 0), str(_WorldCoord select 1)];
    _marker = createMarker [str(_WorldCoord), _WorldCoord];
    _marker setMarkerShape "ICON";
    _marker setMarkerBrush "Solid";
    _marker setMarkerColor "ColorRed";
    _marker setMarkerType "DOT";
    
    _aMarker = vehicleVarName _x;
    _aMarker = createMarkerLocal [_aMarker,_WorldCoord];
    _aMarker setMarkerShapeLocal "ICON";
    _aMarker setMarkerTypeLocal "mil_dot";
    //_aMarker setMarkerTextLocal _unitName;
    _aMarker setMarkerSizeLocal [1,1];
    //_aMarker setmarkerDirLocal (getdir _x);
    _aMarker setMarkerPosLocal (_WorldCoord);
    //_aMarker setMarkerTextLocal _unitName;
    _aMarker setMarkerColorLocal "ColorGreen";*/
}];