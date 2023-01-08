//////////////////////////////////////////////////////////////////
// Function file for Armed Assault
// Created by:  DieHard - Function file for ArmA 2: Operation Arrowhead
//////////////////////////////////////////////////////////////////

_unit = _this select 0;

_unit allowdamage false;

safeZoneDamageEH = _unit addEventhandler["HandleDamage",{ (damage (_this select 0)) +  0.01; (damage (_this select 2)) +  0.01 }];

//_unit addEventHandler ['handleDamage', { (damage (_this select 0)) +  0.01; (damage (_this select 2)) +  0.01 }];
