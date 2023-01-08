// by Bon_Inf*

if(not local player || isNil "_this") exitWith{};

_unit = _this select 0;
_preset = _this select 1;
if(typename _preset == "STRING") then{
	WaitUntil{not isNil "presets"};
	_preset = call compile _preset;
};
_loadoutclass = _preset select 1;
_primaryweapon = _preset select 2;
_secondaryweapon = _preset select 3;
_items_sidearm = _preset select 4;
_magazines = _preset select 5;
_ruckmags = _preset select 6;
_ruckweaps = _preset select 7;


_classremaining = missionNamespace getVariable format["%1",_loadoutclass];

if(_loadoutclass != "" && _classremaining == 0) exitWith{hint "Team limits already reached for this equipment class"};

closeDialog 0;
_process = "";
for "_i" from 0 to 4 do {
	hintSilent format["Equipping (%1) %2",_loadoutclass,_process];
	sleep 0.5 + random 1;
	_process = _process + ".";
};
hint ""; 

missionNamespace setVariable [_loadoutclass,_classremaining - 1];




/****************************************************************/

// determine unit's gear capacity:

_weaponslots = getNumber (configFile >> "CfgVehicles" >> typeOf _unit >> "weaponslots") % 131072;

_goggleslots = floor (_weaponslots/4096); // maybe needed for future work
_weaponslots = _weaponslots % 4096;

_magazineslots = floor (_weaponslots/256);
_weaponslots = _weaponslots % 256;

_pistolmagslots = floor (_weaponslots/16);
_weaponslots = _weaponslots % 16;

_launcherslots = floor (_weaponslots/4); // maybe needed for future work
_weaponslots = _weaponslots % 4;




/****************************************************************/

// equip unit

removeAllWeapons _unit;
removeAllItems _unit;
removeBackpack _unit;

_magcapacity = _magazineslots * 256;
_sidearmcapacity = _pistolmagslots * 16;
{
	_currentmag = _x;
	_magtype = getNumber (configFile >> "CfgMagazines" >> _currentmag select 0 >> "type");

	for "_i" from 1 to (_currentmag select 1) do {
		if(_magtype < 256 && _sidearmcapacity >= _magtype) then { // sidearm mag
			_unit addMagazine (_currentmag select 0);
			_sidearmcapacity = _sidearmcapacity - _magtype;
		};
		if(_magtype >= 256 && _magcapacity >= _magtype) then { // normal mag
			_unit addMagazine (_currentmag select 0);
			_magcapacity = _magcapacity - _magtype;
		};
	};
} foreach _magazines;


{
	if(_x != "") then {
		if(not isText (configFile >> "CfgWeapons" >> _x >> "displayName")) then { // is rucksack
			_unit addBackpack _x;
		} else {
			_unit addWeapon _x;
		};
	};
} foreach [_primaryweapon] + [_secondaryweapon] + _items_sidearm;



if(not isNull (unitBackpack _unit)) then{
	clearMagazineCargoGlobal (unitBackpack _unit);
	{(unitBackpack _unit) addMagazineCargoGlobal _x} foreach _ruckmags;
	{(unitBackpack _unit) addWeaponCargoGlobal _x} foreach _ruckweaps;
};


// patch 1.60 totally messes up AI the way it uses binoculars.
if(not isPlayer _unit) then {
	_binoculars = ["Binocular","Binocular_Vector"];
	{_unit removeWeapon _x} foreach _binoculars;
};


_unit selectWeapon (primaryWeapon _unit);
bon_presets_caller = nil;