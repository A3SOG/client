#include "script_component.hpp"

SOG_Team_Coord = "TEAM_COORD" call BIS_fnc_getParamValue;
SOG_VA_Enable = "VA_ENABLE" call BIS_fnc_getParamValue;

SOG_InteractionButtons = [1600, 1601, 1602, 1603, 1604, 1605, 1606, 1607, 1608];

SOG_InteractionItems = [
	[
		["isPlayer cursorObject", "(player distance cursorObject) <= 5"],
		["Give Cash", "[cursorObject] spawn sog_client_money_fnc_giveCash"]
	],
	[
		["isPlayer cursorObject", "(player distance cursorObject) <= 5"],
		["Add Contact", "[cursorObject] call sog_client_phone_fnc_addContact"]
	],
	[
		["!(isNil {
			cursorObject getVariable 'isBank'
		})", "(player distance cursorObject) <= 5"],
		["Access ATM", "[cursorObject] spawn sog_client_bank_fnc_openBank"]
	],
	[
		["!(isNil {
			cursorObject getVariable 'isCPOF'
		})", "(player distance cursorObject) <= 5 && (getPlayerUID player) in companyGenerals"],
		["Access CPOF", "[cursorObject] spawn sog_client_admin_fnc_openAdmin"]
	],
	[
		["!(isNil {
			cursorObject getVariable 'isCash'
		})", "(player distance cursorObject) <= 5"],
		["Take Cash", "[cursorObject] spawn sog_client_money_fnc_takeCash"]
	],
	[
		["!(isNil {
			cursorObject getVariable 'isLocker'
		})", "(player distance cursorObject) <= 5"],
		["Open Locker", "[cursorObject] spawn sog_client_locker_fnc_openLocker"]
	],
	[
		["!(isNil {
			cursorObject getVariable 'isStore'
		})", "(player distance cursorObject) <= 5"],
		["Access the Store", "[cursorObject] spawn sog_client_store_fnc_openStore"]
	]
];

if (SOG_Team_Coord == 1) then {
	SOG_InteractionItems append [
		[
			["!(isNil {
				cursorObject getVariable 'isGarage'
			})", "(player distance cursorObject) <= 5 && (getPlayerUID player) in companyGenerals"],
			["Open Company Garage", "[cursorObject] spawn sog_client_garage_fnc_openGarage"]
		]
	];
} else {
	SOG_InteractionItems append [
		[
			["!(isNil {
				cursorObject getVariable 'isGarage'
			})", "(player distance cursorObject) <= 5"],
			["Open Garage", "[cursorObject] spawn sog_client_garage_fnc_openGarage"]
		]
	];
};

if (SOG_VA_Enable == 1) then {
	SOG_InteractionItems append [
		[
			["!(isNil {
				cursorObject getVariable 'isLocker'
			})", "(player distance cursorObject) <= 5"],
			["Virtual Armory", "[] spawn sog_client_armory_fnc_openArmory"]
		],
		[
			["!(isNil {
				cursorObject getVariable 'isGarage'
			})", "(player distance cursorObject) <= 5"],
			["Virtual Garage", "[cursorObject] spawn sog_client_armory_fnc_openGarage"]
		]
	];
};