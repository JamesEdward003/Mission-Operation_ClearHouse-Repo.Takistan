//////////////////////////////////////////////////////////////////
// Function file for Armed Assault
// Created by: RALPH BELL AMI
//////////////////////////////////////////////////////////////////
_object 	= _this select 0;
_type	= typeOf _object;
_objPos	= position _oject;

_arrayX 	= ["TaskX11","TaskX12","TaskX13","TaskX14","TaskX15","TaskX16","TaskX17","TaskX18","TaskX19","TaskX21","TaskX22","TaskX23","TaskX24","TaskX25"];
_randomX	= _arrayX select floor random count _arrayX;
	
A_SIMPLE_TASK = player createSimpleTask [_randomX];
A_SIMPLE_TASK setSimpleTaskDestination (position _object);
A_SIMPLE_TASK setSimpleTaskDescription [
   _type,
   _randomX,
   _objPos
];
A_SIMPLE_TASK setTaskState "CREATED";

uisleep 1;
PAPABEAR=[playerSide,"HQ"]; PAPABEAR SideChat format ["The task marker shown will be removed in ten seconds, %1.", name player];
uisleep 10; 
player removeSimpleTask [_randomX];
player removeSimpleTask [A_SIMPLE_TASK];
