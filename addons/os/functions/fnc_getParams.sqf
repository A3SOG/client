params ["_cmd"];

_arr = toArray _cmd;
_i = 0;
_lastFoundIndex = 0;
_isFirst = true;
_parameters = [];

while { _i < count _arr } do {
    if (str(_arr select _i) == "32") then {
        if (_isFirst) then {
            _isFirst = false;
            _lastFoundIndex = _i;
            _params set [count _params, toString (_arr select[0, _i])];
        } else {
            _params set [count _params, toString (_arr select[_lastFoundIndex + 1, _i - _lastFoundIndex - 1])];
            _lastFoundIndex = _i;
        };
    };
    if ((_i + 1 == count _arr) && count _params > 0) then {
        _params set [count _params, toString (_arr select[_lastFoundIndex + 1, _i - _lastFoundIndex])];
    };

    _i = _i + 1;
};

_params;