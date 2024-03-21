#include "script_component.hpp"

_homeScreenBgBtns = [202202, 202203, 202204, 202205, 202206, 202207, 202208, 202209];
_homeScreenBtns = [202310, 202311, 202312, 202313, 202314, 202315, 202316, 202317, 202318];

{
	ctrlShow [_x, false];
	ctrlEnable [_x, false];
} forEach _homeScreenBgBtns;

{
	ctrlShow [_x, false];
	ctrlEnable [_x, false];
} forEach _homeScreenBtns;

ctrlShow [202201, true];
ctrlShow [202307, true];
ctrlShow [202308, true];
ctrlShow [202319, true];
ctrlEnable [202319, true];

_ctrl01 = (findDisplay 202300) displayCtrl 202319;

_ctrl01 ctrlRemoveAllEventHandlers "ButtonClick";

_ctrl01 ctrlAddEventHandler ["ButtonClick", {
	_homeScreenBgBtns = [202202, 202203, 202204, 202205, 202206, 202207, 202208, 202209];
	_homeScreenBtns = [202310, 202311, 202312, 202313, 202314, 202315, 202316, 202317, 202318];

	{ ctrlShow [_x, true]; ctrlEnable [_x, true]; } forEach _homeScreenBgBtns;
	{ ctrlShow [_x, true]; ctrlEnable [_x, true]; } forEach _homeScreenBtns;
	ctrlShow [202201, false];
	ctrlShow [202307, false];
	ctrlShow [202308, false];
	ctrlShow [202319, false];
	ctrlEnable [202319, false];
}];

ctrlSetText [202307, "Safari"];
ctrlSetText [202308, "Internet browser"];