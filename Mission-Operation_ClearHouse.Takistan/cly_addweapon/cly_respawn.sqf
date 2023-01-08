/////////this addaction ["cly loadout","cly_respawn.sqf"];//////////
_unit 	= _this select 1;                       

_unit setVariable ["CLY_addweapon",nil,true];

_unit setVariable ["savedloadout",nil,true];

hintSilent parseText format["<t size='1' font='Zeppelin33' color='#FFFF00'>Cly Weapons!</t>"];

_null = [_unit] execVM "Cly_addWeapon\cly_unitweapons.sqf";

uisleep 5;

hintSilent "";
