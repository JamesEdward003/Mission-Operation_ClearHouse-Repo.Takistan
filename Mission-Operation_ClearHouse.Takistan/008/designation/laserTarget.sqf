/*
laserTarget.sqf

Select the 20mm Cannon then press "R" to lock a target (default target lock for vehicles)
Select "Designate target" from the scroll menu
GBU12 is automatically selected, a red square is placed over target
Make sure distance aircraft to target is +1000m, altitude +750m, speed +350
Place target inside white circle on HUD
Press "R" to select laser target
Wait until you get solid white, stable diamond, it will disappear if flight profile is incorrect
Release bomb

(most of that is a new BIS system for laser designation - requires flying skill now :-)
*/

_plane = _this select 0;
  _caller = _this select 1;
    _id = _this select 2;
      _target = cursorTarget;

if (isNull _target) exitWith {_plane vehicleChat "Laser System - No Target Locked"};

_name = getText (configFile >> "CfgVehicles" >> typeOf _target >> "displayName");

    _lasew = "LaserTargetW" createVehicle [getposATL _target select 0,getposATL _target select 1,0];
      _lasew attachto[_target,[0,0,1]];

_plane selectWeapon "BombLauncher";
  _caller commandTarget _lasew;


_text = actionKeysImages "VehLockTargets";
  _plane vehicleChat format["GBU12 selected, laser lock on %1....Press %2 activate seeker head", _name, _text];

if (true) exitWith {};