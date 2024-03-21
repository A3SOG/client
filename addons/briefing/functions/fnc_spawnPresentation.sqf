/*
	Name:	sog_client_briefing_fnc_spawnLecture
	Date:	8/6/2022
	Version: 1.0
	Author:  J. Schmidt

	Description:
	Object displays a slideshow presentation.

	Parameter(s):
	0: Object that will display the presentation. <OBJECT> 
	1: Slides that will be used for the presentation. <ARRAY>
	1-0: Texture used for the Slide. <STRING>
	1-1: Amount of Time the Slide will display. <NUMBER>
*/
#include "script_component.hpp"

params ["_object", "_slides"];
{
	_x params ["_texture", "_delay"];
	_object setObjectTextureGlobal [0, _texture];
	uiSleep _delay;
} forEach _slides;