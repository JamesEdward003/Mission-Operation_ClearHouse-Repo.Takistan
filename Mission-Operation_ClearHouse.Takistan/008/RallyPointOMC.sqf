//////////////////////////////////////////////////////////////////
// Function file for Armed Assault
// Created by:  DieHard - Function file for ArmA 2: Operation Arrowhead
//////////////////////////////////////////////////////////////////
_mrkr = [];

switch (playerSide) do 
{
	case west: 		{_mrkr = "respawn_west"};
	case east: 		{_mrkr = "respawn_east"};
	case resistance: 	{_mrkr = "respawn_guerrila"};
	case civilian: 	{_mrkr = "respawn_civilian"};
};

deleteMarker _mrkr;

_unit = _this select 0;

_hEnd = _mrkr;

_mrkrColor = [];

switch (playerSide) do 
{
	case west: 		{_mrkrColor = "ColorBlue"};
	case east: 		{_mrkrColor = "ColorRed"};
	case resistance: 	{_mrkrColor = "ColorGreen"};
	case civilian: 	{_mrkrColor = "ColorYellow"};
};

sleep 0.25;
openMap true;
sleep 0.25;
 
	PAPABEAR=[West,"HQ"]; PAPABEAR SideChat format ["%1, click on the map.", name _unit];
	
dt=true;
onMapSingleClick "spwnPt = _pos;dt=false";
waitUntil {!dt};
onMapSingleClick "";

	createMarkerLocal [_hEnd, spwnPt];
	_hEnd setMarkerTypeLocal "Dot";
	_hEnd setMarkerShapeLocal "Icon";
	_hEnd setMarkerTextLocal "";
	_hEnd setMarkerSizeLocal [1,1];
	_hEnd setMarkerColorLocal _mrkrColor;
			
sleep 1;
openMap false;	