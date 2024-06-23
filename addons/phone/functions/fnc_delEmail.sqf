#include "script_component.hpp"

_myDialog = findDisplay 202300;
_ctrl01 = _myDialog displayCtrl 202302;

_myDialog displayRemoveEventHandler ["KeyDown", SOG_DeleteMsg];

if (lbCurSel _ctrl01 == -1) exitwith {};

_homeScreenBgBtns = [202202, 202203, 202204, 202205, 202206, 202207, 202208, 202209];
_homeScreenBtns = [202310, 202311, 202312, 202313, 202314, 202315, 202316, 202317, 202318];
_viewMessagesBtns = [202201, 2023001, 2023002, 2023003, 202302, 202305, 202306, 202307, 202308];

{ ctrlShow [_x, true]; ctrlEnable [_x, true]; } forEach _homeScreenBgBtns;
{ ctrlShow [_x, true]; ctrlEnable [_x, true]; } forEach _homeScreenBtns;
{ ctrlShow [_x, false] } forEach _viewMessagesBtns;
ctrlShow [202319, false];
ctrlEnable [202319, false];

// [player getVariable ["SOG_Email", "unknown@spearnet.mil"], lbCurSel _ctrl01] remoteExec ["db_fnc_listrem", 2, false];
[player getVariable ["SOG_Email", "unknown@spearnet.mil"], lbCurSel _ctrl01] call dragonfly_db_fnc_listRemove;

uiSleep 1;

// [player getVariable ["SOG_Email", "unknown@spearnet.mil"], player, "sog_client_phone_fnc_addEmail", true] remoteExec ["db_fnc_listload", 2, false];
[player getVariable ["SOG_Email", "unknown@spearnet.mil"], "sog_client_phone_fnc_addEmail"] call dragonfly_db_fnc_listLoad;