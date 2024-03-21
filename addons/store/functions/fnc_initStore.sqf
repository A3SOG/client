#include "script_component.hpp"

currentMod = "RHS";
selectedCategory = "storeWeapons";
currentProductList = [];
focusedProductName = "";
focusedProductClass = "";
focusedProdcutPrice = "";
payMethod = "Personal";

B_initialBudget = paramsArray select 0;
deliveryTime = paramsArray select 1;

if (isNil "B_defenceBudget") then {
	B_defenceBudget = B_initialBudget;
	publicVariable "B_defenceBudget";
};

if (isNil "B_totalCost") then {
	B_totalCost = 0;
	publicVariable "B_totalCost";
};

publicVariable "currentMod";
publicVariable "selectedCategory";
publicVariable "currentProductList";
publicVariable "focusedProductName";
publicVariable "focusedProductClass";
publicVariable "focusedProductPrice";
publicVariable "payMethod";