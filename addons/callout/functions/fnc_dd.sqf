// Spawn a dealer and buyer
private _dealer = "C_man_1" createUnit [(position player vectorAdd [random 100, random 100, 0]), (createGroup civilian), "dealer = this;", 0];

// Wait a moment for the dealer to initialize
sleep 1;

private _buyer = "C_man_1" createUnit [(position dealer vectorAdd [random 10, random 10, 0]), (createGroup civilian), "buyer = this;", 0];

// Notify the player about the callout
hint "A drug deal is taking place. Arrest the dealer and the buyer.";

// Wait a moment to allow the dealer and buyer to initialize
sleep 1;

// Check if the dealer and the buyer are detained
waitUntil { sleep 1; dealer getVariable ["isArrested", false] && buyer getVariable ["isArrested", false] };

// Add an action to complete the callout when the dealer and the buyer are arrested
player addAction ["Complete Callout", {
    hint "Callout completed. Good job!";

    // Remove the action 
    player removeAction (_this select 2);
}];