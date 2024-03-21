params ["_processId", "_playerSelection"];

_active = missionNamespace getVariable format ["%1%2", _processId, "programActive"];

while { _active == "1" } do {
    sleep 5;

    lbClear _playerSelection;
    _allPlayers = [];
    {
        if (isPlayer _x) then {
            _allPlayers pushBack [_x, name _x];
            _playerSelection lbAdd (name _x);
        };
    } forEach playableUnits;

    missionNamespace setVariable [format ["%1%2", _playerSelection, "players"], _allPlayers];
    
    _active = missionNamespace getVariable format ["%1%2", _processId, "programActive"];
};