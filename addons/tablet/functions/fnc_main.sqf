// SOG_FileSystem = "true" configClasses (configFile >> "CfgPatches" >> "sog_client_tablet" >> "CfgFileSystem");

SOG_FileSystem = [
	["C:", 0, 0, [1, 2, 3], 1],
	["Programs", 1, 0, [15, 16, 17, 18, 19, 20], 1],
	["Windows", 2, 0, [], 1],
	["Users", 3, 0, [4], 1],
	["root", 4, 3, [5, 6, 7, 8, 9, 10], 1],
	["Desktop", 5, 4, [], 1, nil, "desktop"],
	["Documents", 6, 4, [], 1, nil, "documents"],
	["Downloads", 7, 4, [], 1, nil, "downloads"],
	["Music", 8, 4, [], 1, nil, "music"],
	["Pictures", 9, 4, [11], 1, nil, "pictures"],
	["Videos", 10, 4, [12, 13, 14], 1, nil, "videos"],
	["image1.jpg", 11, 9, [], 0, MISSION_ROOT + "CoalaOs\Images\tank.jpg", "picture"],
	["video1.mp4", 12, 10, [], 0, "\A3\Missions_F_EPA\video\A_in_intro.ogv", "video"],
	["video2.mp4", 13, 10, [], 0, "\A3\Missions_F_EPA\video\A_hub_quotation.ogv", "video"],
	["video3.mp4", 14, 10, [], 0, "\A3\Missions_F_EPA\video\A_in_quotation.ogv", "video"],
	["UAVFeed.exe", 15, 1, [], 0, "uav", "exe", "surveillance"],
	["Frontcam.exe", 16, 1, [], 0, "frontCam", "exe", "frontcam"],
	["Bodycam.exe", 17, 1, [], 0, "bodyCam", "exe", "bodycam"],
	["BFT.exe", 18, 1, [], 0, "bft", "exe", "bluefortracker"],
	["Chatty.exe", 19, 1, [], 0, "chatty", "exe", "Chatty"],
	["MDT.exe", 20, 1, [], 0, "mdt", "exe", "MDT"]
];

SOG_ActivePrograms = [];
SOG_CurrentDirId = 0;
SOG_CurrentDir = SOG_FileSystem select SOG_CurrentDirId;
SOG_CurrentDirName = format["%1\", SOG_CurrentDir select SOG_CurrentDirId];

_sogOpenPrograms = missionNamespace getVariable ["SOG_LastOpenPrograms", []];

_tablet = "Land_SOG_Tablet" createVehicle position player;
_tablet attachTo [player, [-0.03125, 0.3, 0.125], "head"];
_tablet setDir (180);

hideObject _tablet;

_ok = createDialog "RscTablet";

sleep 0.1;
closeDialog 2;

_ok = createDialog "RscTablet";

[_sogOpenPrograms] spawn sog_client_os_fnc_reopenProgs;

waitUntil {
    (!dialog) or (!alive player)
};

if (!alive player) then {
    closeDialog 2;
};

{
    call compile format ["[%2] call sog_client_tablet_%1_fnc_stop", _x select 4, _x select 1];
} forEach SOG_ActivePrograms;

missionNamespace setVariable ["SOG_LastOpenPrograms", SOG_ActivePrograms];
deleteVehicle _tablet;