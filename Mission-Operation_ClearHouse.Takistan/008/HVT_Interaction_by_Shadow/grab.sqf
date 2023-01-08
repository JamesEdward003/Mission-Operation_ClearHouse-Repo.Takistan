_HVT=_this select 0;
_taker=_this select 1;

if ((count (attachedObjects _taker))==0) then {
	detach _HVT;
//	_HVT enableAI "move";
	_HVT attachto [_taker,[-0.3,0.5,0]];
	_index=_taker addaction["Release HVT","release.sqf"];
//	[_HVT] joinsilent _taker;
	_HVT disableAI "FSM";
	[0, {
			_HVT=_this select 0;
			_taker=_this select 1;
			[_HVT] joinsilent _taker;
		}, [_HVT,_taker]] call CBA_fnc_globalExecute;	
	while {(count (attachedObjects _taker))>0} do
	{
		sleep 0.5;
		[-2, {
				_HVT=_this select 0;
				_taker=_this select 1;
				_stance=stance _taker;
				_unitpos="up";
				//hint Format["Stance:%1",_stance];
				if(_stance=="prone") then{
					_unitpos="down";
				}else{
					if(_stance=="crouch") then{
						_unitpos="middle";
					};
 			};
				_HVT setunitpos _unitpos;	
			}, [_HVT,_taker]] call CBA_fnc_globalExecute;
		_veh=vehicle _taker;
		if (!(_veh== _taker)) exitwith {
			[-2, {
				_HVT=_this select 0;
				_veh=_this select 1;
				//_HVT hideobject true;
				detach _HVT;
				_HVT enableAI "fsm";
				_HVT moveincargo _veh;
			}, [_HVT,_veh]] call CBA_fnc_globalExecute;
			
		};
	};
	player removeaction _index;
};