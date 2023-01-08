//////////////////////////////////////////////////////////////////////////////////
/* Function file for Armed Assault
   Created by:  Ralph Bell Ami - Function file for ArmA 2: Operation Arrowhead
*/
//////////////////////////////////////////////////////////////////////////////////
private ["_unit","_sideUnit","_grpUnit","_mrkrColor","_infName","_infArray","_grpName","_mrkr","_spwnPos","_grpnamearr","_grpNameArray","_pos","_grp","_groups","_x","_grpNames","_text","_txt","_array1","_array2","_n","_array1select","_i","_array2select"];

_unit = _this select 0;
_sideUnit = side _unit;
_grpUnit = group _unit;

_mrkrColor = [];
_infName = [];
_infArray = [];
	
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
	
if (isNil "grpNameArray") then {
	
		_grpNameArray = [];

		switch (_sideUnit) do 
		{
			case west: 		{_grpNameArray = ["Alpha","Bravo","Charlie","Delta","Foxtrot","Golf","Hotel","India","Juliet","Kilo","Lima","Mike","November","Oscar","Papa","Quebec","Romeo","Sierra","Tango","Uniform","Victor","Whiskey","X-Ray","Yankee","Zulu"];};
			case east: 		{_grpNameArray = ["Alpha","Bravo","Charlie","Delta","Foxtrot","Golf","Hotel","India","Juliet","Kilo","Lima","Mike","November","Oscar","Papa","Quebec","Romeo","Sierra","Tango","Uniform","Victor","Whiskey","X-Ray","Yankee","Zulu"];};
			case resistance: 	{_grpNameArray = ["Alpha","Bravo","Charlie","Delta","Foxtrot","Golf","Hotel","India","Juliet","Kilo","Lima","Mike","November","Oscar","Papa","Quebec","Romeo","Sierra","Tango","Uniform","Victor","Whiskey","X-Ray","Yankee","Zulu"];};
			case civilian: 	{_grpNameArray = ["Alpha","Bravo","Charlie","Delta","Foxtrot","Golf","Hotel","India","Juliet","Kilo","Lima","Mike","November","Oscar","Papa","Quebec","Romeo","Sierra","Tango","Uniform","Victor","Whiskey","X-Ray","Yankee","Zulu"];};
		};
	
		_groups=[];
		
		{if (count units _x>0 and side _x==_sideUnit) then {_groups=_groups+[_x]}} forEach allGroups;
		
		_grpNames = [];

		{	
			_grpName = _x;
			_x setGroupIconParams [[0,0,0,0], _grpName,1,true];
			_text = toArray(str(_grpName));
			_text set[0,"**DELETE**"];
			_text set[1,"**DELETE**"];
			_text = _text - ["**DELETE**"];
			_txt = toString(_text);
			_grpNames = _grpNames + [_txt];
			
		} forEach _groups;

_array1 = _grpNames;
_array2 = _grpNameArray;

for [{_n=0},{_n < count _array1},{_n=_n+1}] do 
{
	_array1select = _array1 select _n;
	for [{_i=0},{_i < count _array2},{_i=_i+1}] do 
	{
		_array2select = _array2 select _i;
		if (_array1select == _array2select) then 
		{
		    _array2 = _array2 - [_array2select];
		};
	};
};

missionNamespace setVariable ["grpNameArray",_array2];

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

		_grpNameArray = missionNamespace getVariable "grpNameArray";
		_grpName = _grpNameArray select 0;
		_grpNameArray = _grpNameArray - [_grpName];
		missionNamespace setVariable ["grpNameArray",_grpNameArray];
		
		hint format ["%1",_grpName];

		switch (_sideUnit) do 
		{
			case west: 		{_infArray = [_spwnPos, WEST, ["US_Soldier_SL_EP1","US_Soldier_TL_EP1","US_Soldier_Marksman_EP1","US_Soldier_Medic_EP1","US_Soldier_AR_EP1","US_Soldier_MG_EP1","US_Soldier_AA_EP1","US_Soldier_AT_EP1","US_Soldier_HAT_EP1"],[],["Captain","Lieutenant","Sergeant","Corporal","Corporal","Corporal","Corporal","Corporal","Corporal"],[0.8,0.9,1],[0.8,0.9,1],[4,1],330]};
			case east: 		{_infArray = [_spwnPos, EAST, ["TK_INS_Soldier_Warlord_EP1","TK_INS_Soldier_TL_EP1","TK_INS_Soldier_Sniper_EP1","TK_INS_Bonesetter_EP1","TK_INS_Soldier_AR_EP1","TK_INS_Soldier_MG_EP1","TK_INS_Soldier_AA_EP1","TK_INS_Soldier_AT_EP1"],[],["Captain","Lieutenant","Sergeant","Corporal","Corporal","Corporal","Corporal","Corporal"],[0.8,0.9,1],[0.8,0.9,1],[4,1],330]};
			case resistance: 	{_infArray = [_spwnPos, RESISTANCE, ["TK_GUE_Soldier_Warlord_EP1","TK_GUE_Soldier_TL_EP1","TK_GUE_Soldier_Sniper_EP1","TK_GUE_Bonesetter_EP1","TK_GUE_Soldier_AR_EP1","TK_GUE_Soldier_MG_EP1","TK_GUE_Soldier_AA_EP1","TK_GUE_Soldier_AT_EP1","TK_GUE_Soldier_HAT_EP1"],[],["Captain","Lieutenant","Sergeant","Corporal","Corporal","Corporal","Corporal","Corporal","Corporal"],[0.8,0.9,1],[0.8,0.9,1],[4,1],330]};
			case civilian: 	{_infArray = [_spwnPos, CIVILIAN, ["TK_CIV_Takistani01_EP1","TK_CIV_Takistani02_EP1","TK_CIV_Takistani03_EP1","TK_CIV_Takistani04_EP1","TK_CIV_Takistani05_EP1","TK_CIV_Takistani06_EP1","TK_CIV_Worker01_EP1","TK_CIV_Worker02_EP1"],[],["Captain","Lieutenant","Sergeant","Corporal","Corporal","Corporal","Corporal","Corporal"],[0.8,0.9,1],[0.8,0.9,1],[4,1],330]};
		};
			
		_grp = CreateGroup _sideUnit;

		_grp = _infArray call BIS_fnc_spawnGroup;
				
		//(units _grp select 0) setVehicleInit format ["%1=group this; this setGroupID ['%1']",_grpName];
		(leader _grp) setVehicleInit format ["%1=group this; this setGroupID ['%1']",_grpName];
		processInitcommands;

		{ [_x] execVM "Cly_addweapon\cly_unitweapons.sqf";
		  [_x] execVM "Cly_addweapon\cly_unlimited.sqf";
		  [_x] execVM "Cent_HCS2\cent_HCS2_init.sqf";
		  [_x] execVM "008\Bis_findSafePos.sqf";
		  [_x] execVM "008\aiHealthRegen2.sqf";
		  [_x] execVM "008\twirlyMrkr3.sqf";
		  [_x] execVM "008\init_dismiss.sqf";
		  addSwitchableUnit _x;
		  setPlayable _x;
		} forEach units _grp;

if ([_unit, vehicle leader _grp] call BIS_fnc_distance2D < 40) then 
{
	{[_x] joinsilent group player} foreach units _grp;
} else {
	_grp addWaypoint [taskDestination currentTask Player, 0];
};
				
uisleep 2;
deleteMarkerLocal _infName;
uisleep 0.5;
openMap false;