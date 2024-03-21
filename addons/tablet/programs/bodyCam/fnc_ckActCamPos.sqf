params ["_selectedPlayer", "_cam", "_processId", "_dirCtrl"];

_vehicle = vehicle _selectedPlayer;

while { (missionNamespace getVariable format["%1%2", _processId, "programActive"] != "0") } do {
    if (_vehicle != vehicle _selectedPlayer) then {
        _cam attachTo [vehicle _selectedPlayer, [-0.05, 0.15, 0.08], "Head"];
        _vehicle = vehicle _selectedPlayer;
    };

    _dirCtrl ctrlSetText format["Dir: %1", str(floor(getDir _vehicle))];
    _dir =  [_vehicle] call CBA_fnc_modelHeadDir;
    _pitch = (_dir select 2) - 10;
    
    [_cam, [_pitch, 0, 0]] call sog_client_tablet_bodyCam_fnc_setPBY;
        
    sleep 0.08;
};