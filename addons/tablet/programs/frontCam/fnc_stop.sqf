_procId = _this select 0;
_cam = missionNamespace getVariable format ["%1%2", _procId, "_cam"];

_cam cameraEffect ["terminate", "back", str(_procId)]; 
camDestroy _cam;