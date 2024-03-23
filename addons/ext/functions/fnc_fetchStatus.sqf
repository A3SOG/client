params [["_event", ""], ["_uid", ""], ["_status", ""]];

// hint format ["Event: %1\nUID: %2\nStatus: %3\n\n", _event, _uid, _status];
["Status has been updated.", "blue-grey", 3] call sog_client_misc_fnc_notify;

SOG_tempDb = [];
[SOG_tempDb, ["players", _uid, "status"], _status] call BIS_fnc_dbValueSet;

missionNamespace setVariable ["SOG_tempDb", SOG_tempDb, true];

/*["statusUpdated", "76561198027566824", "available"]
[
	"#players",
	[
		"#76561198027566824",
		[
			"&status", "available",
		],
	]
]*/