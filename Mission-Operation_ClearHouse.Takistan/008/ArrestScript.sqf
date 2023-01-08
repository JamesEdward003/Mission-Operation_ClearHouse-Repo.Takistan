//////////////////////////////////////////////////////////////////
// Function file for Armed Assault
// Created by: RALPH BELL AMI
//
// null = [this] execVM "008\ArrestScript.sqf";
// START of ArrestScript.sqf - Called on the start of the Arrest
//////////////////////////////////////////////////////////////////
_unit = cursorTarget;

[_unit] execVM "008\handsUpArrest.sqf";

Act1 = _unit addaction ["<t color='#FF0000'>Arrest Chinaman</t>","008\arreststart.sqf",nil,1,false,true,"","((_target distance _this)<3"];

["ArrestStart", {
	private ["_gen", "_caller", "_id"];
	_gen = _this select 0;
	_caller = _this select 1;
	_id = _this select 2;
	// REMOVEACTIONS
	_gen removeAction _id;
	_gen removeAction act1;
	_gen removeAction act2;
	_gen removeAction act3;
	_gen removeAction act4;
	//ANIMATION
	[_gen] execVM "008\handsBackArrest.sqf";

	//ADDACTIONS
	act1 = _gen addaction ["<t color='#FF0000'>Take Suspect With You</t>","008\joinGroupPlayer.sqf",[cursorTarget,player],1,false,true,"",""];
	act2 = _gen addaction ["<t color='#FF0000'>Search Suspect</t>","008\search.sqf",[cursorTarget,player],1,false,true,"",""];
	act3 = _gen addaction ["<t color='#FF0000'>Release Suspect</t>","008\joinGroupNull.sqf",[cursorTarget,player],1,false,true,"",""];
	act4 = _gen addaction ["<t color='#FF0000'>Disarm Suspect</t>","008\surrender.sqf",[cursorTarget,player],1,false,true,"",""];
	ProcessInitCommands;
}] call CBA_fnc_addEventHandler;