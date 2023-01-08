// by Bon_Inf*

if(not local player || isNil "_this") exitWith{};

_unit = _this select 0;
_preset = _this select 1;
_loadoutclass = _preset select 1;
_weapons = _preset select 2;
_magazines = _preset select 3;
_ruckweapons = _preset select 4;
_ruckmags = _preset select 5;
_weapononback = _preset select 6;

_classremaining = Server getVariable format["%1",_loadoutclass];

if(_loadoutclass != "" && _classremaining == 0) exitWith{hint "Team limits already reached for this equipment class"};

closeDialog 0;
_process = "";
for "_i" from 0 to 4 do {
	hintSilent format["Equipping (%1) %2",_loadoutclass,_process];
	sleep 0.5 + random 1;
	_process = _process + ".";
};
hint ""; 

Server setVariable [_loadoutclass,_classremaining - 1,true];

removeAllWeapons _unit;
removeAllItems _unit;
{ _unit removeMagazine _x } forEach magazines _unit;
{
	_currentmag = _x;
	for "_i" from 1 to (_currentmag select 1) do {_unit addMagazine (_currentmag select 0)};
} foreach _magazines;
{_unit addWeapon _x} foreach _weapons;


Rucksacks=["US_Assault_Pack_EP1","US_Patrol_Pack_EP1","US_Backpack_EP1","CZ_Backpack_EP1","CZ_VestPouch_EP1","TK_ALICE_Pack_EP1","TK_Assault_Pack_EP1"];

_hadRuck = (count _weapons) - (count (_weapons - Rucksacks)) < (count _weapons);
if(_hadRuck) then{
	if(count _ruckweapons > 0) then{
		_unit setVariable ["RuckWepContents",_ruckweapons,false];
		//{[_unit, _x select 0, _x select 1] call ace_sys_ruck_fnc_API_PackWeapon} foreach _ruckweapons;
	};
	if(count _ruckmags > 0) then{
		_unit setVariable ["RuckMagContents",_ruckmags,false]
		//{[_unit, _x select 0, _x select 1] call sys_ruck_fnc_API_PackMagazine} foreach _ruckmags;
	};
};

if(not isNil "_weapononback") then{_unit setVariable ["Weapononback",_weapononback,false]};

if(true) exitWith{};