//////////////////////////////////////////////////////////////////
_unit = _this select 0;
_unit addEventHandler ["Respawn",{_null = [_this select 0,_this select 1] execVM "Cly_addWeapon\saveLoadout.sqf";}];

hintSilent parseText format["<t size='1' font='Zeppelin33' color='#FFFF00'>Loadout Saved!</t>"];

uisleep 5;

hintSilent "";
