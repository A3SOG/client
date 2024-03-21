_dirs = _this select 0;
_CRLF = toString [0x0D, 0x0A];
_dirList = "";

{
    // Current result is saved in variable _x
    if (_x select 4 == 1) then {
        _dirList = format ["%1%2#Dir# \%3\", _dirList, _CRLF, _x select 0];
    } else {
        _dirList = format ["%1%2# File # \%3", _dirList, _CRLF, _x select 0];
    };
} forEach _dirs;

_dirList;