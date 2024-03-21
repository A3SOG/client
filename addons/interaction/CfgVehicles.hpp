class CfgVehicles {
    class Man;
    class CAManBase: Man {
        class ACE_SelfActions {
			class giveCash {
				displayName = "Give Cash";
				condition = "isPlayer cursorObject && (player distance cursorObject) <= 5";
				exceptions[] = {};
				statement = "[cursorObject] spawn sog_client_money_fnc_giveCash";
				icon = "";
			};
			class addContact {
				displayName = "Add Contact";
				condition = "isPlayer cursorObject && (player distance cursorObject) <= 5";
				exceptions[] = {};
				statement = "[cursorObject] spawn sog_client_phone_fnc_addContact";
				icon = "";
			};
			class openATM {
				displayName = "Access ATM";
				condition = "!(isNil {cursorObject getVariable 'isBank'}) && (player distance cursorObject) <= 5";
				exceptions[] = {};
				statement = "[cursorObject] spawn sog_client_bank_fnc_openBank";
				icon = "";
			};
			class openCPOF {
				displayName = "Access CPOF";
				condition = "!(isNil {cursorObject getVariable 'isCPOF'}) && (player distance cursorObject) <= 5";
				exceptions[] = {};
				statement = "[cursorObject] spawn sog_client_admin_fnc_openAdmin";
				icon = "";
			};
			class openGarage {
				displayName = "Open Garage";
				condition = "!(isNil {cursorObject getVariable 'isGarage'}) && (player distance cursorObject) <= 5 && SOG_Team_Coord == 0";
				exceptions[] = {};
				statement = "[cursorObject] spawn sog_client_garage_fnc_openGarage";
				icon = "";
			};
			class openGarage {
				displayName = "Open Garage";
				condition = "!(isNil {cursorObject getVariable 'isGarage'}) && (player distance cursorObject) <= 5 && SOG_Team_Coord == 1 && (getPlayerUID player) in companyGenerals";
				exceptions[] = {};
				statement = "[cursorObject] spawn sog_client_garage_fnc_openGarage";
				icon = "";
			};
			class openVirtualGarage {
				displayName = "Virtual Garage";
				condition = "!(isNil {cursorObject getVariable 'isGarage'}) && (player distance cursorObject) <= 5 && SOG_VA_Enable == 1 && SOG_Team_Coord == 0";
				exceptions[] = {};
				statement = "[cursorObject] spawn sog_client_armory_fnc_openGarage";
				icon = "";
			};
			class openVirtualGarage {
				displayName = "Virtual Garage";
				condition = "!(isNil {cursorObject getVariable 'isGarage'}) && (player distance cursorObject) <= 5 && SOG_VA_Enable == 1 && SOG_Team_Coord == 1 && (getPlayerUID player) in companyGenerals";
				exceptions[] = {};
				statement = "[cursorObject] spawn sog_client_armory_fnc_openGarage";
				icon = "";
			};
			class takeCash {
				displayName = "Take Cash";
				condition = "!(isNil {cursorObject getVariable 'isCash'}) && (player distance cursorObject) <= 5";
				exceptions[] = {};
				statement = "[cursorObject] spawn sog_client_money_fnc_takeCash";
				icon = "";
			};
			class openLocker {
				displayName = "Open Locker";
				condition = "!(isNil {cursorObject getVariable 'isLocker'}) && (player distance cursorObject) <= 5";
				exceptions[] = {};
				statement = "[cursorObject] spawn sog_client_locker_fnc_openLocker";
				icon = "";
			};
			class openVirtualArmory {
				displayName = "Virtual Armory";
				condition = "!(isNil {cursorObject getVariable 'isLocker'}) && (player distance cursorObject) <= 5 && SOG_VA_Enable == 1";
				exceptions[] = {};
				statement = "[cursorObject] spawn sog_client_armory_fnc_openArmory";
				icon = "";
			};
			class openStore {
				displayName = "Access Store";
				condition = "!(isNil {cursorObject getVariable 'isStore'}) && (player distance cursorObject) <= 5";
				exceptions[] = {};
				statement = "[cursorObject] spawn sog_client_store_fnc_openStore";
				icon = "";
			};
		};
	};
};