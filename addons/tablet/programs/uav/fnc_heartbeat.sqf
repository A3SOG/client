params ["_playerSelection", "_processId"];

missionNamespace setVariable [format ["%1%2", _processId, "programActive"], "1"];

_active = missionNamespace getVariable format ["%1%2", _processId, "programActive"];
while {_active == "1"} do {
    lbClear _playerSelection;
    _allDrones = [];
    {
        _name = getText(configFile >> "cfgVehicles" >> typeOf _x >> "DisplayName");
        //hint _name;
        if (typeOf _x == "B_UAV_01_F") then {
            _allDrones = _allDrones + [_x];
            _playerSelection lbAdd (_name);
        };
    } foreach vehicles;
    missionNamespace setVariable [format ["%1%2", _playerSelection, "allDrones"], _allDrones];
    sleep 1;
    _active = missionNamespace getVariable [format ["%1%2", _processId, "programActive"], "0"];
};