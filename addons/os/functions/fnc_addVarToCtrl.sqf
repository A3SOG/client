_ctrl = _this select 0;
_var = _this select 1;
_varName = "";

if (count _this > 2) then {
    _varName = _this select 2;
};

missionNamespace setVariable [format ["%1%2", str(_ctrl), _varName], _var];