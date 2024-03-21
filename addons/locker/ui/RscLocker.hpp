class RscLocker {
    idd = 202301;
    class Controls {
        class RscLockerBG: RscText {
            idc = 1800;
            x = "0.25 * safeZoneW + safeZoneX";
            y = "0.25 * safeZoneH + safeZoneY";
            w = "0.5 * safeZoneW";
            h = "0.4125 * safeZoneH";
            colorBackground[] = {0,0,0,0.8};
        };
        class RscLockerBtn: RscButton {
            idc = 1600;
            text = "Equip";
            x = "0.4625 * safeZoneW + safeZoneX";
            y = "0.425 * safeZoneH + safeZoneY";
            w = "0.075 * safeZoneW";
            h = "0.05 * safeZoneH";
            colorText[] = {1,1,1,1};
            colorBackground[] = {0,0,0,1};
            colorActive[] = {0,0,0,1};
            action = "ctrlEnable [1600, false]; [] call sog_client_locker_fnc_equipLocker;";
        };
        class RscLockerBtn1: RscButton {
            idc = 1601;
            text = "Store";
            x = "0.4625 * safeZoneW + safeZoneX";
            y = "0.5 * safeZoneH + safeZoneY";
            w = "0.075 * safeZoneW";
            h = "0.05 * safeZoneH";
            colorText[] = {1,1,1,1};
            colorBackground[] = {0,0,0,1};
            colorActive[] = {0,0,0,1};
            action = "ctrlEnable [1601, false]; [] call sog_client_locker_fnc_storeLocker;";
        };
        class RscLockerTxtPlayer: RscText {
            idc = 1001;
            text = "";
            x = "0.275 * safeZoneW + safeZoneX";
            y = "0.295 * safeZoneH + safeZoneY";
            w = "0.175 * safeZoneW";
            h = "0.05 * safeZoneH";
        };
        class RscLockerLBPlayer: RscListBox {
            idc = 1501;
            x = "0.275 * safeZoneW + safeZoneX";
            y = "0.3675 * safeZoneH + safeZoneY";
            w = "0.175 * safeZoneW";
            h = "0.25 * safeZoneH";
        };
        class RscLockerTxtLocker: RscText {
            idc = 1000;
            text = "";
            x = "0.55 * safeZoneW + safeZoneX";
            y = "0.295 * safeZoneH + safeZoneY";
            w = "0.175 * safeZoneW";
            h = "0.05 * safeZoneH";
        };
        class RscLockerLBLocker: RscListBox {
            idc = 1500;
            x = "0.55 * safeZoneW + safeZoneX";
            y = "0.3675 * safeZoneH + safeZoneY";
            w = "0.175 * safeZoneW";
            h = "0.25 * safeZoneH";
        };
    };
};