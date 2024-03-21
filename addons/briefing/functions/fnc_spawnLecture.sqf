/*
	Name:	sog_client_briefing_fnc_spawnLecture
	Date:	8/6/2022
	Version: 1.0
	Author:  J. Schmidt

	Description:
	AI plays a given sentence/conversation.

	Parameter(s):
	0: Unit that is playing the given sentence/conversation. <OBJECT> 
	1: Topic that is being talked about. <STRING>
	2: Sentence partaining to the topic at hand. <STRING>
*/
#include "script_component.hpp"

params ["_unit", "_topic", "_sentence"];
SOG_Briefing_inProgress = true;
publicVariable "SOG_Briefing_inProgress";

while { alive _unit } do {
	_unit disableAI "ALL";
	_unit switchMove " ";
	_handle = [_topic, _sentence, nil, nil, nil, [_unit], 1, false] spawn BIS_fnc_kbTell;

	if (!alive _unit) exitWith {
		[_unit] spawn BIS_fnc_kbSkip;

		SOG_Briefing_inProgress = false;
		publicVariable "SOG_Briefing_inProgress";
	};

	uiSleep 5;
};

waitUntil { scriptDone _handle };
SOG_Briefing_inProgress = false;
publicVariable "SOG_Briefing_inProgress";