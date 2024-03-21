#include "script_component.hpp"

// This script withdraws the amount specified by the player.
private _amount = round (parseNumber (ctrlText 2023004));

// Check if the withdrawal amount is positive
if (_amount > 0) then {
	// Withdraw the amount from the bank
	[_amount, "Cash"] call sog_client_bank_fnc_bankRefresh;
} else {
	// Display an error message
	hintSilent "Withdrawal amount must be more than $0!";
};

// Clear the text box and Enable the button
ctrlSetText [2023004, ""];
ctrlEnable [1600, true];