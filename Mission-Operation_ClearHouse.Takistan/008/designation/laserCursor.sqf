/*
laserCursor.sqf

Select "Designate Cursor" from the scroll menu
Press L when cursor over desired target
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

hint "Press L to lase cursor position.";

KeyDown = (findDisplay 46) displayAddEventHandler ["KeyDown", "varone = true;"];
  waitUntil {varone};
    (finddisplay 46) displayremoveeventhandler ["KeyDown",KeyDown];

hint "";

//DS_rooftool = "Land_Can_Rusty_F" createVehicle (screenToWorld [0.5,0.5]);
//  DS_rooftool setVelocity [0,0,-10];

//sleep 1;

//  _lasew = "LaserTargetW" createVehicle (getPosATL DS_rooftool);
//    _lasew attachTo [DS_rooftool,[0,0,6]];

	_blinky = "Sign_sphere10cm_EP1" createVehicle (screenToWorld [0.5,0.5]);	
	_targets = nearestObjects[_blinky,["Man","Car","Air","Tank","Truck","Ship","Static","House","Office","Barracks","Hanger"], 75];
	_target = _targets select 0;
	[_target] execVM "008\twirlyMrkr.sqf";
	_type = typeOf _target;
	deleteVehicle _blinky;
	
	_lazew = "LaserTargetW" createVehicle getPos _target;
	_lazew attachTo [_target,[0,0,1]];
	
_text = actionKeysImages "VehLockTargets";
  _plane vehicleChat format["GBU12 selected, laser locked....Press %1 activate seeker head", _text];

_plane selectWeapon "BombLauncher";
  _caller commandTarget _lasew;

varone = false;

if (true) exitWith {};