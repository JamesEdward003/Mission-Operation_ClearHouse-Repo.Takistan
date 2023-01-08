//////////////////////////////////////////////////////////////////
// Function file for Armed Assault
// Created by:  DieHard - Function file for ArmA 2: Operation Arrowhead
// nul=[laserTarget player, getpos missilestart,"M_Ch29_AT",200] execvm "launchmissile.sqf"
// this addAction["Fire Missile","launchMissile.sqf",[this, missilestart,"M_Hellfire_AT",200]]

//////////////////////////////////////////////////////////////////
_primaryTarget = _this select 0; //target for the missile
_missileStart = _this select 1; //position where te missile will be spawned
_missileType = _this select 2; //type of the missile
_missileSpeed = _this select 3; //speed of the missile
_defaultTargetPos = _this select 4; //default position where unguided missiles will fly [8340.718750,3074.914795,0];

if (isNull _primarytarget) exitWith {hintSilent "No Target Found!"};

_perSecondChecks = 25; //direction checks per second
_getPrimaryTarget = {if (typeName _primaryTarget == typename {}) then {call _primaryTarget} else {_primaryTarget}}; //code can be used for laser dots
_target = call _getPrimaryTarget;

_missile = _missileType createVehicle _missileStart;
_missile setPos _missileStart;

//secondary target used for random trajectory when laser designator is turned off prematurily
_secondaryTarget = "HeliHEmpty" createVehicle _defaultTargetPos;
_secondaryTarget setPos _defaultTargetPos;

_guidedRandomly = FALSE;

//procedure for guiding the missile
_homeMissile = {

//here we switch to secondary target at random position if the laser dot no longer exists
//if the designator is turned on again, the missile will return to it's original target (providing it hadn't flown too far)
private ["_velocityX", "_velocityY", "_velocityZ", "_target"];
_target = _secondaryTarget;
if (!(_guidedRandomly) && _missile distance _target > _missileSpeed * 1.5) then {
_guidedRandomly = TRUE;
_target = _secondaryTarget;
_dispersion = (_missile distance _defaultTargetPos) / 20;
_dispersionMin = _dispersion / 10;
_target setPos [(_defaultTargetPos select 0) + _dispersionMin - (_dispersion / 2) + random _dispersion, (_defaultTargetPos select 1) + _dispersionMin - (_dispersion / 2) + random _dispersion, 0];
};
if (!(isNull (call _getPrimaryTarget))) then {_target = call _getPrimaryTarget; _defaultTargetPos = position _target; _guidedRandomly = FALSE};

//altering the direction, pitch and trajectory of the missile
if (_missile distance _target > (_missileSpeed / 20)) then {
_travelTime = (_target distance _missile) / _missileSpeed;
_steps = floor (_travelTime * _perSecondChecks);

_relDirHor = [_missile, _target] call BIS_fnc_DirTo;
_missile setDir _relDirHor;

_relDirVer = asin ((((getPosASL _missile) select 2) - ((getPosASL _target) select 2)) / (_target distance _missile));
_relDirVer = (_relDirVer * -1);
[_missile, _relDirVer, 0] call BIS_fnc_setPitchBank;

_velocityX = (((getPosASL _target) select 0) - ((getPosASL _missile) select 0)) / _travelTime;
_velocityY = (((getPosASL _target) select 1) - ((getPosASL _missile) select 1)) / _travelTime;
_velocityZ = (((getPosASL _target) select 2) - ((getPosASL _missile) select 2)) / _travelTime;

//_defaultTargetPos = position _target;
};

[_velocityX, _velocityY, _velocityZ]
};

call _homeMissile;

//fuel burning should illuminate the landscape
_fireLight = "#lightpoint" createVehicle position _missile;
_fireLight setLightBrightness 0.5;
_fireLight setLightAmbient [1.0, 1.0, 1.0];
_fireLight setLightColor [1.0, 1.0, 1.0];
_fireLight lightAttachObject [_missile, [0, -0.5, 0]];

//missile flying
while {alive _missile} do {
_velocityForCheck = call _homeMissile;
if ({(typeName _x) == (typeName 0)} count _velocityForCheck == 3) then {_missile setVelocity _velocityForCheck};
sleep (1 / _perSecondChecks)
};

deleteVehicle _fireLight;
deleteVehicle _secondaryTarget;