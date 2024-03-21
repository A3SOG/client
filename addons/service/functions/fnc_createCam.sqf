_camera = "camera" camCreate [0,0,0];
_camera cameraEffect ["internal", "back"];

showCinemaBorder false;

_camera camPrepareTarget [65085.18,59302.71,-63669.23];
_camera camPreparePos [5633.12,10207.67,2.71];
_camera camPrepareFov 0.7;
_camera camCommitPrepared 0;
_camera camPrepareTarget [49610.96,93483.23,-33625.87];
_camera camPrepareFov 0.7;
_camera camCommitPrepared 3;

waitUntil { !opened };

_camera cameraEffect ["terminate", "back"];
camDestroy _camera;