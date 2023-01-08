//  [player] execVM "Heal_Player.sqf";  //
_unit = _this select 0;
_side = side _unit;
_teamleader = leader _unit;
_grp =  group _unit;
_dist = 100;
_type = "US_Delta_Force_Medic_EP1";

_nearestUnits = nearestObjects [_unit,["Man"],_dist];

_injuredGrp = [];

{if ((lifeState _x == "UNCONSCIOUS") || (lifeState _x == "ALIVE") and (damage _x > .3)) then {    
	_injuredGrp = _injuredGrp + [_x];
}} forEach _nearestUnits;

for "_i" from 0 to count _injuredGrp - 1 do {
	
	_injured = _injuredGrp select _i;
	
	if (lifeState _injured == "ALIVE") then {hint format ["Just visiting %1? Are you good to go?", vehicleVarname _injured]};

	if (lifeState _injured == "UNCONSCIOUS") then {
		_injured setDamage 0;
		hint format ["Combat Life Saver not needed %1. You're good to go!", vehicleVarname _injured];
	};	
};

uisleep 10;
hint "";

