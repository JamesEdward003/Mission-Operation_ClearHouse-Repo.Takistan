//////////////////////////////////////////////////////
//  From trigger:
//  _nul = [player] execVM "plannedRotaryWing.sqf";
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

detach RWlaze;
deleteVehicle RWlaze;
deleteVehicle RWsign;
deleteMarkerLocal "RWTarget";
		
uisleep 0.25;
openMap true;
uisleep 0.25;

PAPABEAR=[_sideUnit,"HQ"]; PAPABEAR SideChat format ["RotaryWingCAS ready, %1, mark your target on the map!", name _unit];
	
dt=true;
onMapSingleClick "RWTarget = _pos;dt=false";
waitUntil {!dt};
onMapSingleClick "";

	_blinky = "Sign_sphere10cm_EP1" createVehicle RWTarget;	
	_targets = nearestObjects[_blinky,["Man","Car","Air","Tank","Truck","Ship","Static","House","Building","Barracks","Hanger"], 75];
	_target = _targets select 0;
	[_target] execVM "008\twirlyMrkr.sqf";
	_type = typeOf _target;
	deleteVehicle _blinky;
				
sleep 2;
openMap false;	

_airDist = [_unit, _target] call BIS_fnc_distance2D;

if (count _targets > 0) then

{		
PAPABEAR=[_sideUnit,"HQ"]; PAPABEAR SideChat format ["%1 is %2 meters distant from %3.", name _unit, round(_airDist)/1.0, typeOf _target];

_smoke = "SmokeShell" createVehicle [getPos _target select 0, getPos _target select 1, 30];

uisleep 6;
	
//RWsign = createVehicle ["sign_sphere25cm_ep1",getPos _smoke,[],0,"can_collide"];
RWsign = "sign_sphere25cm_ep1" createVehicle position _smoke;
//RWlaze = createVehicle ["LaserTargetW",getPos RWsign,[],0,"can_collide"];
RWlaze = "LaserTargetW" createVehicle position RWsign;

RWlaze attachTo [RWsign,[0,0,.2]];

deleteVehicle _smoke;

hideObject RWsign;

_target addEventHandler["Killed", {[_this select 0, _this select 1, [RWlaze,RWsign]] execVM "008\laserTargetEH.sqf"}];

_targetPos = getPos _target;

_mrkr2color 	= [];

switch (side _target) do {

	case west:		{_mrkr2color = "ColorBlue"};
	case east:		{_mrkr2color = "ColorRed"};
	case resistance:	{_mrkr2color = "ColorGreen"};
	case civilian:		{_mrkr2color = "ColorYellow"};
};

_marker2 = createMarkerLocal ["RWTarget", _targetPos];
_marker2 setMarkerType "EMPTY";
_marker2 setMarkerShapeLocal "ELLIPSE"; 
_marker2 setMarkerBrushLocal "BORDER"; 
_marker2 setMarkerTextLocal "";
_marker2 setMarkerSizeLocal [100,100];
_marker2 setMarkerColorLocal _mrkr2color;
	
if (isNil {_unit getVariable "RotaryWing"}) then {
	
//_vehicle = "AH1Z";
//_vehicle = "AH64D";
//_vehicle = "AH64D_EP1";
//_vehicle = "AH6J_EP1";
//_vehicle = "AH6X_EP1";
//_vehicle = "AW159_Lynx_BAF";
//_vehicle = "BAF_Apache_AH1_D";
//_vehicle = "BAF_Merlin_HC3_D";
//_vehicle = "CH_47F_BAF";
//_vehicle = "CH_47F_EP1";
//_vehicle = "Ka52";
//_vehicle = "Ka52Black";
//_vehicle = "Ka137_PMC";
//_vehicle = "Ka137_MG_PMC";
//_vehicle = "Ka60_GL_PMC";
//_vehicle = "Ka60_PMC";
//_vehicle = "MH60S";
//_vehicle = "MH6J_EP1";
//_vehicle = "Mi17_CDF";
//_vehicle = "Mi17_Civilian";
//_vehicle = "Mi17_medevac_CDF";
//_vehicle = "Mi17_medevac_Ins";
//_vehicle = "Mi17_medevac_RU";
//_vehicle = "Mi17_rockets_RU";
//_vehicle = "Mi17_TK_EP1";
//_vehicle = "Mi17_UN_CDF_EP1";
//_vehicle = "Mi171Sh_CZ_EP1";
//_vehicle = "Mi171Sh_rockets_CZ_EP1";
//_vehicle = "Mi24_D";
//_vehicle = "Mi24_D_TK_EP1";
//_vehicle = "Mi24_P";
//_vehicle = "Mi24_V";
//_vehicle = "MV22";
//_vehicle = "UH1H_TK_EP1";
//_vehicle = "UH1H_TK_GUE_EP1";
//_vehicle = "UH1Y";
//_vehicle = "UH1Y_cutscene";
//_vehicle = "UH60M_EP1";
//_vehicle = "UH60M_MEV_EP1";

_vehicle = [];

switch (playerSide) do 
{
	case west: 		{_vehicle = "AH64D_EP1"};
	case east: 		{_vehicle = "Ka52Black"};
	case resistance: 	{_vehicle = "Ka137_MG_PMC"};
	case civilian: 	{_vehicle = "Mi17_Civilian"};
};

_mrkrcolor 	= [];

switch (_sideUnit) do {

	case west:		{_mrkrcolor = "ColorBlue"};
	case east:		{_mrkrcolor = "ColorRed"};
	case resistance:	{_mrkrcolor = "ColorGreen"};
	case civilian:		{_mrkrcolor = "ColorYellow"};        
};

_marker = createMarkerLocal ["RWStart", _spawnLoc];
_marker setMarkerTypeLocal "select";
_marker setMarkerShapeLocal "Icon";  
_marker setMarkerTextLocal " RWStart";
_marker setMarkerSizeLocal [0.75,0.75];
_marker setMarkerColorLocal _mrkrcolor;	

	_blinky = "Sign_sphere10cm_EP1" createVehicle _spawnLoc;
	_flightPath = [_blinky, _target] call BIS_fnc_relativeDirTo;	
	deleteVehicle _blinky;	

	_ch = [[_spawnLoc select 0, _spawnLoc select 1, 300], _flightPath, _vehicle, side _unit] call BIS_fnc_spawnVehicle;

	_unit setVariable ["RotaryWing", _vehicle, true];
			
	RotaryWingCAS = _ch select 0;
	
	_chGroup = _ch select 2; 
	
	addSwitchableUnit leader _chGroup;
		
	_ch select 0 setVehicleInit "RotaryWingCAS = this; this setVehicleVarName 'RotaryWingCAS'; RotaryWingCASGroup=group this; this setGroupID ['RotaryWingCASGroup', 'GroupColor4'];  
	this flyInHeight 70;
	this setVariable ['speedLimit', 300];
	this setvehiclelock 'unlocked'; 
	this addWeaponCargo ['DMR',1]; 
	this addMagazineCargo ['20Rnd_762x51_DMR',8]; 
	this addWeaponCargo ['m240_scoped_EP1',1];
	this addMagazineCargo ['100Rnd_762x51_M240',4];
	this addWeaponCargo ['JAVELIN',1]; 
	this addMagazineCargo ['JAVELIN',4];
	[this] execVM '008\loadoutAir.sqf';
	this addEventHandler ['Fired',{[_this select 0,getNumber (configFile/'CfgAmmo'/(_this select 4)/'explosive')] spawn {if (_this select 1==1) then {sleep 0.5};_this select 0 setVehicleAmmo 1; _this select 0 setVariable ['RWCASfired', [] + [1]];}}];
	this addEventHandler ['killed', {[_this select 0, _this select 1, ['RWStart']] execVM '008\onKilled.sqf'}];
	this addEventHandler ['handleDamage', { (damage (_this select 0)) +  0.01; (damage (_this select 2)) +  0.01 }]; 
	{[_x] execVM '008\adfalse.sqf'} forEach crew this;
	this addeventhandler ['getin', {_nul=[_this select 2] execVM '008\adfalse.sqf'}];
	this addeventhandler ['getout', {_nul=[_this select 2] execVM '008\adtrue.sqf'}];";
	processInitCommands;
	
	RotaryWingCAS spawn {
		
	while {alive _this && canMove _this} do {
		
		_this limitSpeed (_this getVariable "speedLimit");
		
		uisleep 0.1;			
		};		
	};

	RotaryWingCAS spawn {
		
	while {alive _this && canMove _this} do {
		
	if (currentWeapon player == "Laserdesignator" && cameraOn == player && cameraView == "Gunner") then 
	{	
		detach RWlaze;

		deleteVehicle RWlaze;
			    
		deleteVehicle RWsign;
		
		hintSilent "Laser designator view is on. Target laser spot is deleted.";	    
	} else {		
		hintSilent "Laser designator view is off.";	
	};	
		sleep 2;	   
	};

	};
	
	RotaryWingCAS spawn {
	
	while {alive RotaryWingCAS && canMove RotaryWingCAS} do {
		
		waitUntil {[RotaryWingCAS, RWlaze] call BIS_fnc_distance2D < 200};
			
		_kv = RotaryWingCAS knowsAbout RWlaze;
		
	if (_kv < 1) then	
	{	
		detach RWlaze;

		deleteVehicle RWlaze;
			    
		deleteVehicle RWsign;

		RotaryWingCAS SideChat format ["Pilot cannot see target. Target knowledge is %1. Laser spot is deleted.",round(_kv)];	    
	} else {		
		RotaryWingCAS SideChat format ["Pilot can see target. Target knowledge is %1.",round(_kv)];	
	};		
		sleep 5;
	};
	
	};	
	
	RotaryWingCAS spawn {
	
	while {alive RotaryWingCAS && canMove RotaryWingCAS} do {
		
		waitUntil {[RotaryWingCAS, RWlaze] call BIS_fnc_distance2D < 200};
			
		_RWCASfired = RotaryWingCAS getVariable "RWCASfired";
		PAPABEAR=[_sideUnit,"HQ"]; PAPABEAR SideChat format ["RotaryWingCAS has fired %1 rocket rounds.", _RWCASfired];
		//hint format ["%1",_RWCASfired];
		
	if (_RWCASfired > 0) then	
	{	
		detach RWlaze;

		deleteVehicle RWlaze;
			    
		deleteVehicle RWsign;

		RotaryWingCAS SideChat format ["Pilot has fired rockets, %1. Laser spot is deleted.",_RWCASfired];	    
	} else {		
		RotaryWingCAS SideChat format ["Pilot has fired rockets, %1. Laser spot is deleted.",_RWCASfired];	
	};		
		sleep 5;
	};
	
	};
};

_airDist2 = [RotaryWingCAS, _targetPos] call BIS_fnc_distance2D;
	
PAPABEAR=[_sideUnit,"HQ"]; PAPABEAR SideChat format ["RotaryWingCAS is %1 meters distant from %2.", round(_airDist2)/1.0, typeOf _target];

while {(count (waypoints RotaryWingCASGroup)) > 0} do {
	deleteWaypoint ((waypoints RotaryWingCASGroup) select 0);
	sleep 0.01;
	};
				    
	wp0 = RotaryWingCASGroup addwaypoint [_targetPos, 100];
	wp0 setwaypointtype "MOVE";	
	wp0 setWaypointBehaviour "AWARE";
	wp0 setWaypointCombatMode "YELLOW";
	wp0 setWaypointSpeed "NORMAL";
	wp0 setWaypointStatements ["true","RotaryWingCAS setVariable ['speedLimit', 100]; driver (vehicle this) sideChat 'RotaryWingCAS in target area!';"];
				
	wp1 = RotaryWingCASGroup addwaypoint [_unitPos, 100];
	wp1 setwaypointtype "MOVE";	
	wp1 setWaypointBehaviour "AWARE";
	wp1 setWaypointCombatMode "RED";
	wp1 setWaypointSpeed "LIMITED";
	wp1 setWaypointStatements ["true",""];

	wp2 = RotaryWingCASGroup addwaypoint [_targetPos, 100];
	wp2 setwaypointtype "MOVE";	
	wp2 setWaypointBehaviour "AWARE";
	wp2 setWaypointCombatMode "RED";
	wp2 setWaypointSpeed "NORMAL";
	wp2 setWaypointStatements ["true",""];
				
	wp3 = RotaryWingCASGroup addwaypoint [_unitPos, 100];
	wp3 setwaypointtype "MOVE";	
	wp3 setWaypointBehaviour "AWARE";
	wp3 setWaypointCombatMode "RED";
	wp3 setWaypointSpeed "LIMITED";
	wp3 setWaypointStatements ["true","!alive RWlaze; RotaryWingCAS setVariable ['speedLimit', 300]; driver (vehicle this) sideChat 'RotaryWingCAS returning to BASE!';"];
	
	wp4 = RotaryWingCASGroup addwaypoint [_spawnLoc, 100];
	wp4 setwaypointtype "MOVE";
	wp4 setWaypointBehaviour "AWARE";
	wp4 setWaypointCombatMode "GREEN";
	wp4 setWaypointSpeed "FULL";
	wp4 setWaypointStatements ["true","{deletevehicle _x} foreach (crew vehicle this + [vehicle this]);"];

	waitUntil {!alive RotaryWingCAS};
	
 	PAPABEAR=[_sideUnit,"HQ"]; PAPABEAR SideChat format ["RotaryWingCAS ready for reassignment!"];

	_unit setVariable ["RotaryWing",nil];
	deleteMarkerLocal "RWStart";
	deleteMarkerLocal "RWTarget";
	detach RWlaze;
	deleteVehicle RWlaze;
	deleteVehicle RWsign;
	
} else {
		
	PAPABEAR=[_sideUnit,"HQ"]; PAPABEAR SideChat format ["No targets in that area, %1!", name _unit];
	uisleep 1;
  };
};	
