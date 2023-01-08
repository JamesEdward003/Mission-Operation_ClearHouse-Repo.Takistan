_unit = _this select 0;

/*****************************************************************
	Client Stuff
******************************************************************/
if !(isPlayer _unit) then {_unit addAction ["<t color='#FF8000'>Dismiss</t>","008\dismiss.sqf",[],-2,false,true,""]};