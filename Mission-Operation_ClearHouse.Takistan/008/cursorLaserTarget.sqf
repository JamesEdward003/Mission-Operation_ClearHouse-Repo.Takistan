//////////////////////////////////////////////////////////////////
//  From trigger:
//  nul = [player] execVM "cursorLaserTarget.sqf";
//
//////////////////////////////////////////////////////////////////
_unit= _this select 0;
_sideUnit = side _unit;
_laze = laserTarget player;
_lazePos = position _laze;
				
_blinky = "Sign_sphere10cm_EP1" createVehicle _lazePos;	
_airObjects = nearestObjects [_blinky,["Man","Car","Air","Tank","Truck","Ship","Static","House","Office","Barracks","Hanger"], 75];
deleteVehicle _blinky;
		
_airAliveObjects = [];

{ if (alive _x) then { _airAliveObjects = _airAliveObjects+[_x] }; } forEach _airObjects;

if (count _airAliveObjects > 0) then

{
	_airTarget = _airAliveObjects select 0;
	[_airTarget] execVM "008\flare.sqf";
	[_airTarget] execVM "008\twirlyMrkr.sqf";
	_airTargetPos = getPos _airTarget;
	_airDist = _unit distance _airTarget;
	_type = typeOf _airTarget;

	PAPABEAR=[_sideUnit,"HQ"]; PAPABEAR SideChat format ["%1 marked is %2 meters distant from %3.", typeOf _airTarget, round(_airDist)/1.0, name _unit];
	      	
	_airTarget addEventHandler["Killed", {[_this select 0, _this select 1, [_laze, _randomM]] execVM "008\laserTargetEH.sqf"}];
 
// 	myNinja = group player createUnit ["USMC_SoldierS_SniperH", position _airTarget, [], 0, "FORM"];
//	addSwitchableUnit myNinja;
//	{ //[_x] execVM "Cly_addweapon\cly_unitweapons.sqf";
//	  //[_x] execVM "Cly_addweapon\cly_unlimited.sqf";
//	  //[_x] execVM "Cent_HCS2\cent_HCS2_init.sqf";
//	  //[_x] execVM "Bis_findSafePos.sqf";
//	  [_x] execVM "008\aiHealthRegen2.sqf";
//	  [_x] execVM "008\twirlyMrkr2.sqf";
//	  [_x] execVM "008\init_dismiss.sqf";
//	} forEach [myNinja];
//	selectPlayer myNinja;
      
// 	myDog = group player createUnit ["Pastor", position _airTarget, [], 0, "FORM"];
//	addSwitchableUnit myDog;
//	{ //[_x] execVM "Cly_addweapon\cly_unitweapons.sqf";
//	  //[_x] execVM "Cly_addweapon\cly_unlimited.sqf";
//	  //[_x] execVM "Cent_HCS2\cent_HCS2_init.sqf";
//	  //[_x] execVM "Bis_findSafePos.sqf";
//	  [_x] execVM "008\aiHealthRegen2.sqf";
//	  [_x] execVM "008\twirlyMrkr2.sqf";
//	  [_x] execVM "008\init_dismiss.sqf";
//	} forEach [myDog];
//	selectPlayer myDog;
	 
} else {
		
	PAPABEAR=[_sideUnit,"HQ"]; PAPABEAR SideChat format ["Make sure your laserDesignator is on, %1.", name _unit];
};

/*	_type = getText (configFile >> "CfgVehicles" >> typeOf _airTarget >> "displayName");

	_picture = getText (configFile >> "cfgVehicles" >> typeOf _airTarget >> "picture");

        _text = parseText format[
        "Congrats <t color='%4'>%1</t> Team!<br/> You have been rewarded with an <t color='#FFCC33'>%2</t> for your efforts!<br/>
        <t color='%4'><img size='4' image='%3'/></t>", _sideUnit, _type, _picture, _color
        ];
        [nil,nil,rHINT,_text] call RE;
*/