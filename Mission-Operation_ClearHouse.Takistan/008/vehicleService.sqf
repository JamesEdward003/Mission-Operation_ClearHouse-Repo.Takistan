//////////////////////////////////////////////////////////////////
// Function file for Armed Assault
// Created by:  DieHard - Function file for ArmA 2: Operation Arrowhead
//////////////////////////////////////////////////////////////////
_unit = _this select 0;

ID = _unit addAction ["Service", "008\x_reload.sqf",[],3,false,true,"","_this distance _target<8"]; 
