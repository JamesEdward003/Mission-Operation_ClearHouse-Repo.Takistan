//////////////////////////////////////////////////////////////////
_unit = _this select 0;
//_nameUnit = name _unit;

if (_unit in units group player) then
{
	while {true} do
	{
		if (alive _unit) then 
		{
			if (damage _unit > 0) then
			{
				_unit setDamage ((damage _unit) - 0.1);
				hintSilent format ["Health: %1-%2",name _unit, damage _unit];
				sleep 0.1;
			};

		};
	};
}; 

	


