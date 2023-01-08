// by Bon_Inf*

_unit = _this select 1;

_weapons = weapons _unit;
_magazines = magazines _unit;
_backpack = unitBackpack _unit;
_backpackmagazines = getMagazineCargo _backpack;
_backpackweapons = getWeaponCargo _backpack;

tfor_savedloadout = [_weapons,_magazines,typeOf _backpack,_backpackmagazines,_backpackweapons];


if(tfor_ACE) then {

	_ace_ruck = [_unit] call ACE_fnc_FindRuck;

	private ["_ruckweapons","_ruckmags"];
	if(_ace_ruck != "") then{
		_ruckweapons = [player] call ACE_fnc_RuckWeaponsList;
		_ruckmags = [player] call ACE_fnc_RuckMagazinesList;
	} else {
		_ruckweapons = [];
		_ruckmags = [];
	};

	_weapononback = _unit getVariable "ACE_weapononback";
	if(isNil "_weapononback") then {_Weapononback = ""};

	tfor_savedloadout = tfor_savedloadout + [_ace_ruck,_ruckweapons,_ruckmags,_weapononback];
};


hint "current loadout saved";