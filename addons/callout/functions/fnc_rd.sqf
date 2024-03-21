// Spawn a driver
_driver = "C_man_1" createUnit [((position player) vectorAdd [random 100, random 100, 0]), (createGroup civilian), "rDriver = this;", 0];

// Wait a moment to allow the driver to initialize
sleep 1;

// Spawn a vehicle with the driver
_targetVehicle = "C_Offroad_01_F" createVehicle (position rDriver);

// Wait a moment to allow the vehicle to initialize
sleep 1;
rDriver moveInDriver _targetVehicle;

// Make the driver drive recklessly
rDriver doMove ((position player) vectorAdd [random 1000, random 1000, 0]);

// Notify the player about the callout
hint "A reckless driver has been reported. Stop the vehicle.";

// Check if the driver is stopped
waitUntil { sleep 1; speed _targetVehicle < 1 };

// Add an action to complete the callout when the driver is stopped
player addAction ["Complete Callout", {
    hint "Callout completed. Good job!";

    // Remove the action
    player removeAction (_this select 2);
}];