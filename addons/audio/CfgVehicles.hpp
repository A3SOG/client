class CfgVehicles {
	class All;
	class Sound: All {
		author = "SOG";
		mapSize = 1;
		_generalMacro = "Sound";
		scope = 0;
		side = -1;
		animated = 0;
		vehicleClass = "Sounds";
		icon = "iconSound";
		faction = "none";
		editorCategory = "sog";
		editorSubcategory = "sog_audio";
	};
	class SOGSubmarineDraining: Sound {
		scope = 2;
		sound = "SOGSubmarineDrainingSFX";
		displayName = "SOG Submarine Draining SFX";
	};
	class SOGSubmarineExteriorAmbience: Sound {
		scope = 2;
		sound = "SOGSubmarineExteriorAmbienceSFX";
		displayName = "SOG Submarine Exterior Ambience SFX";
	};
	class SOGSubmarineFlooding: Sound {
		scope = 2;
		sound = "SOGSubmarineFloodingSFX";
		displayName = "SOG Submarine Flooding SFX";
	};
	class SOGSubmarineFloodSiren: Sound {
		scope = 2;
		sound = "SOGSubmarineFloodSirenSFX";
		displayName = "SOG Submarine Flood Siren SFX";
	};
	class SOGSubmarineHatch: Sound {
		scope = 2;
		sound = "SOGSubmarineHatchSFX";
		displayName = "SOG Submarine Hatch SFX";
	};
	class SOGSubmarineInteriorAmbience: Sound {
		scope = 2;
		sound = "SOGSubmarineInteriorAmbienceSFX";
		displayName = "SOG Submarine Interior Ambience SFX";
	};
	class SOGSubmarineLockoutDoor: Sound {
		scope = 2;
		sound = "SOGSubmarineLockoutDoorSFX";
		displayName = "SOG Submarine Lockout Door SFX";
	};
	class SOGSubmarineEnterExterior: Sound {
		scope = 2;
		sound = "SOGSubmarineEnterExteriorSFX";
		displayName = "SOG Submarine Enter Exterior SFX";
	};
	class SOGSubmarineValve: Sound {
		scope = 2;
		sound = "SOGSubmarineValveSFX";
		displayName = "SOG Submarine Valve SFX";
	};
};