// OnRespawnLoadout.sqf //
_target = _this select 0;
_caller = _this select 1;
_actionID = _this select 2;
_arguments = _this select 3;

if (isNil {_caller getVariable "Loadout"}) then
	{	
		_wep = weapons _caller;
		_mag = magazines _caller;
		_backpack = typeOf unitBackpack _caller;
		_backpackmags = getMagazineCargo unitBackpack _caller;
		_backpackweap = getWeaponCargo unitBackpack _caller;
		_caller setVariable ["Loadout", [_wep,_mag,_backpack,_backpackmags,_backpackweap], true];

		hintSilent "Saved Loadout";
		uisleep 6;
		hintSilent "";

		if (isMultiplayer) then {
			_caller addMPEventHandler ["MPRespawn", {[(_this select 0),(_this select 1)] spawn {
		  		private ["_unit","_dead"];
		  		_unit = _this select 0;
		  		_dead = _this select 1;
				_loadout = _dead getVariable "Loadout";
				_wep = _loadout select 0;
				_mag = _loadout select 1;
				_backpack = _loadout select 2;
				_backpackmags = _loadout select 3;
				_backpackweap = _loadout select 4;
				removeAllWeapons _unit;
				removeAllItems _unit;
				removeBackpack _unit;
				{_unit addMagazine _x} foreach _mag;
				{_unit addWeapon _x} foreach _wep;
				if (primaryWeapon _unit != "") then {
			      	_unit selectWeapon (primaryWeapon _unit);
			        _muzzles = getArray(configFile>>"cfgWeapons" >> primaryWeapon _unit >> "muzzles");
				    _unit selectWeapon (_muzzles select 0);
				};
				if(_backpack != "") then {
					_unit addBackpack _backpack; clearWeaponCargo (unitBackpack _unit); clearMagazineCargo (unitBackpack _unit);

					for "_i" from 0 to (count (_backpackmags select 0) - 1) do {
						(unitBackpack _unit) addMagazineCargo [(_backpackmags select 0) select _i,(_backpackmags select 1) select _i];
					};
					for "_i" from 0 to (count (_backpackweap select 0) - 1) do {
						(unitBackpack _unit) addWeaponCargo [(_backpackweap select 0) select _i,(_backpackweap select 1) select _i];
					};
				};
				[objNull,_unit] execVM "OnLeaderRespawn.sqf";
			}}];
		} else {
				
			[_caller] execVM "weaponrespawn.sqf";
		};
	} else {
		_wep = weapons _caller;
		_mag = magazines _caller;
		_backpack = typeOf unitBackpack _caller;
		_backpackmags = getMagazineCargo unitBackpack _caller;
		_backpackweap = getWeaponCargo unitBackpack _caller;
		_caller setVariable ["Loadout", [_wep,_mag,_backpack,_backpackmags,_backpackweap], true]; 	

		hintSilent "Saved Loadout";
		uisleep 6;
		hintSilent "";
	};


