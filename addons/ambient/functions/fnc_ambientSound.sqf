/*
	Name:	sog_client_ambient_fnc_ambientSound
	Date:	8/6/2022
	Version: 1.0
	Author:  J. Schmidt

	Description:
	Create a sound source and play an ambient sfx sound.

	Arguments:
	0: OBJECT - The sound source
	1: STRING - The name of the SFX sound
	2: SCALAR - Number of seconds before SFX sound will be deleted (Optional)

	Example:
	// Default No Time Limit
	[this, "sfx_sound_name"] spawn sog_client_ambient_fnc_ambientSound

	Returns:
	void
*/
#include "script_component.hpp"

params ["_source", "_sfx", "_time"];
private ["_sound0"];

_sound0 = createSoundSource [_sfx, position _source, [], 0];

while { alive _source } do {
	if (!isNil "_time") exitWith {
		uiSleep _time;
		deleteVehicle _sound0;
	};

	uiSleep 5;

	if (!alive _source) exitWith {
		deleteVehicle _sound0;
	};
};