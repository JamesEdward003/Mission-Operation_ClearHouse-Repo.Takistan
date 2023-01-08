// GetInTurrets.sqf //
/*
GetinTurrets v.1.1
by Demonized
-window -noborder
Execute with  _null = [vehicleName,group] execVM "getinturrets.sqf";
*/

if (!isServer) exitWith {};
_veh = _this select 0;
_grp = _this select 1;

_debugMode = true;  // set to false to disable debug messages.
// all possible turrets.
_turretArray = [ [0],[1],[2],[3],[4],[5],[0,1],[0,2],[0,3],[0,4],[0,5],[1,1],[1,2],[1,3],[1,4],[1,5],[2,1],[2,2],[2,3],[2,4],[2,5] ];

_getInTurret = {
if (!isServer) exitWith {};
_veh = _this select 0;
_unit = _this select 1;
_turretArray = _this select 2;
_debugMode = _this select 3;
_newArr = [];
_seat = [];
_selector = 0;
if ((count (crew _veh)) != 3 AND ((typeOf _veh) == "Mi171Sh_CZ_EP1" OR (typeOf _veh) == "Mi171Sh_rockets_CZ_EP1" OR (typeOf _veh) == "UH1Y")) then {
	if ((count (crew _veh)) == 1) then {_seat = [0]};
	if ((count (crew _veh)) == 2) then {_seat = [2]};
	if ((typeOf _veh) == "UH1Y") then {
		if ((count (crew _veh)) == 1) then {_seat = [1]};
		if ((count (crew _veh)) == 2) then {_seat = [2]};
		_unit action ["moveToTurret",_veh,_seat];
	} else {
		_unit setPos [0,0,1000];
		waitUntil {!(_unit in _veh)};
		_unit moveInTurret [_veh, _seat];
	};
	if (_debugMode) then {player sidechat format["bug workaround seat is %1",_seat]};
} else {
	{
		if ((gunner _veh) == _unit) then {
			if (_debugMode) then {player sideChat format["checking turret %1",_x]};
			_unit action ["moveToTurret",_veh,_x];
			while {_selector != ((count _turretArray)-1)} do {
				_newArrVar = _turretArray select _selector;
				if (str(_newArrVar) != str(_x)) then {
					_newArr = _newArr + [_newArrVar];
				};
				_selector = _selector + 1;
			};
		};
	} foreach _turretArray;
};
_freeGunner = _veh emptyPositions "Gunner";
if (_debugMode) then {player sideChat format["gunner positions available is %1",_freeGunner]};
_newArr
};

// move units towards vehicle.
{_x doMove [(getPos _veh select 0)+(random 3), (getPos _veh select 1)+(random 3),0]} foreach units _grp;  // note read bugs/notes in BI forums on this script.

// have units stop and not run away to get in far formation with helis. note this makes units stand like idiots, need some sort of formation or similar.
/*
{
[_x,_veh] spawn {
	if (!isServer) exitWith {};
	_unit = _this select 0;
	_veh = _this select 1;
	waitUntil {unitReady _unit};
	dostop _unit;
	waitUntil {{(_veh emptyPositions _x) == 0} foreach ["Driver","Commander","Gunner","Cargo"] OR !alive _unit OR !canMove _veh OR _unit in _veh};
	_unit doFollow (leader (group _unit));
};
} foreach units _grp;
*/

// count all various free positions.
_freeDriver = _veh emptyPositions "Driver";
_freeCommander = _veh emptyPositions "Commander";
_freeGunner = _veh emptyPositions "Gunner";
_freeCargo = _veh emptyPositions "Cargo";
_commPos = _freeCommander;
sleep 2;
if (_debugMode) then {player sideChat format["commander %1 driver %2 gunner %3 cargo %4",_freeCommander,_freeDriver,_freeGunner,_freeCargo]};

_commAssigned = false;
_drivAssigned = false;
_gunnAssigned = false;

{
_notMounted = true;

if ((_veh emptyPositions "Gunner") != 0 AND (vehicle _x) == _x AND alive _x AND !_gunnAssigned AND _notMounted) then {
	_x assignAsGunner _veh;
	[_x] orderGetIn true;
	waitUntil {_x in _veh OR !alive _x};
	if (alive _x) then {
		_turretArrayMod = [_veh, _x, _turretArray, _debugMode] call _getInTurret;
		_turretArray = [];
		_turretArray = _turretArray + _turretArrayMod;

		_freeGunner = _veh emptyPositions "Gunner";
		if (_freeGunner == 0) then {
			if (_debugMode) then {player sideChat "gunner assigned"};
			_gunnAssigned = true;
		} else {
			if (_debugMode) then {player sideChat "turret assigned"};
		};
	};
	_notMounted = false;
};
if ( _freeCommander != 0 AND (vehicle _x) == _x AND alive _x AND !_commAssigned AND _notMounted) then {
	_x assignAsCommander _veh;
	[_x] orderGetIn true;
	_freeCommander = _freeCommander - 1;
	if (_debugMode) then {player sideChat "commander assigned"};
	_notMounted = false;
	_commAssigned = true;
};
if (_freeDriver != 0 AND (vehicle _x) == _x AND alive _x AND !_drivAssigned AND _notMounted) then {
	_x assignAsDriver _veh;
	[_x] orderGetIn true;
	_freeDriver = _freeDriver - 1;
	if (_debugMode) then {player sideChat "driver assigned"};
	_notMounted = false;
	_drivAssigned = true;
};
if (_freeCargo != 0 AND (vehicle _x) == _x AND alive _x AND _notMounted) then {
	_x assignAsCargo _veh;
	[_x] orderGetIn true;
	_freeCargo = _freeCargo - 1;
	if (_debugMode) then {player sideChat "cargo assigned"};
	_notMounted = false;
};
} foreach units _grp;
// finally make sure leader is in commander seat if its present in vehicle.
if (_commPos != 0 AND (leader _grp) in _veh) then {
waitUntil {(_veh emptyPositions "Commander") == 0};
(leader _grp) action ["moveToCommander", _veh];
//(leader _grp) assignAsCommander _veh;  // note read bugs/notes in BI forums on this script.
if (_debugMode) then {player sideChat "leader was in vehicle and switched place with unit in commander seat"};
};
