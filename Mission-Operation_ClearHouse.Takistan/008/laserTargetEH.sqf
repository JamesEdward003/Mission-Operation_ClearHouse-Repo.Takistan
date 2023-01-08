//_target addEventHandler["killed", {[_this select 0, _this select 1, [_laze,_smoke]] execVM "scripts\laserTargetEH.sqf"}];//
_target 		= _this select 0;
_killer 		= _this select 1;
_laze 		= _this select 2 select 0;
_smoke 		= _this select 2 select 1;

detach _laze;
deleteVehicle _laze;
deleteVehicle _smoke;

_lazes = nearestObjects [_target, ["LaserTargetW"], 20];
_laze = _lazes select 0;

_cameras = nearestObjects [_target, ["camera"], 20];
_camera = _camera select 0;

while {(count _lazes) > 0} do
{
detach _lazes select 0;
deleteVehicle _lazes select 0;
sleep 0.1; 
};

while {(count _cameras) > 0) do
{ 
camDestroy _camera;
sleep 0.1;  
}; 

hintSilent parseText format["<t size='1' font='Zeppelin33' color='#FFFF00'>Asset Destroyed, Victim: %2, NameOfVictim: %4, Killer: %1, NameOfKiller: %3</t>", typeOf _killer, typeOf _target, name _killer, name _target];
//hintSilent format["Asset Destroyed, Killer: %1, Victim: %2, NameOfKiller: %3, NameOfVictim: %4", _killer, _victim, name _killer, name _victim];
