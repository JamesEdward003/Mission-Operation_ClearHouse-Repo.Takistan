//////////////////////////////////////////////////////////////////
// Function file for Armed Assault
// Created by:  DieHard - Function file for ArmA 2: Operation Arrowhead
//////////////////////////////////////////////////////////////////

_unit = _this select 0;

_unit allowdamage true;

_unit removeEventhandler["HandleDamage", safeZoneDamageEH];