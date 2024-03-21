ctrlSetText [2001, "got here"];
_arr = toArray (_this select 0);
_CRLF = toString [0x0D, 0x0A];
_lastTwo = [];
_lineBreaks = [];

{
    if (count _lastTwo == 0) then {
        _lastTwo set [0, _x];
    };
    if (count _lastTwo == 1) then {
        _lastTwo set [1, _x];
        if ((toString _lastTwo) == _CRLF) then {
            _lineBreaks set[count _lineBreaks, _forEachIndex];
        };
    };
    if (count _lastTwo == 2) then {
        _lastTwo set [0, _lastTwo select 1];
        _lastTwo set [1, _x];
    };
} forEach _arr;

ctrlSetText [2001, (toString _lineBreaks)];
cutText [(toString _lineBreaks), "PLAIN", 2];