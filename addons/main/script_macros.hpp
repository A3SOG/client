// #include "\x\cba\addons\main\script_macros_common.hpp" // Included in ACE3's "script_macros.hpp"
#include "\z\ace\addons\main\script_macros.hpp"

#include "\a3\ui_f\hpp\defineDIKCodes.inc"
#include "\a3\ui_f\hpp\defineCommonGrids.inc"

#define TYPE_CAR storeWheeled
#define TYPE_ARMOR storeArmored
#define TYPE_HELI storeChoppper
#define TYPE_PLANE storeAircraft
#define TYPE_NAVAL storeMarine
#define TYPE_STATIC storeStatic
#define TYPE_UAV storeUAV
#define TYPE_UGV storeUGV

#define AFUNC(var1,var2) TRIPLES(DOUBLES(ace,var1),fnc,var2)
#define BFUNC(var1) TRIPLES(BIS,fnc,var1)
#define CFUNC(var1) TRIPLES(CBA,fnc,var1)
// #define DFUNC(var1) TRIPLES(ADDON,fnc,var1)
#define TFUNC(var1) TRIPLES(TFAR,fnc,var1)

#ifdef DISABLE_COMPILE_CACHE
    #undef PREP
    #define PREP(fncName) DFUNC(fncName) = compile preprocessFileLineNumbers QPATHTOF(functions\DOUBLES(fnc,fncName).sqf)
    #define PREPOS(progName,fncName) DFUNC(fncName) = compile preprocessFileLineNumbers QPATHTOF(programs\progName\DOUBLES(fnc,fncName).sqf)
#else
    #undef PREP
    #define PREP(fncName) [QPATHTOF(functions\DOUBLES(fnc,fncName).sqf), QFUNC(fncName)] call CBA_fnc_compileFunction
    #define PREPOS(progName,fncName) [QPATHTOF(programs\progName\DOUBLES(fnc,fncName).sqf), QFUNC(fncName)] call CBA_fnc_compileFunction
#endif