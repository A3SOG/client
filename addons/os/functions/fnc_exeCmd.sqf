params ["_cmd"];

_cmdWoParam = _this select 0;
_complCmd = _cmd;
_res = [];
_parameters = [_cmd] call sog_client_os_fnc_getParams;

if (count _params > 0) then {
    _cmd = _params select 0;
    _cmdWoParam = format ["%1 %2", _params select 0, _params select 1];
};

_cmds = ["cd", "ls", "time", "help", "open", "processes", "close"];
_cmdHelp = [
    "cd - change active directory 'cd [dirname]'",
    "ls - list files in active directory 'ls'",
    "time - show current time 'time'",
    "help - display this list 'help'",
    "open - open a given file 'open [filename] [parameters]'",
    "processes - show all active processes 'processes'",
    "close - closes a given process 'close [process id]' (process id can be found with processes command)"
];

switch (_cmd) do {
    case "processes": {
        _input = ctrlText 1400;
        _CRLF = toString [0x0D, 0x0A];
        _programs = "";

        {
            _programs = format ["%1%2%4# %3", _programs, _CRLF, _x select 2, _x select 1];
        } forEach SOG_ActivePrograms;

        _attach = format ["%1Open processes: %2%1%1%3", _CRLF, _programs, SOG_CurrentDirName];
        _return = _attach;

        ctrlSetText [1400, format ["%1%2 ", _input, _attach]];
    };
    case "close": {
        _input = ctrlText 1400;
        _CRLF = toString [0x0D, 0x0A];

        if (count _params > 1) then {
            _id = parseNumber format ["%1", _params select 1];
            _foundArray = [];
            _foundIndex = -1;

            {
                if (format ["%1", _id] == format ["%1", _x select 1]) then {
                    _foundIndex = _forEachIndex;
                    breakOut "";
                };
            } forEach SOG_ActivePrograms;

            if (_foundIndex != -1) then {
                _foundArray = SOG_ActivePrograms deleteAt _foundIndex;
                missionNamespace setVariable [format ["SOG_ActivePrograms"], SOG_ActivePrograms];
                call compile format ["[%2] call sog_client_tablet_%1_fnc_stop", _foundArray select 4, str(_id)];

                _attach = format ["%1Process %3 was closed.%1%1%2", _CRLF, SOG_CurrentDirName, _id];
                _return = _attach;

                ctrlSetText [1400, format ["%1%2 ", _input, _attach]];
            } else {
                _attach = format ["%1There is no process with id: %3.%1%1%2", _CRLF, SOG_CurrentDirName, _id];
                _return = _attach;

                ctrlSetText [1400, format ["%1%2 ", _input, _attach]];
            };
        } else {
            _attach = format ["%1Please also add a process id.%1%1%2", _CRLF, SOG_CurrentDirName];
            _return = _attach;

            ctrlSetText [1400, format ["%1%2 ", _input, _attach]];
        };
    };
    case "open": {
        _input = ctrlText 1400;
		_CRLF = toString [0x0D, 0x0A];

		if (count _params > 0) then {
			_filename = _params select 1;
			_file = [_fileName] call sog_client_os_fnc_getFileWName;

			if (count _file > 0) then {
				_attach = format ["%1Opening File: %2%1%1%3", _CRLF, _filename, SOG_CurrentDirName];
				_return = _attach;

				ctrlSetText [1400, format ["%1%2 ", _input, _attach]];

				if (count _file > 5) then {
					if (_file select 6 == "video") then {
						_handle = [_file, count SOG_ActivePrograms] call sog_client_tablet_player_fnc_start;
						SOG_ActivePrograms set [count SOG_ActivePrograms, [_handle, count SOG_ActivePrograms, format ["%1", _file select 0], format ["%1", _file select 1], format ["%1", "player"]]];
					};
					if (_file select 6 == "exe") then {
                        _handle = [_params, count SOG_ActivePrograms, _file select 0] spawn (format ["%1", _file select 5]);
                        SOG_ActivePrograms set [count SOG_ActivePrograms, [_handle, count SOG_ActivePrograms, format ["%1", _file select 0], format ["%1", _file select 1], format ["%1", _file select 7], _file, [_cmdWoParam]]];
                    } else {
                        switch (_file select 6) do {
                            case "uav": {
                                _handle = [_file, count SOG_ActivePrograms] call sog_client_tablet_uav_fnc_start;
                            };
                            case "frontCam": {
                                _handle = [_file, count SOG_ActivePrograms] call sog_client_tablet_frontCam_fnc_start;
                            };
                            case "bodyCam": {
                                _handle = [_file, count SOG_ActivePrograms] call sog_client_tablet_bodyCam_fnc_start;
                            };
                            case "bft": {
                                _handle = [_file, count SOG_ActivePrograms] call sog_client_tablet_bft_fnc_start;
                            };
                            case "mdt": {
                                _handle = [_file, count SOG_ActivePrograms] call sog_client_tablet_mdt_fnc_start;
                            };
                        };
                        if (!isNil "_handle") then {
                            SOG_ActivePrograms set [count SOG_ActivePrograms, [_handle, count SOG_ActivePrograms, format ["%1", _file select 0], format ["%1", _file select 1], format ["%1", _file select 6]]];
                        };
                    };
					if (_file select 6 == "picture") then {
						_handle = [_file, count SOG_ActivePrograms] call sog_client_tablet_gallery_fnc_start;
						SOG_ActivePrograms set [count SOG_ActivePrograms, [_handle, count SOG_ActivePrograms, format ["%1", _file select 0], format ["%1", _file select 1], format ["%1", "player"]]];
					};
				} else {
					_attach = format ["%1Error: Could not open file. (File is empty)%1%1%3", _CRLF, _filename, SOG_CurrentDirName];
					_return = _attach;

					ctrlSetText [1400, format ["%1%2 ", _input, _attach]];
				};
			} else {
				_attach = format ["%1Error: No such file in this directory.%1%1%3", _CRLF, _filename, SOG_CurrentDirName];
				_return = _attach;

				ctrlSetText [1400, format ["%1%2 ", _input, _attach]];
			};
		} else {
			_attach = format ["%1Please also add a Filename.%1%1%3", _CRLF, _filename, SOG_CurrentDirName];
			_return = _attach;

			ctrlSetText [1400, format ["%1%2 ", _input, _attach]];
		};
    };
    case "help": {
        _input = ctrlText 1400;
        _CRLF = toString [0x0D, 0x0A];
        
        _toReturn = [_cmdHelp] call sog_client_os_fnc_genListFromArray;

        _attach = format ["%1Available Commands are:%2%1%1%3", _CRLF, _toReturn, SOG_CurrentDirName];
        _return = _attach;

        ctrlSetText [1400, format ["%1%2 ", _input, _attach]];
    };
    default { };
};