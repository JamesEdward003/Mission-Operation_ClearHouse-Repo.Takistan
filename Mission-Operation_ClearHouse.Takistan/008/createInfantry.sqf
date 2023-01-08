//////////////////////////////////////////////////////////////////
/* Function file for Armed Assault
   Created by:  Ralph Bell Ami - Function file for ArmA 2
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
			case west: 		{_infName = "WestInfantry"};
			case east: 		{_infName = "EastInfantry"};
			case resistance: 	{_infName = "GuerrilaInfantry"};
			case civilian: 	{_infName = "CivilianInfantry"};
		};

		switch (_sideUnit) do 
		{
			case west: 		{_grpName = WestInfantry};
			case east: 		{_grpName = EastInfantry};
			case resistance: 	{_grpName = GuerrilaInfantry};
			case civilian: 	{_grpName = CivilianInfantry};
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
			case west: 		{_infArray = [_spwnPos, WEST, ["USMC_Soldier_SL","USMC_Soldier_TL","USMC_SoldierM_Marksman","USMC_Soldier_Medic"],[],["Captain","Lieutenant","Sergeant","Corporal"],[0.8,0.9,1],[0.8,0.9,1],[4,1],330]};
			case east: 		{_infArray = [_spwnPos, EAST, ["RU_Soldier_SL","RU_Soldier_TL","RU_Soldier_Marksman","RU_Soldier_Medic"],[],["Captain","Lieutenant","Sergeant","Corporal"],[0.8,0.9,1],[0.8,0.9,1],[4,1],330]};
			case resistance: 	{_infArray = [_spwnPos, RESISTANCE, ["GUE_Commander","GUE_Woodlander2","GUE_Villager3","GUE_Soldier_Medic"],[],["Captain","Lieutenant","Sergeant","Corporal"],[0.8,0.9,1],[0.8,0.9,1],[4,1],330]};
			case civilian: 	{_infArray = [_spwnPos, CIVILIAN, ["RU_Priest","RU_Pilot","RU_Policeman","RU_Doctor","RU_Functionary1"],[],["Captain","Lieutenant","Sergeant","Corporal","Corporal"],[0.8,0.9,1],[0.8,0.9,1],[4,1],330]};
		};

		_grpName = CreateGroup _sideUnit;

		_grpName = _infArray call BIS_fnc_spawnGroup;

		{[_x] joinsilent group player} foreach units _grpName;

//		{[_x] execVM "008\twirlyMrkr2.sqf"} foreach units _grpUnit;

//		{[_x] execVM "008\init_dismiss.sqf"} foreach units _grpUnit;

		{ [_x] execVM "Cly_addweapon\cly_unitweapons.sqf";
		  [_x] execVM "Cly_addweapon\cly_unlimited.sqf";
		  [_x] execVM "aiHealthRegen2.sqf";
		  [_x] execVM "Cent_HCS2\cent_HCS2_init.sqf";
		  [_x] execVM "Bis_findSafePos.sqf";
		  [_x] execVM "008\twirlyMrkr2.sqf";
		  [_x] execVM "008\init_dismiss.sqf";
		} forEach units _grpUnit;
		
uisleep 2;
deleteMarkerLocal _infName;
uisleep 0.5;
openMap false;	