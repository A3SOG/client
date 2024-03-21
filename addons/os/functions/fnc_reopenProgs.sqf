_progs = _this select 0;

{
    [format ["%1 %2 %3", (_x select 6) select 0, (_x select 7) select 0, (_x select 7) select 1]] call sog_client_os_exeCmdNonShell;
} forEach _progs;