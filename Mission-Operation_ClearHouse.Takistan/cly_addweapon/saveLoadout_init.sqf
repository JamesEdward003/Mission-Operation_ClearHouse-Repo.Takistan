//////////////////////////////////////////////////////////////////
private ["_magazines","_weapons","_backpack","_backpackweap","_backpackmags"];
_unit = _this select 1;

_unit setVariable ["CLY_addweapon",nil,true];

_weapons = weapons _unit;
_magazines = magazines _unit;
_backpack = unitBackpack _unit;
_backpackmags = getMagazineCargo _backpack;
_backpackweap = getWeaponCargo _backpack;

savedloadout = [_weapons,_magazines,typeOf _backpack,_backpackmags,_backpackweap];

_unit setVariable ["savedloadout",savedloadout,true];

[_unit] execVM "Cly_addWeapon\saveLoadoutEH.sqf";
