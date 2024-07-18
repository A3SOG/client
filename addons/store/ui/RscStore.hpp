class RscStore {
    idd = 202302;
    objects[] = {};
    class controlsBackground {
        class RscStoreFrame: RscText {
            idc = -1;
            colorBackground[] = {0,0.25,0.5,1};
            x = "0.25 * safezoneW + safezoneX";
            y = "0.125 * safezoneH + safezoneY";
            w = "0.5 * safezoneW";
            h = "0.725 * safezoneH";
        };
        class RscStorePage: RscText {
            idc = -1;
            colorBackground[] = {1,1,1,1};
            x = "0.25 * safezoneW + safezoneX";
            y = "0.1575 * safezoneH + safezoneY";
            w = "0.5 * safezoneW";
            h = "0.6925 * safezoneH";
        };
        class RscStoreTitle: RscText {
            idc = 2023000;
            colorBackground[] = {0,0,0,0};
            colorText[] = {1,1,1,1};
            text = "";
            sizeEx = 0.025;
            x = "0.25 * safezoneW + safezoneX";
            y = "0.125 * safezoneH + safezoneY";
            w = "0.25 * safezoneW";
            h = "0.0325 * safezoneH";
        };
        class RscStoreProductDescription: RscStructuredText {
            idc = 2023001;
            sizeEx = 0.035;
            colorText[] = {0.1,0.1,0.1,1};
            text = "Description";
            x = "0.6125 * safezoneW + safezoneX";
            y = "0.5 * safezoneH + safezoneY";
            w = "0.1125 * safezoneW";
            h = "0.075 * safezoneH";
        };
        class RscStoreProductWindow: RscListBox {
            idc = 2023002;
            colorBackground[] = {0,0,0,0.25};
            onLBDblClick = "_this spawn sog_client_store_fnc_selectProduct;";
            x = "0.2775 * safezoneW + safezoneX";
            y = "0.2425 * safezoneH + safezoneY";
            w = "0.3225 * safezoneW";
            h = "0.5575 * safezoneH";
        };
        class RscStoreProductImage: RscPictureKeepAspect {
            idc = 2023003;
            colorBackground[] = {0.9,0,0,1};
            text = "";
            // style = "ST_MULTI + ST_TITLE_BAR + ST_KEEP_ASPECT_RATIO";
            x = "0.6125 * safezoneW + safezoneX";
            y = "0.6 * safezoneH + safezoneY";
            w = "0.1125 * safezoneW";
            h = "0.2 * safezoneH";
        };
    };

    class controls {
        class RscStoreButton: RscButton {
            idc = 1600;
            colorBackground[] = {0.9,0,0,1};
            colorBackgroundActive[] = {1,0,0,1};
            colorBorder[] = {0.9,0,0,1};
            colorBorderActive[] = {1,0,0,1};
            colorText[] = {1,1,1,1};
            action = "closeDialog 0;";
            text = "X";
            x = "0.73 * safezoneW + safezoneX";
            y = "0.125 * safezoneH + safezoneY";
            w = "0.02 * safezoneW";
            h = "0.0325 * safezoneH";
        };
        class RscStoreModFilterLB: RscCombo {
            idc = 2023004;
            onLBSelChanged = "_this spawn sog_client_store_fnc_modsetChange;";
            text = "FILTER BY MOD";
            x = "0.6125 * safezoneW + safezoneX";
            y = "0.3225 * safezoneH + safezoneY";
            w = "0.1125 * safezoneW";
            h = "0.0275 * safezoneH";
        };
        class RscStoreCategoryFilterLB: RscCombo {
            idc = 2023005;
            onLBSelChanged = "_this spawn sog_client_store_fnc_filterChange;";
            text = "FILTER BY CATEGORY";
            x = "0.6125 * safezoneW + safezoneX";
            y = "0.36 * safezoneH + safezoneY";
            w = "0.1125 * safezoneW";
            h = "0.0275 * safezoneH";
        };
        class RscStorePaymentMethodLB: RscCombo {
            idc = 2023006;
            onLBSelChanged = "_this spawn sog_client_store_fnc_selectPayment;";
            text = "SELECT PAYMENT METHOD";
            x = "0.6125 * safezoneW + safezoneX";
            y = "0.3975 * safezoneH + safezoneY";
            w = "0.1125 * safezoneW";
            h = "0.0275 * safezoneH";
        };
        class RscStoreSearchInput: RscEdit {
            idc = 2100;
            colorText[] = {0.1,0.1,0.1,1};
            text = "";
            x = "0.6125 * safezoneW + safezoneX";
            y = "0.205 * safezoneH + safezoneY";
            w = "0.075 * safezoneW";
            h = "0.025 * safezoneH";
        };
        class RscStoreButton1: RscButton {
            idc = 1601;
            action = "";
            soundClick[] = {"\A3\ui_f\data\sound\RscButton\soundClick",0.09,1};
            text = "SEARCH";
            x = "0.69 * safezoneW + safezoneX";
            y = "0.205 * safezoneH + safezoneY";
            w = "0.035 * safezoneW";
            h = "0.025 * safezoneH";
        };
        class RscStoreButton2: RscButton {
            idc = 1602;
            action = "_this spawn sog_client_store_fnc_storeBuy;";
            soundClick[] = {"\A3\ui_f\data\sound\RscButton\soundClick",0.09,1};
            text = "PURCHASE";
            x = "0.6125 * safezoneW + safezoneX";
            y = "0.2425 * safezoneH + safezoneY";
            w = "0.1125 * safezoneW";
            h = "0.0275 * safezoneH";
        };
        class RscStoreButton3: RscButton {
            idc = 1603;
            action = "closeDialog 0;";
            soundClick[] = {"\A3\ui_f\data\sound\RscButton\soundClick",0.09,1};
            text = "CANCEL";
            x = "0.6125 * safezoneW + safezoneX";
            y = "0.2825 * safezoneH + safezoneY";
            w = "0.1125 * safezoneW";
            h = "0.0275 * safezoneH";
        };
    };
};