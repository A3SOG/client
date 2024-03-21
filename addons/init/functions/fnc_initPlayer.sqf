waitUntil { !isNull player; };
waitUntil { player == player; };
waitUntil { alive player; };

cutText ["Loading In...", "BLACK", 1];

player setVariable ["SOG_Holster", [], true];
player setVariable ["SOG_Holstered", 0, true];

value_loadDone = false;
[getPlayerUID player, vehicle player, "sog_client_init_fnc_playerDBLoad", true] remoteExec ["db_fnc_load", 2, false];
waitUntil { value_loadDone };

true spawn {
	while { true } do {
		waitUntil { sleep 1; alive player };
		sleep ((configFile >> "CfgPatches" >> "sog_client_main" >> "clientSaveLoopTime") call BIS_fnc_getCfgData);
		waitUntil { isNull (findDisplay 9001) };
		[] spawn sog_client_init_fnc_playerDBSave;
	};
};

cutText ["", "PLAIN", 1];

[] spawn sog_client_interaction_fnc_initInteraction;

waitUntil {
	uiSleep 0.01;
	!(isNull (findDisplay 46))
};

(findDisplay 46) displayAddEventHandler ["KeyDown", {
	switch (_this select 1) do {
		// Interaction Interface (default key TAB)
		case ((configFile >> "CfgPatches" >> "sog_client_main" >> "interactionKey") call BIS_fnc_getCfgData): {
			[] call sog_client_interaction_fnc_openInteraction;
			false;
		};
		// Holster/Unholster (default key H)
		case ((configFile >> "CfgPatches" >> "sog_client_main" >> "holsterKey") call BIS_fnc_getCfgData): {
			[] call sog_client_misc_fnc_holster;
			false;
		};
		// Open Phone (default key ScrLck)
		case ((configFile >> "CfgPatches" >> "sog_client_main" >> "phoneKey") call BIS_fnc_getCfgData): {
			[] spawn sog_client_phone_fnc_openPhone;
			false;
		};
		default {
			false;
		};
	};
}];