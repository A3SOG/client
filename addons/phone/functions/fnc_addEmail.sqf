#include "script_component.hpp"

if (_this isEqualTo [""]) exitWith {};

private _tmp = call compile format ["%1", _this];
if ((typeName _tmp) isEqualTo "SCALAR") exitWith {};

SOG_Email = _this;