params ["_params", "_uav", "_processId", "_renderSurface"];

_camId = str(netId _uav);
missionNamespace setVariable [format ["%1%2", _processId, "_uavId"], _camId];

/* create render surface */
_renderSurface ctrlSetText "#(argb,512,512,1)r2t(" + _camId + ",1)";

/* create camera and stream to render surface */
_cam = "camera" camCreate [0, 0, 0];
_cam cameraEffect ["Internal", "Back", _camId];

/* attach cam to gunner cam position */
_cam attachTo [_uav, [0, 0, 0], "PiP0_pos"];

/* make it zoom in a little */
_cam camSetFov 1;

//_cam camSetTarget player;

/* switch cam to thermal */
if (count _params > 2) then {
    _camId setPiPEffect [parseNumber(_params select 2)];
} else {
    _camId setPiPEffect [0];
};
_cam camCommit 0;

/* adjust cam orientation */

_btnNormal = missionNamespace getVariable format ["%1%2", _processId, "_btnNormal"];
_btnNV = missionNamespace getVariable format ["%1%2", _processId, "_btnNV"];
_btnWarm = missionNamespace getVariable format ["%1%2", _processId, "_btnWarm"];
_btnPlus = missionNamespace getVariable format ["%1%2", _processId, "_btnPlus"];
_btnMinus = missionNamespace getVariable format ["%1%2", _processId, "_btnMinus"];
_textHeight = missionNamespace getVariable format ["%1%2", _processId, "_textHeight"];
_textDirection = missionNamespace getVariable format ["%1%2", _processId, "_textDirection"];

missionNamespace setVariable [format ["%1%2", _processId, "cam"], _cam];
missionNamespace setVariable [format ["%1%2", _processId, "_cam"], _cam];
missionNamespace setVariable [format ["%1%2", _processId, "_uav"], _uav];

missionNamespace setVariable [format ["%1%2", _btnNormal, "_uavId"], _camId];
missionNamespace setVariable [format ["%1%2", _btnNV, "_uavId"], _camId];
missionNamespace setVariable [format ["%1%2", _btnWarm, "_uavId"], _camId];

missionNamespace setVariable [format ["%1%2", _btnPlus, "_camId"], _camId];
missionNamespace setVariable [format ["%1%2", _btnMinus, "_camId"], _camId];

missionNamespace setVariable [format ["%1%2", _camId, "_cam"], _cam];
missionNamespace setVariable [format ["%1%2", _camId, "_fov"], 1];
missionNamespace setVariable [format ["%1%2", _camId, "_height"], 100];
missionNamespace setVariable [format ["%1%2", _camId, "_uav"], _uav];

missionNamespace setVariable [format ["%1%2", _processId, "_doMovement"], "true"];
[_uav, _cam, _processId, _camId, _textDirection, _textHeight] spawn sog_client_tablet_uav_fnc_doCamSim;