#include "script_component.hpp"

currentMod = "RHS";
currentPaymentMethod = "Personal";
currentProductList = [];
focusedProductName = "";
focusedProductClass = "";
focusedProdcutPrice = "";
selectedCategory = "storeWeapons";
selectedPaymentMethod = "Personal";

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
publicVariable "currentPaymentMethod";
publicVariable "currentProductList";
publicVariable "focusedProductClass";
publicVariable "focusedProductName";
publicVariable "focusedProductPrice";
publicVariable "selectedCategory";
publicVariable "selectedPaymentMethod";