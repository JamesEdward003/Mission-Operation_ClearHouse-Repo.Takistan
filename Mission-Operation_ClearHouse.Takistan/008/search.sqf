//////////////////////////////////////////////////////////////////
// Function file for Armed Assault
// Created by: RALPH BELL AMI
//////////////////////////////////////////////////////////////////
	_target = _this select 0;
	_caller = _this select 1;
	_id = _this select 2;

	_target removeAction _id;

createGearDialog [_target, "RscDisplayGear"];