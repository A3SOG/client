// Create enemies at the target location
private _enemies = [];
for "_i" from 0 to 5 do {
    _enemy = (createGroup east) createUnit ["O_Soldier_F", ((position player) vectorAdd [random 1000, random 1000, 0]), [], 0, "FORM"];
    _enemies pushBack _enemy;
};

// Add a marker on the map for the target location
private _marker = createMarker ["TargetLocation", _pos];
_marker setMarkerShape "ICON";
_marker setMarkerType "hd_dot";
_marker setMarkerColor "ColorRed";
_marker setMarkerText "Suspicious Activity";

// Wait a moment for the group to initialize
sleep 1;

// Notify the player about the callout
hint format ["Suspicious activity reported at the marked location. Investigate with caution."];

// Check if all enemies are eliminated
waitUntil { sleep 1; { alive _x } count _enemies == 0 };

// Add an action to complete the callout when all enemies are eliminated
player addAction ["Complete Callout", {
    hint "Callout completed. Good job!";

    // Remove the action
    player removeAction (_this select 2);
    // Remove the marker
    deleteMarker "TargetLocation";
}];