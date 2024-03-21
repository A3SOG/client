_text = _this select 0;
_headerText = _this select 1;
_newWin = [5, 5, 20, 12, _headerText] call sog_client_tablet_fnc_drawWindow;
_textRsc = ["RscText", _text, 0, 0, 10, 5] call sog_client_tablet_fnc_addCtrl;

[_newWin select 0, _textRsc, [0, 0, 20, 10.5]] call sog_client_tablet_fnc_addCtrlToWin;