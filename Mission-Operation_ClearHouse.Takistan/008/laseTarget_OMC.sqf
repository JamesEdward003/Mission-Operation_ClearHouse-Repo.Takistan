//////////////////////////////////////////////////////////////////
// Function file for Armed Assault
// Created by: RALPH BELL AMI
//////////////////////////////////////////////////////////////////
titleText ["MAPCLICK TARGET", "PLAIN DOWN"];

openMap true;

onmapsingleclick {
	
	deleteVehicle lazeThree;
	deleteMarkerLocal "TARGET";
	targets = nearestObjects[_pos,["House","AllVehicles"],100];
	target = targets select 0;
	smoke = "SmokeShell" createVehicle [(getpos target select 0),( getpos target select 1), 30];
//	smoke setPosASL [getPos smoke select 0,getPos smoke select 1,30];
//	smoke setPosASL [getPos smoke select 0,getPos smoke select 1,(getPosASL smoke select 2)-(getPos smoke select 2)];
//	smoke setPosATL [getPos smoke select 0,getPos smoke select 1,30];
//	smoke setPosATL [getPos smoke select 0,getPos smoke select 1,(getPosATL smoke select 2)-(getPos smoke select 2)];
	//bomb = "Bo_GBU12_LGB" createVehicle [(getpos player select 0),( getpos player select 1), 100];
//	lazeThree = "LaserTargetW" createVehicle (getpos smoke);
	lazeThree = "LaserTargetW" createVehicle (getpos target);
//	lazeThree setpos (getpos smoke);
//	lazeThree setPosATL [getPos lazeThree select 0,getPos lazeThree select 1,30];
//	lazeThree setPosATL [getPos lazeThree select 0,getPos lazeThree select 1,(getPosATL lazeThree select 2)-(getPos lazeThree select 2)];
//	lazeThree setpos (getpos smoke);
	//lazeThree setPos [ getPos player select 0, getPos player select 1, (getPos player select 2) +2];
	lazeThree attachTo [target,[0,0,2]];
	createMarkerLocal ["TARGET", target];
	"TARGET" setMarkerTypeLocal "select";
	"TARGET" setMarkerShapeLocal "Icon";
	"TARGET" setMarkerTextLocal "TARGET";
	"TARGET" setMarkerSizeLocal [1,1];
	
	target addEventHandler["Killed", {[_this select 0, _this select 1, [lazeThree, "TARGET"]] execVM "008\laserTargetEH.sqf"}];
	//[smoke] execvm "008\snapshot.sqf";
	[target] exec "camera.sqs";
		
	lazeThree spawn {

    t = time;

    waituntil {isnull _this};

    hint format ["time started\n%1\n\ntime stopped\n%2\n\ntotal time\n%3",str t,str time,str (time - t)];

 	};
 
titleText ["", "PLAIN DOWN"];
 
openMap false;
 	
onmapsingleclick {}};