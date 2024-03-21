#include "script_component.hpp"

params ["_index"];

closeDialog 0;

call compile (SOG_CurrentActionArray select _index);