/*
	Ussage:
	_trg = createTrigger ["EmptyDetector", getPos player];
	_trg setTriggerArea [5, 5, 0, false];
	_trg setTriggerActivation ["ANYPLAYER", "PRESENT", true];
	_trg setTriggerStatements [
		"call { {_x iskindof 'LAND' && speed _x < 1} count thisList > 0; };",
		"call { _handle = [(thisList select 0), 'LAND'] spawn sog_client_service_fnc_serviceVehicle; };",
		""
	];
*/
#include "script_component.hpp"

params [("_veh"), "_vehKind"];

_veh = _this select 0;
_vehType = getText (configFile >> "CfgVehicles" >> typeOf _veh >> "DisplayName");
_vehMags = getArray (configFile >> "CfgVehicles" >> _vehType >> "magazines");

_refuelCost = 0;
_rearmCost = 0;
_repairCost = 0;

_fuelPrice = "FUEL_COST" call BIS_fnc_getParamValue;
_repairPrice = "REPAIR_COST" call BIS_fnc_getParamValue;

if ((_veh isKindOf _vehKind) && (driver _veh == player)) exitWith {

	_lastFuelState = fuel _veh;
	_veh setFuel 0;

	_veh vehicleChat format ["Servicing %1... Please Stand By...", _vehType];

	uiSleep 3;
	
	_lastMagCount = 0;
	_lastMagCount = count magazines _veh;

	if (count _vehMags > 0) then {
		_removed = [];
		{
			if (!(_x in _removed)) then {
				_veh removeMagazines _x;
				_removed = _removed + [_x];
			};
		} forEach _vehMags;

		{
			_veh vehicleChat format ["Reloading %1", _x];
			uiSleep 1;
			_veh addMagazine _x;
			_rearmCost = (_rearmCost + 100);
		} forEach _vehMags;
	};

	_count = count (configFile >> "CfgVehicles" >> _vehType >> "Turrets");
	if (_count > 0) then {
		for "_i" from 0 to (_count - 1) do {
			scopeName "xx_reload2_xx";
			_config = (configFile >> "CfgVehicles" >> _vehType >> "Turrets") select _i;
			_vehMags = getArray (_config >> "magazines");
			_removed = [];
			{
				if (!(_x in _removed)) then {
					_veh removeMagazines _x;
					_removed = _removed + [_x];
				};
			} forEach _vehMags;

			{
				_veh vehicleChat format ["Rearming %1", _x];
				uiSleep 1;
				_veh addMagazine _x;
				_rearmCost = (_rearmCost + 100);
				uiSleep 1;
			} forEach _vehMags;

			_countOther = count (_config >> "Turrets");
			if (_countOther > 0) then {
				for "_i" from 0 to (_countOther - 1) do {
					_config2 = (_config >> "Turrets") select _i;
					_vehMags = getArray (_config2 >> "magazines");
					_removed = [];
					{
						if (!(_x in _removed)) then {
							_veh removeMagazine _x;
							_removed = _removed + [_x];
						};
					} forEach _vehMags;

					{
						_veh vehicleChat format ["Reloading %1", _x];
						uiSleep 1;
						_veh addMagazine _x;
						_rearmCost = (_rearmCost + 100);
						uiSleep 1;
					} forEach _vehMags;
				};
			};
		};
	};

	_lastMagCount = (_lastMagCount * 100);
	_rearmCost = (_rearmCost - _lastMagCount);

	["deduct", _rearmCost] remoteExecCall ["sog_server_money_fnc_handleFunds", 2];

	_veh setVehicleAmmo 1;
	_veh vehicleChat format ["%1 Rearmed.", _vehType];

	uiSleep 3;

	_currentDamage = damage _veh;
	_damageWait = (_currentDamage * 10);
	_laborPrice = (_damageWait * _repairPrice);
	_partsPrice = (_currentDamage * 1000);
	_damagePrice = (_laborPrice + _partsPrice);

	hint format ["SERVICE DEPARTMENT: \n \n The service will take %1 Labor Hours to complete, that'll run about $%2 at the agreed labor price of $%3 per hour... \n \n The service will cost $%4 in parts... \n \n The total cost will be $%5", _damageWait, (_laborPrice) call sog_client_misc_fnc_formatNumber, (_repairPrice) call sog_client_misc_fnc_formatNumber, (_partsPrice) call sog_client_misc_fnc_formatNumber, (_damagePrice) call sog_client_misc_fnc_formatNumber];
	uiSleep 5;

	["deduct", _damagePrice] remoteExecCall ["sog_server_money_fnc_handleFunds", 2];

	_veh vehicleChat "Repairing...";
	uiSleep _damageWait;

	_veh setDamage 0;
	_veh vehicleChat format ["%1 Repaired.", _vehType];

	uiSleep 3;

	_veh setFuel _lastFuelState;
	uiSleep 0.2;

	while { fuel _veh < 0.99 } do {
		_veh setFuel ((fuel _veh + 0.10) min 1);
		["deduct", _refuelCost] remoteExecCall ["sog_server_money_fnc_handleFunds", 2];
		_refuelCost = (_refuelCost + _fuelPrice);
		uiSleep 0.2;
	};

	_veh vehicleChat format ["%1 Refueled.", _vehType];
	
	uiSleep 3;

	_subTotal = (_rearmCost + _refuelCost + _damagePrice);
	hint format ["Service Cost: \n \n Rearmament: $%1 \n \n Repairs: $%2 \n \n Refueling: $%3 \n \n Total: $%4 \n \n Billed to SOG PMC Group.", (_rearmCost) call sog_client_misc_fnc_formatNumber, (_damagePrice) call sog_client_misc_fnc_formatNumber, (_refuelCost) call sog_client_misc_fnc_formatNumber, (_subTotal) call sog_client_misc_fnc_formatNumber];
	_veh vehicleChat format ["Service Completed for %1", _vehType];
};