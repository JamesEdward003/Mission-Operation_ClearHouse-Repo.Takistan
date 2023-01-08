//////////////////////////////////////////////////////////////////
private ["_unit","_unitname","_marker","_mrkrcolor"];

_unit 		= cursorTarget;
_mrkrcolor 	= [];

if (isMultiplayer) then {	
	_unit addMPEventHandler ["MPRespawn",{_this execVM "twirlyMrkr.sqf"}];
};

switch (side _unit) do {

         case west:			{_mrkrcolor = "ColorBlue"};
         case east:			{_mrkrcolor = "ColorRed"};
         case resistance:		{_mrkrcolor = "ColorGreen"};
         case civilian:		{_mrkrcolor = "ColorYellow"};
};

While {alive _unit} do {
	_marker = createMarkerLocal [name _unit, position _unit];
	_marker setMarkerTypeLocal "mil_dot";
	_marker setMarkerColorLocal _mrkrcolor;
	_marker setMarkerSizeLocal [0.75,0.75];
	sleep 2;
	deleteMarkerLocal _marker;
};
