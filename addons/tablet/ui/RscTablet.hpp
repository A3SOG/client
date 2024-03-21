#undef GUI_GRID_X
#define GUI_GRID_X (0)
#undef GUI_GRID_Y
#define GUI_GRID_Y (0)
#undef GUI_GRID_W
#define GUI_GRID_W (0.025)
#undef GUI_GRID_H
#define GUI_GRID_H (0.04)


class RscTablet {
	idd = 1000;
	movingEnable = 0;
	enableSimulation = 1;
	onLoad = "_this call sog_client_tablet_fnc_myDrinkLoad; _this select 0 displayCtrl 1002 ctrlEnable false";
	objects[] = {"Tablet"};
	// controls[] = {"BGBox_1401", "RscEdit_1400"};
	controls[] = {"BGBox_1401"};
	class Tablet {
		onObjectMoved = "systemChat str _this";
		idc = 1002;
		type = 82;
		model = "\z\sog\addons\tablet\item\sog_tablet.p3d";
		scale = 3.5;
		direction[] = {0, -0.1, -1};
		up[] = {0, 0.65, -0.35};
		x = 0.0; y = 0.0; z = 0.2;
		xBack = 0.5;
		yBack = 0.5;
		zBack = 0.81;
		inBack = 1;
		enableZoom = 0;
		zoomDuration = 0.001;
	};

	class BGBox_1401 {
		idc = 1401;
		type = 0;
		style = 80;
		sizeEx = 0.05;
		x = "-1.5 * GUI_GRID_W + GUI_GRID_X";
		y = "1 * GUI_GRID_H + GUI_GRID_Y";
		w = "45.75 * GUI_GRID_W";
		h = "21.1 * GUI_GRID_H";
		colorBackground[] = {0,0,0,1};
		colorText[] = {1,1,1,1};
		font = "EtelkaNarrowMediumPro";
		text = "";
	};

	class RscEdit_1400: Life_RscEdit {
		idc = 1400;
		x = "-2.55 * GUI_GRID_W + GUI_GRID_X";
		y = "1 * GUI_GRID_H + GUI_GRID_Y";
		w = "45.75 * GUI_GRID_W";
		h = "21.1 * GUI_GRID_H";
		style = 16;
		text = "";
		font = "EtelkaNarrowMediumPro";
		lineSpacing = 1;
		sizeEx = 0.03;
		shadow = 2;
		colorBackground[] = {1, 1, 1, 1};
		colorText[] = {0, 0, 0, 1};
		colorSelection[] = {0.8784, 0.8471, 0.651, 1.0};
	};
};