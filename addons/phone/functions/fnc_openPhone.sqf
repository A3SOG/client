#include "script_component.hpp"

private ["_dayTime", "_defaultTheme", "_dialog", "_dialpadBgBtns", "_dialpadBtns", "_displayCtrls", "_homeScreenBgBtns", "_homeScreenBtns", "_theme", "_themeBackground"];

_defaultTheme = profileNamespace getVariable "SOG_PhoneTheme";

if (isNil "_defaultTheme") then {
	profileNamespace setVariable ["SOG_PhoneTheme", ["bg_dark01","\@sog_mod\userconfig\backgrounds\bgdark_01.paa"]];
};

uiSleep 0.1;

_theme = profileNamespace getVariable "SOG_PhoneTheme";
_themeBackground = _theme select 1;

_dayTime = [(date select 3), (date select 4)] call sog_client_phone_fnc_dateToHhMm;
_dialog = createDialog "RscPhone";

_homeScreenBgBtns = [202202, 202203, 202204, 202205, 202206, 202207, 202208, 202209];
_homeScreenBtns = [202310, 202311, 202312, 202313, 202314, 202315, 202316, 202317, 202318];

_dialpadBgBtns = [202210, 202211, 202212, 202213, 202214, 202215, 202216, 202217, 202218, 202219, 202220, 202221];
_dialpadBtns = [202401, 202402, 202403, 202404, 202405, 202406, 202407, 202408, 202409, 202410, 202411, 202412, 202413];

_displayCtrls = [202201, 202210, 202211, 202212, 202213, 202214, 202215, 202216, 202217, 202218, 202219, 202220, 202221, 202222, 202223, 202224, 202302, 202303, 202304, 202305, 202306, 202307, 202308, 202309, 202319, 2023001, 2023002, 2023003, 2023004, 2023005, 2023006, 202401, 202402, 202403, 202404, 202405, 202406, 202407, 202408, 202409, 202410, 202411, 202412, 202413, 202414, 202415, 202416];

disableSerialization;

ctrlSetText [202200, _themeBackground];

{
	ctrlShow [_x, false];
} forEach _displayCtrls;

ctrlSetText [202301, (_dayTime select 0) + ":" + (_dayTime select 1)];