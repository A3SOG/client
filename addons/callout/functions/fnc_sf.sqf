// Spawn a shooter
private _unit = "O_Soldier_F" createUnit [((position player) vectorAdd [random 100, random 100, 0]), (createGroup east), "shooter = this;", 0];

// Wait a moment to allow the shooter to initialize
sleep 1;

// Notify the player about the callout
hint "Active Shooter. Find and Neutralize the shooter.";

// Make the shooter fire his weapon
waitUntil { player distance shooter <= 250 };
shooter doTarget player;
shooter doFire player;

// Wait until the shooter is killed
waitUntil { sleep 1; !alive shooter };

// Add an action to complete the callout when the shooter is neutralized
player addAction ["Complete Callout", {
    hint "Callout completed. Good job!";

    // Remove the action
    player removeAction (_this select 2);
}];