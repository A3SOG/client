/*lastInsert = [string] call fnc_getLastInsert
    Example:
    awdlkawlkawd cd
    dc dwaklwakldwa
    dc
cd */

// alles am anfang trimmen
private "_arr";
_arr = toArray (_this select 0);
reverse _arr;
_break = false;
_foundLetter = false;
_i = 0;

while { (_i < ((count _arr)-1)) and (!_break) } do {
    _curChar = str (_arr select _i);
    if ((!_foundLetter) and ((str (_arr select _i) != "32"))) then {
        _foundLetter = true;
    };
    if ((str (_arr select _i) == "13") and _foundLetter) then {
        _break = true;
        // found space
    };
    _i = _i + 1;
};

_arr resize _i - 1;

_break = false;
_foundLetter = false;
_i = 0;
_lastFound = 0;
while { (_i < ((count _arr)-1)) and (!_break) } do {
    _curChar = str (_arr select _i);
    if ((!_foundLetter) and ((str (_arr select _i) != "32"))) then {
        _foundLetter = true;
    };
    if ((str (_arr select _i) == "32") and _foundLetter) then {
        _lastFound = _i;
        // found space
    };
    _i = _i + 1;
};
_arr resize _lastFound;
reverse _arr;

/*// leerzeichen am ende trimmen
_i = 0;
_break = false;
while { (_i < ((count _arr)-1)) and (!_break) } do {
    _curChar = str (_arr select _i);
    if ((_curChar == "32")) then {
        _break = true;
    };
    _i = _i + 1;
};

if (_break) then {
    _arr resize _i - 1;
};*/
toString _arr;