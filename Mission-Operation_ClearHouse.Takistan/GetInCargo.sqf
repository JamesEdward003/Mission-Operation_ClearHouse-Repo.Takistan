// GetInCargo.sqf //
_target = _this select 0;
_caller = _this select 1;
_actionID = _this select 2;

group _caller addVehicle _target;
_caller assignAsCargo _target;
_caller action ["GetInCargo", _target];

