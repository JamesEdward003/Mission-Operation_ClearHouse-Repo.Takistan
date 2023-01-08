//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//  From trigger:
//  nul = [_unit] execVM "launchMissile.sqf";
//  _unit addAction["MissileStrike","launchMissile.sqf",[],1,false,true,"","cameraOn == _unit && cameraView == 'Gunner'"];
//_primaryTarget = lasertarget (_this select 1); //target for the missile
//_missileStart = getPos ((_this select 3) select 1); //position where te missile will be spawned
//_missileType = (_this select 3) select 2; //type of the missile
//_missileSpeed = (_this select 3) select 3; //speed of the missile
//_defaultTargetPos = (_this select 3) select 4; //default position where unguided missiles
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
_unit = _this select 0;
	_unit addAction ["Missile Strike","008\MissileStrike\launchMissile.sqf",[this, missilestart,"M_Ch29_AT",200],1,false,true,"","cameraOn == _this && cameraView == 'Gunner'"]; //cameraOn == _this && cameraView == 'Gunner' // laserTarget _this,getpos missilestart,"M_Ch29_AT",200,_this

	if !(_unit hasWeapon "LaserDesignator") then {
	_unit addMagazine "LaserBatteries";
	_unit addWeapon "LaserDesignator";
	};
	
if ( isNil {_unit getVariable "mk_killedMstrike"} ) then 
	{
		
	_unit addEventHandler ["MPRespawn", 
	
	{ 
	
	_this select 0 execVM "008\MissileStrike\missile_airstrike_init.sqf";
			 	
	}];
	
	_unit setVariable ["mk_killedMstrike", true];
	
};

