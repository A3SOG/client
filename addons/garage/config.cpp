#include "script_component.hpp"

// information on this addon specifically
class CfgPatches {
    class ADDON {
        name = COMPONENT_NAME;
        units[] = {};
        weapons[] = {};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {"sog_client_main"};
        authors[] = {"J. Schmidt", "Creedcoder"}; // sub array of authors, considered for the specific addon, can be removed or left empty {}
        author = "SOG"; // primary author name, either yours or your team's, considered for the whole mod
        VERSION_CONFIG;

        locations[] = {
            {"garageAircraft", {4805,8075,0}, 0},
            {"garageArmored", {4805,8075,0}, 0},
            {"garageChopper", {4805,8075,0}, 0},
            {"garageMarine", {4805,8075,0}, 0},
            {"garageStatic", {4805,8075,0}, 0},
            {"garageUAV", {4805,8075,0}, 0},
            {"garageUGV", {4805,8075,0}, 0},
            {"garageWheeled", {4805,8075,0}, 0}
        };
    };
};

// configs go here
#include "CfgEventHandlers.hpp"
#include "ui\RscCommon.hpp"
#include "ui\RscGarage.hpp"