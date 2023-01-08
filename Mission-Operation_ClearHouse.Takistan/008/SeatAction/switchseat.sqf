//////////////////////////////////////////////////////////////////
// Function file for Armed Assault
// Created by:  DieHard - Function file for ArmA 2: Operation Arrowhead
//////////////////////////////////////////////////////////////////

 _unit = player;
 _veh = vehicle _unit;
 _pilot = driver _veh;
 _gunner = gunner _veh;
 _hov = getPosATL _veh select 2;
 _actionArray = _this select 3;
 _action = _actionArray select 0;

 if (_hov > 2) then
 {
	 hint format ["Too high to perform that action!"];
	 
	 } else {
	 
 if (_action == "pilot") then
 {
 if (!isplayer _pilot) then
     {
	_pilot setVehicleVarName "pilot";
	_pilot action ["eject", _veh];  
	sleep .5; 
  	_pilot assignascargo _veh;
  	_pilot moveincargo _veh;
  	_unit action ["eject", _veh];
  	sleep .5;
  	_unit assignasdriver _veh;
  	_unit moveindriver _veh;
  	_unit action ["engineOn", _veh];
     hint format ["You are now pilot!"];
 } else {
     sleep 0.1;
     hint format ["There is already a pilot inside!"];

 };
 };
 
 if (_action == "back") then
 {
 if (isplayer _pilot) then
     {
	_pilot action ["eject", _veh];  
	sleep .5; 
  	_pilot assignascargo _veh;
  	_pilot moveincargo _veh;
  	pilot action ["eject", _veh];
  	sleep .5;
  	pilot assignasdriver _veh;
  	pilot moveindriver _veh;
  	pilot action ["engineOn", _veh];
    hint format ["Ai pilot is now pilot!"];
 } else {
     sleep 0.1;
     hint format ["There is already a pilot inside!"];

 };
 };
 
 if (_action == "gunner") then
 {
 if (isplayer _pilot) then
     {
	_gunner action ["eject", _veh];  
	sleep .5; 
  	_gunner assignascargo _veh;
  	_gunner moveincargo _veh;
  	_pilot action ["eject", _veh];
  	sleep .5;
  	_pilot assignasgunner _veh;
  	_pilot moveingunner _veh;
	pilot action ["eject", _veh];  
	sleep .5; 
  	pilot assignasdriver _veh;
  	pilot moveindriver _veh;
  	pilot action ["engineOn", _veh];
     hint format ["You are now gunner!"];
 } else {
     sleep 0.1;
     hint format ["There is already a gunner inside!"];

 };
 };
 };