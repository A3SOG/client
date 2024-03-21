// [subDirName] call sog_client_os_fnc_getSubDirIdFromName
_subDirName = _this select 0;
_id = -1;

if (count (toArray _subDirName) > 0) then {
    _dirs = [SOG_CurrentDirId] call sog_client_os_fnc_getSubDirs;
    {
        if (_x select 0 == _subDirName) then {
            _didFind = true;
            _id = _x select 1;
        };
    } forEach _dirs;
};

_id;