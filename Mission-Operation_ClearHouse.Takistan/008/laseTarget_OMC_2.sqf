//////////////////////////////////////////////////////////////////
// Function file for Armed Assault
// Created by: RALPH BELL AMI
//////////////////////////////////////////////////////////////////
_target = _this select 0;
_pos = position _target;
	
deleteMarkerLocal "TARGET"; 
_obj = "Sign_sphere10cm_EP1" createVehicle _pos;
_fastAirObjects = nearestObjects [_obj, ["Man","Car","Air","Tank","Truck","Ship","Static","House","Office","Barracks","Hanger"], 75];
deleteVehicle _obj;
		
_fastAirAliveObjects = [];

{ if (alive _x) then { _fastAirAliveObjects = _fastAirAliveObjects+[_x] }; } forEach _fastAirObjects;

//_fastAirTarget = _fastAirAliveObjects select 0;

if (count _fastAirAliveObjects > 0) then

{

	_fastAirTarget = _fastAirAliveObjects select 0;
	_fastAirTargetPos =	getPos _fastAirTarget;
	PAPABEAR=[playerSide,"HQ"]; PAPABEAR SideChat format ["TARGET that ""%1""", typeOf _fastAirTarget];
//	_name = getText (configFile >> "CfgVehicles" >> typeOf _fastAirTarget >> "displayName");	
//	[_fastAirTarget] execVM "008\snapShot3.sqf";
	RB_rooftool = "SmokeShellYellow" createVehicle [_fastAirTargetPos select 0,_fastAirTargetPos select 1,30];
	_RB_rooftoolPos = getPos RB_rooftool;
  	_lasew = "LaserTargetW" createVehicle [_RB_rooftoolPos select 0,_RB_rooftoolPos select 1,0];
  	_lasew attachTo [RB_rooftool,[0,0,0.1]];
//	_lazeThree = "LaserTargetW" createVehicle getPos _fastAirTarget; 
//	_lazeThree attachTo [_fastAirTarget,[0,0,0.1]]; 
	[RB_rooftool] execVM "008\snapShot.sqf";

	createMarkerLocal ["TARGET", _fastAirTarget]; 
	"TARGET" setMarkerTypeLocal "select"; 
	"TARGET" setMarkerShapeLocal "Icon";  
	"TARGET" setMarkerTextLocal "TARGET"; 
	"TARGET" setMarkerSizeLocal [1,1]; 
	_fastAirTarget addEventHandler["Killed", {[_this select 0, _this select 1, [_lazeThree, "TARGET"]] execVM "008\laserTargetEH.sqf"}];
 
} else {
	
	PAPABEAR=[playerSide,"HQ"]; PAPABEAR SideChat format ["No TARGETs identified..."];
};