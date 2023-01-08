////////////////////////////////////////////////////////////////// 
_wounded = _this select 0;

_nameUnit = name _wounded;

_medics = nearestObjects [_wounded, ["Man"], 75];
		
_aliveMedics = [];

{ if (alive _x) then { _aliveMedics = _aliveMedics+[_x] }; } forEach _medics;

_wounded sidechat format ["I'm wounded %1, heal me!", typeOf (_aliveMedics select 0)];

if (count _aliveMedics > 0) then
{
	_medic = _aliveMedics select 0;

if (!(_wounded getVariable ["BIS_IS_inAgony", false])) then {_wounded playMove "AinjPpneMstpSnonWrflDnon_rolltoback"};

while {(getDammage _wounded) != 0 AND alive _wounded AND alive _medic} do {
	
_dam = getDammage _wounded;

_medic playMove "AinvPknlMstpSnonWrflDnon_medic";

waitUntil {(animationState _medic) == "AinvPknlMstpSnonWrflDnon_medic" OR !alive _medic OR !alive _wounded};

if (alive _medic AND alive _wounded) then {_medic playMove "AinvPknlMstpSnonWrflDnon_medic3"};

waitUntil {(animationState _medic) == "AinvPknlMstpSnonWrflDnon_medic3" OR !alive _medic OR !alive _wounded};

_wounded setDammage _dam;

if (alive _medic AND alive _wounded AND _dam > 0.1) then {_wounded setDammage (_dam - 0.1)} else {_wounded setDammage 0};

};

if (alive _medic) then {
	
_medic playMove "AinvPknlMstpSnonWrflDnon_medicEnd";
waitUntil {!alive _medic OR !alive _wounded OR (animationState _medic) == "AinvPknlMstpSnonWrflDnon_medicEnd"};
waitUntil {!alive _medic OR !alive _wounded OR (animationState _medic) != "AinvPknlMstpSnonWrflDnon_medicEnd"};

};

if (alive _wounded AND !(_wounded getVariable ["BIS_IS_inAgony", false])) then {
_wounded playMove "AinjPpneMstpSnonWrflDnon_rolltofront";
_wounded playMove "amovpknlmstpsraswrfldnon_amovppnemstpsraswrfldnon";

};

if (alive _wounded AND alive _medic) then {_wounded setDammage 0};

// if first aid modules is used.
if ((_wounded getVariable ["BIS_IS_inAgony", false]) AND alive _medic AND alive _wounded) then {
	{_wounded setVariable [_x,0,true]} foreach ["head_hit","body","hands","legs","bloodlossPerSecond","bloodloss"];
	_wounded setVariable ["BIS_IS_inAgony",false];
	_wounded playMove "AinjPpneMstpSnonWrflDnon_rolltofront";
	_wounded playMove "amovpknlmstpsraswrfldnon_amovppnemstpsraswrfldnon";
};

if (alive _wounded AND alive _medic) then {_wounded setDammage 0};


hint parseText format["<t>You healed %1</t>", _nameUnit];

} else {
	titleText ["No MEDICS identified...","PLAIN DOWN"];
};




