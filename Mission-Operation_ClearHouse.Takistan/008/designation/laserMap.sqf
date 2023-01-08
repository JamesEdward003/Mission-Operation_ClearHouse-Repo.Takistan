/*
laserMap.sqf

Select "Designate Map" from the scroll menu
Click on map to select target - can be terrain or building
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

openMap true;
  sleep 1;

hint "Click on map to select target position.";
  onMapSingleClick "TargetPos = _pos; openMap false; onMapSingleClick ''; true;";
    waitUntil{!(visibleMap)};
      hint "";

	_blinky = "Sign_sphere10cm_EP1" createVehicle TargetPos;	
	_targets = nearestObjects[_blinky,["Man","Car","Air","Tank","Truck","Ship","Static","House","Office","Barracks","Hanger"], 75];
	_target = _targets select 0;
	[_target] execVM "008\twirlyMrkr.sqf";
	_type = typeOf _target;
	deleteVehicle _blinky;
	
	_laze = "LaserTargetW" createVehicle getPos _target;
	_laze attachTo [_target,[0,0,1]];

_text = actionKeysImages "VehLockTargets";
  _plane vehicleChat format["GBU12 selected, laser lock....Press %1 activate seeker head", _text];

_plane selectWeapon "BombLauncher";
  _caller commandTarget _lasew;

if (true) exitWith {};