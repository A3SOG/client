/*
	Author: PDT for J. Schmidt
	starts the slideshow

	Arguments:
	0: _controller  <OBJECT> - object that controls the slide show

	Return Value:
	<BOOL> - true if slide show was started
*/
#include "script_component.hpp"

params [["_controller", objNull], ["_units", []], ["_topic", ""], ["_sentence", ""]];
SOG_Briefing_inProgress = true;
publicVariable "SOG_Briefing_inProgress";

if (isNull _controller) exitWith {
	_return = false;
	_return
};

// should it auto scroll
private _autoScroll = _controller getVariable ["SOG_SlideShow_AutoScroll", false];

// array of controllers
private _controllers = _controller getVariable ["SOG_SlideShow_Controllers", []];

// the current image
private _currentIndex = _controller getVariable ["SOG_SlideShow_CurrentIndex", 0];

// the images to display
private _images = _controller getVariable ["SOG_SlideShow_Images", []];

// the screens to display images on
private _screens = _controller getVariable ["SOG_SlideShow_Screens", []];

// array of units
private _units = _controller getVariable ["SOG_SlideShow_Units", []];

// the converstation topic
private _topic = _controller getVariable ["SOG_SlideShow_Topic", ""];

// the conversation sentence(s)
private _sentence = _controller getVariable ["SOG_SlideShow_Sentence", ""];

// has the slideshow started
private _started = _controller getVariable ["SOG_SlideShow_Started", true];


// makes sure there are images
if (_images isEqualTo []) exitWith {
	_return = false;
	_return
};

// make sure there are screens
if (_screens isEqualTo []) exitWith {
	_return = false;
	_return
};

// make sure we have controllers
if (_controllers isEqualTo []) exitWith {
	_return = false;
	_return
};

// number of images
private _imageCount = (count _images) - 1;

// just in-case somthing weird happens
if (_currentIndex isEqualTo _imageCount) then {
	_currentIndex = 0;
};

_handle = [_topic, _sentence, nil, nil, nil, _units, 1, false] spawn BIS_fnc_kbTell;

// set the image on each screen
{
	_x setObjectTextureGlobal [0, (_images select _currentIndex) select 0];
} forEach _screens;

// set our current image so our other functions work correctly
{
	_x setVariable ["SOG_SlideShow_CurrentIndex", _currentIndex, true];
} forEach _controllers;

if (_autoScroll) then {
/*
	So this bit can get a bit complicated especially if your doing it with
	a lot of arrays.

	Basically what we're doing is saying "for every element in the _image array,
	get the index we're at, get the image we're on, and get the durration for
	the image.

	Once we have all that we are going to apply the image to
	every element in the _screens array and wait for that images durration.

	After we've set the image and time then we're going to increment and
	save our index and do all that again untill someone ends the slide show."
*/

	{
		// current index - not technically needed but just in case it is
		private _index = _controller getVariable ["SOG_SlideShow_CurrentIndex", 0];
		private _image = _x select 0; // current image
		private _sleep = _x select 1; // how long the image should laserTarget

		{
			_x setObjectTextureGlobal [0, _image];
		} forEach _screens;

		_index = _index + 1;
		_controller setVariable ["SOG_SlideShow_CurrentIndex", _index, true];

		uiSleep _sleep;
	} forEach _images;
};

waitUntil { scriptDone _handle };
SOG_Briefing_inProgress = false;
publicVariable "SOG_Briefing_inProgress";

_return = true;
_return