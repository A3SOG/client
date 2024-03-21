#include "script_component.hpp"

private ["_h", "_m"];

_h = _this select 0;
_m = _this select 1;

_HHMM = [];

if (_h < 10) then {
	_HHMM = [format ["0%1", _h]];
} else {
	_HHMM = [format ["%1", _h]];
};

if (_m < 10) then {
	_HHMM = _HHMM + [format ["0%1", _m]];
} else {
	_HHMM = _HHMM + [format ["%1", _m]];
};

_HHMM;