//////////////////////////////////////////////////////////////////
// this addEventHandler["killed", {[_this select 0, _this select 1, [_hStart]] execVM "scripts\onKilled.sqf"}];
_victim 		= _this select 0;
_killer 		= _this select 1;
_hStart		= _this select 2 select 0;

deleteMarker _hStart;

hintSilent parseText format["<t size='1' font='Zeppelin33' color='#FFFF00'>Asset Destroyed, Victim: %2, NameOfVictim: %4, Killer: %1, NameOfKiller: %3</t>", typeOf _killer, typeOf _victim, name _killer, name _victim];
//hintSilent format["Asset Destroyed, Killer: %1, Victim: %2, NameOfKiller: %3, NameOfVictim: %4", _killer, _victim, name _killer, name _victim];
 
 	
 
 