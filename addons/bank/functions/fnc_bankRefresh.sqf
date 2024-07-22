#include "script_component.hpp"

// Get the parameters
params ["_amount", "_type"];
private ["_bank", "_cash", "_netWorth", "_newBank", "_newCash"];

// Get the current bank balance and cash
private _bank = player getVariable ["Cash_Bank", 0];
private _cash = player getVariable ["Cash", 0];

// Calculate the new bank balance and cash
private _newBank = _bank;
private _newCash = _cash;

// Check the type
switch (_type) do {
    case "Bank": {
        // Subtract the amount from the cash
        private _newCash = _cash - _amount;
        // Add the amount to the bank
        private _newBank = _bank + _amount;
    };
    case "Cash": {
        // Subtract the amount from the bank
        private _newBank = _bank - _amount;
        // Add the amount to the cash
        private _newCash = _cash + _amount;
    };
};

// Check if the new bank balance or cash is negative
if (_newBank < 0) exitWith {
    hintSilent "You do not have enough money in the bank!";
};
if (_newCash < 0) exitWith {
    hintSilent "You do not have enough cash!";
};

// Calculate the new net worth
private _netWorth = _newBank + _newCash;

// Set the new bank balance and cash
player setVariable ["Cash_Bank", _newBank, true];
player setVariable ["Cash", _newCash, true];

// Set the player's SOGPlayerNet net worth
profileNamespace setVariable ["SOGPlayerNet", _netWorth];

// Update the text boxes
ctrlSetText [2023002, format ["Bank: $%1", (_newBank call sog_client_misc_fnc_formatNumber)]];
ctrlSetText [2023003, format ["Cash: $%1", (_newCash call sog_client_misc_fnc_formatNumber)]];