//////////////////////////////////////////////////////////////////
/* Function file for Armed Assault
   Created by:  Ralph Bell Ami - Function file for ArmA 2: Operation Arrowhead
   
   [_spwnPos, WEST, (configFile >> "CfgGroups" >> "West" >> "USMC" >> "Mechanized" >> "USMC_MechReconSection")] call BIS_fnc_spawnGroup;
*/
//////////////////////////////////////////////////////////////////
private ["_unit","_sideUnit","_grpUnit","_mrkrColor","_infName","_infArray","_grpName","_mrkr","_spwnPos"];
 		_unit = _this select 0;
		_sideUnit = side _unit;
		_grpUnit = group _unit;

		_mrkrColor = [];
		_infName = [];
		_infArray = [];
		_grpName = [];

		switch (_sideUnit) do 
		{
			case west: 		{_mrkrColor = "ColorBlue"};
			case east: 		{_mrkrColor = "ColorRed"};
			case resistance: 	{_mrkrColor = "ColorGreen"};
			case civilian: 	{_mrkrColor = "ColorYellow"};
		};
		
		switch (_sideUnit) do 
		{
			case west: 		{_infName = "WestMechanizedInfantry"};
			case east: 		{_infName = "EastMechanizedInfantry"};
			case resistance: 	{_infName = "GuerrilaMechanizedInfantry"};
			case civilian: 	{_infName = "CivilianMechanizedInfantry"};
		};
				
		switch (_sideUnit) do 
		{
			case west: 		{_grpName = WestMechanizedInfantry};
			case east: 		{_grpName = EastMechanizedInfantry};
			case resistance: 	{_grpName = GuerrilaMechanizedInfantry};
			case civilian: 	{_grpName = CivilianMechanizedInfantry};
		};
		
uisleep 0.25;
openMap true;
uisleep 0.25;
 
	PAPABEAR=[_sideUnit,"HQ"]; PAPABEAR SideChat format ["%1, click on the map.", name _unit];
	
dt=true;
onMapSingleClick "spwnPt = _pos;dt=false";
waitUntil {!dt};
onMapSingleClick "";
 	
		_mrkr = createMarkerLocal [_infName, spwnPt];
		_mrkr setMarkerTypeLocal "Dot";
		_mrkr setMarkerShapeLocal "Icon";
		_mrkr setMarkerTextLocal _infName;
		_mrkr setMarkerSizeLocal [1,1];
		_mrkr setMarkerColorLocal _mrkrColor;
		
		_spwnPos = getMarkerPos _infName;

		switch (_sideUnit) do 
		{
			case west: 		{_infArray = [_spwnPos, WEST, (configFile >> "CfgGroups" >> "West" >> "USMC" >> "Mechanized" >> "USMC_MechReconSection")]};
			case east: 		{_infArray = [_spwnPos, EAST, (configFile >> "CfgGroups" >> "East" >> "RU" >> "Mechanized" >> "RU_MechInfSquad_2")]};
			case resistance: 	{_infArray = [_spwnPos, RESISTANCE, (configFile >> "CfgGroups" >> "Guerrila" >> "Gue" >> "Mechanized" >> "GUE_MechInfSection")]};
			case civilian: 	{_infArray = [_spwnPos, CIVILIAN, (configFile >> "CfgGroups" >> "East" >> "INS" >> "Mechanized" >> "INS_MechInfSection_AT")]};
		};
		
		_grpName = CreateGroup _sideUnit;

		_grpName = _infArray call BIS_fnc_spawnGroup;

		{[_x] joinsilent group player} foreach units _grpName;

		{[_x] execVM "008\twirlyMrkr2.sqf"} foreach units _grpUnit;

		{[_x] execVM "008\init_dismiss.sqf"} foreach units _grpUnit;

uisleep 2;
deleteMarkerLocal _infName;
uisleep 0.5;
openMap false;