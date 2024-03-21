_ctrl = _this select 0;
_varName = "";

if (count _this > 1) then {
    _varName = _this select 1;
};

_var = missionNamespace getVariable format ["%1%2", str(_ctrl), _varName];

_var;