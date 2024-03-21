#include "script_component.hpp"

disableSerialization;
createDialog "RscGarage";

ctrlSetText [1000, format ["%1 Garage", (name player)]];

[] call sog_client_garage_fnc_fetchGarage;
[] call sog_client_garage_fnc_fetchVehicle;