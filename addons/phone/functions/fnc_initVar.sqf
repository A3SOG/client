#include "script_component.hpp"

SOG_AddressBook = profileNamespace getVariable ["SOG_AddressBook", []];
SOG_Phone_MSG = [];
SOG_Email = [];

// ["01607969938", player, "sog_client_phone_fnc_addOfflineMsg", true] remoteExec ["db_fnc_listload", 2, false];