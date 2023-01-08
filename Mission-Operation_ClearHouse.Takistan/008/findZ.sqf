//null=[location] execvm "findB.sqf"

titleText ["You have used enemy search...", "plain down"];
cutText ["", "black out", 1];
sleep 2;
openMap true;
sleep 1;
cutText ["", "black in", 1];

_pos = _this select 0;

_eastmen = nearestobjects [_pos,["SoldierEB"],5000];
_westmen = nearestobjects [_pos,["SoldierWB"],5000];
_guermen = nearestobjects [_pos,["SoldierGB"],5000];

hint format ["W-%1 E-%2" G-%3,count _westmen,count _eastmen,count _guermen];

sleep 2;

// reveal West to East 
{ 
_temp = _x;
{_temp reveal _x}  foreach _westmen;
} foreach  _eastmen;

// reveal West to Guerrila 
{ 
_temp = _x;
{_temp reveal _x}  foreach _westmen;
} foreach  _guermen;

// reveal East to West
{ 
_temp = _x;
{_temp reveal _x}  foreach _eastmen;
} foreach  _westmen;

// reveal East to Guerrila
{ 
_temp = _x;
{_temp reveal _x}  foreach _eastmen;
} foreach  _guermen;

// reveal Guerrila to West
{ 
_temp = _x;
{_temp reveal _x}  foreach _guermen;
} foreach  _westmen;

// reveal Guerrila to East
{ 
_temp = _x;
{_temp reveal _x}  foreach _guermen;
} foreach  _eastmen;

