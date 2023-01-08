//////////////////////////////////////////////////////////////////
// Function file for Armed Assault
// Created by: RALPH BELLAMY
// execvm "RallyPoint.sqf"
//////////////////////////////////////////////////////////////////
_vehicle 	= _this select 0;                    

_vehicleVarName = vehicleVarName _vehicle;
               
_mrkr = [];

switch (playerSide) do 
{
	case west: 		{_mrkr = "respawn_west"};
	case east: 		{_mrkr = "respawn_east"};
	case resistance: 	{_mrkr = "respawn_guerrila"};
	case civilian: 	{_mrkr = "respawn_civilian"};
};

_mrkr setmarkerpos [(getpos _vehicle select 0)+5, (getpos _vehicle select 1)+5,0];

hintSilent format ["Rally Point Deployed At %1.", _vehicleVarName];