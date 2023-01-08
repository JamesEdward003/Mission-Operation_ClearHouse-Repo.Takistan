//////////////////////////////////////////////////////////////////
_target = _this select 0;  
_caller = _this select 1;  
_action = _this select 2;  

//_caller removeAction _action;

_damage = getDammage _caller;

if (_damage > 0) then {

_caller playMove "AinvPknlMstpSlayWrflDnon_medic";

sleep 8;
	
_caller setDamage 0;

sleep 1;

//hint parseText format["<t>You healed %1</t>", _caller];
player commandChat format["Unit %1 healed himself", name player];

} else {
	
player commandChat format["Unit %1 is not damaged", name player];

};
	
	


