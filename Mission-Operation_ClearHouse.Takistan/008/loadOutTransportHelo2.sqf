///////////// loadOutTransportHelo.sqf //////////////
_vehicle = _this select 0;
_vehicleName	= vehicleVarName _vehicle;

hintSilent parseText format["<t size='1' font='Zeppelin33' color='#FFFF00'>%1 changing loadout...</t>", _vehicleName];

	_magt = _vehicle magazinesTurret [-1];
	{_vehicle removemagazine _x}forEach _magt;
	_wept = _vehicle weaponsTurret [-1];
	{_vehicle removeweapon _x}forEach _wept;
	{_vehicle removeMagazineTurret [_x,[-1]];}forEach _magt;

		_magt = _vehicle magazinesTurret [0];
		{_vehicle removemagazine _x}forEach _magt;
		_wept = _vehicle weaponsTurret [0];
		{_vehicle removeweapon _x}forEach _wept;
		
			_vehicle addMagazineTurret ["120Rnd_CMFlare_Chaff_Magazine",[-1]];
			_vehicle addweapon "CMFlareLauncher";
				
				_vehicle addMagazine "1200Rnd_30x113mm_M789_HEDP";
				_vehicle addweapon "M230";
				_vehicle addMagazine "38Rnd_FFAR";
				_vehicle addweapon "FFARLauncher";
				_vehicle addMagazine "8Rnd_Sidewinder_AH64";
				_vehicle addweapon "SidewinderLaucher_AH64";
				
sleep 5;
				
hintSilent parseText format["<t size='1' font='Zeppelin33' color='#FFFF00'>%1 loadout changed!</t>", _vehicleName];

//_nul=[TransportHelo] execVM "008\TransportHeloCrew.sqf";
