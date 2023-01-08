//////////////////////////////////////////////////////////////////////////////////
/* Function file for Armed Assault
   Created by:  Ralph Bell Ami - Function file for ArmA 2: Operation Arrowhead
*/
//////////////////////////////////////////////////////////////////////////////////
private ["_unit","_sideUnit","_grpUnit","_mrkrColor","_infName","_infArray","_grpName","_mrkr","_spwnPos","_grpnamearr","_grpNameArray","_pos","_grp"];

_unit = _this select 0;
_sideUnit = side _unit;
_grpUnit = group _unit;

_mrkrColor = [];
_infName = [];
_infArray = [];
//grpNameArray = [];
		
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
			case west: 		{_infArray = [_spwnPos, WEST, ["US_Soldier_SL_EP1","US_Soldier_TL_EP1","US_Soldier_Marksman_EP1","US_Soldier_Medic_EP1","US_Soldier_AR_EP1","US_Soldier_MG_EP1","US_Soldier_AA_EP1","US_Soldier_AT_EP1","US_Soldier_HAT_EP1"],[],["Captain","Lieutenant","Sergeant","Corporal","Corporal","Corporal","Corporal","Corporal","Corporal"],[0.8,0.9,1],[0.8,0.9,1],[4,1],330]};
			case east: 		{_infArray = [_spwnPos, EAST, ["TK_INS_Soldier_Warlord_EP1","TK_INS_Soldier_TL_EP1","TK_INS_Soldier_Sniper_EP1","TK_INS_Bonesetter_EP1","TK_INS_Soldier_AR_EP1","TK_INS_Soldier_MG_EP1","TK_INS_Soldier_AA_EP1","TK_INS_Soldier_AT_EP1"],[],["Captain","Lieutenant","Sergeant","Corporal","Corporal","Corporal","Corporal","Corporal"],[0.8,0.9,1],[0.8,0.9,1],[4,1],330]};
			case resistance: 	{_infArray = [_spwnPos, RESISTANCE, ["TK_GUE_Soldier_Warlord_EP1","TK_GUE_Soldier_TL_EP1","TK_GUE_Soldier_Sniper_EP1","TK_GUE_Bonesetter_EP1","TK_GUE_Soldier_AR_EP1","TK_GUE_Soldier_MG_EP1","TK_GUE_Soldier_AA_EP1","TK_GUE_Soldier_AT_EP1","TK_GUE_Soldier_HAT_EP1"],[],["Captain","Lieutenant","Sergeant","Corporal","Corporal","Corporal","Corporal","Corporal","Corporal"],[0.8,0.9,1],[0.8,0.9,1],[4,1],330]};
			case civilian: 	{_infArray = [_spwnPos, CIVILIAN, ["TK_CIV_Takistani01_EP1","TK_CIV_Takistani02_EP1","TK_CIV_Takistani03_EP1","TK_CIV_Takistani04_EP1","TK_CIV_Takistani05_EP1","TK_CIV_Takistani06_EP1","TK_CIV_Worker01_EP1","TK_CIV_Worker02_EP1"],[],["Captain","Lieutenant","Sergeant","Corporal","Corporal","Corporal","Corporal","Corporal"],[0.8,0.9,1],[0.8,0.9,1],[4,1],330]};
		};

if (isNil {missionNamespace getVariable "grpNameArray"}) then {
	
		switch (_sideUnit) do 
		{
			case west: 		{grpNameArray = ["Alpha","Bravo","Charlie","Delta","Foxtrot","Golf","Hotel","India","Juliet","Kilo","Lima","Mike","November","Oscar","Papa","Quebec","Romeo","Sierra","Tango","Uniform","Victor","Whiskey","X-Ray","Yankee","Zulu"];};
			case east: 		{grpNameArray = ["Alpha","Bravo","Charlie","Delta","Foxtrot","Golf","Hotel","India","Juliet","Kilo","Lima","Mike","November","Oscar","Papa","Quebec","Romeo","Sierra","Tango","Uniform","Victor","Whiskey","X-Ray","Yankee","Zulu"];};
			case resistance: 	{grpNameArray = ["Alpha","Bravo","Charlie","Delta","Foxtrot","Golf","Hotel","India","Juliet","Kilo","Lima","Mike","November","Oscar","Papa","Quebec","Romeo","Sierra","Tango","Uniform","Victor","Whiskey","X-Ray","Yankee","Zulu"];};
			case civilian: 	{grpNameArray = ["Alpha","Bravo","Charlie","Delta","Foxtrot","Golf","Hotel","India","Juliet","Kilo","Lima","Mike","November","Oscar","Papa","Quebec","Romeo","Sierra","Tango","Uniform","Victor","Whiskey","X-Ray","Yankee","Zulu"];};
		};
		
//	grpNameArray=true;
//	publicVariable "grpNameArray";
//	hint format ["%1",grpNameArray];
	missionNameSpace setVariable ["grpNameArray", grpNameArray];
	"grpNameArray" addPublicVariableEventHandler {
//	grpNameArray = missionNameSpace getVariable "grpNameArray";
//	grpNameArray = grpNameArray - grpNameArray select 0;
	hint format [
		"%1 has been updated to: %2",
		_this select 0,
		_this select 1
	]
	};
};

		_grpNameArray = missionNameSpace getVariable "grpNameArray";
		_grpName = _grpNameArray select 0;
		_grpNameArray = _grpNameArray - _grpName;

//		missionNameSpace setVariable ["grpNameArray", _grpNameArray];
		
		hint format ["%1",_grpNameArray];
		
		_grp = CreateGroup _sideUnit;

		_grp = _infArray call BIS_fnc_spawnGroup;
				
//		_grp setGroupID [_grpName];
//_grp setVehicleInit "this setIdentity '_grpName'";
//_grp setVehicleInit format ["%1=group this; this setGroupID [%1]",_grpName];
//hint format ["%1",name _grp];
(units _grp select 0) setVehicleInit format ["%1=group this; this setGroupID ['%1']",_grpName];
//(leader _grp) setVehicleInit format ["this setGroupID [%1]",_grpName];
processInitcommands;

//		hint format ["%1",_grpName];
		{ [_x] execVM "Cly_addweapon\cly_unitweapons.sqf";
		  [_x] execVM "Cly_addweapon\cly_unlimited.sqf";
		  [_x] execVM "Cent_HCS2\cent_HCS2_init.sqf";
		  [_x] execVM "008\Bis_findSafePos.sqf";
		  [_x] execVM "008\aiHealthRegen2.sqf";
		  [_x] execVM "008\twirlyMrkr3.sqf";
		  [_x] execVM "008\init_dismiss.sqf";
//		  addSwitchableUnit _x;
//		  setPlayable _x;
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