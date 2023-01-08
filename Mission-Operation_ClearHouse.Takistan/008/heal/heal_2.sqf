//////////////////////////////////////////////////////////////////
_target = _this select 0;  
_caller = _this select 1;  
_action = _this select 2;  

//_caller removeAction _action;

_wounded = cursortarget;

_damage = getDammage _wounded;

hintsilent format ["%1 Percent Health",(round (100 - (_damage * 110)))];

if (_damage > 0) then {

_wounded playMove "AinjPpneMstpSnonWrflDnon_rolltoback";
_caller playMove "AinvPknlMstpSlayWrflDnon_medic";

sleep 8;
	
_wounded setDamage 0;

_wounded playMove "AinjPpneMstpSnonWrflDnon_rolltofront";
_wounded playMove "amovpknlmstpsraswrfldnon_amovppnemstpsraswrfldnon";

sleep 1;

//hint parseText format["<t>You healed %1</t>", _caller];
player commandChat format["Unit %1 healed %2", name player, name _wounded];

} else {
	
player commandChat format["Unit %1 is not damaged", name _wounded];

};
	
	


