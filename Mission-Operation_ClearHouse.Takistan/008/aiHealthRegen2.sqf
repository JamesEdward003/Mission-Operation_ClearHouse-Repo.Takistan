//////////////////////////////////////////////////////////////////
private ["_unit"];
_unit = _this select 0;

if (isMultiplayer) then {	
	_unit addMPEventHandler ["MPRespawn",{_this execVM "aiHealthRegen2.sqf"}];
};
		
_unit addEventHandler ["Hit",{
	private ["_unit","_causedBy","_damage"]; 
        	_unit = _this select 0; 
        	_causedBy = _this select 1;
         _damage = _this select 2;
	if (alive _unit) then 
	{
		if (_damage > 0) then
		{
			_unit setDamage ((_damage) - 0.1);
			//hintSilent format ["Health: %1-%2",name _unit, damage _unit];
			//hintSilent parseText format["<t size='1' font='Zeppelin33' color='#ff0000'>Loadout Saved!</t>"];
			hintSilent parseText format["<t size='1' font='Zeppelin33' color='#FFFF00'>Health: %1-%2</t>",name _unit, damage _unit];
			sleep 0.1;
		};

	};

}];
			

