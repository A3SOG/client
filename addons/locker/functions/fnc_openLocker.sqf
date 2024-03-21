#include "script_component.hpp"

disableSerialization;
createDialog "RscLocker";

ctrlSetText [1001, format ["%1 Inventory", (name player)]];
ctrlSetText [1000, format ["%1 Locker", (name player)]];

[] call sog_client_locker_fnc_fetchLocker;
[] call sog_client_locker_fnc_fetchPlayer;