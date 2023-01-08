//////////////////////////////////////////////////////////////////
//_unit = _this select 0;  
_caller = player;  
//_action = _this select 2;  

//_caller removeAction _action;

_target = cursorTarget;

_damage = getDammage _target;

if (_damage > 0) then {

_caller playMove "AinvPknlMstpSlayWrflDnon_medic";

sleep 8;
	
_target setDamage 0;

sleep 1;

player commandChat format["%1 repaired by %2", typeOf _target, name _caller];

} else {
	
player commandChat format["%1 is not damaged", typeOf _target];

};
