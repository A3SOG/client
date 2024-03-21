_pic = _this select 2;
_name = _this select 3;
_xAnpasser = _this select 4;

_icon = ["RscPicture", _pic, _this select 0, _this select 1, 4, 3] call sog_client_tablet_fnc_addCtrl;
_icon ctrlEnable true;

_winName = ["RscText", _name, (_this select 0) + _xAnpasser, (_this select 1) + 2.4, 4, 1.5] call sog_client_tablet_fnc_addCtrl;
_winName ctrlEnable true;

_return = [_icon, _winName];
_return;