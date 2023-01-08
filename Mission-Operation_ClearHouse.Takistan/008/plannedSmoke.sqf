//////////////////////////////////////////////////////////////////
//init
	_cpos = position player;
	_radius = 15;

//loop check
	while {alive c130} do {
		_smokearray = _cpos nearObjects ["SmokeShell",_radius];
		_qty = count _smokearray;
		if (_qty > 0) then {
			//Smoke has been dropped
			_smoke = _smokearray select 0;
			_smokepos = position _smoke;
			hint format ["%1",_smokepos];
		};
		sleep 2;
	};
		
//	Position _cpos nearestObject "Smokeshell";