params ["_procId"];
_win = missionNamespace getVariable format ["%1%2", _procId, "window"];
//hint format["bla. %1",  str([_procId] call fnCoala_getProgramEntryById)];

missionNamespace setVariable [format ["%1%2", _procId, "programActive"], "0"];

_cam = missionNamespace getVariable format ["%1%2", _procId, "_cam"];

if (str(_cam) != "<null>") then {
    _cam cameraEffect ["terminate", "back"];
    camDestroy _cam;
};