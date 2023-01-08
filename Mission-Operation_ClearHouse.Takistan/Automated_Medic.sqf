// Automated_Medic.sqf aka closeMedic.sqf //
/*
Automated medic v 1.13
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

// optionals:  true/false = on/off
_canWalk = false;  	// if units should be prioritized nearest unit wich cannot walk, closest wounded is ignored if someone cannot walk.
_critical = false;  	// if units should be prioritized by amount of damage, nearest is ignored, amount of damage is priority.
_fallBack = false;  	// if medic should return to his original position after heal prior to healing start. works with "fullAuto" AND "closeMedic"
_maxDist = 500;  		// x = meters - medic will not attempt to return to a position or heal units more than this away from the medic.
_optHeal = true;		// if medic should heal longer based on amount of damage to the wounded unit.

// this below options is relying on eachother, adds a action to leader, it will make the medic mark any position he is currently in as his fallback position, it can be used with any of the options.
_opFallBack = true;  	// make the current medic position as his fallback position after healing team members until fallback is reset.
_showMarker = true;  	// when medic is given a fallBackPosition, there will be a marker on map created at the fallback position.

_buildMash = true;  	// only usable with _opFallBack set to true, medic build a mash tent at fallback position, use together with _fallBack = true to have fallbacks without building mash or simply dont use this option.
_mashInit = "";		// set the init of the mash here if desired, can be for example naming it so you can respawn at it, run another script on it etc... make sure to use ""double"" or 'single' inside the outer "quotes". for example "myTent = this" will name the tent to myTent, wich you can use outside of the script for example for respawns.
_respawn = true;		// if medic should respawn at mash when killed, requires _buildMash = true;
_timer = 10;		// timer in seconds until medic respawns after death.
_lives = 3;			// how many respawns medic has, 0 means unlimited.


// DO NOT EDIT BELOW THIS LINE //

_idRemoval = {
//_ret = [_medic,_idx] call _idRemoval;
_medic = _this select 0;
_arr = _medic getVariable ["DMZ_AM_actionsOrespawn", []];
_arr = _arr + [(_this select 1)];
_medic setVariable ["DMZ_AM_actionsOrespawn", _arr, true];
_medic setVariable ["DMZ_AM_leader", (leader (group _medic)), true];
};

_respawnEH = {
//_null = _medic spawn _respawnEH;
_idx = _this addEventHandler ["killed", {
	_null = (_this select 0) spawn {
		_mash = _this getVariable ["DMZ_AM_mashbuilt", _this];
		_pos = _this getVariable ["DMZ_AM_pos", _this];
		_script = _this getVariable ["DMZ_AM_script", "none"];
		_mark = _this getVariable ["DMZ_AM_marker", "none"];
		_timer = _this getVariable ["DMZ_AM_Respawn", 10];
		_lAct = _this getVariable ["DMZ_AM_actionsOrespawn", []];
		_lead = _this getVariable ["DMZ_AM_leader", "none"];
		_lives = _this getVariable ["DMZ_AM_respawn_lives", 0];
		_skill = _this getVariable ["DMZ_AM_respawn_skill", 0];
		_color = _this getVariable ["DMZ_AM_color_used", "#ff0000"];
		_vName = vehicleVarName _this;
		_grp = group _this;
		_type = typeOf _this;
		{_lead removeAction _x} foreach _lAct;

		if (_lives == 0) exitWith {};

		sleep _timer;

		_cnt = 0;
		_dName = "DMZ_AM_dead";
		while {!isNil (_dName)} do {
			_cnt = _cnt + 1;
			_dName = format["DMZ_AM_dead_%1",_cnt];
		};
		_this SetVehicleVarName _dName;
		_this Call Compile Format ["%1=_This ; PublicVariable ""%1""",_dName];
		waitUntil {(vehicleVarName _this) == _dName};

		_unit = _grp createUnit [_type, _pos, [], 0, "NONE"];
		_unit SetVehicleVarName _vName;
		_unit Call Compile Format ["%1=_This ; PublicVariable ""%1""",_vName];

		_unit setskill _skill;

		_vars = [_mash,false,true,_pos,_mark,_script,_timer,_lead,_lives,_color];
		_sel = 0;
		{
			_unit setVariable [_x, (_vars select _sel), true];
			_sel = _sel + 1;
		} foreach ["DMZ_AM_mashbuilt","DMZ_AM_mash","DMZ_AM_pos_set","DMZ_AM_pos","DMZ_AM_marker","DMZ_AM_script","DMZ_AM_Respawn","DMZ_AM_leader","DMZ_AM_respawn_lives","DMZ_AM_color_used"];

		_script set [0, _unit];
		if (!("DMZ_AM_respawnedEH" in _script)) then {
			_script = _script + ["DMZ_AM_respawnedEH"];
		};
		_null = _script execVM "medicAuto.sqf";

		_unit doMove _pos;
		waitUntil {unitReady _unit};
		doStop _unit;
		_unit setUnitPos "Middle";
	};
}];
_this setVariable ["DMZ_AM_removeEH", _idx, true];
};

_medic = _this select 0;
if (!(local (leader (group _medic)))) exitWith {};

// different color selection for multiple medics in same group using this script.
_color = "#ff0000";	// color used for action text, default is RED, place color code inside "qoutes" more colors to be found here   http://html-color-codes.info/
if (!("DMZ_AM_respawnedEH" in _this) AND _opFallBack AND ({_x in ["closeWounded","closeMedic","fullAuto"]} count _this) != 0) then {
_grpLead = leader (group _medic);
sleep (random 1);
waitUntil {sleep 1; (_grpLead getVariable ["DMZ_AM_color", true])};
_grpLead setVariable ["DMZ_AM_color", false, true];

_col = _grpLead getVariable ["DMZ_AM_color_used", []];
if (!("red" in _col)) then {
	_col = _col + ["red"]; _color = "#ff0000";
} else {
	if (!("blue" in _col)) then {
		_col = _col + ["blue"]; _color = "#0000FF";
	} else {
		if (!("yellow" in _col)) then {
			_col = _col + ["yellow"]; _color = "#FFFF00";
		} else {
			if (!("purple" in _col)) then {
				_col = _col + ["purple"]; _color = "#A901DB";
			};
		};
	};
};

_grpLead setVariable ["DMZ_AM_color_used", _col, true];
_grpLead setVariable ["DMZ_AM_color", true, true];
_medic setVariable ["DMZ_AM_color_used", _color, true];
};

// respawn function re activate.
if ("DMZ_AM_respawnedEH" in _this) then {
_medic setVariable ["DMZ_AM_Respawn", _timer, true];
_color = _medic getVariable ["DMZ_AM_color_used", "#ff0000"];
_null = _medic spawn _respawnEH;
};

// dynamic fix for unnamed medics.
if (({_x in ["closeWounded","closeMedic","fullAuto"]} count _this) != 0) then {
_vName = vehicleVarName _medic;
if (_vName == "") then {
	_cnt = 0;
	_vName = "DMZ_AM_name";
	while {!isNil (_vName)} do {
		_cnt = _cnt + 1;
		_vName = format["DMZ_AM_name_%1",_cnt];
	};
	_medic SetVehicleVarName _vName;
	_medic Call Compile Format ["%1=_This ; PublicVariable ""%1""",_vName];
};
};

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
_acN1 = format ["<t color='%1'>MEDIC!!!</t>",_color];
_idx = _lead addAction [_acN1, "medicAuto.sqf", ["action",_medic], 0, false, true, "", _con1];
_ret = [_medic,_idx] call _idRemoval;
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
_acN2 = format ["<t color='%1'>MEDIC ABORT!!</t>",_color];
_idx = _lead addAction [_acN2, "medicAuto.sqf", ["abort",_medic], 0, false, true, "", _con2];
_ret = [_medic,_idx] call _idRemoval;
};

if (_opFallBack AND ("closeMedic" in _this OR "closeWounded" in _this OR "fullAuto" in _this)) then {
_lead = leader (group _medic);
_con1 = format["_target == _this AND alive _target AND alive %1 AND (%1 getVariable ['DMZ_AM_available', true]) AND (%1 distance (%1 getVariable ['DMZ_AM_pos', [0,0,0]])) > 5 AND !(%1 getVariable ['DMZ_AM_pos_set', false])",_medic];
_acN1 = format ["<t color='%1'>FALLBACK POSITION MEDIC</t>",_color];
_idx1 = _lead addAction [_acN1, "medicAuto.sqf", ["fallback",_medic], 0, false, true, "", _con1];

_con1 = format["_target == _this AND alive _target AND alive %1 AND (%1 getVariable ['DMZ_AM_available', true]) AND (%1 getVariable ['DMZ_AM_pos_set', false])",_medic];
_acN1 = format ["<t color='%1'>RESET FALLBACK POSITION</t>",_color];
_idx2 = _lead addAction [_acN1, "medicAuto.sqf", ["resetFallback",_medic], 0, false, true, "", _con1];
{_ret = [_medic,_x] call _idRemoval} foreach [_idx1,_idx2];
if (_respawn) then {
	_medic setVariable ["DMZ_AM_script", _this, true];
	_medic setVariable ["DMZ_AM_respawn_skill", (skill _medic), true];

	if (_lives != 0) then {
		_aL = _medic getVariable ["DMZ_AM_respawn_lives", 19999];
		if (_aL == 19999) then {
			_medic setVariable ["DMZ_AM_respawn_lives", _lives, true];
		} else {
			_aL = _aL - 1;
			_medic setVariable ["DMZ_AM_respawn_lives", _aL, true];
		};
	} else {
		_medic setVariable ["DMZ_AM_respawn_lives", 5, true];
	};
};
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
if ("resetFallback" in _arg) then {
	_medic = _arg select 1;
	_medic setVariable ["DMZ_AM_pos", [0,0,0], true];
	_medic setVariable ["DMZ_AM_pos_set", false, true];

	if (!(_medic getVariable ["DMZ_AM_mash", true])) then {
		_mash = _medic getVariable ["DMZ_AM_mashbuilt", "none"];
		_mark = _medic getVariable ["DMZ_AM_marker", "none"];
		if (_mash != _medic) then {
			_vName = vehicleVarName _mash;
			deleteVehicle _mash;
			_medic setVariable ["DMZ_AM_mash", true, true];
			waitUntil {isNull _mash};
			_vName = nil;

			_idx = _medic getVariable ["DMZ_AM_removeEH", 9999];
			if (_idx != 9999) then {
				_medic removeEventHandler ["killed", _idx];
			};
		};
		if (_mark != "none") then {
			deleteMarker _mark;
			_medic setVariable ["DMZ_AM_marker", "none", true];
			_mark = nil;
		};
	};
};
if ("fallback" in _arg) then {
	_medic = _arg select 1;
	(leader (group _medic)) groupChat "Medic - setup fallback position";
	doStop _medic;
	_pos = getPos _medic;
	_medic doMove _pos;
	_medic setVariable ["DMZ_AM_pos_set", true, true];
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

			if (!_respawn) then {
				_medic addEventHandler ["killed", {
					_null = (_this select 0) spawn {
						_ret = _this getVariable ["DMZ_AM_marker", "none"];
						deleteMarker _ret;
					};
				}];
			};
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

	if (_buildMash AND (_medic getVariable ["DMZ_AM_mash", true])) then {
		_dir = getDir _medic;
		_cd = _dir mod 360;
		_mp = getPos _medic;
		_newX = (_mp select 0) + (sin _cd * 4);
		_newY = (_mp select 1) + (cos _cd * 4);
		_newZ = (_mp select 2);
		_newPos = [_newX, _newY, _newZ];

		_medic setVariable ["DMZ_AM_mash", false, true];
		sleep 2;
		_mash = createVehicle ["MASH_EP1", _newPos, [], 0, "NONE"];
		_mash setPos _newPos;
		_mash setDir (_dir + 180);

		if (_mashInit != "") then {
			_mash setVehicleInit _mashInit;
			processInitCommands;
		};

		_vName = vehicleVarName _mash;
		if (_vName == "") then {
			_cnt = 0;
			_vName = "DMZ_AM_mash";
			while {!isNil (_vName)} do {
				_cnt = _cnt + 1;
				_vName = format["DMZ_AM_mash_%1",_cnt];
			};
			_mash SetVehicleVarName _vName;
			_mash Call Compile Format ["%1=_This ; PublicVariable ""%1""",_vName];
		};

		_medic setVariable ["DMZ_AM_Respawn", _timer, true];
		_medic setVariable ["DMZ_AM_mashbuilt", _mash, true];
		_null = _medic spawn _respawnEH;
		_medic doWatch (leader (group _medic));
		sleep 5;
		_medic doWatch objNull;
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
if (({_x == 0} count _varPos) != 3) then {_orgPos = _varPos};
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
		if (alive _x AND (getDammage _x) != 0 AND alive _medic AND !(_x getVariable ["DMZ_AM_Being_healed", false])) then {
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
				if (_dist1 < _dist AND !canStand _x AND !(_x getVariable ["DMZ_AM_Being_healed", false])) then {
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
			if (alive _x AND (getDammage _x) != 0 AND alive _medic AND _dam1 > _dam AND !(_x getVariable ["DMZ_AM_Being_healed", false])) then {
				_dist1 = _medic distance _x;
				if (_dist1 < _dist) then {
					_dam = _dam1;
					_wounded = _x;
				};
			};
		} foreach units _grp;
	};
	if (alive _wounded) then {
		_wounded setVariable ["DMZ_AM_Being_healed", true, true];
	};

	// the actual moving and healing part.
	if ((getDammage _wounded) != 0 AND alive _medic) then {
		_move = true;
		while {_move AND alive _wounded AND alive _medic} do {
			_pos = getPos _wounded;
			_medic doMove _pos;
			waitUntil {(getDammage _wounded) == 0 OR (_medic distance _pos) < 3 OR (_wounded distance _pos) > 5 OR !alive _medic OR !alive _wounded OR (currentCommand _medic) in _cansel OR (_medic getVariable ["DMZ_AM_abort", false])};
			if ((getDammage _wounded) == 0 OR (_medic distance _wounded) < 3 OR !alive _medic OR !alive _wounded OR (currentCommand _medic) in _cansel OR (_medic getVariable ["DMZ_AM_abort", false])) then {_move = false};
		};
		if (alive _wounded AND alive _medic AND !((currentCommand _medic) in _cansel) AND !(_medic getVariable ["DMZ_AM_abort", false]) AND (getDammage _wounded) != 0) then {
			if (_optHeal) then {
				if (!(_wounded getVariable ["BIS_IS_inAgony", false])) then {_wounded playMove "AinjPpneMstpSnonWrflDnon_rolltoback"};
				_vector = ((((getPos _wounded select 0) - (getPos _medic select 0)) atan2 ((getPos _wounded select 1) - (getPos _medic select 1))) + 360) % 360;
				_medic setDir _vector;
				_medic playActionNow "walkf";
				while {(getDammage _wounded) != 0 AND alive _wounded AND alive _medic} do {
					_dam = getDammage _wounded;
					_vector = ((((getPos _wounded select 0) - (getPos _medic select 0)) atan2 ((getPos _wounded select 1) - (getPos _medic select 1))) + 360) % 360;
					if ((getDir _medic) != _vector) then {_medic setDir _vector};
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

			} else {
				_wounded action ["heal", _medic];
				sleep 3;
			};
			if (alive _wounded AND alive _medic) then {_wounded setDammage 0};
			_wounded setVariable ["DMZ_AM_Being_healed", false, true];

			// if first aid modules is used.
			if ((_wounded getVariable ["BIS_IS_inAgony", false]) AND alive _medic AND alive _wounded) then {
				{_wounded setVariable [_x,0,true]} foreach ["head_hit","body","hands","legs","bloodlossPerSecond","bloodloss"];
				_wounded setVariable ["BIS_IS_inAgony",false];
			};

			waitUntil {!alive _medic OR !alive _wounded OR (getDammage _wounded) == 0};
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
