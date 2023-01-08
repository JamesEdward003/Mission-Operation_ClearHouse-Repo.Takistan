//////////////////////////////////////////////////////////////////
// Function file for Armed Assault
// Created by: RALPH BELL AMI
//////////////////////////////////////////////////////////////////
/*	 surrender.sqf
	 Original Skript & Idea by Mr-Murray 2006
	 modified for Knock Knock by W0lle
	 
	 www.mapfact.net
	 www.mr-murray.de.vu
*/

if (!isServer) exitWith {};
hands_up = false;
hands_back = false;

_target = _this select 0;
_id = _this select 2;
_target removeAction _id;

_target setCaptive true;
_target disableAI "Anim";		
_target disableAI "MOVE";

if (!alive _target) exitWith {};

_target action ["DROPWEAPON", _target, primaryWeapon _target];

_target playmove "AmovPercMstpSnonWnonDnon";

removeallWeapons _target;