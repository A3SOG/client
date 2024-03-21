_return = [];
{
    if str(_x select 1) == str(_this select 0) then {
        _return = _x;
    };
} forEach SOG_ActivePrograms;

_return;