//////////////////////////////////////////////////////////////////
// Function file for Armed Assault
// Created by: RALPH BELL AMI
//////////////////////////////////////////////////////////////////
_location = _this select 0;

{_x switchLight "OFF"} forEach ((getPos _location) nearObjects ["StreetLamp",1500])

_objHouse = nearestObjects [_location, ["House"], 1500];

{
	for "_i" from 1 to 5 do {
					
					_x animate [format ["Lights_%1",_i],0];
	};
} forEach _objHouse;
