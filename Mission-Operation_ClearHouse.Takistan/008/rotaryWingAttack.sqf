//////////////////////////////////////////////////////
//  From trigger:
//  _nul = [player,east] execVM "rotaryWingAttack.sqf";
/////////////////////////////////////////////////////

waituntil {!isnil "bis_fnc_init"};

_unit = _this select 0;
_sideAttack = _this select 1;
_sideUnit = sideEnemy;
_unitPos = getPos _unit;
_sourcePoint = _unit;

_vehicle = [];

switch (_sideAttack) do 
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
_spawnLoc = [(getPos vehicle _sourcePoint select 0) + (_randDist * sin(_randDir)), (getPos vehicle _sourcePoint select 1) + (_randDist * cos(_randDir)), 0];

_marker = createMarkerLocal ["hStart", _spawnLoc];
_marker setMarkerTypeLocal "select";
_marker setMarkerShapeLocal "Icon";  
_marker setMarkerTextLocal "hStart";
_marker setMarkerSizeLocal [0.75,0.75];
_marker setMarkerColorLocal _mrkrcolor;	

if (isServer) then {

	PAPABEAR=[_sideUnit,"HQ"]; PAPABEAR SideChat format ["Enemy rotary wing attack on the way, %1, prepare to defend!", name _unit];

	_blinky = "Sign_sphere10cm_EP1" createVehicle _unit;	
	_targets = nearestObjects[_blinky,["Car","Air","Tank","Truck","Ship","Static","House","Office","Barracks","Hanger"], 75];
	_target = _targets select 0;
	_type = typeOf _target;
	deleteVehicle _blinky;

	uisleep 4;
				
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
	this addEventHandler ['Fired',{[_this select 0,getNumber (configFile/'CfgAmmo'/(_this select 4)/'explosive')] spawn {if (_this select 1==1) then {sleep 0.5};_this select 0 setVehicleAmmo 1}}];
	processInitCommands;

	_laze = "Sign_sphere25cm_EP1" createVehicle getPos _target;

	_laze attachTo [_target,[0,0,1]];
	
	_targetPos = getPos _target;

	_airDist2 = RotaryWingCAS distance _target;
	
	PAPABEAR=[_sideUnit,"HQ"]; PAPABEAR SideChat format ["Enemy air attack is %1 meters distant from %2.", round(_airDist2)/1.0, typeOf _target];
	
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
	wp1 setWaypointStatements ["true","driver (vehicle this) sideChat format ['Leave the area or reattack imminent!'];"];

	wp2 = _chGroup addwaypoint [_spawnLoc, 20];
	wp2 setwaypointtype "MOVE";
	wp2 setWaypointBehaviour "CARELESS";
	wp2 setWaypointCombatMode "BLUE";
	wp2 setWaypointSpeed "FULL";
	wp2 setWaypointStatements ["true","{deletevehicle _x} foreach (crew vehicle this + [vehicle this]);"];
			
	waitUntil {!alive RotaryWingCAS};
	
 	PAPABEAR=[_sideUnit,"HQ"]; PAPABEAR SideChat format ["Enemy air attack is over!"];

} else {
		
	PAPABEAR=[_sideUnit,"HQ"]; PAPABEAR SideChat format ["No targets in that area, %1!", name _unit];
	uisleep 1;
	
 	deleteMarkerLocal _marker;
 
 	deleteVehicle _laze;
  };
};	
