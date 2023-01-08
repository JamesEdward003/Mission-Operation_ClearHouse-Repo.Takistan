//////////////////////////////////////////////////////
//  From trigger:
//  _nul = [player] execVM "plannedRotaryWing.sqf";
/////////////////////////////////////////////////////

waituntil {!isnil "bis_fnc_init"};

_unit = _this select 0;
_sideUnit = side _unit;
_unitPos = getPos _unit;
_sourcePoint = _unit;

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

         case west:			{_mrkrcolor = "ColorBlue"};
         case east:			{_mrkrcolor = "ColorRed"};
         case resistance:	{_mrkrcolor = "ColorGreen"};
         case civilian:		{_mrkrcolor = "ColorYellow"};
};

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

_randDir = getDir vehicle _sourcePoint - 10;
_randDir = _randDir + random(20);
_randDist = (random 100) + 3000;
_spawnLoc =	[(getPos vehicle _sourcePoint select 0) + (_randDist * sin(_randDir)), (getPos vehicle _sourcePoint select 1) + (_randDist * cos(_randDir)), 0];

_marker = createMarkerLocal ["hStart", _spawnLoc];
_marker setMarkerTypeLocal "select";
_marker setMarkerShapeLocal "Icon";  
_marker setMarkerTextLocal "hStart";
_marker setMarkerSizeLocal [0.75,0.75];
_marker setMarkerColorLocal _mrkrcolor;	

if (isServer) then {
 
sleep 0.25;
openMap true;
sleep 0.25;

	PAPABEAR=[_sideUnit,"HQ"]; PAPABEAR SideChat format ["RotaryWingCAS ready, %1, mark your target on the map!", name _unit];
	
dt=true;
onMapSingleClick "RWTarget = _pos;dt=false";
waitUntil {!dt};
onMapSingleClick "";

	_blinky = "Sign_sphere10cm_EP1" createVehicle RWTarget;	
	_targets = nearestObjects[_blinky,["Man","Car","Air","Tank","Truck","Ship","Static","House","Office","Barracks","Hanger"], 75];
	_target = _targets select 0;
	[_target] execVM "008\twirlyMrkr.sqf";
	_type = typeOf _target;
	deleteVehicle _blinky;
			
sleep 2;
openMap false;	

	_airDist = _unit distance _target;

if (count _targets > 0) then

{		
	//PAPABEAR=[_sideUnit,"HQ"]; PAPABEAR SideChat format ["%1 marked is %2 meters distant from %3.", typeOf _target, round(_airDist)/1.0, name _unit];

	_blinky = "Sign_sphere10cm_EP1" createVehicle _spawnLoc;
	_flightPath = [_blinky, _target] call BIS_fnc_relativeDirTo;	
	deleteVehicle _blinky;	
	
	_ch = [[_spawnLoc select 0, _spawnLoc select 1, 100], _flightPath, _vehicle, side _unit] call BIS_fnc_spawnVehicle;
	
	RotaryWingCAS = _ch select 0;
	
	_chGroup = _ch select 2; 
	
	addSwitchableUnit leader _chGroup;
		
	_ch select 0 setVehicleInit "RotaryWingCAS = this; this setVehicleVarName 'RotaryWingCAS'; RotaryWingCASGroup=group this; this setGroupID ['RotaryWingCASGroup', 'GroupColor4'];  
	this flyInHeight 80;
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

	_arrayY 	= ["laze11","laze12","laze13","laze14","laze15","laze16","laze17","laze18","laze19","laze21","laze22","laze23","laze24","laze25"];
	_laze 	= _arrayY select floor random count _arrayY;
			
//	_laze = "LaserTargetW" createVehicle getPos _target;
	_laze = "Sign_sphere25cm_EP1" createVehicle getPos _target;

	_laze attachTo [_target,[0,0,1]];

	[_target] execVM "008\unitMrkr2.sqf";

	_target addEventHandler["Killed", {[_this select 0, _this select 1, [_laze]] execVM "008\laserTargetEH.sqf"}];
	
	_targetPos = getPos _target;

	_airDist2 = RotaryWingCAS distance _target;
	
	PAPABEAR=[_sideUnit,"HQ"]; PAPABEAR SideChat format ["RotaryWingCAS is %1 meters distant from %2.", round(_airDist2)/1.0, typeOf _target];
	
	wp0 = _chGroup addwaypoint [_targetPos, 20];
	wp0 setwaypointtype "MOVE";	
	wp0 setWaypointBehaviour "AWARE";
	wp0 setWaypointCombatMode "YELLOW";
	wp0 setWaypointSpeed "NORMAL";
	wp0 setWaypointStatements ["true",""];

	waitUntil {_airDist2 > 60};

	deleteMarkerLocal _marker;
	
	wp1 = _chGroup addwaypoint [_unitPos, 20];
	wp1 setwaypointtype "MOVE";	
	wp1 setWaypointBehaviour "AWARE";
	wp1 setWaypointCombatMode "GREEN";
	wp1 setWaypointSpeed "LIMITED";
	wp1 setWaypointStatements ["true","driver (vehicle this) sideChat format ['RotaryWingCAS returning to BASE!'];"];

	wp2 = _chGroup addwaypoint [_spawnLoc, 20];
	wp2 setwaypointtype "MOVE";
	wp2 setWaypointBehaviour "CARELESS";
	wp2 setWaypointCombatMode "BLUE";
	wp2 setWaypointSpeed "FULL";
	wp2 setWaypointStatements ["true","{deletevehicle _x} foreach (crew vehicle this + [vehicle this]);"];
			
	waitUntil {!alive RotaryWingCAS};
	
 	PAPABEAR=[_sideUnit,"HQ"]; PAPABEAR SideChat format ["RotaryWingCAS ready for reassignment!"];

} else {
		
	PAPABEAR=[_sideUnit,"HQ"]; PAPABEAR SideChat format ["No targets in that area, %1!", name _unit];
	uisleep 1;
	
 	deleteMarkerLocal _marker;
  };
};	
