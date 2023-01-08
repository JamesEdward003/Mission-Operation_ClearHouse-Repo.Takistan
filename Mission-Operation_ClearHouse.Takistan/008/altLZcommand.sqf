//////////////////////////////////////////////////////////////////
// Function file for Armed Assault
// Created by:  DieHard - Function file for ArmA 2: Operation Arrowhead
//////////////////////////////////////////////////////////////////
_vehicle 	= vehicle player;
_caller 		= player;  
_vehicle removeaction ALZ;                     

_vehicleVarName = vehicleVarName _vehicle;
_vehiclegroup = group _vehicle;
_vehiclepilot = driver _vehicle;
_lzMkrColor = "ColorOrange";
_hEnd3 = "hEnd3";
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
	deleteVehicle lzDropOff3;
	deleteVehicle lzDropOff4;
	deleteMarker "hEnd";
	deleteMarker "hEnd2";	
	deleteMarker "hEnd3";
	deleteMarker "hEnd4";
	
sleep 0.1;
	PAPABEAR=[West,"HQ"]; PAPABEAR SideChat format ["%1 to your new position, %2, mark your new destination on the map.", _vehicleVarName, name _caller];
dt=true;
onMapSingleClick "infTarget3 = _pos;dt=false";
waitUntil {!dt};
onMapSingleClick "";

	createMarkerLocal [_hEnd3, infTarget3];
	_hEnd3 setMarkerTypeLocal "b_air";
	_hEnd3 setMarkerShapeLocal "Icon";
	_hEnd3 setMarkerTextLocal _hEnd3;
	_hEnd3 setMarkerSizeLocal [1,1];
	_hEnd3 setMarkerColorLocal _lzMkrColor;
				
sleep 0.5;
openMap false;
	_end3 = getMarkerPos _hEnd3;
	lzDropOff3 = "HeliHEmpty" createvehicle _end3;
	
	while {(count (waypoints _vehiclegroup)) > 0} do {
		deleteWaypoint ((waypoints _vehiclegroup) select 0);
		sleep 0.01;
		};

	_vehiclepilot commandMove _end3;
	_vehiclepilot setBehaviour "AWARE"; 
	_vehiclegroup setCombatMode "RED";

	_arrayY  = ["TaskY11","TaskY12","TaskY13","TaskY14","TaskY15","TaskY16","TaskY17","TaskY18","TaskY19","TaskY21","TaskY22","TaskY23","TaskY24","TaskY25"];
	_arrayZ  = ["TaskZ11","TaskZ12","TaskZ13","TaskZ14","TaskZ15","TaskZ16","TaskZ17","TaskZ18","TaskZ19","TaskZ21","TaskZ22","TaskZ23","TaskZ24","TaskZ25"];

	_randomY = _arrayY select floor random count _arrayY;
	_randomZ = _arrayZ select floor random count _arrayZ;
	
	[_randomY,"Cancelled",[_randomZ,"Next Landing Zone","Next Landing Zone",player,[_randomZ,getpos lzDropOff3],"Assigned",lzDropOff3]] call SHK_Taskmaster_upd;
	
	waitUntil { _vehicle distance lzDropOff3 < 100 };
	
	_vehicle land "GET OUT";
	
	waitUntil { {_x in _vehicle} count units group _caller == 0 };

	_vehiclepilot commandMove _hStartLoc;

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

	[_randomZ,"Succeeded"] call SHK_Taskmaster_upd;
	
	waitUntil { _vehicle distance _hStartLoc < 100 };
	
	_vehiclepilot setBehaviour "CARELESS"; 
	_vehiclegroup setCombatMode "BLUE";
	_vehicle land "LAND";
	{deletevehicle _x} foreach (crew _vehicle + [_vehicle]); 
	PAPABEAR=[West,"HQ"]; PAPABEAR SideChat format ["TransportHelo ready for reassignment!"];
		
};
