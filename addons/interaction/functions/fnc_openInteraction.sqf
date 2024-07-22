#include "script_component.hpp"

if (!isNull findDisplay 1014) exitWith {};

createDialog "RscInteraction";

{
	ctrlShow [_x, false];
} forEach SOG_InteractionButtons;

private _index1 = 0;
SOG_CurrentActionArray = [];

{
	private _cArray = _x select 0;
	private _cTrue = true;

	for "_i" from 0 to ((count _cArray) - 1) step 1 do {
		_c = call compile (_cArray select _i);
		if (!_c) then {
			_cTrue = false;
		};
	};

	if (_cTrue) then {
		if (_index1 < 9) then {
			private _idc = 1600 + _index1;
			_index1 = _index1 + 1;
			private _text = (_x select 1) select 0;
			private _action = (_x select 1) select 1;

			ctrlShow [_idc, true];
			ctrlSetText [_idc, _text];

			SOG_CurrentActionArray pushBack _action;
		};
	};
} forEach SOG_InteractionItems;