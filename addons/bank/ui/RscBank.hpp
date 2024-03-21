class RscBank {
    idd = 202300;
    class Controls {
        class RscBankFrame: RscText {
            idc = -1;
            colorBackground[] = {0,0.25,0.5,1};
            colorText[] = {1,1,1,1};
            text = "";
            x = "0.25 * safeZoneW + safeZoneX";
            y = "0.125 * safeZoneH + safeZoneY";
            w = "0.5 * safeZoneW";
            h = "0.725 * safeZoneH";
        };
        class RscBankPage: RscText {
            idc = -1;
            colorBackground[] = {1,1,1,1};
            colorText[] = {0,0,0,1};
            text = "";
            x = "0.25 * safeZoneW + safeZoneX";
            y = "0.1575 * safeZoneH + safeZoneY";
            w = "0.5 * safeZoneW";
            h = "0.6925 * safeZoneH";
        };
        class RscBankAccountNum: RscText {
            idc = 2023001;
            colorText[] = {0,0,0,1};
            text = "";
            style = "0x02";
            x = "0.4125 * safeZoneW + safeZoneX";
            y = "0.275 * safeZoneH + safeZoneY";
            w = "0.175 * safeZoneW";
            h = "0.05 * safeZoneH";
        };
        class RscBankBankSum: RscText {
            idc = 2023002;
            colorText[] = {0,0,0,1};
            text = "";
            style = "0x00";
            x = "0.4125 * safeZoneW + safeZoneX";
            y = "0.35 * safeZoneH + safeZoneY";
            w = "0.175 * safeZoneW";
            h = "0.05 * safeZoneH";
        };
        class RscBankCashSum: RscText {
            idc = 2023003;
            colorText[] = {0,0,0,1};
            text = "";
            style = "0x00";
            x = "0.4125 * safeZoneW + safeZoneX";
            y = "0.425 * safeZoneH + safeZoneY";
            w = "0.175 * safeZoneW";
            h = "0.05 * safeZoneH";
        };
        class RscBankPendingSum: RscText {
            idc = 2023000;
            colorText[] = {0,0,0,1};
            text = "";
            style = "0x00";
            x = "0.4125 * safeZoneW + safeZoneX";
            y = "0.5 * safeZoneH + safeZoneY";
            w = "0.1 * safeZoneW";
            h = "0.05 * safeZoneH";
        };
        class RscBankAmount: RscText {
            idc = -1;
            colorText[] = {0,0,0,1};
            text = "Amount";
            style = "0x00";
            x = "0.4125 * safeZoneW + safeZoneX";
            y = "0.575 * safeZoneH + safeZoneY";
            w = "0.075 * safeZoneW";
            h = "0.05 * safeZoneH";
        };
        class RscBankVal1: RscEdit {
            idc = 2023004;
            colorText[] = {0,0,0,1};
            text = "";
            x = "0.4875 * safeZoneW + safeZoneX";
            y = "0.575 * safeZoneH + safeZoneY";
            w = "0.1 * safeZoneW";
            h = "0.05 * safeZoneH";
        };
        class RscBankExit: RscButton {
            idc = -1;
            colorBackground[] = {0.9,0,0,1};
            colorBackgroundActive[] = {1,0,0,1};
            colorFocused[] = {0.9,0,0,1};
            colorText[] = {1,1,1,1};
            action = "closeDialog 0;";
            soundClick[] = {"\A3\ui_f\data\sound\RscButton\soundClick",0.09,1};
            text = "X";
            x = "0.73 * safeZoneW + safeZoneX";
            y = "0.125 * safeZoneH + safeZoneY";
            w = "0.02 * safeZoneW";
            h = "0.0325 * safeZoneH";
        };
        class RscBankWithdraw: RscButton {
            idc = 1600;
            colorText[] = {1,1,1,1};
            action = "ctrlEnable [1600, false]; [] call sog_client_bank_fnc_bankWithdraw;";
            soundClick[] = {"\A3\ui_f\data\sound\RscButton\soundClick",0.09,1};
            text = "Withdraw";
            x = "0.4125 * safeZoneW + safeZoneX";
            y = "0.65 * safeZoneH + safeZoneY";
            w = "0.075 * safeZoneW";
            h = "0.05 * safeZoneH";
        };
        class RscBankDeposit: RscButton {
            idc = 1601;
            colorText[] = {1,1,1,1};
            action = "ctrlEnable [1601, false]; [] call sog_client_bank_fnc_bankDeposit;";
            soundClick[] = {"\A3\ui_f\data\sound\RscButton\soundClick",0.09,1};
            text = "Deposit";
            x = "0.5125 * safeZoneW + safeZoneX";
            y = "0.65 * safeZoneH + safeZoneY";
            w = "0.075 * safeZoneW";
            h = "0.05 * safeZoneH";
        };
        class RscBankTime: RscButton {
            idc = 1602;
            colorText[] = {1,1,1,1};
            action = "ctrlEnable [1602, false]; [] call sog_client_bank_fnc_timeAndExpense;";
            soundClick[] = {"\A3\ui_f\data\sound\RscButton\soundClick",0.09,1};
            text = "Submit Paycheck";
            x = "0.5125 * safeZoneW + safeZoneX";
            y = "0.5 * safeZoneH + safeZoneY";
            w = "0.075 * safeZoneW";
            h = "0.05 * safeZoneH";
        };
    };
};