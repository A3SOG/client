#include "script_component.hpp"

_cntcBtns = [202223, 202224, 202414, 202415];
_metaCtrls = [2023001, 2023002, 2023003, 2023004, 2023005, 2023006];

{
	ctrlShow [_x, true];
	ctrlEnable [_x, true];
} forEach _cntcBtns;

{
	ctrlShow [_x, true];
	ctrlEnable [_x, true];
} forEach _metaCtrls;

_ctrl01 = (findDisplay 202300) displayCtrl 202319;
_ctrl01 ctrlRemoveAllEventHandlers "ButtonClick";
_ctrl01 ctrlAddEventHandler ["ButtonClick", {
	_this spawn sog_client_phone_fnc_viewContacts;

	ctrlShow [202223, false];
	ctrlShow [202224, false];
	ctrlShow [2023001, false];
	ctrlShow [2023002, false];
	ctrlShow [2023003, false];
	ctrlShow [2023004, false];
	ctrlShow [2023005, false];
	ctrlShow [2023006, false];
	ctrlShow [202414, false];
	ctrlShow [202415, false];
}];

_ctrl02 = (findDisplay 202300) displayCtrl 202414;
_ctrl02 ctrlRemoveAllEventHandlers "ButtonClick";
// _ctrl02 ctrlAddEventHandler ["ButtonClick", {
// 	_reciever = ctrlText 2023004;
// 	[_reciever] spawn sog_client_phone_fnc_showDialpad;

// 	ctrlShow [202223, false];
// 	ctrlShow [202224, false];
// 	ctrlShow [2023001, false];
// 	ctrlShow [2023002, false];
// 	ctrlShow [2023003, false];
// 	ctrlShow [2023004, false];
// 	ctrlShow [2023005, false];
// 	ctrlShow [2023006, false];
// 	ctrlShow [202307, false];
// 	ctrlShow [202308, false];
// 	ctrlShow [202414, false];
// 	ctrlShow [202415, false];
// }];

_ctrl03 = (findDisplay 202300) displayCtrl 202415;
_ctrl03 ctrlRemoveAllEventHandlers "ButtonClick";
_ctrl03 ctrlAddEventHandler ["ButtonClick", {
	_reciever = ctrlText 2023004;
	[_reciever] spawn sog_client_phone_fnc_showMessageInput;

	ctrlShow [202223, false];
	ctrlShow [202224, false];
	ctrlShow [2023001, false];
	ctrlShow [2023002, false];
	ctrlShow [2023003, false];
	ctrlShow [2023004, false];
	ctrlShow [2023005, false];
	ctrlShow [2023006, false];
	ctrlShow [202414, false];
	ctrlShow [202415, false];
}];
private ["_control", "_index", "_contact", "_details"];

disableSerialization;

_control = _this select 0;
_index = _this select 1;

_contact = _control lbText _index;
_details = _control lbData _index;
_data = call compile format["%1", _details];

_phoneNumber = _data select 0;
_email = _data select 1;

ctrlSetText [202307, "Contacts"];
ctrlSetText [202308, "Contact details"];

ctrlSetText [2023001, "NAME"];
ctrlSetText [2023002, _contact];
ctrlSetText [2023003, "PHONE NUMBER"];
ctrlSetText [2023004, _phoneNumber];
ctrlSetText [2023005, "EMAIL"];
ctrlSetText [2023006, _email];