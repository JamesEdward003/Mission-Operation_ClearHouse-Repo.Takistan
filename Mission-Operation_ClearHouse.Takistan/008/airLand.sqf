//////////////////////////////////////////////////////////////////
// Function file for Armed Assault
// Created by:  DieHard - Function file for ArmA 2: Operation Arrowhead
//////////////////////////////////////////////////////////////////
_vehicle 	= vehicle player;
_caller 		= player;     
_vehicle removeaction ALZ;    

_vehicle 	= cursorTarget;              

_vehicleVarName = vehicleVarName _vehicle;
_vehiclegroup = group _vehicle;
_vehiclepilot = driver _vehicle;
_lzMkrColor = "ColorOrange";
_hStart = "hStart";
_hStartLoc = getMarkerPos "hStart";
_hEnd4 = "hEnd4";
_hDest = "airStart";
_hDestLoc = getMarkerPos "airStart";

if (isServer) then {
	
sleep 0.1;
openMap true;

	deleteVehicle lzPickup;
	deleteVehicle lzDropOff;
	deleteVehicle lzDropOff2;
	deleteVehicle lzDropOff3;
	deleteVehicle lzDropOff4;
	deleteMarker "hEnd";
	deleteMarker "hEnd2";	
	deleteMarker "hEnd3";
	deleteMarker "hEnd4";
	
sleep 0.1;
	PAPABEAR=[West,"HQ"]; PAPABEAR SideChat format ["%1 to your position, %2, mark your destination on the map.", _vehicleVarName, name _caller];
dt=true;
onMapSingleClick "infTarget4 = _pos;dt=false";
waitUntil {!dt};
onMapSingleClick "";

	createMarkerLocal [_hEnd4, infTarget4];
	_hEnd4 setMarkerTypeLocal "b_air";
	_hEnd4 setMarkerShapeLocal "Icon";
	_hEnd4 setMarkerTextLocal _hEnd4;
	_hEnd4 setMarkerSizeLocal [1,1];
	_hEnd4 setMarkerColorLocal _lzMkrColor;
				
sleep 0.5;
openMap false;
	_end4 = getMarkerPos _hEnd4;

	lzDropOff4 = "HeliHEmpty" createvehicle _end4;
		
	while {(count (waypoints _vehiclegroup)) > 0} do {
		deleteWaypoint ((waypoints _vehiclegroup) select 0);
		sleep 0.01;
		};
	
	//PAPABEAR=[West,"HQ"]; PAPABEAR SideChat "TRANSPORT HELICOPTER relocating to your new position.";
	PAPABEAR=[West,"HQ"]; PAPABEAR SideChat format ["%1 relocating to your position.", _vehicleVarName];
	
	// Select random Task numbers
	_arrayY  = ["TaskY11","TaskY12","TaskY13","TaskY14","TaskY15","TaskY16","TaskY17","TaskY18","TaskY19","TaskY21","TaskY22","TaskY23","TaskY24","TaskY25"];
	_arrayZ  = ["TaskZ11","TaskZ12","TaskZ13","TaskZ14","TaskZ15","TaskZ16","TaskZ17","TaskZ18","TaskZ19","TaskZ21","TaskZ22","TaskZ23","TaskZ24","TaskZ25"];

	_randomY = _arrayY select floor random count _arrayY;
	_randomZ = _arrayZ select floor random count _arrayZ;
	
	[_randomY,"Cancelled",[_randomZ,"Next Landing Zone","Next Landing Zone",player,[_randomZ,getpos lzDropOff4],"Assigned",lzDropOff4]] call SHK_Taskmaster_upd;
			 	
	wp0 = _vehiclegroup addWaypoint [_end4, 20];
	wp0 setWaypointType "MOVE";
	wp0 setWaypointBehaviour "CARELESS";
	wp0 setWaypointCombatMode "BLUE";
	wp0 setWaypointSpeed "NORMAL";
	wp0 setWaypointStatements ["true","(vehicle this) land ""GETOUT"""];

	// Wait till the player's group is out of the helo.
	waitUntil{{_x in _vehicle} count units group _caller == 0};

	[_randomZ,"Succeeded"] call SHK_Taskmaster_upd;
			
	// Once they are out, set a waypoint back to the start and clean up by deleting the helo and landing pads.
	wp1 = _vehiclegroup addwaypoint [_hStartLoc, 20];
	wp1 setwaypointtype "MOVE";
	wp1 setWaypointBehaviour "CARELESS";
	wp1 setWaypointCombatMode "BLUE";
	wp1 setWaypointSpeed "NORMAL";
	wp1 setWaypointStatements ["true","{deletevehicle _x} foreach (crew vehicle this + [vehicle this]); PAPABEAR=[West,'HQ']; PAPABEAR SideChat format ['TransportHelo ready for reassignment!'];"];
	
	// Wait till the player's group is out of the helo.
	//waitUntil{{_x in _vehicle} count units group _caller == 0};
	// Wait till the player's group is in the helo.
	//waitUntil{{_x in _vehicle} count units group _caller == count units group _caller};
	
	deleteVehicle lzPickup;
	deleteVehicle lzDropOff;
	deleteVehicle lzDropOff2;
	deleteVehicle lzDropOff3;
	deleteVehicle lzDropOff4;
	deleteMarker "hEnd";
	deleteMarker "hEnd2";	
	deleteMarker "hEnd3";
	deleteMarker "hEnd4";	
	deleteMarker _randomY;
	deleteMarker _randomZ;
	_hStart setMarkerPos _hDestLoc;
};
