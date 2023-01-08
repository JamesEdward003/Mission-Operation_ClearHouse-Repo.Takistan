//////////////////////////////////////////////////////
//  From trigger:
//  nul = [player] execVM "plannedFixedWing.sqf";
//
//  Pre-place "hStart" marker on the map.
/////////////////////////////////////////////////////

waituntil {!isnil "bis_fnc_init"};

_unit = _this select 0;
_sideUnit = side _unit;
_unitPos = getPos _unit;
_sourcePoint = _unit;

_vehicle = [];

switch (playerSide) do 
{
	case west: 		{_vehicle = "AV8B"};
	case east: 		{_vehicle = "Su34"};
	case resistance: 	{_vehicle = "Su25_Ins"};
	case civilian: 	{_vehicle = "An2_1_TK_CIV_EP1"};
};

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

_arrayM 	= ["TARGET21","TARGET22","TARGET23","TARGET24","TARGET25","TARGET26","TARGET27","TARGET28","TARGET29","TARGET31","TARGET32","TARGET33","TARGET34","TARGET35"];
_randomM	= _arrayM select floor random count _arrayM;
	
_hEnd = _randomM;
_hStart = "hStart";
_hStartLoc = getMarkerPos "hStart";

_randDir = getDir vehicle _sourcePoint - 10;
_randDir = _randDir + random(20);
_randDist = (random 100) + 4000;
_spawnLoc =	[(getPos vehicle _sourcePoint select 0) + (_randDist * sin(_randDir)), (getPos vehicle _sourcePoint select 1) + (_randDist * cos(_randDir)), 0];

"hStart" setMarkerPos _spawnLoc;

if (isServer) then {
 
sleep 0.25;
openMap true;
sleep 0.25;

	PAPABEAR=[_sideUnit,"HQ"]; PAPABEAR SideChat format ["FixedWingCAS ready, %1, mark your target on the map!", name _unit];
	
dt=true;
onMapSingleClick "FWTarget = _pos;dt=false";
waitUntil {!dt};
onMapSingleClick "";

	_blinky = "Sign_sphere10cm_EP1" createVehicle FWTarget;	
	_targets = nearestObjects[_blinky,["Man","Car","Air","Tank","Truck","Ship","Static","House","Office","Barracks","Hanger"], 75];
	_target = _targets select 0;
	[_target] execVM "008\twirlyMrkr.sqf";
	_type = typeOf _target;
	deleteVehicle _blinky;
				
sleep 2;
openMap false;	

	_start = getMarkerPos "hStart";
	_end = getMarkerPos _randomM;
	"hStart" setMarkerPos _hStartLoc;
	_airDist = _unit distance _target;

if (count _targets > 0) then

{		
	//PAPABEAR=[_sideUnit,"HQ"]; PAPABEAR SideChat format ["%1 marked is %2 meters distant from %3.", typeOf _target, round(_airDist)/1.0, name _unit];

	_blinky = "Sign_sphere10cm_EP1" createVehicle _start;
	_flightPath = [_blinky, _end] call BIS_fnc_relativeDirTo;	
	deleteVehicle _blinky;	

	_ch = [[_start select 0, _start select 1, 300], _flightPath, _vehicle, side _unit] call BIS_fnc_spawnVehicle;
	
	FixedWingCAS = _ch select 0;
	
	_chGroup = _ch select 2; 
	
	addSwitchableUnit leader _chGroup;
		
	_ch select 0 setVehicleInit "FixedWingCAS = this; this setVehicleVarName 'FixedWingCAS'; FixedWingCASGroup=group this; this setGroupID ['FixedWingCASGroup', 'GroupColor4'];  
	this flyInHeight 300;
	this setvehiclelock 'unlocked'; 
	this addWeaponCargo ['DMR',1]; 
	this addMagazineCargo ['20Rnd_762x51_DMR',8]; 
	this addWeaponCargo ['m240_scoped_EP1',1];
	this addMagazineCargo ['100Rnd_762x51_M240',4];
	this addWeaponCargo ['JAVELIN',1]; 
	this addMagazineCargo ['JAVELIN',4];
	[this] execVM '008\loadoutAir.sqf';
	this addEventHandler ['Fired',{[_this select 0,getNumber (configFile/'CfgAmmo'/(_this select 4)/'explosive')] spawn {if (_this select 1==1) then {sleep 0.5};_this select 0 setVehicleAmmo 1}}];
	this addEventHandler ['killed', {[_this select 0, _this select 1, ['hEnd']] execVM '008\onKilled.sqf'}];
	this addEventHandler ['handleDamage', { (damage (_this select 0)) +  0.01; (damage (_this select 2)) +  0.01 }]; 
	{[_x] execVM '008\adfalse.sqf'} forEach crew this;
	this addeventhandler ['getin', {_nul=[_this select 2] execVM '008\adfalse.sqf'}];
	this addeventhandler ['getout', {_nul=[_this select 2] execVM '008\adtrue.sqf'}];";
	processInitCommands;
 
	_arrayX 	= ["TaskX21","TaskX22","TaskX23","TaskX24","TaskX25","TaskX26","TaskX27","TaskX28","TaskX29","TaskX31","TaskX32","TaskX33","TaskX34","TaskX35"];
	_arrayY 	= ["laze21","laze22","laze23","laze24","laze25","laze26","laze27","laze28","laze29","laze31","laze32","laze33","laze34","laze35"];
	_randomX	= _arrayX select floor random count _arrayX;
	_laze 	= _arrayY select floor random count _arrayY;
			
	_laze = "LaserTargetW" createVehicle getPos _target;

	_laze attachTo [_target,[0,0,1]];

	[_target] execVM "008\unitMrkr2.sqf";
	//[_target] execVM "008\snapShots\snapShot2.sqf";
	//smoke = "Smokeshell" createVehicle [getPos _target select 0, getPos _target select 1, (getPos _target select 2) +40];
	_target addEventHandler["Killed", {[_this select 0, _this select 1, [_laze, _randomM]] execVM "008\laserTargetEH.sqf"}];
	
	[_randomX,_randomM,_type,player,[_randomX,getpos _target],"Assigned",_target] call SHK_Taskmaster_add;
	
	_targetPos = getPos _target;
	_hEnd setMarkerPos _targetPos;
	_airDist2 = FixedWingCAS distance _target;
	
	PAPABEAR=[_sideUnit,"HQ"]; PAPABEAR SideChat format ["FixedWingCAS is %1 meters distant from %2.", round(_airDist2)/1.0, typeOf _target];

	FixedWingCAS doTarget _target;
	
	//[this] execVM '008\loadoutAir.sqf';
	//[this] execVM '008\designation\laserSetup.sqf';
	////FixedWingCAS doFire _target;
	//FixedWingCAS commandFire _target;
	////FixedWingCAS fireAtTarget [_target]; 
	////FixedWingCAS fireAtTarget [_target,"Mk82BombLauncher_6"];
 	
	FixedWingCAS commandFire _target;
	    
	wp0 = _chGroup addwaypoint [_targetPos, 20];
	wp0 setwaypointtype "MOVE";	
	wp0 setWaypointBehaviour "COMBAT";
	wp0 setWaypointCombatMode "RED";
	wp0 setWaypointSpeed "NORMAL";
	wp0 setWaypointStatements ["true",""];
	
	waitUntil {!alive _target};
	
	[_randomX,"Succeeded"] call SHK_Taskmaster_upd;
	
	deleteMarker _hEnd;
	deleteMarker _randomX;
	
	wp1 = _chGroup addwaypoint [_unitPos, 20];
	wp1 setwaypointtype "MOVE";	
	wp1 setWaypointBehaviour "AWARE";
	wp1 setWaypointCombatMode "GREEN";
	wp1 setWaypointSpeed "FULL";
	wp1 setWaypointStatements ["true","driver (vehicle this) sideChat format ['FixedWingCAS returning to BASE!'];"];

	wp2 = _chGroup addwaypoint [_start, 20];
	wp2 setwaypointtype "MOVE";
	wp2 setWaypointBehaviour "CARELESS";
	wp2 setWaypointCombatMode "BLUE";
	wp2 setWaypointSpeed "FULL";
	wp2 setWaypointStatements ["true","{deletevehicle _x} foreach (crew vehicle this + [vehicle this]);"];

	waitUntil {!alive FixedWingCAS};
	
 	PAPABEAR=[_sideUnit,"HQ"]; PAPABEAR SideChat format ["FixedWingCAS ready for reassignment!"];

} else {
		
	PAPABEAR=[_sideUnit,"HQ"]; PAPABEAR SideChat format ["No targets in that area, %1!", name _unit];
	uisleep 1;
	
 	deleteMarkerLocal _randomM;
  };
};	
