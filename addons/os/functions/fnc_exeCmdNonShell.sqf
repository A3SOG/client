params ["_attach"];

if (_attach != "") then {
    _input = ctrlText 1400;
    ctrlSetText [1400, format ["%1%2 ", _input, _attach]];
    _return = [_attach] call sog_client_os_fnc_exeCmd;
    _return;
};