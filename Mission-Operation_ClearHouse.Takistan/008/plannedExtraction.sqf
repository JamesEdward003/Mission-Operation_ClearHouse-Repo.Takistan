//////////////////////////////////////////////////////
//  From trigger:
//  nul = [player] execVM "plannedExtraction.sqf";
/////////////////////////////////////////////////////

waituntil {!isnil "bis_fnc_init"};

_unit = _this select 0;
_sideUnit = side _unit;
_unitPos = getPos _unit;
_sourcePoint = _unit;

_vehicle = [];

switch (playerSide) do 
{
	case west: 		{_vehicle = "UH1Y"};
	case east: 		{_vehicle = "Mi17_rockets_RU"};
	case resistance: 	{_vehicle = "UH1H_TK_GUE_EP1"};
	case civilian: 	{_vehicle = "Mi17_Civilian"};
};

_mrkrcolor 	= [];

switch (_sideUnit) do {

         case west:			{_mrkrcolor = "ColorBlue"};
         case east:			{_mrkrcolor = "ColorRed"};
         case resistance:	{_mrkrcolor = "ColorGreen"};
         case civilian:		{_mrkrcolor = "ColorYellow"};
};

//_vehicle = "CH_47F_EP1";
//_vehicle = "fza_ah64d_b2e_nr";
//_vehicle = "OFrP_Caracal";
//_vehicle = "OFrP_Caracal_DAOS";
//_vehicle = "OFrP_Caracal_RESCO";
//_vehicle = "OFrP_Puma_CE_Pirate";
//_vehicle = "OFrP_Tiger_HAD_CE";
//_vehicle = "MAF_AS555_EALAT";
//_vehicle = "Ka60_PMC";
//_vehicle = "Ka60_GL_PMC";
//_vehicle = "Ka137_PMC";
//_vehicle = "Ka137_MG_PMC";
//_vehicle = "MAF_AS555_EALAT";
//_vehicle = "MAF_AS555_EALAT";

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

	PAPABEAR=[_sideUnit,"HQ"]; PAPABEAR SideChat format ["TransportHelo to your position, %1, mark your destination on the map.", name _unit];
	
dt=true;
onMapSingleClick "infTarget = _pos;dt=false";
waitUntil {!dt};
onMapSingleClick "";

	createMarkerLocal ["LZ", infTarget];
	_hEnd setMarkerTypeLocal "b_air";
	_hEnd setMarkerShapeLocal "Icon";
	_hEnd setMarkerTextLocal "LZ";
	_hEnd setMarkerSizeLocal [1,1];
	_hEnd setMarkerColorLocal _mrkrcolor;
			
sleep 2;
openMap false;	

	_start = getMarkerPos "hStart";
//	_loc = [getMarkerPos _txt, 60, 120, 3, 0, 20, 0] call BIS_fnc_findSafePos;
	_landPos = [_unit, 20, getdir _unit] call BIS_fnc_relPos;
	
	// Create a little shiney ball we can use to get the direction from start to caller with
	_blinky = "Sign_sphere10cm_EP1" createVehicle _start;
	_flightPath = [_blinky, _unit] call BIS_fnc_relativeDirTo;		
	
	// Spawn the helo, facing the user, in the air at the start location.
	_ch = [[_start select 0, _start select 1, 70], _flightPath, _vehicle, side _unit] call BIS_fnc_spawnVehicle;
	
	// Name the helo globally so that waypoint orders will work.
	transporthelo = _ch select 0;
	
	// group of helo so waypoints work.
	_chGroup = _ch select 2; 
	
	// Make sure they don't get distracted.
	//leader _chGroup setBehaviour "CARELESS";
	
	// uncomment this to make your ride safe. 
	//transporthelo setCaptive true; 
	
	// These lines might be needed in MP. :)  Didn't test it yet.
	_ch select 0 setVehicleInit "TransportHelo = this; this setVehicleVarName 'TransportHelo'; TransportHeloGroup=group this; this setGroupID ['TransportHeloGroup', 'GroupColor4'];  
	this setvehiclelock 'unlocked'; 
	clearWeaponCargo this;
	this addWeaponCargo ['DMR',1]; 
	this addMagazineCargo ['20Rnd_762x51_DMR',8]; 
	this addWeaponCargo ['m240_scoped_EP1',1];
	this addMagazineCargo ['100Rnd_762x51_M240',4];
	this addWeaponCargo ['JAVELIN',1]; 
	this addMagazineCargo ['JAVELIN',4];
	[this] execVM '008\loadoutAir.sqf';
	[this] execVM '008\SeatAction\seat_action.sqf';
	[this] execVM '008\heliDoors.sqf';
	this addAction['<t color=''#FFD700''>Deploy RallyPoint</t>', '008\RallyPoint.sqf', [], 6, False, True, '', ''];
	ALZ = this addAction ['Alternate Landing Zone', '008\altLZ.sqf',[],3,false,true,'',''];
	this setVariable ['Alternate Landing Zone', ALZ];
	this addEventHandler ['Fired',{[_this select 0,getNumber (configFile/'CfgAmmo'/(_this select 4)/'explosive')] spawn {if (_this select 1==1) then {sleep 0.5};_this select 0 setVehicleAmmo 1}}];
	this addEventHandler ['killed', {[_this select 0, _this select 1, [lzPickup, lzDropOff, 'hEnd']] execVM '008\onKilled.sqf'}];
	this addEventHandler ['handleDamage', { (damage (_this select 0)) +  0.01; (damage (_this select 2)) +  0.01 }]; 
	{[_x] execVM '008\adfalse.sqf'} forEach crew this;
	this addeventhandler ['getin', {_nul=[_this select 2] execVM '008\adfalse.sqf'}];
	this addeventhandler ['getout', {_nul=[_this select 2] execVM '008\adtrue.sqf'}];";
	processInitCommands;

sleep 0.25;   
	//PAPABEAR=[West,"HQ"]; PAPABEAR SideChat "TRANSPORT HELICOPTER to your position.";
	PAPABEAR=[_sideUnit,"HQ"]; PAPABEAR SideChat format ["TransportHelo to your position", name _unit];
		
	// Delete the cute little light that let us spawn facing the right direction
	// and create landing pads for pickup and dropoff.
	deleteVehicle _blinky;
	lzPickup = "HeliHEmpty" createvehicle _landPos;
	lzDropOff = "HeliHEmpty" createvehicle _end;
	// Select random Task numbers
	_arrayX  = ["TaskX11","TaskX12","TaskX13","TaskX14","TaskX15","TaskX16","TaskX17","TaskX18","TaskX19","TaskX21","TaskX22","TaskX23","TaskX24","TaskX25"];
	_arrayY  = ["TaskY11","TaskY12","TaskY13","TaskY14","TaskY15","TaskY16","TaskY17","TaskY18","TaskY19","TaskY21","TaskY22","TaskY23","TaskY24","TaskY25"];
	_randomX = _arrayX select floor random count _arrayX;
	_randomY = _arrayY select floor random count _arrayY;

	[_randomX,"Landing Zone","Landing Zone",player,[_randomX,getpos lzPickup],"Assigned",lzPickup] call SHK_Taskmaster_add;
	
	driver TransportHelo setBehaviour "CARELESS";
	
	// Give the helo a waypoint to where the player is and make it land, engines on.
	wp0 = _chGroup addwaypoint [_landPos, 20];
	wp0 setwaypointtype "LOAD";	
	wp0 setWaypointBehaviour "AWARE";
	wp0 setWaypointCombatMode "BLUE";
	wp0 setWaypointSpeed "NORMAL";
	wp0 setWaypointStatements ["true","(vehicle this) land 'GET IN'"];
	
	// Wait till the player's group is in the helo.
	waitUntil{{_x in transporthelo} count units group _unit == count units group _unit};

	[_randomX,"Succeeded",[_randomY,"Next Landing Zone","Next Landing Zone",player,[_randomY,getpos lzDropOff],"Assigned",lzDropOff]] call SHK_Taskmaster_upd;
	
	// Once they are, off we go by setting a TRANSPORT UNLOAD waypoint.  
	// It'll auto boot the leader once there, but he'll have to tell the others to get out.
	wp1 = _chGroup addwaypoint [_end, 20];
	wp1 setwaypointtype "TR UNLOAD";	
	wp1 setWaypointBehaviour "CARELESS";
	wp1 setWaypointCombatMode "BLUE";
	wp1 setWaypointSpeed "NORMAL";
	wp1 setWaypointStatements ["true","(vehicle this) land 'GET OUT'"];
	
	// Wait till the player's group is out of the helo.
	waitUntil{{_x in Transporthelo} count units group _unit == 0};

	[_randomY,"Succeeded"] call SHK_Taskmaster_upd;
		
	// Once they are out, set a waypoint back to the start and clean up by deleting the helo and landing pads.
	wp2 = _chGroup addwaypoint [_start, 20];
	wp2 setwaypointtype "MOVE";
	wp2 setWaypointBehaviour "CARELESS";
	wp2 setWaypointCombatMode "BLUE";
	wp2 setWaypointSpeed "NORMAL";
	wp2 setWaypointStatements ["true","{deletevehicle _x} foreach (crew vehicle this + [vehicle this]);"];

	waitUntil{ _vehicle distance lzPickup < 100};
	
 	PAPABEAR=[_sideUnit,"HQ"]; PAPABEAR SideChat format ["RotaryWingCAS ready for reassignment!"];
 			
	deleteVehicle lzPickup;
	deleteVehicle lzDropOff;
	deleteMarker "hEnd";
	deleteMarker _randomX;
	deleteMarker _randomy;
	_hStart setMarkerPos _hDestLoc;
};
