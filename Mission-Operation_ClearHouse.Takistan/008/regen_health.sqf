//////////////////////////////////////////////////////////////////
private ["_newDamage","_t"];
hintSilent "Regen Script Started";
while {alive player} do 
{
_t = time;
waitUntil {time - _t > 1};
if (damage player > 0) then 
	{
	_newDamage = (damage player) - 0.05;
	player setdamage _newDamage;
	hintSilent format["Current Damage %1",_newdamage];
	};
sleep 0.10;
};

waitUntil{alive player};
sleep 0.5;
[player] execVM "008\regen_health.sqf";