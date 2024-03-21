#include "script_component.hpp"

// This script deposits the amount specified by the player.
private _amount = round (parseNumber (ctrlText 2023004));

// Check if the deposit amount is positive
if (_amount > 0) then {
	// Deposit the amount from the wallet
	[_amount, "Bank"] call sog_client_bank_fnc_bankRefresh;
} else {
	// Display an error message
	hintSilent "Deposit amount must be greater than 0!";
};

// Clear the text box and Enable the button
ctrlSetText [2023004, ""];
ctrlEnable [1601, true];