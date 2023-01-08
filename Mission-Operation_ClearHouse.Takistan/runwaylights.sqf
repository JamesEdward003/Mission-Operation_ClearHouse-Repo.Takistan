// executed by initline of helipads; Original By MH6.
// _null=[this,6] execVM "runwaylights.sqf";

_target_pos = getPos (_this select 0);

//helipad = "HeliH" createVehicle _target_pos;
//helipad setPos _target_pos;

_ang = 0;
_rad = 6.5; //radius
_bcount = _this select 1; //number of lights
_inc = 360/_bcount; 

for "_i" from 0 to _bcount do
{
	_a = (_target_pos select 0)+(sin(_ang)*_rad);
	_b = (_target_pos select 1)+(cos(_ang)*_rad);

	_pos = [_a,_b,_target_pos select 2];
	_ang = _ang + _inc;

	_light = "Land_runway_edgelight" createVehicle _pos;
	_light setPos _pos;
};

if(true) exitWith{};