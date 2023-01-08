//null=[location] execvm "find.sqf"

_pos = _this select 0;

_eastmen = nearestobjects [_pos,["SoldierEB"],5000];
_westmen = nearestobjects [_pos,["SoldierWB"],5000];

//hint format ["west %1 east %2",count _westmen,count _eastmen];

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