class CfgNotifications {
	class Default {
		title = ""; // Tile displayed as text on black background. Filled by arguments.
		iconPicture = ""; // Small icon displayed in left part. Colored by "color", filled by arguments.
		iconText = ""; // Short text displayed over the icon. Colored by "color", filled by arguments.
		description = ""; // Brief description displayed as structured text. Colored by "color", filled by arguments.
		color[] = {1,1,1,1}; // Icon and text color
		duration = 5; // How many seconds will the notification be displayed
		priority = 0; // Priority; higher number = more important; tasks in queue are selected by priority
		difficulty[] = {}; // Required difficulty settings. All listed difficulties has to be enabled
	};
	
	class TaskAssigned {
		title = "Contract Accepted"; // Tile displayed as text on black background. Filled by arguments.
		iconPicture = "\A3\ui_f\data\map\mapcontrol\taskIcon_ca.paa"; // Small icon displayed in left part. Colored by "color", filled by arguments.
		description = "%1"; // Brief description displayed as structured text. Colored by "color", filled by arguments.
		color[] = {1,1,1,1}; // Icon and text color
		priority = 0;
				
	};
	
	class TaskFailed {
		title = "Breach of Contract";
		iconPicture = "\A3\ui_f\data\map\mapcontrol\taskIconFailed_ca.paa";
		description = "%1";
		color[] = {1,0,0,1}; // Icon and text color
		priority = 0;
	};
	
	class TaskDone {
		title = "Contract Fulfilled";
		iconPicture = "\A3\ui_f\data\map\mapcontrol\taskIconDone_ca.paa";
		description = "%1";
		color[] = {0,1,0,1}; // Icon and text color
		priority = 0;
	};
	
	class InformationRed {
		title = "Information";
		iconPicture = "\A3\ui_f\data\map\markers\handdrawn\warning_ca.paa";
		description = "%1";
		color[] = {0.69,0.13,0.13,1}; // Icon and text color
		priority = 1;
	};
	
	
	class InformationGreen {
		title = "Information";
		iconPicture = "\A3\ui_f\data\map\markers\handdrawn\warning_ca.paa";
		description = "%1";
		color[] = {0.13,0.54,0.13,1}; // Icon and text color
		priority = 1;
	};
	
	class ScoreAdded {
		title = "RP Earned";
		iconText = "+%2";
		description = "%1";
		color[] = {1,0,1,1};
		priority = 2;
	};

	class IncomingQRF {
		title = "ENEMY QRF";  // Title displayed as text on black background. Filled by arguments.
		iconPicture = "\A3\ui_f\data\Map\VehicleIcons\iconTruck_ca.paa";  // Small icon displayed in left side.
		iconText = "";  // Short text displayed over the icon..
		description = "An enemy QRF was spotted near your location";  // Brief description displayed as structured text.
		color[] = {1, 1, 1, 1};  // Icon and text color
		duration = 5;  // How many seconds will the notification be displayed
		priority = 3;  // Priority; higher number = more important; tasks in queue are selected by priority
		difficulty[] = {};  // Required difficulty settings. All listed difficulties has to be enabled
	};

	class Warning {
		title = "WARNING";
		iconPicture = "\A3\ui_f\data\Map\Markers\Military\warning_CA.paa";
		iconText = "";
		description = "%1";
		color[] = {1, 0, 0, 1};
		duration = 7;
		priority = 5;
		difficulty[] = {};
	};

	class JipTeleport {
		title = "JIP";
		iconPicture = "\A3\ui_f\data\GUI\Cfg\Hints\Timing_ca.paa";
		iconText = "";
		description = "Join In Progress: Use self-interaction to TP back to your squad";
		color[] = {1, 1, 1, 1};
		duration = 5;
		priority = 4;
		difficulty[] = {};
	};

	class IntelAdded {
		title = "INTEL FOUND";
		iconPicture = "\A3\ui_f\data\GUI\RscCommon\RscButtonSearch\search_start_ca.paa";
		iconText = "";
		description = "%1";
		color[] = {1, 1, 1, 1};
		duration = 7;
		priority = 3;
		difficulty[] = {};
	};

	class RespawnCalled {
		title = "RESPAWN";
		iconPicture = "\A3\modules_f\data\iconSector_ca.paa";
		iconText = "";
		description = "The CO has called for reinforcements. Respawning in 5 seconds...";
		color[] = {0, 0.8, 0, 1};
		duration = 5;
		priority = 5;
		difficulty[] = {};
	};

	class Info {
		title = "INFO";
		iconPicture = "\A3\ui_f\data\GUI\Cfg\CommunicationMenu\instructor_ca.paa";
		iconText = "";
		description = "%1";
		color[] = {1, 1, 1, 1};
		duration = 5;
		priority = 4;
		difficulty[] = {};
	};

	class AOLimitWarning {
		title = "AO LIMIT";
		iconPicture = "\a3\ui_f\data\GUI\Cfg\Debriefing\endDeath_ca.paa";
		iconText = "";
		description = "Where are you going? Return to the AO now!";
		color[] = {1, 1, 1, 1};
		duration = 5;
		priority = 4;
		difficulty[] = {};
	};

	class SetupTimerEnded {
		title = "SETUP TIMER";
		iconPicture = "\a3\ui_f\data\IGUI\Cfg\Actions\settimer_ca.paa";
		iconText = "";
		description = "Setup phase is over. The mission is a go.";
		color[] = {1, 1, 1, 1};
		duration = 5;
		priority = 4;
		difficulty[] = {};
	};

	class TimeLimitNotification {
		title = "MISSION TIME LIMIT";
		iconPicture = "\a3\ui_f\data\IGUI\Cfg\Actions\settimer_ca.paa";
		iconText = "";
		description = "%1 minutes remaining.";
		color[] = {1, 1, 1, 1};
		duration = 5;
		priority = 5;
		difficulty[] = {};
	};
};