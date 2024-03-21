_arr = _this select 0;
_CRLF = toString [0x0D, 0x0A];
_arrList = "";

{
    _arrList = format ["%1%2%3", _arrList, _CRLF, _x];
} forEach _arr;

_arrList;