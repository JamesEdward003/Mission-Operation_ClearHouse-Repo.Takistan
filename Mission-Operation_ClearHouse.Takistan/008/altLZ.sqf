//////////////////////////////////////////////////////////////////
// Function file for Armed Assault
// Created by:  DieHard - Function file for ArmA 2: Operation Arrowhead
//////////////////////////////////////////////////////////////////
_vehicle 	= _this select 0;
_caller 		= _this select 1;                                       

_vehicleVarName = vehicleVarName _vehicle;
_vehiclegroup = group _vehicle;
_lzMkrColor = "ColorOrange";
_hEnd2 = "hEnd2";
_hStart = "hStart";
_hStartLoc = getMarkerPos "hStart";
_hDest = "airStart";
_hDestLoc = getMarkerPos "airStart";

if (isServer) then {
	
sleep 0.1;
openMap true;

	deleteVehicle lzPickup;
	deleteVehicle lzDropOff;
	deleteVehicle lzDropOff2;
	deleteMarker "hEnd";
	deleteMarker "hEnd2";
	
sleep 0.1;
	PAPABEAR=[West,"HQ"]; PAPABEAR SideChat format ["%1 to your new position, %2, mark your new destination on the map.", _vehicleVarName, name _caller];
dt=true;
onMapSingleClick "infTarget2 = _pos;dt=false";
waitUntil {!dt};
onMapSingleClick "";

	createMarkerLocal [_hEnd2, infTarget2];
	_hEnd2 setMarkerTypeLocal "b_air";
	_hEnd2 setMarkerShapeLocal "Icon";
	_hEnd2 setMarkerTextLocal _hEnd2;
	_hEnd2 setMarkerSizeLocal [1,1];
	_hEnd2 setMarkerColorLocal _lzMkrColor;
				
sleep 0.5;
openMap false;
	_end2 = getMarkerPos _hEnd2;
	_start = getMarkerPos _hStart;
		
	while {(count (waypoints _vehiclegroup)) > 0} do {
		deleteWaypoint ((waypoints _vehiclegroup) select 0);
		sleep 0.01;
		};
	
	//PAPABEAR=[West,"HQ"]; PAPABEAR SideChat "TRANSPORT HELICOPTER relocating to your new position.";
	PAPABEAR=[West,"HQ"]; PAPABEAR SideChat format ["%1 relocating to your new position.", _vehicleVarName];

	lzDropOff2 = "HeliHEmpty" createvehicle _end2;
	// Select random Task numbers
	_arrayY  = ["TaskY11","TaskY12","TaskY13","TaskY14","TaskY15","TaskY16","TaskY17","TaskY18","TaskY19","TaskY21","TaskY22","TaskY23","TaskY24","TaskY25"];
	_arrayZ  = ["TaskZ11","TaskZ12","TaskZ13","TaskZ14","TaskZ15","TaskZ16","TaskZ17","TaskZ18","TaskZ19","TaskZ21","TaskZ22","TaskZ23","TaskZ24","TaskZ25"];

	_randomY = _arrayY select floor random count _arrayY;
	_randomZ = _arrayZ select floor random count _arrayZ;
	
	[_randomY,"Cancelled",[_randomZ,"Next Landing Zone","Next Landing Zone",player,[_randomZ,getpos lzDropOff2],"Assigned",lzDropOff2]] call SHK_Taskmaster_upd;
				 
	// If "TR UNLOAD" It'll auto boot the leader once there, but he'll have to tell the others to get out.	
	wp0 = _vehiclegroup addWaypoint [_end2, 20];
	wp0 setWaypointType "TR UNLOAD";
	wp0 setWaypointBehaviour "CARELESS";
	wp0 setWaypointCombatMode "BLUE";
	wp0 setWaypointSpeed "NORMAL";
	wp0 setWaypointStatements ["true","(vehicle this) land 'GET OUT'"];
		
	// Wait till the player's group is out of the helo.
	waitUntil{{_x in _vehicle} count units group _caller == 0};
	
	[_randomZ,"Succeeded"] call SHK_Taskmaster_upd;
		
	// Once they are out, set a waypoint back to the start and clean up by deleting the helo and landing pads.
	wp1 = _vehiclegroup addwaypoint [_start, 20];
	wp1 setwaypointtype "MOVE";
	wp1 setWaypointBehaviour "CARELESS";
	wp1 setWaypointCombatMode "BLUE";
	wp1 setWaypointSpeed "NORMAL";
	wp1 setWaypointStatements ["true","{deletevehicle _x} foreach (crew vehicle this + [vehicle this]); PAPABEAR=[West,'HQ']; PAPABEAR SideChat format ['TransportHelo ready for reassignment!'];"];
	
	deleteVehicle lzPickup;
	deleteVehicle lzDropOff;
	deleteVehicle lzDropOff2;
	deleteMarker "hEnd";
	deleteMarker "hEnd2";	
	deleteMarker _randomY;
	deleteMarker _randomZ;
	_hStart setMarkerPos _hDestLoc;	
};
