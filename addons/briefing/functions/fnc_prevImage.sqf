/*
	Author: PDT for J. Schmidt
	displays the previous image

	Arguments:
	0: _controller <OBJECT> - object that controls the slide show

	Return Value:
	<BOOL> - true if the previous image was displayed; false if not
*/
#include "script_component.hpp"

params [["_controller", objNull]];

if (isNull _controller) exitWith {
	_return = false;
	_return
};

// array of controllers
private _controllers = _controller getVariable ["SOG_SlideShow_Controllers", []];

// the current image
private _currentIndex = _controller getVariable ["SOG_SlideShow_CurrentIndex", 0];

// the images to display
private _images = _controller getVariable ["SOG_SlideShow_Images", []];

// the screens to display images on
private _screens = _controller getVariable ["SOG_SlideShow_Screens", []];

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

// make sure there are controllers
if (_controllers isEqualTo []) exitWith {
	_return = false;
	_return
};

// number of images
private _imageCount = (count _images) - 1;

// if we're at the first image
if (_currentIndex isEqualTo 0) then {
	// reset the index
	_currentIndex = 0;
	// otherwise
} else {
	// decrement the index
	_currentIndex = _currentIndex - 1;
};

// set the image on each screen
{
	_x setObjectTextureGlobal [0, (_images select _currentIndex) select 0];
} forEach _screens;

// set our current image so our other functions work correctly
{
	_x setVariable ["SOG_SlideShow_CurrentIndex", _currentIndex, true];
} forEach _controllers;

_return = true;
_return