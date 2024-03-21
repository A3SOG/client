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
    };
};

class CfgSounds {
    sounds[] = {};
    class SOG_newMsg {
        name = "newMsg";
        sound[] = {QUOTE(PATHTOF(sounds\newMsg.ogg)), 2, 1};
        titles[] = {};
    };
    class SOG_msgSent {
        name = "msgSent";
        sound[] = {QUOTE(PATHTOF(sounds\woop.ogg)), 3, 1};
        titles[] = {};
    };
};

// configs go here
#include "CfgEventHandlers.hpp"
#include "ui\RscCommon.hpp"
#include "ui\RscPhone.hpp"