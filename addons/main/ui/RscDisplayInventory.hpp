class RscDisplayInventory {
	class controls {
		class CA_ContainerBackground: RscText
		{
			idc = 1001;

			x = "-2.8 * safeZoneW + safeZoneX";
			y = "1 * safeZoneH + safeZoneY";
			w = "14.4 * safeZoneW";
			h = "23 * safeZoneH";
			colorBackground[] = {0.05,0.05,0.05,0.7};
		};
		class CA_PlayerBackground: RscText
		{
			idc = 1002;

			x = "13.52 * safeZoneW + safeZoneX";
			y = "2 * safeZoneH + safeZoneY";
			w = "29.28 * safeZoneW";
			h = "22 * safeZoneH";
			colorBackground[] = {0.05,0.05,0.05,0.7};
		};
		class TitleBackground: RscText
		{
			idc = 1020;

			x = "13.52 * safeZoneW + safeZoneX";
			y = "1 * safeZoneH + safeZoneY";
			w = "29.28 * safeZoneW";
			h = "1 * safeZoneH";
			colorBackground[] = {0.1,0.1,0.1,1};
		};
		class PlayersName: RscText
		{
			idc = 111;

			text = "Player name:"; //--- ToDo: Localize;
			x = "14.72 * safeZoneW + safeZoneX";
			y = "1 * safeZoneH + safeZoneY";
			w = "23.76 * safeZoneW";
			h = "1 * safeZoneH";
		};
		class RankBackground: RscText
		{
			idc = 1014;

			x = "14.12 * safeZoneW + safeZoneX";
			y = "1.25 * safeZoneH + safeZoneY";
			w = "0.72 * safeZoneW";
			h = "0.6 * safeZoneH";
			colorBackground[] = {1,1,1,0.2};
		};
		class RankPicture: RscPicture
		{
			idc = 1203;

			text = "\A3\Ui_f\data\GUI\Cfg\Ranks\corporal_gs.paa";
			x = "14.12 * safeZoneW + safeZoneX";
			y = "1.25 * safeZoneH + safeZoneY";
			w = "0.72 * safeZoneW";
			h = "0.6 * safeZoneH";
		};
		class ButtonBack: RscActiveText
		{
			idc = 2;
			style = 48;
			color[] = {1,1,1,0.7};

			text = "\A3\Ui_f\data\GUI\Rsc\RscDisplayArcadeMap\icon_exit_cross_ca.paa"; //--- ToDo: Localize;
			x = "41.6 * safeZoneW + safeZoneX";
			y = "1 * safeZoneH + safeZoneY";
			w = "1.2 * safeZoneW";
			h = "1 * safeZoneH";
			colorText[] = {1,1,1,0.7};
			colorActive[] = {1,1,1,1};
			tooltip = "Close"; //--- ToDo: Localize;
		};
		class BackgroundSlotPrimary: RscPicture
		{
			idc = 1242;

			text = "#(argb,8,8,3)color(1,1,1,1)";
			x = "27.92 * safeZoneW + safeZoneX";
			y = "6 * safeZoneH + safeZoneY";
			w = "14.28 * safeZoneW";
			h = "3 * safeZoneH";
		};
		class BackgroundSlotPrimaryMuzzle: BackgroundSlotPrimary
		{
			idc = 1243;

			text = "#(argb,8,8,3)color(1,1,1,1)";
			x = "27.92 * safeZoneW + safeZoneX";
			y = "9.1 * safeZoneH + safeZoneY";
			w = "2.28 * safeZoneW";
			h = "2 * safeZoneH";
		};
		class BackgroundSlotPrimaryUnderBarrel: BackgroundSlotPrimary
		{
			idc = 1200;

			text = "#(argb,8,8,3)color(1,1,1,1)";
			x = "30.32 * safeZoneW + safeZoneX";
			y = "9.1 * safeZoneH + safeZoneY";
			w = "2.28 * safeZoneW";
			h = "2 * safeZoneH";
		};
		class BackgroundSlotPrimaryFlashlight: BackgroundSlotPrimary
		{
			idc = 1244;

			text = "#(argb,8,8,3)color(1,1,1,1)";
			x = "32.72 * safeZoneW + safeZoneX";
			y = "9.2 * safeZoneH + safeZoneY";
			w = "2.28 * safeZoneW";
			h = "2 * safeZoneH";
		};
		class BackgroundSlotPrimaryOptics: BackgroundSlotPrimary
		{
			idc = 1245;

			text = "#(argb,8,8,3)color(1,1,1,1)";
			x = "35.12 * safeZoneW + safeZoneX";
			y = "9.1 * safeZoneH + safeZoneY";
			w = "2.28 * safeZoneW";
			h = "2 * safeZoneH";
		};
		class BackgroundSlotPrimaryMagazineGL: BackgroundSlotPrimary
		{
			idc = 1267;

			text = "#(argb,8,8,3)color(1,1,1,1)";
			x = "37.52 * safeZoneW + safeZoneX";
			y = "9.1 * safeZoneH + safeZoneY";
			w = "2.28 * safeZoneW";
			h = "2 * safeZoneH";
		};
		class BackgroundSlotPrimaryMagazine: BackgroundSlotPrimary
		{
			idc = 1246;

			text = "#(argb,8,8,3)color(1,1,1,1)";
			x = "39.92 * safeZoneW + safeZoneX";
			y = "9.1 * safeZoneH + safeZoneY";
			w = "2.28 * safeZoneW";
			h = "2 * safeZoneH";
		};
		class BackgroundSlotSecondary: BackgroundSlotPrimary
		{
			idc = 1247;

			text = "#(argb,8,8,3)color(1,1,1,1)";
			x = "27.92 * safeZoneW + safeZoneX";
			y = "11.5 * safeZoneH + safeZoneY";
			w = "14.28 * safeZoneW";
			h = "3 * safeZoneH";
		};
		class BackgroundSlotSecondaryMuzzle: BackgroundSlotPrimary
		{
			idc = 1248;

			text = "#(argb,8,8,3)color(1,1,1,1)";
			x = "27.92 * safeZoneW + safeZoneX";
			y = "14.6 * safeZoneH + safeZoneY";
			w = "2.76 * safeZoneW";
			h = "2 * safeZoneH";
		};
		class BackgroundSlotSecondaryUnderBarrel: BackgroundSlotPrimary
		{
			idc = 1266;

			text = "#(argb,8,8,3)color(1,1,1,1)";
			x = "30.8 * safeZoneW + safeZoneX";
			y = "14.6 * safeZoneH + safeZoneY";
			w = "2.76 * safeZoneW";
			h = "2 * safeZoneH";
		};
		class BackgroundSlotSecondaryFlashlight: BackgroundSlotPrimary
		{
			idc = 1249;

			text = "#(argb,8,8,3)color(1,1,1,1)";
			x = "33.68 * safeZoneW + safeZoneX";
			y = "14.6 * safeZoneH + safeZoneY";
			w = "2.76 * safeZoneW";
			h = "2 * safeZoneH";
		};
		class BackgroundSlotSecondaryOptics: BackgroundSlotPrimary
		{
			idc = 1250;

			text = "#(argb,8,8,3)color(1,1,1,1)";
			x = "36.56 * safeZoneW + safeZoneX";
			y = "14.6 * safeZoneH + safeZoneY";
			w = "2.76 * safeZoneW";
			h = "2 * safeZoneH";
		};
		class BackgroundSlotSecondaryMagazine: BackgroundSlotPrimary
		{
			idc = 1251;

			text = "#(argb,8,8,3)color(1,1,1,1)";
			x = "39.44 * safeZoneW + safeZoneX";
			y = "14.6 * safeZoneH + safeZoneY";
			w = "2.76 * safeZoneW";
			h = "2 * safeZoneH";
		};
		class BackgroundSlotHandgun: BackgroundSlotPrimary
		{
			idc = 1252;

			text = "#(argb,8,8,3)color(1,1,1,1)";
			x = "27.92 * safeZoneW + safeZoneX";
			y = "17 * safeZoneH + safeZoneY";
			w = "14.28 * safeZoneW";
			h = "3 * safeZoneH";
		};
		class BackgroundSlotHandgunMuzzle: BackgroundSlotPrimary
		{
			idc = 1253;

			text = "#(argb,8,8,3)color(1,1,1,1)";
			x = "27.92 * safeZoneW + safeZoneX";
			y = "20.1 * safeZoneH + safeZoneY";
			w = "2.76 * safeZoneW";
			h = "2 * safeZoneH";
		};
		class BackgroundSlotHandgunUnderBarrel: BackgroundSlotPrimary
		{
			idc = 1268;

			text = "#(argb,8,8,3)color(1,1,1,1)";
			x = "30.8 * safeZoneW + safeZoneX";
			y = "20.1 * safeZoneH + safeZoneY";
			w = "2.76 * safeZoneW";
			h = "2 * safeZoneH";
		};
		class BackgroundSlotHandgunFlashlight: BackgroundSlotPrimary
		{
			idc = 1254;

			text = "#(argb,8,8,3)color(1,1,1,1)";
			x = "33.68 * safeZoneW + safeZoneX";
			y = "20.1 * safeZoneH + safeZoneY";
			w = "2.76 * safeZoneW";
			h = "2 * safeZoneH";
		};
		class BackgroundSlotHandgunOptics: BackgroundSlotPrimary
		{
			idc = 1255;

			text = "#(argb,8,8,3)color(1,1,1,1)";
			x = "36.56 * safeZoneW + safeZoneX";
			y = "20.1 * safeZoneH + safeZoneY";
			w = "2.76 * safeZoneW";
			h = "2 * safeZoneH";
		};
		class BackgroundSlotHandgunMagazine: BackgroundSlotPrimary
		{
			idc = 1256;

			text = "#(argb,8,8,3)color(1,1,1,1)";
			x = "39.44 * safeZoneW + safeZoneX";
			y = "20.1 * safeZoneH + safeZoneY";
			w = "2.76 * safeZoneW";
			h = "2 * safeZoneH";
		};
		class BackgroundSlotHeadgear: BackgroundSlotPrimary
		{
			idc = 1257;

			text = "#(argb,8,8,3)color(1,1,1,1)";
			x = "27.92 * safeZoneW + safeZoneX";
			y = "2.5 * safeZoneH + safeZoneY";
			w = "3.48 * safeZoneW";
			h = "2.9 * safeZoneH";
		};
		class BackgroundSlotGoggles: BackgroundSlotPrimary
		{
			idc = 1258;

			text = "#(argb,8,8,3)color(1,1,1,1)";
			x = "31.52 * safeZoneW + safeZoneX";
			y = "2.5 * safeZoneH + safeZoneY";
			w = "3.48 * safeZoneW";
			h = "2.9 * safeZoneH";
		};
		class BackgroundSlotHMD: BackgroundSlotPrimary
		{
			idc = 1259;

			text = "#(argb,8,8,3)color(1,1,1,1)";
			x = "35.12 * safeZoneW + safeZoneX";
			y = "2.5 * safeZoneH + safeZoneY";
			w = "3.48 * safeZoneW";
			h = "2.9 * safeZoneH";
		};
		class BackgroundSlotBinoculars: BackgroundSlotPrimary
		{
			idc = 1260;

			text = "#(argb,8,8,3)color(1,1,1,1)";
			x = "38.72 * safeZoneW + safeZoneX";
			y = "2.5 * safeZoneH + safeZoneY";
			w = "3.48 * safeZoneW";
			h = "2.9 * safeZoneH";
		};
		class BackgroundSlotMap: BackgroundSlotPrimary
		{
			idc = 1261;

			text = "#(argb,8,8,3)color(1,1,1,1)";
			x = "14.12 * safeZoneW + safeZoneX";
			y = "20.1 * safeZoneH + safeZoneY";
			w = "2.544 * safeZoneW";
			h = "2 * safeZoneH";
		};
		class BackgroundSlotGPS: BackgroundSlotPrimary
		{
			idc = 1262;

			text = "#(argb,8,8,3)color(1,1,1,1)";
			x = "16.78 * safeZoneW + safeZoneX";
			y = "20.1 * safeZoneH + safeZoneY";
			w = "2.544 * safeZoneW";
			h = "2 * safeZoneH";
		};
		class BackgroundSlotCompass: BackgroundSlotPrimary
		{
			idc = 1263;

			text = "#(argb,8,8,3)color(1,1,1,1)";
			x = "22.11 * safeZoneW + safeZoneX";
			y = "20.1 * safeZoneH + safeZoneY";
			w = "2.544 * safeZoneW";
			h = "2 * safeZoneH";
		};
		class BackgroundSlotRadio: BackgroundSlotPrimary
		{
			idc = 1264;

			text = "#(argb,8,8,3)color(1,1,1,1)";
			x = "19.45 * safeZoneW + safeZoneX";
			y = "20.1 * safeZoneH + safeZoneY";
			w = "2.544 * safeZoneW";
			h = "2 * safeZoneH";
		};
		class BackgroundSlotWatch: BackgroundSlotPrimary
		{
			idc = 1265;

			text = "#(argb,8,8,3)color(1,1,1,1)";
			x = "24.78 * safeZoneW + safeZoneX";
			y = "20.1 * safeZoneH + safeZoneY";
			w = "2.544 * safeZoneW";
			h = "2 * safeZoneH";
		};
		class ExternalContainerBackground: RscPicture
		{
			idc = 1240;

			text = "#(argb,8,8,3)color(1,1,1,1)";
			x = "-2.2 * safeZoneW + safeZoneX";
			y = "3.7 * safeZoneH + safeZoneY";
			w = "13.2 * safeZoneW";
			h = "18.4 * safeZoneH";
			colorText[] = {1,1,1,0.1};
		};
		class PlayerContainerBackground: ExternalContainerBackground
		{
			idc = 1241;

			text = "#(argb,8,8,3)color(1,1,1,1)";
			x = "14.12 * safeZoneW + safeZoneX";
			y = "6 * safeZoneH + safeZoneY";
			w = "13.2 * safeZoneW";
			h = "14 * safeZoneH";
			colorText[] = {1,1,1,0.1};
		};
		class GroundTab: RscActiveText
		{
			idc = 6321;
			colorBackgroundSelected[] = {1,1,1,1};
			colorFocused[] = {1,1,1,0};
			soundDoubleClick[] = {"",0.1,1};
			color[] = {1,1,1,1};

			x = "-2.2 * safeZoneW + safeZoneX";
			y = "1.5 * safeZoneH + safeZoneY";
			w = "6.6 * safeZoneW";
			h = "1 * safeZoneH";
			colorBackground[] = {0,0,0,1};
		};
		class SoldierTab: GroundTab
		{
			idc = 6401;

			x = "4.4 * safeZoneW + safeZoneX";
			y = "1.5 * safeZoneH + safeZoneY";
			w = "6.6 * safeZoneW";
			h = "1 * safeZoneH";
			colorBackground[] = {0,0,0,1};
		};
		class GroundContainer: RscListBox
		{
			idc = 632;
			sizeEx2 = "0.8 * 			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
			rowHeight = "2 * 			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
			canDrag = 1;
			itemBackground[] = {1,1,1,0.1};
			itemSpacing = 0.001;

			x = "-2.2 * safeZoneW + safeZoneX";
			y = "3.7 * safeZoneH + safeZoneY";
			w = "13.2 * safeZoneW";
			h = "18.4 * safeZoneH";
			colorBackground[] = {0,0,0,0};
			sizeEx = "0.8 * 			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * safeZoneH";
		};
		class SoldierContainer: GroundContainer
		{
			idc = 640;

			x = "-2.2 * safeZoneW + safeZoneX";
			y = "3.7 * safeZoneH + safeZoneY";
			w = "13.2 * safeZoneW";
			h = "18.4 * safeZoneH";
			colorBackground[] = {0,0,0,0};
			sizeEx = "0.8 * 			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * safeZoneH";
		};
		class GroundFilter: RscCombo
		{
			idc = 6554;

			x = "-2.2 * safeZoneW + safeZoneX";
			y = "2.6 * safeZoneH + safeZoneY";
			w = "13.2 * safeZoneW";
			h = "1 * safeZoneH";
		};
		class GroundLoad: RscProgress
		{
			idc = 6307;
			texture = "";
			textureExt = "";
			colorBar[] = {0.9,0.9,0.9,0.9};
			colorExtBar[] = {1,1,1,1};
			colorFrame[] = {1,1,1,1};

			x = "-2.2 * safeZoneW + safeZoneX";
			y = "22.5 * safeZoneH + safeZoneY";
			w = "13.2 * safeZoneW";
			h = "1 * safeZoneH";
		};
		class SlotPrimary: GroundTab
		{
			idc = 610;
			style = "0x30 + 0x800";
			color[] = {1,1,1,1};
			colorBackgroundSelected[] = {1,1,1,0.1};
			colorFocused[] = {0,0,0,0};
			canDrag = 1;

			x = "27.92 * safeZoneW + safeZoneX";
			y = "6 * safeZoneH + safeZoneY";
			w = "14.28 * safeZoneW";
			h = "3 * safeZoneH";
			colorText[] = {0,0,0,0.5};
			colorBackground[] = {1,1,1,0.1};
		};
		class SlotPrimaryMuzzle: SlotPrimary
		{
			idc = 620;

			x = "27.92 * safeZoneW + safeZoneX";
			y = "9.1 * safeZoneH + safeZoneY";
			w = "2.28 * safeZoneW";
			h = "2 * safeZoneH";
			colorText[] = {0,0,0,0.5};
			colorBackground[] = {1,1,1,0.1};
		};
		class SlotPrimaryUnderBarrel: SlotPrimary
		{
			idc = 641;

			x = "30.32 * safeZoneW + safeZoneX";
			y = "9.1 * safeZoneH + safeZoneY";
			w = "2.28 * safeZoneW";
			h = "2 * safeZoneH";
			colorText[] = {0,0,0,0.5};
			colorBackground[] = {1,1,1,0.1};
		};
		class SlotPrimaryFlashlight: SlotPrimary
		{
			idc = 622;

			x = "32.72 * safeZoneW + safeZoneX";
			y = "9.1 * safeZoneH + safeZoneY";
			w = "2.28 * safeZoneW";
			h = "2 * safeZoneH";
			colorText[] = {0,0,0,0.5};
			colorBackground[] = {1,1,1,0.1};
		};
		class SlotPrimaryOptics: SlotPrimary
		{
			idc = 621;

			x = "35.12 * safeZoneW + safeZoneX";
			y = "9.1 * safeZoneH + safeZoneY";
			w = "2.28 * safeZoneW";
			h = "2 * safeZoneH";
			colorText[] = {0,0,0,0.5};
			colorBackground[] = {1,1,1,0.1};
		};
		class SlotPrimaryMagazineGL: SlotPrimary
		{
			idc = 644;

			x = "37.52 * safeZoneW + safeZoneX";
			y = "9.1 * safeZoneH + safeZoneY";
			w = "2.28 * safeZoneW";
			h = "2 * safeZoneH";
			colorText[] = {0,0,0,0.5};
			colorBackground[] = {1,1,1,0.1};
		};
		class SlotPrimaryMagazine: SlotPrimary
		{
			idc = 623;

			x = "39.92 * safeZoneW + safeZoneX";
			y = "9.1 * safeZoneH + safeZoneY";
			w = "2.28 * safeZoneW";
			h = "2 * safeZoneH";
			colorText[] = {0,0,0,0.5};
			colorBackground[] = {1,1,1,0.1};
		};
		class SlotSecondary: SlotPrimary
		{
			idc = 611;

			x = "27.92 * safeZoneW + safeZoneX";
			y = "11.5 * safeZoneH + safeZoneY";
			w = "14.28 * safeZoneW";
			h = "3 * safeZoneH";
			colorText[] = {0,0,0,0.5};
			colorBackground[] = {1,1,1,0.1};
		};
		class SlotSecondaryMuzzle: SlotPrimary
		{
			idc = 624;

			x = "27.92 * safeZoneW + safeZoneX";
			y = "14.6 * safeZoneH + safeZoneY";
			w = "2.76 * safeZoneW";
			h = "2 * safeZoneH";
			colorText[] = {0,0,0,0.5};
			colorBackground[] = {1,1,1,0.1};
		};
		class SlotSecondaryUnderBarrel: SlotPrimary
		{
			idc = 642;

			x = "30.8 * safeZoneW + safeZoneX";
			y = "14.59 * safeZoneH + safeZoneY";
			w = "2.76 * safeZoneW";
			h = "2 * safeZoneH";
			colorText[] = {0,0,0,0.5};
			colorBackground[] = {1,1,1,0.1};
		};
		class SlotSecondaryFlashlight: SlotPrimary
		{
			idc = 626;

			x = "33.68 * safeZoneW + safeZoneX";
			y = "14.6 * safeZoneH + safeZoneY";
			w = "2.76 * safeZoneW";
			h = "2 * safeZoneH";
			colorText[] = {0,0,0,0.5};
			colorBackground[] = {1,1,1,0.1};
		};
		class SlotSecondaryOptics: SlotPrimary
		{
			idc = 625;

			x = "36.56 * safeZoneW + safeZoneX";
			y = "14.6 * safeZoneH + safeZoneY";
			w = "2.76 * safeZoneW";
			h = "2 * safeZoneH";
			colorText[] = {0,0,0,0.5};
			colorBackground[] = {1,1,1,0.1};
		};
		class SlotSecondaryMagazine: SlotPrimary
		{
			idc = 627;

			x = "39.44 * safeZoneW + safeZoneX";
			y = "14.6 * safeZoneH + safeZoneY";
			w = "2.76 * safeZoneW";
			h = "2 * safeZoneH";
			colorText[] = {0,0,0,0.5};
			colorBackground[] = {1,1,1,0.1};
		};
		class SlotHandgun: SlotPrimary
		{
			idc = 612;

			x = "27.92 * safeZoneW + safeZoneX";
			y = "17 * safeZoneH + safeZoneY";
			w = "14.28 * safeZoneW";
			h = "3 * safeZoneH";
			colorText[] = {0,0,0,0.5};
			colorBackground[] = {1,1,1,0.1};
		};
		class SlotHandgunMuzzle: SlotPrimary
		{
			idc = 628;

			x = "27.92 * safeZoneW + safeZoneX";
			y = "20.1 * safeZoneH + safeZoneY";
			w = "2.76 * safeZoneW";
			h = "2 * safeZoneH";
			colorText[] = {0,0,0,0.5};
			colorBackground[] = {1,1,1,0.1};
		};
		class SlotHandgunUnderBarrel: SlotPrimary
		{
			idc = 643;

			x = "30.8 * safeZoneW + safeZoneX";
			y = "20.1 * safeZoneH + safeZoneY";
			w = "2.76 * safeZoneW";
			h = "2 * safeZoneH";
			colorText[] = {0,0,0,0.5};
			colorBackground[] = {1,1,1,0.1};
		};
		class SlotHandgunFlashlight: SlotPrimary
		{
			idc = 630;

			x = "33.68 * safeZoneW + safeZoneX";
			y = "20.1 * safeZoneH + safeZoneY";
			w = "2.76 * safeZoneW";
			h = "2 * safeZoneH";
			colorText[] = {0,0,0,0.5};
			colorBackground[] = {1,1,1,0.1};
		};
		class SlotHandgunOptics: SlotPrimary
		{
			idc = 629;

			x = "36.56 * safeZoneW + safeZoneX";
			y = "20.1 * safeZoneH + safeZoneY";
			w = "2.76 * safeZoneW";
			h = "2 * safeZoneH";
			colorText[] = {0,0,0,0.5};
			colorBackground[] = {1,1,1,0.1};
		};
		class SlotHandgunMagazine: SlotPrimary
		{
			idc = 631;

			x = "39.44 * safeZoneW + safeZoneX";
			y = "20.1 * safeZoneH + safeZoneY";
			w = "2.76 * safeZoneW";
			h = "2 * safeZoneH";
			colorText[] = {0,0,0,0.5};
			colorBackground[] = {1,1,1,0.1};
		};
		class SlotHeadgear: SlotPrimary
		{
			idc = 6240;

			x = "27.92 * safeZoneW + safeZoneX";
			y = "2.5 * safeZoneH + safeZoneY";
			w = "3.48 * safeZoneW";
			h = "2.9 * safeZoneH";
			colorText[] = {0,0,0,0.5};
			colorBackground[] = {1,1,1,0.1};
		};
		class SlotGoggles: SlotPrimary
		{
			idc = 6216;

			x = "31.52 * safeZoneW + safeZoneX";
			y = "2.5 * safeZoneH + safeZoneY";
			w = "3.48 * safeZoneW";
			h = "2.9 * safeZoneH";
			colorText[] = {0,0,0,0.5};
			colorBackground[] = {1,1,1,0.1};
		};
		class SlotHMD: SlotPrimary
		{
			idc = 6217;

			x = "35.12 * safeZoneW + safeZoneX";
			y = "2.5 * safeZoneH + safeZoneY";
			w = "3.48 * safeZoneW";
			h = "2.9 * safeZoneH";
			colorText[] = {0,0,0,0.5};
			colorBackground[] = {1,1,1,0.1};
		};
		class SlotBinoculars: SlotPrimary
		{
			idc = 6238;

			x = "38.72 * safeZoneW + safeZoneX";
			y = "2.5 * safeZoneH + safeZoneY";
			w = "3.48 * safeZoneW";
			h = "2.9 * safeZoneH";
			colorText[] = {0,0,0,0.5};
			colorBackground[] = {1,1,1,0.1};
		};
		class SlotMap: SlotPrimary
		{
			idc = 6211;

			x = "14.19 * safeZoneW + safeZoneX";
			y = "20.1 * safeZoneH + safeZoneY";
			w = "2.4 * safeZoneW";
			h = "2 * safeZoneH";
			colorText[] = {0,0,0,0.5};
			colorBackground[] = {1,1,1,0.1};
		};
		class SlotGPS: SlotPrimary
		{
			idc = 6215;

			x = "16.86 * safeZoneW + safeZoneX";
			y = "20.1 * safeZoneH + safeZoneY";
			w = "2.4 * safeZoneW";
			h = "2 * safeZoneH";
			colorText[] = {0,0,0,0.5};
			colorBackground[] = {1,1,1,0.1};
		};
		class SlotCompass: SlotPrimary
		{
			idc = 6212;

			x = "22.18 * safeZoneW + safeZoneX";
			y = "20.1 * safeZoneH + safeZoneY";
			w = "2.4 * safeZoneW";
			h = "2 * safeZoneH";
			colorText[] = {0,0,0,0.5};
			colorBackground[] = {1,1,1,0.1};
		};
		class SlotRadio: SlotPrimary
		{
			idc = 6214;

			x = "19.52 * safeZoneW + safeZoneX";
			y = "20.1 * safeZoneH + safeZoneY";
			w = "2.4 * safeZoneW";
			h = "2 * safeZoneH";
			colorText[] = {0,0,0,0.5};
			colorBackground[] = {1,1,1,0.1};
		};
		class SlotWatch: SlotPrimary
		{
			idc = 6213;

			x = "24.85 * safeZoneW + safeZoneX";
			y = "20.1 * safeZoneH + safeZoneY";
			w = "2.4 * safeZoneW";
			h = "2 * safeZoneH";
			colorText[] = {0,0,0,0.5};
			colorBackground[] = {1,1,1,0.1};
		};
		class UniformTab: GroundTab
		{
			idc = 6332;

			x = "14.12 * safeZoneW + safeZoneX";
			y = "2.5 * safeZoneH + safeZoneY";
			w = "4.2 * safeZoneW";
			h = "3 * safeZoneH";
			colorBackground[] = {1,1,1,0.5};
		};
		class UniformSlot: SlotPrimary
		{
			idc = 6331;

			x = "14.42 * safeZoneW + safeZoneX";
			y = "2.5 * safeZoneH + safeZoneY";
			w = "3.6 * safeZoneW";
			h = "3 * safeZoneH";
			colorText[] = {0,0,0,0.5};
			colorBackground[] = {1,1,1,0.1};
		};
		class UniformLoad: GroundLoad
		{
			idc = 6304;

			x = "14.12 * safeZoneW + safeZoneX";
			y = "5.5 * safeZoneH + safeZoneY";
			w = "4.2 * safeZoneW";
			h = "0.5 * safeZoneH";
		};
		class UniformContainer: GroundContainer
		{
			idc = 633;

			x = "14.12 * safeZoneW + safeZoneX";
			y = "6 * safeZoneH + safeZoneY";
			w = "13.2 * safeZoneW";
			h = "14 * safeZoneH";
			colorBackground[] = {0,0,0,0};
			sizeEx = "0.8 * 			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * safeZoneH";
		};
		class VestTab: UniformTab
		{
			idc = 6382;

			x = "18.62 * safeZoneW + safeZoneX";
			y = "2.5 * safeZoneH + safeZoneY";
			w = "4.2 * safeZoneW";
			h = "3 * safeZoneH";
			colorBackground[] = {1,1,1,0.5};
		};
		class VestSlot: SlotPrimary
		{
			idc = 6381;

			x = "18.92 * safeZoneW + safeZoneX";
			y = "2.5 * safeZoneH + safeZoneY";
			w = "3.6 * safeZoneW";
			h = "3 * safeZoneH";
			colorText[] = {0,0,0,0.5};
			colorBackground[] = {1,1,1,0.1};
		};
		class VestLoad: GroundLoad
		{
			idc = 6305;

			x = "18.62 * safeZoneW + safeZoneX";
			y = "5.5 * safeZoneH + safeZoneY";
			w = "4.2 * safeZoneW";
			h = "0.5 * safeZoneH";
		};
		class VestContainer: UniformContainer
		{
			idc = 638;

			x = "14.12 * safeZoneW + safeZoneX";
			y = "6 * safeZoneH + safeZoneY";
			w = "13.2 * safeZoneW";
			h = "14 * safeZoneH";
			colorBackground[] = {0,0,0,0};
			sizeEx = "0.8 * 			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * safeZoneH";
		};
		class BackpackTab: UniformTab
		{
			idc = 6192;

			x = "23.12 * safeZoneW + safeZoneX";
			y = "2.5 * safeZoneH + safeZoneY";
			w = "4.2 * safeZoneW";
			h = "3 * safeZoneH";
			colorBackground[] = {1,1,1,0.5};
		};
		class BackpackSlot: SlotPrimary
		{
			idc = 6191;

			x = "23.42 * safeZoneW + safeZoneX";
			y = "2.5 * safeZoneH + safeZoneY";
			w = "3.6 * safeZoneW";
			h = "3 * safeZoneH";
			colorText[] = {0,0,0,0.5};
			colorBackground[] = {1,1,1,0.1};
		};
		class BackpackLoad: GroundLoad
		{
			idc = 6306;

			x = "23.12 * safeZoneW + safeZoneX";
			y = "5.5 * safeZoneH + safeZoneY";
			w = "4.2 * safeZoneW";
			h = "0.5 * safeZoneH";
		};
		class BackpackContainer: UniformContainer
		{
			idc = 619;

			x = "14.12 * safeZoneW + safeZoneX";
			y = "6 * safeZoneH + safeZoneY";
			w = "13.2 * safeZoneW";
			h = "14 * safeZoneH";
			colorBackground[] = {0,0,0,0};
			sizeEx = "0.8 * 			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * safeZoneH";
		};
		class TotalLoad: GroundLoad
		{
			idc = 6308;

			x = "14.12 * safeZoneW + safeZoneX";
			y = "22.5 * safeZoneH + safeZoneY";
			w = "28.08 * safeZoneW";
			h = "1 * safeZoneH";
		};
		class ContainerMarker: GroundTab
		{
			idc = 6325;

			x = "-4 * safeZoneW + safeZoneX";
			y = "24 * safeZoneH + safeZoneY";
			w = "1.2 * safeZoneW";
			h = "1 * safeZoneH";
			colorBackground[] = {0,0,0,1};
		};
		class GroundMarker: ContainerMarker
		{
			idc = 6385;

			x = "-2.2 * safeZoneW + safeZoneX";
			y = "24 * safeZoneH + safeZoneY";
			w = "1.2 * safeZoneW";
			h = "1 * safeZoneH";
			colorBackground[] = {0,0,0,1};
		};
		class SoldierMarker: ContainerMarker
		{
			idc = 6405;

			x = "-0.4 * safeZoneW + safeZoneX";
			y = "24 * safeZoneH + safeZoneY";
			w = "1.2 * safeZoneW";
			h = "1 * safeZoneH";
			colorBackground[] = {0,0,0,1};
		};
	};
};