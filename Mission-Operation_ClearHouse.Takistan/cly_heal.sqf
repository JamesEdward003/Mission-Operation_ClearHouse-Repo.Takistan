// cly_heal.sqf //
/*
CLY Heal - a self-bandaging script written by Celery.

-How to use-
Execute in init script:
	[player,0.2,0.15,3,true] execVM "cly_heal.sqf";
The first number is the damage threshold after which you are given the option to heal.
The second one is the player's damage after healing.
The third one is the number of bandages. -1 is unlimited.
The boolean at the end is optional, setting it to true will make the bandaging action
pop up when the player is injured. It's false by default.

How to add bandages to a unit:
	unit setVariable ["CLY_healings",this getVariable "CLY_healings"+1,true]
Make an AI unit drop bandages when it dies:
	0=[this,0,0,1,true] execVM "cly_heal.sqf";
*/

_target=_this select 0;
_caller=_this select 1;
_id=_this select 3;

//Add PVEHs
if (isNil "CLY_healfirstrun") then {
CLY_healfirstrun=true;
"CLY_healinterruptpv" addPublicVariableEventHandler {
	_var=_this select 1;
	_var select 0 switchMove (_var select 1);
	_var select 0 playMoveNow (_var select 1);
};
"CLY_healbandagepv" addPublicVariableEventHandler {
	_var=_this select 1;
	_unit=_var select 0;
	if (count _var>1) then {
		_unit addAction (_var select 1);
	} else {
		for "_x" from 0 to 99 do {_unit removeAction _x};
	};
};
"CLY_healannouncepv" addPublicVariableEventHandler {
	_var=_this select 1;
	_unit=_var select 0;
	_text=_var select 1;
	if (player==_unit) then {
		titleText _text;
	};
};
};

//Give bandage
if (_id in ["give"]) then {
_caller setVariable ["CLY_healings",(_caller getVariable "CLY_healings")-1,true];
_target setVariable ["CLY_healings",(_target getVariable "CLY_healings")+1,true];
titleText [format ["Bandage given to %1",name _target],"PLAIN DOWN",0.3];
_text=[format ["Received bandage from %1",name _caller],"PLAIN DOWN",0.3];
CLY_healannouncepv=[_target,_text];
publicVariable "CLY_healannouncepv";
};

//Interrupt healing
if (_id in ["interrupt"]) then {
_caller setVariable ["CLY_healinterrupt",true];
};

//Take bandage
if (typeName _id=="ARRAY") then {
if (_id select 0=="take") then {
	_taken=_id select 1;
	_caller setVariable ["CLY_healings",(_caller getVariable "CLY_healings")+_taken,true];
	_s=if (_taken>1) then {"s"} else {""};
	titleText [format ["%1 bandage%2 taken",_taken,_s],"PLAIN DOWN",0.3];
	for "_x" from 0 to 99 do {_target removeAction _x};
	CLY_healbandagepv=[_target];
	publicVariable "CLY_healbandagepv";
};
};

//Heal self or other
if (_id in ["heal","healother"]) then {
_weapontype=getNumber (configFile/"CfgWeapons"/(currentWeapon _caller)/"type");
_weapontypes=[];
{_weapontypes set [count _weapontypes,getNumber (configFile/"CfgWeapons"/_x/"type")]} forEach weapons _caller;

_anim="ainvpknlmstpsnonwnondnon_medic_2";
if (_weapontype in [1,5] or (_weapontype==0 and {_x in [1,5]} count _weapontypes>0)) then {_anim="ainvpknlmstpslaywrfldnon_medic"};
if (_weapontype==2 or (_weapontype==0 and 2 in _weapontypes)) then {_anim="ainvpknlmstpsnonwnondnon_medic_1"};

if (_id=="healother") then {
	_text=[format ["%1 is bandaging you",name _caller],"PLAIN DOWN",0.3];
	CLY_healannouncepv=[_target,_text];
	publicVariable "CLY_healannouncepv";
};

_caller playMove _anim;
_caller setVariable ["CLY_healcooldown",time+5];
_caller setVariable ["CLY_healinterrupt",false];

waitUntil {animationState _caller in ["ainvpknlmstpslaywrfldnon_medic","ainvpknlmstpsnonwnondnon_medic_1","ainvpknlmstpsnonwnondnon_medic_2"]};
waitUntil {_caller getVariable "CLY_healinterrupt" or !alive _target or _caller distance _target>3 or !(animationState _caller in ["ainvpknlmstpslaywrfldnon_medic","ainvpknlmstpsnonwnondnon_medic_1","ainvpknlmstpsnonwnondnon_medic_2"])};
if (alive _caller) then {
	//Heal
	if (alive _target and !(_caller getVariable "CLY_healinterrupt")) then {
		_healee=if (_id=="healother") then {_target} else {_caller};
		if (damage _healee>_caller getVariable "CLY_healthreshold") then {
			_healee setDamage (_caller getVariable "CLY_healdamage");
			_caller setVariable ["CLY_healings",(_caller getVariable "CLY_healings")-1,true];
		};
		//Heal legs
		if (!canStand _healee) then {
			_healee setHit ["legs",_caller getVariable "CLY_healdamage"];
			_caller setVariable ["CLY_healings",(_caller getVariable "CLY_healings")-1,true];
		};
	//Interrupt healing
	} else {
		_caller setVariable ["CLY_healinterrupt",false];
		_anim="ainvpknlmstpslaywrfldnon_amovpknlmstpsnonwnondnon";
		if (_weapontype in [1,5]) then {_anim="ainvpknlmstpslaywrfldnon_amovpknlmstpsraswrfldnon"};
		if (_weapontype==2) then {_anim="ainvpknlmstpsnonwnondnon_amovpknlmstpsraswpstdnon"};
		if (_weapontype==4) then {_anim="amovpknlmstpsnonwnondnon_amovpknlmstpsraswlnrdnon"};
		CLY_healinterruptpv=[_caller,_anim];
		publicVariable "CLY_healinterruptpv";
		_caller switchMove _anim;
		_caller playMoveNow _anim;
	};
};
};

//Main loop
while {typeName _id=="SCALAR"} do {
if (!local _target) exitWith {};
_healthreshold=_this select 1;
_healdamage=_this select 2;
_healings=floor (_this select 3);
_popup=if (count _this>4) then {_this select 4} else {false};
CLY_healanims=["amovpknlmstpsraswrfldnon_ainvpknlmstpslaywrfldnon","ainvpknlmstpslaywrfldnon_medic","ainvpknlmstpslaywrfldnon_amovpknlmstpsraswrfldnon","amovpknlmstpsraswpstdnon_ainvpknlmstpsnonwnondnon","amovpknlmstpsraswpstdnon_ainvpknlmstpsnonwnondnon_end","ainvpknlmstpsnonwnondnon_medic_1","ainvpknlmstpsnonwnondnon_amovpknlmstpsraswpstdnon","amovpknlmstpsraswlnrdnon_ainvpknlmstpsnonwnondnon","ainvpknlmstpsnonwnondnon_medic_2","amovpknlmstpsnonwnondnon_amovpknlmstpsraswlnrdnon"];

//Add take bandage action to AI, then exit
if (_target!=player) exitWith {
	_target setVariable ["CLY_healings",_healings,true];
	[_target] spawn {
		_unit=_this select 0;
		waitUntil {!alive _unit};
		if (!isPlayer _unit and _unit getVariable "CLY_healings">0) then {
			_actionname=if (_unit getVariable "CLY_healings">1) then {
				"Take bandages";
			} else {
				"Take bandage";
			};
			_action=[
				_actionname,
				"cly_heal.sqf",
				["take",_unit getVariable "CLY_healings"],
				1.4,
				true,
				true,
				"",
				"_this!=_target and !alive _target and _this distance _target<4 and _this getVariable 'CLY_healings'>=0"
			];
			_unit addAction _action;
			CLY_healbandagepv=[_unit,_action];
			publicVariable "CLY_healbandagepv";
		};
	};
};

waitUntil {alive player};
_unit=player;

if (isNil {_unit getVariable "CLY_healings"}) then {_unit setVariable ["CLY_healings",_healings,true]};
if (isNil {_unit getVariable "CLY_healthreshold"}) then {_unit setVariable ["CLY_healthreshold",_healthreshold]};
if (isNil {_unit getVariable "CLY_healdamage"}) then {_unit setVariable ["CLY_healdamage",_healdamage]};
if (isNil {_unit getVariable "CLY_healcooldown"}) then {_unit setVariable ["CLY_healcooldown",time-5]};
if (isNil {_unit getVariable "CLY_healinterrupt"}) then {_unit setVariable ["CLY_healinterrupt",false]};

_healaction=100;
_interruptaction=100;
_healotheraction=100;
_giveaction=100;
_nearestaliveactive=objNull;
_reset=true;
_leftstring="";

while {alive _unit and _unit==player} do {
	//Reset actions
	if (_reset or _unit getVariable "CLY_healings"!=_healings) then {
		_unit removeAction _healaction;
		_unit removeAction _interruptaction;

		_nearestaliveactive removeAction _healotheraction;
		_nearestaliveactive removeAction _giveaction;
		_nearestaliveactive=objNull;

		_healings=_unit getVariable "CLY_healings";
		_leftstring="";
		if (_healings>0) then {_leftstring=format [" (%1 left)",_unit getVariable "CLY_healings"]};

		_healaction=_unit addAction [
			format ["Bandage wounds%1",_leftstring],
			"cly_heal.sqf",
			"heal",	//Argument
			1.37,		//Priority
			_popup,	//Action pops up?
			true,		//Hide on use
			"",		//Shortcut
			"_this==_target and (damage _this>_this getVariable 'CLY_healthreshold' or !canStand _this) and !(animationState _this in CLY_healanims) and time>_this getVariable 'CLY_healcooldown' and _this getVariable 'CLY_healings'!=0"
		];
		_interruptaction=_unit addAction [
			"Cancel bandaging",
			"cly_heal.sqf",
			"interrupt",
			1.4,
			true,
			true,
			"",
			"_this==_target and animationState _target in ['ainvpknlmstpslaywrfldnon_medic','ainvpknlmstpsnonwnondnon_medic_1','ainvpknlmstpsnonwnondnon_medic_2']"
		];
		_reset=false;
	};

	_nearestalive=objNull;
	_nearestalivedist=5;

	//Determine nearest alive and dead units
	{
		if (_x!=_unit and _unit distance _x<_nearestalivedist and alive _x and _unit countEnemy [_x]==0) then {
			_nearestalive=_x;
			_nearestalivedist=_x distance _unit;
		};
	} forEach allUnits;
	if (_nearestalive!=_nearestaliveactive) then {
		_nearestaliveactive removeAction _healotheraction;
		_nearestaliveactive removeAction _giveaction;
		if (isNull _nearestalive) then {_nearestaliveactive=objNull};
	};

	//Add bandaging and give bandage action
	if (!isNull _nearestalive and _nearestalive!=_nearestaliveactive) then {
		_nearestaliveactive=_nearestalive;
		_healotheraction=_nearestaliveactive addAction [
			format ["Bandage %1%2",name _nearestaliveactive,_leftstring],
			"cly_heal.sqf",
			"healother",
			1.38,
			true,
			true,
			"",
			"_this!=_target and (damage _target>_this getVariable 'CLY_healthreshold' or !canStand _target) and !(animationState _this in CLY_healanims) and time>_this getVariable 'CLY_healcooldown' and _this getVariable 'CLY_healings'!=0 and _this distance _target<3"
		];
		_giveaction=_nearestaliveactive addAction [
			format ["Give bandage to %1%2",name _nearestaliveactive,_leftstring],
			"cly_heal.sqf",
			"give",
			1.39,
			true,
			true,
			"",
			"_this!=_target and alive _target and !(animationState _this in CLY_healanims) and time>_this getVariable 'CLY_healcooldown' and _target getVariable 'CLY_healings'>=0 and _this getVariable 'CLY_healings'>0 and _this distance _target<3"
		];
	};
	sleep 0.1;
};

//Remove actions at death or unit switch
_unit removeAction _healaction;
_unit removeAction _interruptaction;
_nearestaliveactive removeAction _giveaction;

//Take bandage from corpse action
if (!alive _unit and _unit getVariable "CLY_healings">0) then {
	_actionname=if (_unit getVariable "CLY_healings">1) then {
		"Take bandages";
	} else {
		"Take bandage";
	};
	_action=[
		_actionname,
		"cly_heal.sqf",
		["take",_unit getVariable "CLY_healings"],
		1.4,
		true,
		true,
		"",
		"_this!=_target and !alive _target and _this distance _target<4 and _this getVariable 'CLY_healings'>=0 and !(_this isKindOf 'Animal')"
	];
	_unit addAction _action;
	CLY_healbandagepv=[_unit,_action];
	publicVariable "CLY_healbandagepv";
};

//Reset bandages for respawn
if (!alive _unit) then {_unit setVariable ["CLY_healings",nil,true]};

waitUntil {alive player};
_target=player;
};

