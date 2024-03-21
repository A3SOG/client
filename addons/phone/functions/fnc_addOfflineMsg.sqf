#include "script_component.hpp"

if (count _this == 0) exitwith {};

SOG_Phone_MSG = _this;
hint "You got a new message while you were away";