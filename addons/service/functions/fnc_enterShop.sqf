_shop = nearestBuilding logic;
_shop setVariable ["bis_disable_Door_7", 1, true];

_light = "#lightpoint" createVehicle [(position carPos select 0) + 1, (position carpos select 1) - 2, 3.5];
_light setLightBrightness 0;
_light setLightColor [1,1,1];
_light setLightAmbient [1,1,1];

while { true } do {
	waitUntil { player distance _shop < 15 && inShop };

	if ((vehicle player) == player || !(vehicle player isKindOf "car")) then {
		hint "The repair shop is closed.";
	} else {
		opened = true;
		_no = nearestObjects [carPos, ["car"], 5];

		if (count _no > 0) then {
			for "_i" from 0 to (count _no - 1) step 1 do {
				deleteVehicle (_no select _i);
			};
		};

		for "_i" from 5 to 6 step 1 do {
			_door = format ["door_%1_rot", _i];
			_shop animate [_door, 1];
		};

		cutText ["", "black out", 3];
		(vehicle player) setVelocity [0,0,0];
		uiSleep 3;

		_l = [] call sog_client_service_fnc_createCam;
		_light setLightIntensity 3;
		
		car = vehicle player;
		car setPos position carPos;
		car setDir direction carPos;
		car allowDamage false;

		cutText ["", "black in", 1];
		uiSleep 1;

		[] call sog_client_service_fnc_serviceVehicle;
	};

	waitUntil { player distance _shop > 15 && !inShop };

	_light setLightIntensity 0;
	for "_i" from 5 to 6 step 1 do {
		_door = format ["door_%1_rot", _i];
		_shop animate [_door, 0];
	};
};