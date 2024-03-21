#include "script_component.hpp"

_homeScreenBgBtns = [202202, 202203, 202204, 202205, 202206, 202207, 202208, 202209];
_homeScreenBtns = [202310, 202311, 202312, 202313, 202314, 202315, 202316, 202317, 202318];
_dialpadBgBtns = [202210, 202211, 202212, 202213, 202214, 202215, 202216, 202217, 202218, 202219, 202220, 202221, 202222];
_dialpadBtns = [202401, 202402, 202403, 202404, 202405, 202406, 202407, 202408, 202409, 202410, 202411, 202412, 202413];

{
	ctrlShow [_x, false];
	ctrlEnable [_x, false];
} forEach _homeScreenBgBtns;

{
	ctrlShow [_x, false];
	ctrlEnable [_x, false];
} forEach _homeScreenBtns;

{
	ctrlShow [_x, true];
	ctrlEnable [_x, true];
} forEach _dialpadBgBtns;

{
	ctrlShow [_x, true];
	ctrlEnable [_x, true];
} forEach _dialpadBtns;

ctrlShow [202201, true];
ctrlShow [202309, true];
ctrlShow [202319, true];
ctrlEnable [202319, true];

ctrlSetText [202309, ""];

_reciever = _this select 0;
ctrlSetText [202309, _reciever];

_ctrl01 = (findDisplay 202300) displayCtrl 202319;

_ctrl01 ctrlRemoveAllEventHandlers "ButtonClick";

_ctrl01 ctrlAddEventHandler ["ButtonClick", {
	_homeScreenBgBtns = [202202, 202203, 202204, 202205, 202206, 202207, 202208, 202209];
	_homeScreenBtns = [202310, 202311, 202312, 202313, 202314, 202315, 202316, 202317, 202318];
	_dialpadBgBtns = [202210, 202211, 202212, 202213, 202214, 202215, 202216, 202217, 202218, 202219, 202220, 202221, 202222];
	_dialpadBtns = [202401, 202402, 202403, 202404, 202405, 202406, 202407, 202408, 202409, 202410, 202411, 202412, 202413];

	{ ctrlShow [_x, true]; ctrlEnable [_x, true]; } forEach _homeScreenBgBtns;
	{ ctrlShow [_x, true]; ctrlEnable [_x, true]; } forEach _homeScreenBtns;
	{ ctrlShow [_x, false]; ctrlEnable [_x, false]; } forEach _dialpadBgBtns;
	{ ctrlShow [_x, false]; ctrlEnable [_x, false]; } forEach _dialpadBtns;
	ctrlShow [202201, false];
	ctrlShow [202309, false];
	ctrlShow [202319, false];
	ctrlEnable [202319, false];
}];