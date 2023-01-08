_Taker=_this select 0;
_index=_this select 3;
_id=_this select 2;
_HVT =((attachedObjects _Taker) select 0);
detach _HVT;
_HVT enableAI "fsm";
[0, {
		_HVT=_this select 0;
		[_HVT] joinsilent grpNull;
	}, [_HVT]] call CBA_fnc_globalExecute;	
player removeaction _id;
