//null=[location] execvm "findB.sqf"

titleText ["YOU HAVE USED ENEMY SEARCH...", "plain down"];
cutText ["", "black out", 1];
sleep 2;
openMap true;
sleep 1;
cutText ["", "black in", 1];

_unit = _this select 0;

_eastmen = nearestobjects [_unit,["SoldierEB"],5000];
_westmen = nearestobjects [_unit,["SoldierWB"],5000];

hint format ["west %1 east %2",count _westmen,count _eastmen];

sleep 2;

// reveal West to East 
{ 
_temp = _x;
{_temp reveal _x}  foreach _westmen;
} foreach  _eastmen;



// reveal East to West
{ 
_temp = _x;
{_temp reveal _x}  foreach _eastmen;
} foreach  _westmen;

