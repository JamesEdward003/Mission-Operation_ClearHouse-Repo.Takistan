//null=[location] execvm "findC.sqf"

titleText ["YOU HAVE USED ENEMY SEARCH...", "plain down"];
cutText ["", "black out", 1];
sleep 2;
openMap true;
sleep 1;
cutText ["", "black in", 1];

_unit = _this select 0;

_guermen = nearestobjects [_unit,["SoldierGB"],5000];
_westmen = nearestobjects [_unit,["SoldierWB"],5000];

hint format ["west %1 guerrila %2",count _westmen,count _guermen];

sleep 2;

// reveal West to Guerrila 
{ 
_temp = _x;
{_temp reveal _x}  foreach _westmen;
} foreach  _guermen;



// reveal Guerrila to West
{ 
_temp = _x;
{_temp reveal _x}  foreach _guermen;
} foreach  _westmen;

