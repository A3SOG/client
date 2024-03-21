#include "script_component.hpp"

params ["_contact"];

SOG_AddressBook pushBackUnique [(name _contact), (_contact getVariable ["SOG_Phone_Number", "unk"]), (_contact getVariable ["SOG_Email", "unk"])];

profileNamespace setVariable ["SOG_AddressBook", SOG_AddressBook];