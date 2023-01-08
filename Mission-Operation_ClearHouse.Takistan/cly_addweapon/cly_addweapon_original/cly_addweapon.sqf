/*
	addWeapon script written by Celery
	Add weapons and ammo the easy way by only having to know weapon classnames.
	
	Init line syntax:
	0=[this,["weaponclass",mags,magtype,secondarymags,secondarymagtype],"itemclass"] execVM "cly_addweapon.sqf"
	
	You can add multiple weapons like this:
	0=[this,["AA12_PMC",3,2],["RPG7V",3,3],["Makarov",4],"Binocular"] execVM "cly_addweapon.sqf"
	This adds an AA-12 with 3 magazines of exploding rounds, an RPG-7 with 3 frag rounds,
	a Makarov PM with 4 magazines and binoculars (use a string for magless items).
	
	The second, optional number after the weapon class determines the type of magazine the weapon
	uses, 0 being the default one. It's useful in changing the type of rocket of a launcher or
	picking a different sized magazine if the weapon is compatible. A classname can be used in
	place of a number if the desired magazine isn't found otherwise.
	
	Add hand grenades, satchels and the like the same way:
	0=[this,["G36C",2],["HandGrenade",3],["SmokeShell",2],["PipeBomb",2]] execVM "cly_addweapon.sqf"
	
	Add secondary muzzle (grenade launcher) ammo:
	0=[this,["M4A1_RCO_GL",4,0,6,1]] execVM "cly_addweapon.sqf"
	The third number is the number of secondary ammunition added. A fourth, optional value can be
	set to define the secondary ammo's type.
*/

//switchMove PVEH
if (isNil "CLY_addweapon") then {
	CLY_addweapon=true;
	"CLY_addweaponpv" addPublicVariableEventHandler {
		_var=_this select 1;
		_unit=_var select 0;
		_anim=_var select 1;
		_unit switchMove _anim;
	};
};

_unit=_this select 0;
if (!local _unit) exitWith {};

_addweaponarray=_this-[_unit];

removeAllWeapons _unit;

//Don't remove countermeasures or items
{if !(_x in ["FlareLauncher","SmokeLauncher","CMFlareLauncher"]+items _unit) then {_unit removeWeapon _x}} forEach weapons _unit;
{if !(_x in getArray (configFile/"CfgWeapons"/"FlareLauncher"/"magazines")+getArray (configFile/"CfgWeapons"/"SmokeLauncher"/"magazines")+getArray (configFile/"CfgWeapons"/"CMFlareLauncher"/"magazines")) then {_unit removeMagazine _x}} forEach magazines _unit;

//Lower case array of Throw and Put magazines
_throwputmags=[];
{_throwputmags=_throwputmags+getArray (configFile/"CfgWeapons"/"Throw"/_x/"magazines")} forEach getArray (configFile/"CfgWeapons"/"Throw"/"muzzles");
{_throwputmags=_throwputmags+getArray (configFile/"CfgWeapons"/"Put"/_x/"magazines")} forEach getArray (configFile/"CfgWeapons"/"Put"/"muzzles");
_i=0;
{_throwputmags set [_i,toLower _x];_i=_i+1} forEach _throwputmags;

//Add weapons and magazines
{
	if (typeName _x=="ARRAY") then {
		_gun=_x select 0;
		_guntype=getNumber (configFile/"CfgWeapons"/_gun/"type");
		_muzzles=getArray (configFile/"CfgWeapons"/_gun/"muzzles");
		_magcount=_x select 1;
		
		if !(toLower _gun in _throwputmags) then {
			//Primary magazines
			_magtype=if (count _x>2) then {_x select 2} else {0};
			_mag="";
			if (typeName _magtype=="STRING") then {_mag=_magtype};
			if (typeName _magtype=="SCALAR") then {_mag=getArray (configFile/"CfgWeapons"/_gun/"magazines") select _magtype};
			for "_x" from 1 to _magcount do {_unit addMagazine _mag};
			
			//Secondary magazines
			if (count _muzzles>1 and count _x>3) then {
				_magtype=if (count _x>4) then {_x select 4} else {0};
				if (typeName _magtype=="STRING") then {_mag=_magtype};
				if (typeName _magtype=="SCALAR") then {_mag=getArray (configFile/"CfgWeapons"/_gun/(_muzzles select 1)/"magazines") select _magtype};
				_magcount=_x select 3;
				for "_x" from 1 to _magcount do {_unit addMagazine _mag};
			};
			
			//Add weapon and select it if the unit doesn't already have one
			_unit addWeapon _gun;
			_muzzle=if !("this" in _muzzles) then {_muzzles select 0} else {_gun};
			_currentweapontype=getNumber (configFile/"CfgWeapons"/(currentWeapon _unit)/"type");
			if (!(_currentweapontype in [1,2,4,5]) and _guntype in [1,2,4,5] and _unit isKindOf "Man") then {
				_unit selectWeapon _muzzle;
				//switchMove to correct stance
				if (vehicle _unit==_unit and alive _unit and isPlayer _unit) then {
					_anim="amovpercmstpsnonwnondnon";
					if (_guntype in [1,5]) then {_anim="amovpercmstpsraswrfldnon"};
					if (_guntype==2) then {_anim="amovpercmstpsraswpstdnon"};
					if (_guntype==4) then {_anim="amovpercmstpsraswlnrdnon"};
					_unit switchMove _anim;
					CLY_addweaponpv=[_unit,_anim];
					publicVariable "CLY_addweaponpv";
				};
			};
			if (_currentweapontype==0 and !(_unit isKindOf "Man")) then {_unit selectWeapon _muzzle};
		} else {
			for "_x" from 1 to _magcount do {_unit addMagazine _gun};
		};
	} else {
		_unit addWeapon _x;
	};
} forEach _addweaponarray;

//Event handler for respawning units
if (isNil {_unit getVariable "CLY_addweapon"}) then {
	_unit addEventHandler [
		"Respawn",
		{
			if (!isNil {_this select 0 getVariable "CLY_addweapon"}) then {
				_addweaponarray=_this select 0 getVariable "CLY_addweapon";
				_addweaponarray set [0,_this select 0];
				_addweaponarray execVM "cly_addweapon\cly_addweapon.sqf";
			};
		}
	];
	_unit setVariable ["CLY_addweapon",_this];
};