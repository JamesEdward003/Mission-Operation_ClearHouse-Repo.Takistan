////////this addAction["Save Loadout","cly_weaponrespawn.sqf"];////////
_object 	= _this select 0;             
_unit 	= _this select 1;          
_id 		= _this select 2;                
//_params = _this select 3;

_unit setVariable ["CLY_addweapon",nil,true];

_unit setVariable ["savedloadout","true",true];

private ["_weapons","_magazines","_p","_primw"];
_weapons = weapons player;
_magazines = magazines player;
hintSilent parseText format["<t size='1' font='Zeppelin33' color='#FFFF00'>Loadout Saved!</t>"];
uisleep 5;
hintSilent "";

waitUntil {!alive player};
waitUntil {alive player};
_p = player;
removeAllItems _p;
removeAllWeapons _p;
{_p addMagazine _x} forEach _magazines;
{_p addWeapon _x} forEach _weapons;
hintSilent parseText format["<t size='1' font='Zeppelin33' color='#FFFF00'>Loadout Restored!</t>"];
uisleep 5;
hintSilent "";
_primw = primaryWeapon _p;
if (_primw != "") then {
    _p selectWeapon _primw;
    // Fix for weapons with grenade launcher
    _muzzles = getArray(configFile>>"cfgWeapons" >> _primw >> "muzzles");
    _p selectWeapon (_muzzles select 0);
};
_p setVariable ["CLY_addweapon",nil,true];
_p setVariable ["savedloadout","true",true];
