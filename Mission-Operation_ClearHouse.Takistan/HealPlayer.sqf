// =======================================================================================
//							INSTRUCTIONS
// =======================================================================================
// SCRIPT: [] execVM "HealPlayer.sqf" for Arma 2
// =======================================================================================
// SCRIPT INTENT: Selected units will form a 360 around the player and heal player
// =======================================================================================

// =======================================================================================
// =======================================  SETUP  ======================================= 
// =======================================================================================

// =======================================================================================
// DECLARE VARIABLES
// =======================================================================================

private ["_Player", "_Location", "_Group", "_Units", "_ValidArray", "_ValidArrayCount", "_ValidArrayPlayerSide", "_ValidArrayPlayerSideCount", "_Interval"];
private ["_CenterX", "_CenterY", "_Perimeter"];
private ["_Angle", "_PosX", "_PosY", "_Position", "_Member"];

// =======================================================================================
// DEFINE VARIABLES 
// =======================================================================================

_Player 		= Player;
_Location		= getPos _Player;
_Group 			= group _Player;
_Units			= units _Group;
_ValidArray		= [];
_ValidArrayCount	= 0;	
_ValidMedicArray		= [];
_ValidMedicArrayCount	= 0;	
_ValidArrayPlayerSide = [];
_ValidArrayPlayerSideCount	= 0;
{
    if ((side _x == playerSide) and ((_x distance player) < 50)) then
    {
        _ValidArrayPlayerSide = _ValidArrayPlayerSide + [_x];
    };
} forEach allUnits;	

// =======================================================================================
// ======================================  SCRIPT  ======================================= 
// =======================================================================================

// =======================================================================================
// ESTABLISH THE PLAYER'S X AND Y POSITIONS AND A PERIMETER DISTANCE
// =======================================================================================

if (alive _Player) then
{
	_CenterX	= _Location select 0;
	_CenterY	= _Location select 1;
	_Perimeter	= 3; // is 6 meters in diameter

// =======================================================================================
// GRAB ONLY VALID UNITS BY CHECKING IF THEY ARE ON FOOT AND ARE NOT PLAYERS
// ======================================================================================= 
_MedicArray = [];
switch (side _Player) do 
	{
	case west: {_MedicArray = ["US_Delta_Force_Medic_EP1","US_Soldier_Medic_EP1","GER_Soldier_Medic_EP1","BAF_Soldier_Medic_DDPM","BAF_Soldier_Medic_W","BAF_Soldier_Medic_MTP","FR_Sykes","FR_Corpsman","USMC_Soldier_Medic","CDF_Soldier_Medic","Doctor","RU_Doctor"];};
	case east: {_MedicArray = ["TK_Soldier_Medic_EP1","RU_Soldier_Medic","INS_Soldier_Medic","Doctor","RU_Doctor"];};
	case resistance: {_MedicArray = ["Soldier_Medic_PMC","GUE_Soldier_Medic","Doctor","RU_Doctor"];};
	case civilian: {_MedicArray = ["Doctor","RU_Doctor"];};
	}:
//	hint format ["%1",_medicarray];
	uisleep .01;
    {if ((vehicle _x == _x) && (_x != player) && (_x in _MedicArray)) then {_ValidArray = _ValidArray + [_x];};} forEach _ValidArrayPlayerSide;

// =======================================================================================
// EVERY VALID SQUAD UNIT AND SUBSEQUENT ONE WILL MOVE TO THE PLAYER AND PERFORM A HEAL ACTION
// =======================================================================================
	
	if (_ValidArrayCount > 0) then {
		
		_ValidArrayCount = count _ValidArray;
		_Interval = 360/(_ValidArrayCount);
	
	for [{_i = _ValidArrayCount},{_i > 0},{_i =_i-1}] do
	{
		_Angle		= 0 + (_Interval*_i);
		_PosX 		= _CenterX + _Perimeter * cos(_Angle);
		_PosY 		= _CenterY + _Perimeter * sin(_Angle);
		_Position	= [_PosX,_PosY];
			
		_Member 	= (_ValidArray select _i-1);
		_Member		doMove _Position;
		_Member		moveTo _Position;
		_Member		setBehaviour "AWARE";
		_Member		setCombatMode "YELLOW";
		_Member		setSpeedMode "FULL";
		_Member 	setUnitPos "MIDDLE";
		_Player 	action ["Heal", _Member];
		
	};	
	
// =======================================================================================
// EVERY VALID AREA UNIT AND SUBSEQUENT ONE WILL MOVE TO THE PLAYER AND PERFORM A HEAL ACTION
// =======================================================================================

} else {
	
	_validMedicArray 	= player nearEntities [_MedicArray, 50];
	_ValidMedicArrayCount = count _validMedicArray;
	if (_ValidMedicArrayCount == 0) exitWith {hint parseText format["<t size='1.25' color='#ff6161'>No medics in 50m range!</t>"];};
	_Interval = 360/(_ValidMedicArrayCount);
		
	for [{_i = _ValidMedicArrayCount},{_i > 0},{_i =_i-1}] do
	{
		_Angle		= 0 + (_Interval*_i);
		_PosX 		= _CenterX + _Perimeter * cos(_Angle);
		_PosY 		= _CenterY + _Perimeter * sin(_Angle);
		_Position	= [_PosX,_PosY];
			
		_Member 	= (_ValidMedicArray select _i-1);
		_Member		doMove _Position;
		_Member		moveTo _Position;
		_Member		setBehaviour "AWARE";
		_Member		setCombatMode "YELLOW";
		_Member		setSpeedMode "FULL";
		_Member 	setUnitPos "MIDDLE";
		_Player 	action ["Heal", _Member];
		
		};	
	
	};		

};

