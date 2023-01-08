// medicAuto.sqf //
/*
Automated medic v 1.1
by Demonized.

When medic is issued a heal command by leader of group, medic will continue to heal rest of groups wounded units.
Medic will attempt to heal the clostest wounded unit from his position, or the most critical or units not able to walk, based on options set.
Until ordered to one of these commands "WAIT","ATTACK","HIDE","REARM","GET IN","STOP" or the medic is dead.

WARNING!! if you have set medic to STOP or HIDE (take cover) ingame via squad menu commands, the auto part will fail, game engine overwrites all other commands.
The script itself will set the unit to stop and it will show stop in unit icon, but this is ok - but you need to keep track of if you order unit yourself to stop or hide,
and then call him back to formation or move to somewhere to fix it.
["WAIT","ATTACK","HIDE","REARM","GET IN","HIDE","STOP"] these commands will abort or cancel healing run.

execute: place in initline of medic/s.  (example here is initline placement, or use name instead of this)
	option 1: - start healing run from the unit ordered to heal by leader, then proceed to next nearest wounded unit.
	_null = [this,"closeWounded"] execVM "medicAuto.sqf";

	option 2: - start healing run from medics actual position, healing nearest wounded unit to medics position,
	note that this is a action added to the leader.
	_null = [this,"closeMedic"] execVM "medicAuto.sqf";

	option 3: - fully automated medic beheaviour, once a team member is wounded, medic rushes to his position to heal.
	note: may be hasardous for medic health if under fire, but medic will react properly firing/covering etc depending on beheaviour of medic as normal.
	_null = [this,"fullAuto"] execVM "medicAuto.sqf";

_fallBack set to true is very valuable if you setup your unit behind your group in a "safe position", he will return to this position when finnished healing or aborted.
it can utilize all below optionals, but beware that using the STOP or HIDE command ingame will halt the unit and this script, or abort current healing run.

option 2 is most recomended.

*/

// optional:
_canWalk = false;  	// true/false = on/off. - if units should be prioritized nearest unit wich cannot walk, closest wounded is ignored if someone cannot walk.
_critical = false;  	// true/false = on/off - if units should be prioritized by amount of damage, nearest is ignored, amount of damage is priority.
_fallBack = true;  	// true/false = on/off - if medic should return to his original position after heal prior to healing start. works with "fullAuto" AND "closeMedic"
_maxDist = 500;  		// x = meters - medic will not attempt to return to a position or heal units more than this away from the medic.

// this below option is mainly designed for "closeWounded" option, adds a action to leade, it will make the medic mark any position he is currently in as his fallback position, it can be used with any of the options.
_opFallBack = true;  	// true/false = on/off - make the current medic position as his fallback position after healing team members.
_showMarker = true;  	// true/false = on/off - when medic is given a fallBackPosition or have one setup auto via _fallback = true above, there will be a marker on map created at the fallback position.

// DO NOT EDIT BELOW THIS LINE //

_medic = _this select 0;

if ("fullAuto" in _this) then {
while {alive _medic} do {
	waitUntil {sleep 1; !alive _medic OR ({alive _x AND (getDammage _x) != 0} count units group _medic) != 0};
	if (alive _medic) then {
		_medic setVariable ["DMZ_AM_available", false, true];
		_null = [_medic,"healingRun"] execVM "medicAuto.sqf";
	};
	waitUntil {sleep 1; !alive _medic OR _medic getVariable ["DMZ_AM_available", true]};
};
};

if ("closeMedic" in _this) then {
_lead = leader (group _medic);
_con1 = format["_target == _this AND alive _target AND alive %1 AND ({alive _x AND (getDammage _x) != 0} count units group _target) != 0 AND (%1 getVariable ['DMZ_AM_available', true])",_medic];
_acN1 = format ["<t color='#ff0000'>MEDIC!!!</t>",_medic];
_lead addAction [_acN1, "medicAuto.sqf", ["action",_medic], 0, false, true, "", _con1];
};

if ("closeWounded" in _this) then {
{
	_x addEventHandler ["HandleHeal", {
		_medic = _this select 1;
		if (_medic getVariable ["DMZ_AM_available", true]) then {
			_medic setVariable ["DMZ_AM_available", false, true];
			_null = [_medic,"eh","healingRun"] execVM "medicAuto.sqf";
		};
	}];
} foreach units group _medic;
};

if ("closeMedic" in _this OR "closeWounded" in _this) then {
_lead = leader (group _medic);
_con2 = format["_target == _this AND alive _target AND alive %1 AND !(%1 getVariable ['DMZ_AM_available', true])",_medic];
_acN2 = format ["<t color='#ff0000'>MEDIC ABORT!!</t>",_medic];
_lead addAction [_acN2, "medicAuto.sqf", ["abort",_medic], 0, false, true, "", _con2];
};

if (_opFallBack AND ("closeMedic" in _this OR "closeWounded" in _this OR "fullAuto" in _this)) then {
_lead = leader (group _medic);
_con1 = format["_target == _this AND alive _target AND alive %1 AND (%1 getVariable ['DMZ_AM_available', true]) AND (%1 distance (%1 getVariable ['DMZ_AM_pos', [0,0,0]])) > 5",_medic];
_acN1 = format ["<t color='#ff0000'>FALLBACK POSITION MEDIC</t>",_medic];
_lead addAction [_acN1, "medicAuto.sqf", ["fallback",_medic], 0, false, true, "", _con1];
};

_heal = false;
if ((count _this) >= 4) then {
_arg = _this select 3;
if ("action" in _arg) then {
	_medic = _arg select 1;
	(leader (group _medic)) groupChat "MEDIC!!";
	_heal = true;
};
if ("abort" in _arg) then {
	_medic = _arg select 1;
	_medic setVariable ["DMZ_AM_abort", true, true];
};
if ("fallback" in _arg) then {
	_medic = _arg select 1;
	(leader (group _medic)) groupChat "Medic - setup fallback position";
	doStop _medic;
	_pos = getPos _medic;
	_medic doMove _pos;
	_medic setVariable ["DMZ_AM_pos", _pos, true];
	sleep 2;
	_medic groupChat "Roger - setting up fallback position";

	//create a marker for fallback position if _showMarker option is enabled.
	if (_showMarker) then {
		_ret = _medic getVariable ["DMZ_AM_marker", "none"];
		if (_ret == "none") then {
			_cnt = 0;
			_mName = "DMZ_AM_Marker";
			while {!isNil (_mName)} do {
				_mName = format["DMZ_AM_Marker_%1",_cnt];
				_cnt = _cnt + 1;
			};
			_mark = createMarkerLocal[_mName,_pos];
			_mark setMarkerShapeLocal "ICON";
			_mark setMarkerTypeLocal "n_med";
			_mark setMarkerTextLocal "Medic Fallback";
			_medic setVariable ["DMZ_AM_marker", _mark, true];
		} else {
			_ret setMarkerPosLocal _pos;
		};
	};

	waitUntil {unitReady _medic};
	doStop _medic;
	_medic setUnitPos "Middle";
	_null = _medic spawn {
		waitUntil {sleep 1; (behaviour _this) in ["COMBAT","STEALTH"] OR !alive _this OR (currentCommand _this) in ["HIDE","MOVE"]};
		if (alive _this) then {_this setUnitPos "AUTO"};
	};
};
};

if ("healingRun" in _this OR _heal) then {
_medic setVariable ["DMZ_AM_available", false, true];

// commands that will abort the healing run.
_cansel = ["WAIT","ATTACK","HIDE","REARM","GET IN","HIDE","STOP"];

_orgPos = [];
if (_fallBack OR _opFallBack) then {_orgPos = getPos _medic};
_varPos = _medic getVariable ["DMZ_AM_pos", []];
if ((count _varPos) != 0) then {_orgPos = _varPos};
if ("eh" in _this) then {
	waitUntil {!alive _medic OR unitReady _medic OR (currentCommand _medic) != "HEAL SOLDIER"};
};

_heal = true;
while {_heal} do {
	_dist = _maxDist;
	_grp = group _medic;
	_lead = leader _grp;
	_wounded = _medic;

	// general nearest wounded part, being overwriten by canWalk or critical in that order if activated.
	{
		if (alive _x AND (getDammage _x) != 0 AND alive _medic) then {
			_dist1 = _medic distance _x;
			if (_dist1 < _dist) then {
				_dist = _dist1;
				_wounded = _x;
			};
		};
	} foreach units _grp;

	// can walk priority part overides general nearest if someone cant walk, nearest unit unable to walk is 1st priority. overwrited by critical if its set to true.
	if (_canWalk) then {
		if (({!canStand _x} count units group _medic) != 0) then {
			_dist = _maxDist;
			{
				_dist1 = _medic distance _x;
				if (_dist1 < _dist AND !canStand _x) then {
					_dist = _dist1;
					_wounded = _x;
				};
			} foreach units _grp;
		};
	};

	// criticals first part overides canwalk part if anyone is more wounded, most damaged unit is 1st priority. overwrites any other conditions.
	if (_critical) then {
		_dam = 0;
		_dist = _maxDist;
		{
			_dam1 = getDammage _x;
			if (alive _x AND (getDammage _x) != 0 AND alive _medic AND _dam1 > _dam) then {
				_dist1 = _medic distance _x;
				if (_dist1 < _dist) then {
					_dam = _dam1;
					_wounded = _x;
				};
			};
		} foreach units _grp;
	};

	// the actual moving and healing part.
	if ((getDammage _wounded) != 0 AND alive _medic) then {
		_move = true;
		while {_move AND alive _wounded AND alive _medic} do {
			_pos = getPos _wounded;
			_medic doMove _pos;
			waitUntil {(_medic distance _pos) < 3 OR !alive _medic OR !alive _wounded OR (currentCommand _medic) in _cansel OR (_medic getVariable ["DMZ_AM_abort", false])};
			if ((_medic distance _wounded) < 3 OR !alive _medic OR !alive _wounded OR (currentCommand _medic) in _cansel OR (_medic getVariable ["DMZ_AM_abort", false])) then {_move = false};
		};
		if (alive _wounded AND alive _medic AND !((currentCommand _medic) in _cansel) AND !(_medic getVariable ["DMZ_AM_abort", false])) then {
			_wounded action ["heal", _medic];
			sleep 2;

			// if dfirst aid modules is used.
			if (_wounded getVariable ["BIS_IS_inAgony", false]) then {
				_wounded setDammage 0;
				{_wounded setVariable [_x,0,true]} foreach ["head_hit","body","hands","legs","bloodlossPerSecond","bloodloss"];
				_wounded setVariable ["BIS_IS_inAgony",false];
			};


			_medic doFollow _lead;
			waitUntil {unitReady _medic OR (currentCommand _medic) in _cansel};
		};
	};

	if ((({(getDammage _x) != 0} count units group _medic) == 0 OR (_medic getVariable ["DMZ_AM_abort", false])) AND alive _medic) then {
		_heal = false;
		_medic setVariable ["DMZ_AM_available", true, true];
		_medic doFollow _lead;
		if ((count _orgPos) != 0) then {
			if (_medic getVariable ["DMZ_AM_abort", false]) then {
				_medic groupChat "aborted - returning to fallback position";
			} else {
				_medic groupChat "no more wounded - returning to fallback position";
			};
		} else {
			_medic groupChat "no more wounded - returning to formation";
		};
	};
	if ((currentCommand _medic) in _cansel OR !alive _medic) then {
		if (alive _medic AND _heal) then {_medic groupChat "aborted"};
		_heal = false;
	};
};
if (alive _medic) then {
	_medic setVariable ["DMZ_AM_available", true, true];
	_medic setVariable ["DMZ_AM_abort", false, true];
	if ((count _orgPos) != 0) then {
		_medic doFollow _lead;
		_medic doMove _orgPos;

		_null = _medic spawn {
			waitUntil {sleep 1; unitReady _this OR !alive _this};
			if (alive _this) then {_this setUnitPos "Middle"};
			waitUntil {sleep 1; (behaviour _this) in ["COMBAT","STEALTH"] OR !alive _this OR (currentCommand _this) in ["HIDE","MOVE"]};
			if (alive _this) then {_this setUnitPos "AUTO"};
		};
	};
};
};
