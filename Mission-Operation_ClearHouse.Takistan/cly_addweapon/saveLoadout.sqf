//////////////////////////////////////////////////////////////////
private ["_magazines","_weapons","_backpack","_backpackweap","_backpackmags"];
_new = _this select 0;
_old = _this select 1;

if ((isNil {_old getVariable "CLY_addweapon"}) and (!isNil {_old getVariable "savedloadout"})) then
{
	savedloadout = _old getVariable "savedloadout";
	_weapons = savedloadout select 0;
	_magazines = savedloadout select 1;
	_backpack = savedloadout select 2;
	_backpackmags = savedloadout select 3;
	_backpackweap = savedloadout select 4;
	hintSilent format ["%1,%2,%3,%4,%5",_weapons,_magazines,_backpack,_backpackmags,_backpackweap];
} else {
	hintSilent parseText format["<t size='1' font='Zeppelin33' color='#FFFF00'>Cly Loadout Respawned!</t>"];
};

WaitUntil{alive _new};

removeAllWeapons _new;
removeAllItems _new;
     removeBackpack _new;
{_new addMagazine _x} foreach _magazines;
{_new addWeapon _x} foreach _weapons;
if (primaryWeapon _new != "") then {
      	_new selectWeapon (primaryWeapon _new);
        	_muzzles = getArray(configFile>>"cfgWeapons" >> primaryWeapon _new >> "muzzles"); // Fix for weapons with grenade launcher
     _new selectWeapon (_muzzles select 0);
};
if(_backpack != "") then {
	_new addBackpack _backpack; clearWeaponCargo (unitBackpack _new); clearMagazineCargo (unitBackpack _new);

	for "_i" from 0 to (count (_backpackmags select 0) - 1) do {
		(unitBackpack _new) addMagazineCargo [(_backpackmags select 0) select _i,(_backpackmags select 1) select _i];
	};
	for "_i" from 0 to (count (_backpackweap select 0) - 1) do {
		(unitBackpack _new) addWeaponCargo [(_backpackweap select 0) select _i,(_backpackweap select 1) select _i];
	};
};

if (isPlayer _new) then {	
_new action ["WEAPONONBACK", _new];
if (daytime > 18.25 || daytime < 5.50) then {_new action ["nvGoggles", _new]};
};

hintSilent parseText format["<t size='1' font='Zeppelin33' color='#FFFF00'>Loadout Restored!</t>"];

