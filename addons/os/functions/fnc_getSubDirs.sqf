// [DirId] call sog_client_os_fnc_getSubDirs
_dirId = _this select 0;
_subDirIds = (SOG_FileSystem select _dirId) select 3;
_dirs = [];

{
    _curDir = SOG_FileSystem select _x;
    _dirs set [count _dirs, _curDir];
} forEach _subDirIds;

_dirs;