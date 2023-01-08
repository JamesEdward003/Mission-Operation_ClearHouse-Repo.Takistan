//null=[location] execvm "findA.sqf"

titleText ["YOU HAVE USED ENEMY SEARCH...", "plain down"];
cutText ["", "black out", 1];
sleep 2;
openMap true;
sleep 1;
cutText ["", "black in", 1];

_unit = _this select 0;

_eastmen = nearestobjects [_unit,["SoldierEB"],5000];
_guermen = nearestobjects [_unit,["SoldierGB"],5000];

hint format ["guerrila %1 east %2",count _guermen,count _eastmen];

sleep 2;

// reveal Guerrila to East 
{ 
_temp = _x;
{_temp reveal _x}  foreach _guermen;
} foreach  _eastmen;



// reveal East to Guerrila
{ 
_temp = _x;
{_temp reveal _x}  foreach _eastmen;
} foreach  _guermen;

