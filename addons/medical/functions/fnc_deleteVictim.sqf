/*
	Name:	sog_client_medical_fnc_deleteVictim
	Date:	8/6/2022
	Version: 1.0
	Author:  J. Schmidt

	Description:
	Delete victim.

	Parameter(s):
	0: The AI unit. <OBJECT>
*/
#include "script_component.hpp"

params ["_unit"];
_unit setDamage 1;
deleteVehicle _unit;