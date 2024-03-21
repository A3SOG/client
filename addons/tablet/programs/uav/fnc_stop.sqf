_procId = _this select 0;
_cam = missionNamespace getVariable format["%1%2", _procId, "_cam"];
_uav = missionNamespace getVariable format["%1%2", _procId, "_uav"];
_cam cameraEffect ["terminate","back"];
camDestroy _cam;

missionNamespace setVariable [format["%1%2", _procId, "_doMovement"], "false"];
missionNamespace setVariable [format["%1%2", _procId, "programActive"], "0"];