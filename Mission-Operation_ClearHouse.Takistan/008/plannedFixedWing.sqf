//////////////////////////////////////////////////////
//  From trigger:
//  _nul = [player] execVM "plannedFixedWing.sqf";
/////////////////////////////////////////////////////
private ["_unit","_sideUnit","_unitPos","_sourcePoint","_pos","_blinky","_targets","_target","_type","_airDist","_smoke","_targetPos","_mrkr2color","_marker2","_vehicle","_mrkrcolor","_randDir","_randDist","_spawnLoc","_marker","_flightPath","_ch","_chGroup","_nul","_kv","_airDist2"];
waituntil {!isnil "bis_fnc_init"};

_unit = _this select 0;
_sideUnit = side _unit;
_unitPos = getPos _unit;
_sourcePoint = _unit;

_randDir  = getDir vehicle _sourcePoint - 10;
_randDir  = _randDir + random(20);
_randDist = (random 100) + 3000;
_spawnLoc = [(getPos vehicle _sourcePoint select 0) + (_randDist * sin(_randDir)), (getPos vehicle _sourcePoint select 1) + (_randDist * cos(_randDir)), 0];

if (isServer) then {

detach laze;
deleteVehicle laze;
deleteVehicle sign;
deleteMarkerLocal "hTarget";
		
uisleep 0.25;
openMap true;
uisleep 0.25;

PAPABEAR=[_sideUnit,"HQ"]; PAPABEAR SideChat format ["FixedWingCAS ready, %1, mark your target on the map!", name _unit];
	
dt=true;
onMapSingleClick "FWTarget = _pos;dt=false";
waitUntil {!dt};
onMapSingleClick "";

	_blinky = "Sign_sphere10cm_EP1" createVehicle FWTarget;	
	_targets = nearestObjects[_blinky,["Man","Car","Air","Tank","Truck","Ship","Static","House","Building","Barracks","Hanger"], 75];
	_target = _targets select 0;
	[_target] execVM "008\twirlyMrkr.sqf";
	_type = typeOf _target;
	deleteVehicle _blinky;
				
uisleep 2;
openMap false;	

_airDist = [_unit, _target] call BIS_fnc_distance2D;

if (count _targets > 0) then

{		
PAPABEAR=[_sideUnit,"HQ"]; PAPABEAR SideChat format ["%1 is %2 meters distant from %3.", name _unit, round(_airDist)/1.0, typeOf _target];

_smoke = "SmokeShell" createVehicle [getPos _target select 0, getPos _target select 1, 30];

uisleep 6;
	
//sign = createVehicle ["sign_sphere25cm_ep1",getPos _smoke,[],0,"can_collide"];
sign = "sign_sphere25cm_ep1" createVehicle position _smoke;
//laze = createVehicle ["LaserTargetW",getPos sign,[],0,"can_collide"];
laze = "LaserTargetW" createVehicle position sign;

laze attachTo [sign,[0,0,.2]];

deleteVehicle _smoke;

hideObject sign;

_target addEventHandler["Killed", {[_this select 0, _this select 1, [laze,sign]] execVM "008\laserTargetEH.sqf"}];

_targetPos = getPos _target;

_mrkr2color 	= [];

switch (side _target) do {

	case west:		{_mrkr2color = "ColorBlue"};
	case east:		{_mrkr2color = "ColorRed"};
	case resistance:	{_mrkr2color = "ColorGreen"};
	case civilian:		{_mrkr2color = "ColorYellow"};
};

_marker2 = createMarkerLocal ["hTarget", _targetPos];
_marker2 setMarkerType "EMPTY";
_marker2 setMarkerShapeLocal "ELLIPSE"; 
_marker2 setMarkerBrushLocal "BORDER"; 
_marker2 setMarkerTextLocal "";
_marker2 setMarkerSizeLocal [100,100];
_marker2 setMarkerColorLocal _mrkr2color;
	
if (isNil {_unit getVariable "FixedWing"}) then {
	
//_vehicle = "rksl_efa_fgr4_raf_9";
//_vehicle = "An2_1_TK_CIV_EP1";
//_vehicle = "An2_2_TK_CIV_EP1";
//_vehicle = "An2_TK_EP1";
//_vehicle = "A10";
//_vehicle = "A10_US_EP1";
//_vehicle = "AV8B";
//_vehicle = "AV8B2";
//_vehicle = "Chukar_EP1";
//_vehicle = "F35B";
//_vehicle = "L39_TK_EP1";
//_vehicle = "MQ9PredatorB";
//_vehicle = "MQ9PredatorB_US_EP1";
//_vehicle = "Pchela1T";
//_vehicle = "Su25_CDF";
//_vehicle = "Su25_Ins";
//_vehicle = "Su25_TK_EP1";
//_vehicle = "Su34";
//_vehicle = "Su39";
//_vehicle = "C130J";
//_vehicle = "C130J_US_EP1";

_vehicle = [];

switch (playerSide) do 
{
	case west: 		{_vehicle = "AV8B"};
	case east: 		{_vehicle = "Su34"};
	case resistance: 	{_vehicle = "Su25_Ins"};
	case civilian: 	{_vehicle = "An2_1_TK_CIV_EP1"};
};

_mrkrcolor 	= [];

switch (_sideUnit) do {

	case west:		{_mrkrcolor = "ColorBlue"};
	case east:		{_mrkrcolor = "ColorRed"};
	case resistance:	{_mrkrcolor = "ColorGreen"};
	case civilian:		{_mrkrcolor = "ColorYellow"};        
};

_marker = createMarkerLocal ["hStart", _spawnLoc];
_marker setMarkerTypeLocal "select";
_marker setMarkerShapeLocal "Icon";  
_marker setMarkerTextLocal " hStart";
_marker setMarkerSizeLocal [0.75,0.75];
_marker setMarkerColorLocal _mrkrcolor;	

	_blinky = "Sign_sphere10cm_EP1" createVehicle _spawnLoc;
	_flightPath = [_blinky, _target] call BIS_fnc_relativeDirTo;	
	deleteVehicle _blinky;	

	_ch = [[_spawnLoc select 0, _spawnLoc select 1, 300], _flightPath, _vehicle, side _unit] call BIS_fnc_spawnVehicle;

	_unit setVariable ["FixedWing", _vehicle, true];
			
	FixedWingCAS = _ch select 0;
	
	_chGroup = _ch select 2; 
	
	addSwitchableUnit leader _chGroup;
		
	_ch select 0 setVehicleInit "FixedWingCAS = this; this setVehicleVarName 'FixedWingCAS'; FixedWingCASGroup=group this; this setGroupID ['FixedWingCASGroup', 'GroupColor4'];  
	this flyInHeight 300;
	this setVariable ['speedLimit', 400];
	this setvehiclelock 'unlocked'; 
	this addWeaponCargo ['DMR',1]; 
	this addMagazineCargo ['20Rnd_762x51_DMR',8]; 
	this addWeaponCargo ['m240_scoped_EP1',1];
	this addMagazineCargo ['100Rnd_762x51_M240',4];
	this addWeaponCargo ['JAVELIN',1]; 
	this addMagazineCargo ['JAVELIN',4];
	[this] execVM '008\loadoutAir.sqf';
	this addEventHandler ['Fired',{[_this select 0,getNumber (configFile/'CfgAmmo'/(_this select 4)/'explosive')] spawn {if (_this select 1==1) then {sleep 0.5};_this select 0 setVehicleAmmo 1}}];
	this addEventHandler ['killed', {[_this select 0, _this select 1, ['hStart']] execVM '008\onKilled.sqf'}];
	this addEventHandler ['handleDamage', { (damage (_this select 0)) +  0.01; (damage (_this select 2)) +  0.01 }]; 
	{[_x] execVM '008\adfalse.sqf'} forEach crew this;
	this addeventhandler ['getin', {_nul=[_this select 2] execVM '008\adfalse.sqf'}];
	this addeventhandler ['getout', {_nul=[_this select 2] execVM '008\adtrue.sqf'}];";
	processInitCommands;
	
	FixedWingCAS spawn {
		
	while {alive _this && canMove _this} do {
		
		_this limitSpeed (_this getVariable "speedLimit");
		
		uisleep 0.1;			
		};		
	};

	FixedWingCAS spawn {
		
	while {alive _this && canMove _this} do {
		
	if (currentWeapon player == "Laserdesignator" && cameraOn == player && cameraView == "Gunner") then 
	{	
		detach laze;

		deleteVehicle laze;
			    
		deleteVehicle sign;
		
		hintSilent "Laser designator view is on. Target laser spot is deleted.";	    
	} else {		
		hintSilent "Laser designator view is off.";	
	};	
		sleep 2;	   
	};

	};
	
	FixedWingCAS spawn {
	
	while {alive FixedWingCAS && canMove FixedWingCAS} do {
		
		waitUntil {[FixedWingCAS, laze] call BIS_fnc_distance2D < 300};
			
		_kv = FixedWingCAS knowsAbout laze;
		
	if (_kv < 1) then	
	{	
		detach laze;

		deleteVehicle laze;
			    
		deleteVehicle sign;

		FixedWingCAS SideChat format ["Pilot cannot see target. Target knowledge is %1. Laser spot is deleted.",round(_kv)];	    
	} else {		
		FixedWingCAS SideChat format ["Pilot can see target. Target knowledge is %1.",round(_kv)];	
	};		
		sleep 5;
	};
	
	};	
};

_airDist2 = [FixedWingCAS, _targetPos] call BIS_fnc_distance2D;
	
PAPABEAR=[_sideUnit,"HQ"]; PAPABEAR SideChat format ["FixedWingCAS is %1 meters distant from %2.", round(_airDist2)/1.0, typeOf _target];

while {(count (waypoints group FixedWingCAS)) > 0} do {
	deleteWaypoint ((waypoints group FixedWingCAS) select 0);
	sleep 0.01;
	};
				    
	wp0 = group FixedWingCAS addwaypoint [_targetPos, 100];
	wp0 setwaypointtype "MOVE";	
	wp0 setWaypointBehaviour "AWARE";
	wp0 setWaypointCombatMode "YELLOW";
	wp0 setWaypointSpeed "NORMAL";
	wp0 setWaypointStatements ["true",""];
				
	wp1 = group FixedWingCAS addwaypoint [_unitPos, 100];
	wp1 setwaypointtype "MOVE";	
	wp1 setWaypointBehaviour "AWARE";
	wp1 setWaypointCombatMode "GREEN";
	wp1 setWaypointSpeed "LIMITED";
	wp1 setWaypointStatements ["true","!alive laze; FixedWingCAS setVariable ['speedLimit', 600]; driver (vehicle this) sideChat 'FixedWingCAS returning to BASE!';"];

	wp2 = group FixedWingCAS addwaypoint [_spawnLoc, 100];
	wp2 setwaypointtype "MOVE";
	wp2 setWaypointBehaviour "AWARE";
	wp2 setWaypointCombatMode "GREEN";
	wp2 setWaypointSpeed "FULL";
	wp2 setWaypointStatements ["true","{deletevehicle _x} foreach (crew vehicle this + [vehicle this]);"];

	waitUntil {!alive FixedWingCAS};
	
 	PAPABEAR=[_sideUnit,"HQ"]; PAPABEAR SideChat format ["FixedWingCAS ready for reassignment!"];

	_unit setVariable ["FixedWing",nil];
	deleteMarkerLocal "hStart";
	deleteMarkerLocal "hTarget";
	detach laze;
	deleteVehicle laze;
	deleteVehicle sign;
	
} else {
		
	PAPABEAR=[_sideUnit,"HQ"]; PAPABEAR SideChat format ["No targets in that area, %1!", name _unit];
	uisleep 1;
  };
};	
