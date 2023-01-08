//////////////////////////////////////////////////////////////////
// Function file for Armed Assault
// Created by: Arma 2 script:
//////////////////////////////////////////////////////////////////
	_target = _this select 0;
	_caller = _this select 1;
	_id = _this select 2;
	
	_target removeAction _id;
	_target removeAction act1;
	_target removeAction act2;
	_target removeAction act3;
	_target removeAction act4;
	
	hands_up = false;
	hands_back = false;
	
	[_target] joinSilent grpNull;

	_target setCaptive false; 
	
	_target enableAI "Anim";
	
	_target enableAI "MOVE"; 
	
	_target setUnitPos "AUTO";

uisleep 0.25;
player commandChat format["%1 left group", vehiclevarname _target];

//{if ((vehicle _x) != (vehicle player)) then {[_x] joinSilent grpNull}} foreach units _grp;