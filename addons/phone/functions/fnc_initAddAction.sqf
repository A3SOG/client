#include "script_component.hpp"

waitUntil { sleep 0.75; "SOG_Phone" in items player };
SOG_addAction = player addAction ["<t color='#0000CC'>Mobile Phone</t>", sog_client_phone_fnc_initAction, [], -99, false, false, "", ""];