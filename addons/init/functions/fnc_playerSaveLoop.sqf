#include "script_component.hpp"

/*
	@file Title: ArmaDragonflyClient Framework by Creedcoder, J.Schmidt
	@file Version: 0.1
	@file Name: fnc_firstLogin.sqf
	@file Author: Creedcoder, J.Schmidt
	@file edit: 03.25.2024
	Copyright © 2024 Creedcoder, J.Schmidt, All rights reserved

	Do not edit without permission!

	This work is licensed under the Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License.
	To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-nd/4.0/ or send a letter to Creative Commons,
	444 Castro Street, Suite 900, Mountain View, California, 94041, USA.

	Player Save Loop:
*/

waitUntil { !isNull player };
waitUntil { alive player };

while { true } do {
    sleep ((configFile >> "CfgPatches" >> "sog_client_main" >> "clientSaveLoopTime") call BIS_fnc_getCfgData);

	["Saving player...", "blue-grey", 3] call sog_client_misc_fnc_notify;
    [] call sog_client_init_fnc_playerDBSave;
};