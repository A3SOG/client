#include "script_component.hpp"

selectedPaymentMethodIndex = _this select 1;
{
	if (selectedPaymentMethodIndex == _forEachIndex) then {
		currentPaymentMethod = _x;
	};
} forEach storePaymentMethods;

hintSilent format ["Payment Method changed. \n Only type %1 will be used.", currentPaymentMethod];