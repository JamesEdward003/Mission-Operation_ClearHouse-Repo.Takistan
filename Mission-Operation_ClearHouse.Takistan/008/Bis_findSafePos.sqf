//////////////////////////////////////////////////////////////////
// Function file for Armed Assault
// Created by: DIEHARD
//////////////////////////////////////////////////////////////////
private ["_victim", "_killer"];
_victim 	= _this select 0;
_killer	= _this select 1;

if (isMultiplayer) then

{	

_victim addMPEventHandler ["MPKilled", {_this execvm "008\Bis_findSafePos.sqf"}];

};
	
switch (side _victim) do { 
	case  WEST     	: {_victim addEventHandler ["killed", {_spwnposw=[getPos (_this select 0), 1, 150, 3, 0, 20, 0] call BIS_fnc_findSafePos; "respawn_west" setmarkerpos _spwnposw; hintSilent parseText format["<t size='1' font='Zeppelin33' color='#FFFF00'>Asset Destroyed, TypeOfVictim: %2, NameOfVictim: %4, TypeOfKiller: %1, NameOfKiller: %3</t>", typeOf (_this select 1), typeOf (_this select 0), name (_this select 1), name (_this select 0)];}];};
	case  EAST     	: {_victim addEventHandler ["killed", {_spwnpose=[getPos (_this select 0), 1, 150, 3, 0, 20, 0] call BIS_fnc_findSafePos; "respawn_east" setmarkerpos _spwnpose; hintSilent parseText format["<t size='1' font='Zeppelin33' color='#FFFF00'>Asset Destroyed, TypeOfVictim: %2, NameOfVictim: %4, TypeOfKiller: %1, NameOfKiller: %3</t>", typeOf (_this select 1), typeOf (_this select 0), name (_this select 1), name (_this select 0)];}];};
	case  RESISTANCE 	: {_victim addEventHandler ["killed", {_spwnposg=[getPos (_this select 0), 1, 150, 3, 0, 20, 0] call BIS_fnc_findSafePos; "respawn_guerrila" setmarkerpos _spwnposg; hintSilent parseText format["<t size='1' font='Zeppelin33' color='#FFFF00'>Asset Destroyed, TypeOfVictim: %2, NameOfVictim: %4, TypeOfKiller: %1, NameOfKiller: %3</t>", typeOf (_this select 1), typeOf (_this select 0), name (_this select 1), name (_this select 0)];}];};
	case  CIVILIAN   	: {_victim addEventHandler ["killed", {_spwnposc=[getPos (_this select 0), 1, 150, 3, 0, 20, 0] call BIS_fnc_findSafePos; "respawn_civilian" setmarkerpos _spwnposc; hintSilent parseText format["<t size='1' font='Zeppelin33' color='#FFFF00'>Asset Destroyed, TypeOfVictim: %2, NameOfVictim: %4, TypeOfKiller: %1, NameOfKiller: %3</t>", typeOf (_this select 1), typeOf (_this select 0), name (_this select 1), name (_this select 0)];}];};
};

//switch (side _victim) do {
//	case  WEST     	: {_victim addEventHandler ["killed", {_spwnposw=[getPos (_this select 0), random 350, random 360] call BIS_fnc_relPos; "respawn_west" setmarkerpos _spwnposw; hintSilent parseText format["<t size='1' font='Zeppelin33' color='#FFFF00'>Asset Destroyed, TypeOfVictim: %2, NameOfVictim: %4, TypeOfKiller: %1, NameOfKiller: %3</t>", typeOf (_this select 1), typeOf (_this select 0), name (_this select 1), name (_this select 0)];}];};
//	case  EAST     	: {_victim addEventHandler ["killed", {_spwnpose=[getPos (_this select 0), random 350, random 360] call BIS_fnc_relPos; "respawn_east" setmarkerpos _spwnpose; hintSilent parseText format["<t size='1' font='Zeppelin33' color='#FFFF00'>Asset Destroyed, TypeOfVictim: %2, NameOfVictim: %4, TypeOfKiller: %1, NameOfKiller: %3</t>", typeOf (_this select 1), typeOf (_this select 0), name (_this select 1), name (_this select 0)];}];};
//	case  RESISTANCE 	: {_victim addEventHandler ["killed", {_spwnposg=[getPos (_this select 0), random 350, random 360] call BIS_fnc_relPos; "respawn_guerrila" setmarkerpos _spwnposg; hintSilent parseText format["<t size='1' font='Zeppelin33' color='#FFFF00'>Asset Destroyed, TypeOfVictim: %2, NameOfVictim: %4, TypeOfKiller: %1, NameOfKiller: %3</t>", typeOf (_this select 1), typeOf (_this select 0), name (_this select 1), name (_this select 0)];}];};
//	case  CIVILIAN   	: {_victim addEventHandler ["killed", {_spwnposc=[getPos (_this select 0), random 350, random 360] call BIS_fnc_relPos; "respawn_civilian" setmarkerpos _spwnposc; hintSilent parseText format["<t size='1' font='Zeppelin33' color='#FFFF00'>Asset Destroyed, TypeOfVictim: %2, NameOfVictim: %4, TypeOfKiller: %1, NameOfKiller: %3</t>", typeOf (_this select 1), typeOf (_this select 0), name (_this select 1), name (_this select 0)];}];};
//};
	
//hintSilent parseText format["<t size='1' font='Zeppelin33' color='#FFFF00'>Asset Destroyed, TypeOfVictim: %2, NameOfVictim: %4, TypeOfKiller: %1, NameOfKiller: %3</t>", typeOf _killer, typeOf _victim, name _killer, name _victim];
////hintSilent format["Asset Destroyed, Killer: %1, victim: %2, NameOfKiller: %3, NameOfvictim: %4", _killer, _victim, name _killer, name _victim];
