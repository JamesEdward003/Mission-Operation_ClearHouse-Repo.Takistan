//////////////////////////////////////////////////////////////////
// Function file for Armed Assault
// Created by: RALPH BELL AMI
// this addaction["<t color='#FF0000'>Move HVT</t>","grab.sqf",nil,1,false,true,"","((_target distance _this)<2"];
// Act1 = this addaction ["<t color='#FF0000'>Arrest Chinaman</t>","008\arreststart.sqf",nil,1,false,true,"","((_target distance _this)<2"];
//////////////////////////////////////////////////////////////////
_suspect = _this select 0;
_caller = _this select 1;
_id = _this select 2;

["ArrestStart", [_suspect, _caller]] call CBA_fnc_globalEvent;

hintSilent "You arrest the Chinaman.";

