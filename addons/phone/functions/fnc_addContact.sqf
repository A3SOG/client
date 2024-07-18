#include "script_component.hpp"

params ["_contact"];

SOG_AddressBook pushBackUnique [(name _contact), (_contact getVariable ["SOG_Phone_Number", "unknown"]), (_contact getVariable ["SOG_Email", "unknown@spearnet.mil"])];
profileNamespace setVariable ["SOG_AddressBook", SOG_AddressBook];