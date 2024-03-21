params ["_uav", "_cam", "_procId", "_id", "_textDirection", "_textHeight"];
_isAllowed = "true";

while {_isAllowed == "true" || str(_isAllowed) == "<null>"} do {
    _dir = (_uav selectionPosition "PiP0_pos") vectorFromTo (_uav selectionPosition "PiP0_dir");
    _cam setVectorDirAndUp [ _dir, _dir vectorCrossProduct [-(_dir select 1), _dir select 0, 0]];
    _fov = nil;
    _fov = missionNamespace getVariable format["%1%2", _id, "_fov"];
    if (str(_fov) != "<null>") then {
        _cam camSetFov _fov;
        _cam camCommit 0;
    };
    sleep 0.1;
    _textHeight ctrlSetText format["%1m", floor(getPos _uav select 2)];
    _textDirection ctrlSetText format["Dir: %1", floor(getDir _uav)];
    _isAllowed = missionNamespace getVariable format["%1%2", _procId, "_doMovement"];
};

_cam cameraEffect ["terminate","back"];
camDestroy _cam;