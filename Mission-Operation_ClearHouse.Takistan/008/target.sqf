//////////////////////////////////////////////////////////////////
// Function file for Armed Assault
// Created by: RALPH BELL AMI
//////////////////////////////////////////////////////////////////
	//_arrayX  = ["TaskX71","TaskX72","TaskX73","TaskX74","TaskX75","TaskX76","TaskX77","TaskX78","TaskX79","TaskX81","TaskX82","TaskX83","TaskX84","TaskX85"];

	//_randomX = _arrayX select floor random count _arrayX;

titleText ["MAPCLICK TARGET", "PLAIN DOWN"];
	
WaitUntil {openMap true}; 
openMap true;

onmapsingleclick {

	enableRadio false;
	_targets = nearestObjects[_pos,["LandVehicle","Man","Static"],1000]; 
	target = _targets select 0; 

	target addEventHandler["Killed", {[_this select 0, _this select 1] execVM "008\laserTargetEH.sqf"}]; 
	[target] execvm "008\snapshot2.sqf"; [target] execvm "008\unitMrkr.sqf";

	//[_randomX,"Hunt Next Target","Hunt and Kill Next Target",mercenary,[_randomX,getpos target],"assigned",target] call SHK_Taskmaster_add;

	titleText ["", "PLAIN DOWN"];

onmapsingleclick {}};

//sleep 10;

//deleteMarkerLocal _randomX; 
