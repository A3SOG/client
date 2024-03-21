class RscAdmin {
    idd = 202303;
    class Controls {
        class RscAdminFrame: RscText {
            idc = -1;
            colorBackground[] = {0,0.25,0.5,1};
            colorText[] = {1,1,1,1};
            text = "";
            x = "0.25 * safezoneW + safezoneX";
            y = "0.125 * safezoneH + safezoneY";
            w = "0.5 * safezoneW";
            h = "0.725 * safezoneH";
        };
        class RscAdminPage: RscText {
            idc = -1;
            colorBackground[] = {1,1,1,1};
            colorText[] = {0,0,0,1};
            text = "";
            x = "0.25 * safezoneW + safezoneX";
            y = "0.1575 * safezoneH + safezoneY";
            w = "0.5 * safezoneW";
            h = "0.6925 * safezoneH";
        };
        class RscAdminRefresh: RscButton {
            idc = -1;
            colorText[] = {1,1,1,1};
            action = "[""dummy""] call sog_client_admin_fnc_adminRefresh;";
            soundClick[] = {"\A3\ui_f\data\sound\RscButton\soundClick",0.09,1};
            text = "Refresh";
            x = "0.38625 * safezoneW + safezoneX";
            y = "0.2 * safezoneH + safezoneY";
            w = "0.05 * safezoneW";
            h = "0.0275 * safezoneH";
        };
        class RscAdminActive: RscText {
            idc = -1;
            colorBackground[] = {1,1,1,1};
            colorText[] = {0,0,0,1};
            text = "Active Operators: ";
            sizeEx = 0.035;
            x = "0.275 * safezoneW + safezoneX";
            y = "0.1775 * safezoneH + safezoneY";
            w = "0.1 * safezoneW";
            h = "0.05 * safezoneH";
        };
        class RscAdminUserList: RscListBox {
            idc = 2023001;
            x = "0.275 * safezoneW + safezoneX";
            y = "0.25 * safezoneH + safezoneY";
            w = "0.16125 * safezoneW";
            h = "0.555 * safezoneH";
            colorBackground[] = {0,0,0,0.25};
            tooltip = "Double Click to Activate an Operator Selection"; //--- ToDo: Localize;
        };
        class RscAdminCash: RscText {
            idc = -1;
            colorText[] = {0,0,0,1};
            text = "Company Account Balance:";
            sizeEx = 0.035;
            x = "0.575 * safezoneW + safezoneX";
            y = "0.2 * safezoneH + safezoneY";
            w = "0.075 * safezoneW";
            h = "0.05 * safezoneH";
        };
        class RscAdminCashSum: RscText {
            idc = 2023002;
            colorText[] = {0,0,0,1};
            text = "";
            sizeEx = 0.035;
            x = "0.65 * safezoneW + safezoneX";
            y = "0.2 * safezoneH + safezoneY";
            w = "0.075 * safezoneW";
            h = "0.05 * safezoneH";
        };
        class RscAdminRank: RscCombo {
            idc = 2023003;
            text = "SELECT RANK";
            x = "0.575 * safezoneW + safezoneX";
            y = "0.2775 * safezoneH + safezoneY";
            w = "0.1 * safezoneW";
            h = "0.0275 * safezoneH";
        };
        class RscAdminPromote: RscButton {
            idc = -1;
            colorText[] = {1,1,1,1};
            action = "['promote'] call sog_client_admin_fnc_adminPromote;";
            soundClick[] = {"\A3\ui_f\data\sound\RscButton\soundClick",0.09,1};
            text = "Promote";
            x = "0.675 * safezoneW + safezoneX";
            y = "0.2775 * safezoneH + safezoneY";
            w = "0.05 * safezoneW";
            h = "0.0275 * safezoneH";
            tooltip = "Promote the player currently selected."; //--- ToDo: Localize;
        };
        class RscAdminVal1: RscEdit {
            idc = 2023005;
            colorText[] = {0,0,0,1};
            text = "";
            x = "0.45 * safezoneW + safezoneX";
            y = "0.2 * safezoneH + safezoneY";
            w = "0.1125 * safezoneW";
            h = "0.0275 * safezoneH";
            tooltip = "Enter a dollar amount here"; //--- ToDo: Localize;
        };
        class RscAdminAdvance: RscButton {
            idc = -1;
            colorText[] = {1,1,1,1};
            action = "['advance'] call sog_client_admin_fnc_adminTransfer;";
            soundClick[] = {"\A3\ui_f\data\sound\RscButton\soundClick",0.09,1};
            text = "Advance";
            x = "0.45 * safezoneW + safezoneX";
            y = "0.25 * safezoneH + safezoneY";
            w = "0.05 * safezoneW";
            h = "0.0275 * safezoneH";
            tooltip = "Advance the amount in the box to the player currently selected."; //--- ToDo: Localize;
        };
        class RscAdminDeduct: RscButton {
            idc = -1;
            colorText[] = {1,1,1,1};
            action = "['deduct'] call sog_client_admin_fnc_adminTransfer;";
            soundClick[] = {"\A3\ui_f\data\sound\RscButton\soundClick",0.09,1};
            text = "Deduct";
            x = "0.5125 * safezoneW + safezoneX";
            y = "0.25 * safezoneH + safezoneY";
            w = "0.05 * safezoneW";
            h = "0.0275 * safezoneH";
            tooltip = "Deduct the amount in the box to the player currently selected."; //--- ToDo: Localize;
        };
        class RscAdminAdvanceAll: RscButton {
            idc = -1;
            colorText[] = {1,1,1,1};
            action = "['advanceAll'] call sog_client_admin_fnc_adminTransfer;";
            soundClick[] = {"\A3\ui_f\data\sound\RscButton\soundClick",0.09,1};
            text = "$10K To All";
            x = "0.45 * safezoneW + safezoneX";
            y = "0.3 * safezoneH + safezoneY";
            w = "0.05 * safezoneW";
            h = "0.0275 * safezoneH";
            tooltip = "Advance $10,000 to each connected player from the company budget."; //--- ToDo: Localize;
        };
        class RscAdminPayday: RscButton {
            idc = -1;
            colorText[] = {1,1,1,1};
            action = "['payday'] call sog_client_admin_fnc_adminTransfer;";
            soundClick[] = {"\A3\ui_f\data\sound\RscButton\soundClick",0.09,1};
            text = "Payday";
            x = "0.5125 * safezoneW + safezoneX";
            y = "0.3 * safezoneH + safezoneY";
            w = "0.05 * safezoneW";
            h = "0.0275 * safezoneH";
            tooltip = "Players Payday."; //--- ToDo: Localize;
        };
        class RscAdminVal2: RscEdit {
            idc = 2023006;
            x = "0.45 * safezoneW + safezoneX";
            y = "0.35 * safezoneH + safezoneY";
            w = "0.275 * safezoneW";
            h = "0.15 * safezoneH";
            style = "0x10";
            lineSpacing = 1;
            tooltip = "Type a message here."; //--- ToDo: Localize;
        };
        class RscAdminSend: RscButton {
            idc = -1;
            colorText[] = {1,1,1,1};
            action = "[] call sog_client_admin_fnc_adminMessage;";
            soundClick[] = {"\A3\ui_f\data\sound\RscButton\soundClick",0.09,1};
            text = "Send Message";
            x = "0.6125 * safezoneW + safezoneX";
            y = "0.525 * safezoneH + safezoneY";
            w = "0.1125 * safezoneW";
            h = "0.0275 * safezoneH";
            tooltip = "Select an operator from the list, type a message, and hit this button to send it, "; //--- ToDo: Localize;
        };
        class RscAdminExit: RscButton {
            idc = -1;
            colorBackground[] = {0.9,0,0,1};
            colorBackgroundActive[] = {1,0,0,1};
            colorFocused[] = {0.9,0,0,1};
            colorText[] = {1,1,1,1};
            action = "closeDialog 0;";
            soundClick[] = {"\A3\ui_f\data\sound\RscButton\soundClick",0.09,1};
            text = "X";
            x = "0.73 * safezoneW + safezoneX";
            y = "0.125 * safezoneH + safezoneY";
            w = "0.02 * safezoneW";
            h = "0.0325 * safezoneH";
        };
    };
};