RydFAW_Howitzer = ["M119","M119_US_EP1","D30_CDF","D30_Ins","D30_RU","D30_TK_EP1","D30_TK_GUE_EP1","D30_TK_INS_EP1"];
RydFAW_Mortar = ["M252","M252_US_EP1","2b14_82mm","2b14_82mm_CDF","2b14_82mm_GUE","2b14_82mm_INS","2b14_82mm_TK_EP1","2b14_82mm_TK_GUE_EP1","2b14_82mm_TK_INS_EP1"];
RydFAW_Rocket = ["MLRS","MLRS_DES_EP1","GRAD_CDF","GRAD_INS","GRAD_RU","GRAD_TK_EP1"];

RYD_AngTowards = 
	{
	private ["_source0", "_target0", "_rnd0","_dX0","_dY0","_angleAzimuth0"];

	_source0 = _this select 0;
	_target0 = _this select 1;
	_rnd0 = _this select 2;

	_dX0 = (_target0 select 0) - (_source0 select 0);
	_dY0 = (_target0 select 1) - (_source0 select 1);

	_angleAzimuth0 = (_dX0 atan2 _dY0) + (random (2 * _rnd0)) - _rnd0;

	_angleAzimuth0
	};

RYD_PosTowards2D = 
	{
	private ["_source","_distT","_angle","_dXb","_dYb","_px","_py","_pz"];

	_source = _this select 0;
	_angle = _this select 1;
	_distT = _this select 2;

	_dXb = _distT * (sin _angle);
	_dYb = _distT * (cos _angle);

	_px = (_source select 0) + _dXb;
	_py = (_source select 1) + _dYb;

	_pz = getTerrainHeightASL [_px,_py];

	[_px,_py,_pz]
	};

RYD_ArtyPrep = 
	{
	private ["_arty","_ModSideHQ","_so","_gp","_artymod","_magAdded","_vh","_SMOKEM119","_SMOKED30","_ILLUMM252","_ILLUMM119","_ILLUMD30","_ILLUMPODNOS","_amount",
	"_BL","_mdls","_isSync","_magAdded","_SADARMM119","_SADARMD30","_HEM119","_HED30","_HEPODNOS","_HEMLRS","_HEGRAD","_WPM252","_hAmmo","_typeVh","_WPM119",
	"_WPD30","_WPPODNOS","_HEM252","_WPM119","_WPD30","_WPPODNOS","_ready"];	

	_arty = _this select 0;
	_amount = _this select 1;

	_ModSideHQ = createCenter sideLogic;

		{
		_BL = leader _x;	

		_so = synchronizedObjects _BL;
		_mdls = [10,10,0] nearEntities [["BIS_ARTY_Logic"], 10];
		_isSync = false;

			{
			if (_BL in (synchronizedObjects _x)) exitWith {_isSync = true};
			}
		foreach _mdls;

		if ((({(typeOf _x) in ["BIS_ARTY_Logic"]} count _so) == 0) and not (_isSync)) then 
			{
			_gp = creategroup sideLogic;
			_artymod = _gp createUnit ["BIS_ARTY_Logic", [10,10], [], 0, "NONE"];
			_artymod synchronizeObjectsAdd [(leader _x)];

			waitUntil
				{
				_ready = _artymod getVariable "ARTY_ONMISSION";
				not (isNil "_ready")
				}
			};

		_hAmmo = _x getVariable "HEAmmo";

		if (isNil "_hAmmo") then 
			{
			_vh = assignedvehicle (leader _x);
			_typeVh = typeOf _vh;

			_x setVariable ["HEAmmo",_amount];
			if (_typeVh in (RydFAW_Howitzer + RydFAW_Mortar)) then {_x setVariable ["IllumAmmo",_amount]};
			if (_typeVh in (RydFAW_Howitzer + RydFAW_Mortar)) then {_x setVariable ["WPAmmo",_amount]};
			if (_typeVh in RydFAW_Howitzer) then {_x setVariable ["SmokeAmmo",_amount]};
			if (_typeVh in RydFAW_Howitzer) then {_x setVariable ["SADARMAmmo",ceil (_amount/10)]};

			_magAdded = [];

				{
				_vh = vehicle _x;
				if not (_vh in _magAdded) then
					{
					_magAdded set [(count _magAdded),_vh];
					//{_vh removemagazine _x} foreach (magazines _vh);
					_SMOKEM119 = "ARTY_30Rnd_105mmSMOKE_M119";
					_SMOKED30 = "ARTY_30Rnd_122mmSMOKE_D30";

					_SADARMM119 = "ARTY_30Rnd_105mmSADARM_M119";
					_SADARMD30 = "ARTY_30Rnd_122mmSADARM_D30";

					_ILLUMM252 = "ARTY_8Rnd_81mmILLUM_M252";
					_ILLUMM119 = "ARTY_30Rnd_105mmILLUM_M119";
					_ILLUMD30 = "ARTY_30Rnd_122mmILLUM_D30";
					_ILLUMPODNOS = "ARTY_8Rnd_82mmILLUM_2B14";

					_HEM252 = "ARTY_8Rnd_81mmHE_M252";
					_HEM119 = "ARTY_30Rnd_105mmHE_M119";
					_HED30 = "ARTY_30Rnd_122mmHE_D30";
					_HEPODNOS = "ARTY_8Rnd_82mmHE_2B14";
					_HEMLRS = "ARTY_12Rnd_227mmHE_M270";
					_HEGRAD = "ARTY_40Rnd_120mmHE_BM21";

					_WPM252 = "ARTY_8Rnd_81mmWP_M252";
					_WPM119 = "ARTY_30Rnd_105mmWP_M119";
					_WPD30 = "ARTY_30Rnd_122mmWP_D30";
					_WPPODNOS = "ARTY_8Rnd_82mmWP_2B14";

					switch (typeOf _vh) do
						{
						case	"M119" : {for "_i" from 1 to (ceil (_amount/30)) do 
							{
							_vh addMagazine _SMOKEM119;
							_vh addMagazine _ILLUMM119;
							_vh addMagazine _HEM119;
							_vh addMagazine _WPM119;
							_vh addMagazine _SADARMM119;
							}};

						case	"M119_US_EP1" : {for "_i" from 1 to (ceil (_amount/30)) do 
							{
							_vh addMagazine _SMOKEM119;
							_vh addMagazine _ILLUMM119;
							_vh addMagazine _HEM119;
							_vh addMagazine _WPM119;
							_vh addMagazine _SADARMM119;
							}};

						case	"D30_RU" : {for "_i" from 1 to (ceil (_amount/30)) do 
							{
							_vh addMagazine _SMOKED30;
							_vh addMagazine _ILLUMD30;
							_vh addMagazine _HED30;
							_vh addMagazine _WPD30;
							_vh addMagazine _SADARMD30;
							}};

						case	"D30_INS" : {for "_i" from 1 to (ceil (_amount/30)) do 
							{
							_vh addMagazine _SMOKED30;
							_vh addMagazine _ILLUMD30;
							_vh addMagazine _HED30;
							_vh addMagazine _WPD30;
							_vh addMagazine _SADARMD30;
							}};

						case	"D30_CDF" : {for "_i" from 1 to (ceil (_amount/30)) do 
							{
							_vh addMagazine _SMOKED30;
							_vh addMagazine _ILLUMD30;
							_vh addMagazine _HED30;
							_vh addMagazine _WPD30;
							_vh addMagazine _SADARMD30;
							}};

						case	"D30_TK_EP1" : {for "_i" from 1 to (ceil (_amount/30)) do 
							{
							_vh addMagazine _SMOKED30;
							_vh addMagazine _ILLUMD30;
							_vh addMagazine _HED30;
							_vh addMagazine _WPD30;
							_vh addMagazine _SADARMD30;
							}};

						case	"D30_TK_GUE_EP1" : {for "_i" from 1 to (ceil (_amount/30)) do 
							{
							_vh addMagazine _SMOKED30;
							_vh addMagazine _ILLUMD30;
							_vh addMagazine _HED30;
							_vh addMagazine _WPD30;
							_vh addMagazine _SADARMD30;
							}};

						case	"D30_TK_INS_EP1" : {for "_i" from 1 to (ceil (_amount/30)) do 
							{
							_vh addMagazine _SMOKED30;
							_vh addMagazine _ILLUMD30;
							_vh addMagazine _HED30;
							_vh addMagazine _WPD30;
							_vh addMagazine _SADARMD30;
							}};

						case	"MLRS" : {for "_i" from 1 to (ceil (_amount/12)) do 
							{
							_vh addMagazine _HEMLRS;
							}};

						case	"MLRS_DES_EP1" : {for "_i" from 1 to (ceil (_amount/12)) do 
							{
							_vh addMagazine _HEMLRS;
							}};

						case	"GRAD_CDF" : {for "_i" from 1 to (ceil (_amount/40)) do 
							{
							_vh addMagazine _HEGRAD;
							}};

						case	"GRAD_INS" : {for "_i" from 1 to (ceil (_amount/40)) do 
							{
							_vh addMagazine _HEGRAD;
							}};

						case	"GRAD_RU" : {for "_i" from 1 to (ceil (_amount/40)) do 
							{
							_vh addMagazine _HEGRAD;
							}};

						case	"GRAD_TK_EP1" : {for "_i" from 1 to (ceil (_amount/40)) do 
							{
							_vh addMagazine _HEGRAD;
							}};

						case	"M252" : {for "_i" from 1 to (ceil (_amount/8)) do 
							{
							_vh addMagazine _ILLUMM252;
							_vh addMagazine _HEM252;
							_vh addMagazine _WPM252;
							}};

						case	"M252_US_EP1" : {for "_i" from 1 to (ceil (_amount/8)) do 
							{
							_vh addMagazine _ILLUMM252;
							_vh addMagazine _HEM252;
							_vh addMagazine _WPM252;
							}};

						default {for "_i" from 1 to (ceil (_amount/8)) do 
							{
							_vh addMagazine _ILLUMPODNOS;
							_vh addMagazine _HEPODNOS;
							_vh addMagazine _WPPODNOS;
							}};
						}
					}
				}
			foreach (units _x)
			}
		}
	foreach _arty;
	};

RYD_CFF_TGT = 
	{//_tgt = [RydFAW_KnEnemies] call RYD_CFF_TGT;
	private ["_enemies","_targets","_target","_nothing","_potential","_potL","_taken","_candidate","_CL","_vehFactor","_artFactor","_crowdFactor","_veh","_nearImp","_ValMax","_trgValS",
	"_temptation","_vh"];

	_enemies = _this select 0;

	_targets = [];
	_target = objNull;
	_temptation = 0;
	_nothing = 0;

		{
		_potential = _x;
		
		_potL = vehicle (leader _potential);

		if not (isNull _potential) then
			{
			if (alive _potential) then
				{
				_taken = (leader _potential) getVariable [("CFF_Taken" + str (leader _potential)),false];
				if not (_taken) then
					{
					if (((getposATL _potL) select 2) < 20) then
						{ 
						if ((abs(speed _potL)) < 50) then
							{ 
							if ((count (weapons (leader _potential))) > 0) then
								{ 
								if not ((leader _potential) isKindOf "civilian") then 
									{
									if not (captive _potL) then
										{
										if not (_potential in _targets) then
											{
											if ((damage _potL) < 0.9) then 
												{
												_targets set [(count _targets),_potential]
												}
											}
										}
									}
								}
							}
						}
					}
				}
			}
		}
	foreach _enemies;

		{
		_candidate = _x;
		_CL = leader _candidate;

		_temptation = 0;
		_vehFactor = 0;
		_artFactor = 1;
		_crowdFactor = 1;
		_veh = ObjNull;

		if not (isNull (assignedVehicle _CL)) then {_veh = assignedVehicle _CL};
		if not ((vehicle _CL) == _CL) then 
			{
			_veh = vehicle _CL;
			if (typeOf _veh in (RydFAW_Howitzer + RydFAW_Mortar + RydFAW_Rocket)) then {_artFactor = 10} else {_vehFactor = 500 + (rating _veh)};
			};

		_nearImp = (getPosATL _CL) nearEntities [["CAManBase","AllVehicles","Strategic","WarfareBBaseStructure","Fortress"],100];

			{
			if (((side _x) getFriend (side _CL) >= 0.6) and not (_x isKindOf "civilian")) then 
				{
				_vh = vehicle _x;
				_crowdFactor = _crowdFactor + 0.2;
				if not (_x == _vh) then 
					{
					_crowdFactor = _crowdFactor + 0.2;
					if (typeOf _vh in (RydFAW_Howitzer + RydFAW_Mortar + RydFAW_Rocket)) then 
						{
						_crowdFactor = _crowdFactor + 0.2
						}
					}
				};
			}
		foreach _nearImp;

			{
			_temptation = _temptation + (250 + (rating _x));
			}
		foreach (units _candidate);

		_temptation = (((_temptation + _vehFactor)*10)/(5 + (speed _CL))) * _artFactor * _crowdFactor;
		_candidate setVariable ["CFF_Temptation",_temptation]
		}
	foreach _targets;

	_ValMax = 0;

		{
		_trgValS = _x getVariable ["CFF_Temptation",0];
		if ((_ValMax < _trgValS) and (random 100 < 85)) then {_ValMax = _trgValS;_target = _x};
		}
	foreach _targets;

	if (isNull _target) then 
		{
		if not ((count _targets) == 0) then 
			{
			_target = _targets select (floor (random (count _targets)))
			} 
		else 
			{
			_nothing = 1
			}
		};

	_target
	};

RYD_ArtyMission = 
	{//_bArr = [_tgtPos,RydFAW_ArtG,"SADARM",6,leaderHQ] call RYD_ArtyMission;
	private ["_pos","_artyAv","_vh","_hasAmmo","_minRange","_maxRange","_rangeNeeded","_battery","_artyGp","_template","_ammoCount","_pX","_pY","_pZ","_arty","_ammo","_amount","_ammocheck",
	"_possible","_typeVh","_FO","_batLead","_agp","_batReady"];

	_pos = _this select 0;
	_arty = _this select 1;
	_ammo = _this select 2;
	_amount = _this select 3;
	_FO = _this select 4;

	_possible = false;
	_battery = ObjNull;
	_agp = objNull;

	_ammocheck = "SmokeAmmo";
	
	switch (_ammo) do
		{
		case ("ILLUM") : {_ammocheck = "IllumAmmo"};
		case ("HE") : {_ammocheck = "HEAmmo"};
		case ("WP") : {_ammocheck = "WPAmmo"};
		case ("SADARM") : {_ammocheck = "SADARMAmmo"};
		};

	_artyAv = [];

		{
		if not (isNull _x) then
			{
			_vh = assignedvehicle (leader _x);
			_typeVh = typeOf _vh;


			_hasAmmo = _x getVariable [_ammocheck,0];

			if (_hasAmmo >= _amount) then
				{
				_minRange = 2375;
				_maxRange = 5800;

				switch (true) do
					{
					case (_vh isKindOf "StaticMortar") : {_minRange = 100;_maxRange = 3700};
					case (_typeVh in ["MLRS","MLRS_DES_EP1"]) : {_minRange = 4900;_maxRange = 15550};
					case (_typeVh in ["GRAD_CDF","GRAD_INS","GRAD_RU","GRAD_TK_EP1"]) : {_minRange = 3300;_maxRange = 10100};
					};

				_rangeNeeded = _pos distance _vh;

				if ((_rangeNeeded > _minRange) and (_rangeNeeded < _maxRange)) then
					{
					_battery = ObjNull;
					_agp = leader _x;

					if (alive _agp) then
						{
						
							{
							if (_agp in (synchronizedObjects _x)) exitWith {_battery = _x}
							}
						foreach ([10,10] nearEntities [["BIS_ARTY_Logic"],50]);

						if not (isNull _battery) then
							{
							_batReady = _battery getvariable [("CFF_Ready" + (str _battery)),true];

							if ((not (_battery getVariable ["ARTY_ONMISSION",true])) and (_batReady)) then
								{
								_artyAv set [(count _artyAv),_x]
								}
							}
						}
					}
				}
			}
		}
	foreach _arty;

	if not ((count _artyAv) == 0) then
		{
		_artyGp = _artyAv select (floor (random (count _artyAv)));

		_agp = leader _artyGp;

			{
			if (_agp in (synchronizedObjects _x)) exitWith {_battery = _x}
			}
		foreach ([10,10] nearEntities [["BIS_ARTY_Logic"],50]);

		_possible = true;

		if (_ammo in ["ILLUM","SMOKE"]) then
			{
			[_battery,(200 + (random 200))] call BIS_ARTY_F_SetDispersion;

			_template = ["IMMEDIATE",_ammo,0,_amount];

			_pX = _pos select 0;
			_pY = _pos select 1;
			_pZ = _pos select 2;

			_pX = _pX + (random 100) - 50;
			_pY = _pY + (random 100) - 50;
			_pZ = _pZ + (random 20) - 10;

			_pos = [_pX,_pY,_pZ];

			[_battery,_pos,_template,_FO] spawn
				{
				private ["_battery","_pos","_template","_ammo","_amount","_angle","_FO","_i","_pos2","_pos3","_i2","_i3"];

				_battery = _this select 0;
				_pos = _this select 1;
				_template = _this select 2;
				_FO = getPosASL (_this select 3);
				_ammo = _template select 1;
				_amount = _template select 3;

				if (_ammo == "ILLUM") then 
					{
					[_battery,_pos,_template] call BIS_ARTY_F_ExecuteTemplateMission;
					}
				else
					{
					_angle = [_FO,_pos,10] call RYD_AngTowards;
					_pos2 = [_pos,_angle + 110,200 + (random 100) - 50] call RYD_PosTowards2D;
					_pos3 = [_pos,_angle - 110,200 + (random 100) - 50] call RYD_PosTowards2D;
					//_i2 = [_pos2,(random 1000),"markArty","ColorRed","ICON","DOT",_ammo,"",[0.75,0.75]] call RYD_Mark;
					//_i3 = [_pos3,(random 1000),"markArty","ColorRed","ICON","DOT",_ammo,"",[0.75,0.75]] call RYD_Mark;

					_template = ["IMMEDIATE",_ammo,0,ceil (_amount/3)];

					[_battery,_pos,_template] call BIS_ARTY_F_ExecuteTemplateMission;
					waitUntil {sleep 0.1;_battery getVariable "ARTY_COMPLETE"};

					[_battery,_pos2,_template] call BIS_ARTY_F_ExecuteTemplateMission;
					waitUntil {sleep 0.1;_battery getVariable "ARTY_COMPLETE"};

					[_battery,_pos3,_template] call BIS_ARTY_F_ExecuteTemplateMission;
					waitUntil {sleep 0.1;_battery getVariable "ARTY_COMPLETE"};
					} 
				}
			}
		};

	[_possible,_battery,_agp]
	};

RYD_CFF_FFE = 
	{//[_battery,_tgt,_batlead,"SADARM",RydFAW_Friends,RydFAW_Debug] spawn RYD_CFF_FFE
	private ["_battery","_target","_batlead","_Ammo","_friends","_Debug","_batname","_first","_phaseF","_targlead","_againF","_dispF","_accF","_Amount","_Rate","_FMType","_againcheck","_Aunit",
	"_RydAccF","_TTI","_amount1","_amount2","_template","_targetPos","_X0","_Y0","_X1","_Y1","_X2","_Y2","_Xav","_Yav","_transspeed","_transdir","_Xhd","_Yhd","_impactpos","_safebase","_distance",
	"_safe","_safecheck","_gauss1","_gauss09","_gauss04","_gauss2","_distance2","_DdistF","_DdamageF","_DweatherF","_DskillF","_anotherD","_Dreduct","_spawndisp","_dispersion","_disp","_RydAccF",
	"_gauss1b","_gauss2b","_AdistF","_AweatherF","_AdamageF","_AskillF","_Areduct","_spotterF","_anotherA","_acc","_finalimpact","_posX","_posY","_i","_dX","_dY","_angle","_dXb","_dYb","_posX2",
	"_posY2","_AmmoN","_exDst","_exPX","_exPY","_onRoad","_exPos","_nR","_stRS","_dMin","_dAct","_dSum","_checkedRS","_RSArr","_angle","_rPos","_actRS","_ammocheck","_artyGp","_ammoCount","_dstAct",
	"_maxRange","_minRange","_isTaken","_batlead","_alive","_waitFor","_blPos","_blPos2D"];	

	_battery = _this select 0;
	_target = _this select 1;
	_batlead = _this select 2;
	_Ammo = _this select 3;
	_friends = _this select 4;
	_Debug = _this select 5;

	if (RydFAW_SpawnM) then {[_battery, true] call BIS_ARTY_F_SetShellSpawn};

	_batname = str _battery;

	_first = _battery getVariable [("FIRST" + _batname),1];

	_artyGp = group _batlead;

	_ammocheck = "SmokeAmmo";
	
	switch (_Ammo) do
		{
		case ("ILLUM") : {_ammocheck = "IllumAmmo"};
		case ("HE") : {_ammocheck = "HEAmmo"};
		case ("WP") : {_ammocheck = "WPAmmo"};
		case ("SADARM") : {_ammocheck = "SADARMAmmo"};
		};

	_isTaken = (leader _target) getvariable ["CFF_Taken" + str (leader _target),false];
	if ((_isTaken) and (RydFAW_Monogamy)) exitWith {_battery setvariable [("CFF_Ready" + _batname),true]};
	(leader _target) setvariable ["CFF_Taken" + str (leader _target),true];

	_phaseF = [1,2];
	if ((RydFAW_OnePhase) or ((count RydFAW_FO) == 0) and not (RydFAW_2PhWithoutFO)) then {_phaseF = [1]};

	_targlead = vehicle (leader _target);

	_minRange = 2375;
	_maxRange = 5800;

	switch (true) do
		{
		case ((vehicle _batlead) isKindOf "StaticMortar") : {_minRange = 100;_maxRange = 3700};
		case ((typeOf (vehicle _batlead)) in ["MLRS","MLRS_DES_EP1"]) : {_minRange = 4900;_maxRange = 15550};
		case ((typeOf (vehicle _batlead)) in ["GRAD_CDF","GRAD_INS","GRAD_RU","GRAD_TK_EP1"]) : {_minRange = 3300;_maxRange = 10100};
		};

	_waitFor = true;

		{
		if (isNil ("_target")) exitwith {_waitFor = false};
		if (isNull _target) exitwith {_waitFor = false};
		if not (alive _targlead) exitwith {_waitFor = false};

		if (isNull _batlead) exitwith {_waitFor = false};
		if not (alive _batlead) exitwith {_waitFor = false};

		if ((abs (speed _targlead)) > 50) exitWith {_waitFor = false};
		if (((getposATL _targlead) select 2) > 20)  exitWith {_waitFor = false};
		
		_againF = 0.5;

		_againcheck = _battery getVariable [("CFF_Trg" + _batname),objNull];
		if not ((str _againcheck) == (str _target)) then {_againF = 1};

		_Aunit = vehicle _batlead;
		_RydAccF = 1;
		_TTI = 60;

		Switch (typeOf _Aunit) do
			{
			case	"M119" : {_RydAccf = 2;_TTI = 20};
			case	"M119_US_EP1" : {_RydAccf = 2;_TTI = 20};
			case	"D30_RU" : {_RydAccf = 2;_TTI = 20};
			case	"D30_INS" : {_RydAccf = 2;_TTI = 20};
			case	"D30_CDF" : {_RydAccf = 2;_TTI = 20};
			case	"D30_TK_EP1" : {_RydAccf = 2;_TTI = 20};
			case	"D30_TK_GUE_EP1" : {_RydAccf = 2;_TTI = 20};
			case	"D30_TK_INS_EP1" : {_RydAccf = 2;_TTI = 20};
			case	"MLRS" : {_RydAccf = 3;_TTI = 35};
			case	"MLRS_DES_EP1" : {_RydAccf = 3;_TTI = 35};
			case	"GRAD_Base" : {_RydAccf = 4;_TTI = 35};
			case	"GRAD_RU" : {_RydAccf = 4;_TTI = 35};
			case	"GRAD_INS" : {_RydAccf = 4;_TTI = 35};
			case	"GRAD_CDF" : {_RydAccf = 4;_TTI = 35};
			case	"GRAD_TK_EP1" : {_RydAccf = 4;_TTI = 35};
			default {_RydAccf = 1;_TTI = 25};
			};

		_FMType = "IMMEDIATE";
		_Rate = RydFAW_Rate;
		_amount = RydFAW_Amount;
		if (_amount < 0) then 
			{
			_amount = ceil (random ((_artyGp getVariable _ammocheck)/10));
			if (_amount > 12) then {_amount = 12}
			};

		_dispF = RydFAW_Disp;
		_accF = RydFAW_Acc;

		if (_Ammo == "SADARM") then {_amount = ceil (_amount/3)};

		_amount1 = ceil (_amount/6);
		_amount2 = _amount - _amount1;

		if ((count _phaseF) == 2) then
			{
			if (_x == 1) then
				{
				_amount = _amount1
				}
			else
				{
				_amount = _amount2
				}
			};

		if (_amount == 0) exitwith {_waitFor = false};
		_template = [_FMType,_Ammo,_Rate,_Amount];
		_targetPos = getPosASL _targlead;

		_X0 = (_targetpos select 0);
		_Y0 = (_targetpos select 1);
		sleep 10;

		if (isNull _targlead) exitWith {_waitFor = false};
		if not (alive _targlead) exitWith {_waitFor = false};

		_targetPos = getPosASL _targlead;
		_X1 = (_targetpos select 0);
		_Y1 = (_targetpos select 1);
		sleep 10;

		if (isNull _targlead) exitWith {_waitFor = false};
		if not (alive _targlead) exitWith {_waitFor = false};

		if (isNull _batlead) exitwith {_waitFor = false};
		if not (alive _batlead) exitwith {_waitFor = false};

		_targetPos = getPosASL _targlead;
		_X2 = (_targetpos select 0);
		_Y2 = (_targetpos select 1);

		_onRoad = isOnRoad _targlead;

		_Xav = (_X1+_X2)/2;
		_Yav = (_Y1+_Y2)/2;

		_transspeed = ([_X0,_Y0] distance [_Xav,_Yav])/15;
		_transdir = (_Xav - _X0) atan2 (_Yav - _Y0);

		_Xhd = _transspeed * sin _transdir * 2.7 * _TTI;
		_Yhd = _transspeed * cos _transdir * 2.7 * _TTI;
		_impactpos = _targetpos;
		_safebase = 100;

		_exPX = (_targetPos select 0) + _Xhd;
		_exPY = (_targetPos select 1) + _Yhd;

		_exPos = [_exPX,_exPY,getTerrainHeightASL [_exPX,_exPY]];

		_exDst = _targetPos distance _exPos;

		_safebase = RydFAW_Safe;

		_safe = _safebase * _RydAccf * (1 + overcast);

		_safecheck = true;

		if not (_onRoad) then
			{
				{
				if (([(_impactpos select 0) + _Xhd, (_impactpos select 1) + _Yhd] distance (vehicle (leader _x))) < _safe) exitwith 
						{
						_Xhd = _Xhd/2;
						_Yhd = _Yhd/2
						}
				}
			foreach _friends;

				{
				if ([(_impactpos select 0) + _Xhd, (_impactpos select 1) + _Yhd] distance (vehicle (leader _x)) < _safe) exitwith {_safecheck = false};
				}
			foreach _friends;

			if not (_safecheck) then 
				{
				_Xhd = _Xhd/2;
				_Yhd = _Yhd/2;
				_safecheck = true;
					{
					if ([(_impactpos select 0) + _Xhd, (_impactpos select 1) + _Yhd] distance (vehicle (leader _x)) < _safe) exitwith {_safecheck = false};
					}
				foreach _friends;
				if not (_safecheck) then 
					{
					_Xhd = _Xhd/5;
					_Yhd = _Yhd/5;
					_safecheck = true;
						{
						if ([(_impactpos select 0) + _Xhd, (_impactpos select 1) + _Yhd] distance (vehicle (leader _x)) < _safe) exitwith {_safecheck = false};
						}
					foreach _friends
					}
				};

			_impactpos = [(_targetpos select 0) + _Xhd, (_targetpos select 1) + _Yhd];
			}
		else
			{
			_nR = _targlead nearRoads 30;

			_stRS = _nR select 0;
			_dMin = _stRS distance _exPos;

				{
				_dAct = _x distance _exPos;
				if (_dAct < _dMin) then {_dMin = _dAct;_stRS = _x}
				}
			foreach _nR;

			_dSum = _targlead distance _stRS;
			_checkedRS = [_stRS];
			_actRS = _stRS;

			while {_dSum < _exDst} do
				{
				_RSArr = (roadsConnectedTo _actRS) - _checkedRS;
				if ((count _RSArr) == 0) exitWith {};
				_stRS = _RSArr select 0;
				_dMin = _stRS distance _exPos;

					{
					_dAct = _x distance _exPos;
					if (_dAct < _dMin) then {_dMin = _dAct;_stRS = _x}
					}
				foreach _RSArr;

				_dSum = _dSum + (_stRS distance _actRS);

				_actRS = _stRS;

				_checkedRS set [(count _checkedRS),_stRS];
				};

			if (_dSum < _exDst) then
				{
				//if (_transdir < 0) then {_transdir = _transdir + 360};
				_angle = [_targetPos,(getPosASL _stRS),1] call RYD_AngTowards;
				_impactPos = [(getPosASL _stRS),_angle,(_exDst - _dSum)] call RYD_PosTowards2D
				}
			else
				{
				_rPos = getPosASL _stRS;
				_impactPos = [_rPos select 0,_rPos select 1]
				};
			
				{
				if ((_impactpos distance (vehicle (leader _x))) < _safe) exitwith 
					{
					_safeCheck = false;
					_impactpos = [((_impactpos select 0) + (_targetPos select 0))/2,((_impactpos select 1) + (_targetPos select 1))/2]
					}
				}
			foreach _friends;
			
			if not (_safeCheck) then
				{
				_safeCheck = true;

					{
					if ((_impactpos distance (vehicle (leader _x))) < _safe) exitwith 
						{
						_safeCheck = false
						}
					}
				foreach _friends
				}
			};

		if not (_safecheck) exitwith {(leader _target) setvariable ["CFF_Taken" + str (leader _target),false]};
		if (not (_battery getvariable [("CFF_Ready" + _batname),true]) and (_x == 1)) exitWith {(leader _target) setvariable ["CFF_Taken" + str (leader _target),false]};
		_battery setvariable [("CFF_Ready" + _batname),false];

		_gauss1 = (random 0.1) + (random 0.1) + (random 0.1) + (random 0.1) + (random 0.1) + (random 0.1) + (random 0.1) + (random 0.1) +  (random 0.1) + (random 0.1);
		_gauss09 = (random 0.09) + (random 0.09) + (random 0.09) + (random 0.09) + (random 0.09) + (random 0.09) + (random 0.09) + (random 0.09) +  (random 0.09) + (random 0.09);
		_gauss04 = (random 0.04) + (random 0.04) + (random 0.04) + (random 0.04) + (random 0.04) + (random 0.04) + (random 0.04) + (random 0.04) +  (random 0.04) + (random 0.04);
		_gauss2 = (random 0.2) + (random 0.2) + (random 0.2) + (random 0.2) + (random 0.2) + (random 0.2) + (random 0.2) + (random 0.2) +  (random 0.2) + (random 0.2);
		_distance2 = _impactPos distance (getPosATL (vehicle _batlead));
		_DdistF = (_distance2/10) * (0.1 + _gauss04);
		_DdamageF = 1 + 0.5 * (damage _batlead);
		_DweatherF = 1 + overcast;
		_DskillF = 2 * (skill _batlead);
		_anotherD = 1 + _gauss1;
		_Dreduct = (1 + _gauss2) + _DskillF;
		 
		_spawndisp = _dispF * ((_RydAccf * _DdistF * _DdamageF) + (50 * _DweatherF * _anotherD)) / _Dreduct;
		_dispersion = 10000 * (_spawndisp atan2 _distance2) / 57.3;

		_disp = _dispersion;
		if (RydFAW_SpawnM) then {_disp = _spawndisp};

		_RydAccF = 1;
		[_battery,_disp] call BIS_ARTY_F_SetDispersion;

		_gauss1b = (random 0.1) + (random 0.1) + (random 0.1) + (random 0.1) + (random 0.1) + (random 0.1) + (random 0.1) + (random 0.1) +  (random 0.1) + (random 0.1);
		_gauss2b = (random 0.2) + (random 0.2) + (random 0.2) + (random 0.2) + (random 0.2) + (random 0.2) + (random 0.2) + (random 0.2) +  (random 0.2) + (random 0.2);
		_AdistF = (_distance2/10) * (0.1 + _gauss09);
		_AweatherF = _DweatherF;
		_AdamageF = 1 + 0.1 * (damage (vehicle _batlead));
		_AskillF = 5 * (_batlead skill "aimingAccuracy");
		_Areduct = (1 + _gauss2b) + _AskillF;
		_spotterF = 0.2 + (random 0.2);
		_spotterF = _spotterF * RydFAW_FOAccGain;
		if (((count _phaseF) == 2) and (_x == 1) or ((count _phaseF) == 1)) then {_spotterF = 1};
		_anotherA = 1 + _gauss1b;

		_acc = _spotterF * _againF * _accF * ((_AdistF * _AdamageF) + (50 * _AweatherF * _anotherA)) / _Areduct;

		_finalimpact = [(_impactpos select 0) + (random (2 * _acc)) - _acc,(_impactpos select 1) + (random (2 * _acc)) - _acc];

		if (isNull _targlead) exitWith {_waitFor = false};
		if not (alive _targlead) exitWith {_waitFor = false};

		if ((abs (speed _targlead)) > 50) exitWith {_waitFor = false};
		if (((getposATL _targlead) select 2) > 20)  exitWith {_waitFor = false};

		_dstAct = _impactpos distance _batlead;

		if ((_dstAct > _maxRange) or (_dstAct < _minRange)) exitWith {_waitFor = false};

		[_battery, _finalimpact, _template] call BIS_ARTY_F_ExecuteTemplateMission;

		_ammoCount = _artyGp getVariable _ammocheck;

		_artyGp setVariable [_ammocheck,_ammoCount - _Amount];

		sleep 0.2;
		_posX = 0;
		_posY = 0;
		if (_Debug) then 
			{
			_blPos = getposATL (vehicle _batlead);
			_blPos2D = [_blPos select 0,_blPos select 1];
			_distance = _impactpos distance _finalimpact;
			_distance2 = _impactpos distance _blPos2D;
			_i = "mark0" + str (_battery);
			_i = createMarker [_i,_impactPos];
			_i setMarkerColor "ColorBlue";
			_i setMarkerShape "ELLIPSE";
			_i setMarkerSize [_distance, _distance];
			_i setMarkerBrush "Border";

			_dX = (_impactPos select 0) - (_blPos2D select 0);
			_dY = (_impactPos select 1) - (_blPos2D select 1);
			_angle = _dX atan2 _dY;
			if (_angle >= 180) then {_angle = _angle - 180};
			_dXb = (_distance2/2) * (sin _angle);
			_dYb = (_distance2/2) * (cos _angle);
			_posX = (_blPos2D select 0) + _dXb;
			_posY = (_blPos2D select 1) + _dYb;

			_i = "mark1" + str (_battery);
			_i = createMarker [_i,[_posX,_posY]];
			_i setMarkerColor "ColorBlack";
			_i setMarkerShape "RECTANGLE";
			_i setMarkerSize [0.5,_distance2/2];
			_i setMarkerBrush "Solid";
			_i setMarkerdir _angle;

			_dX = (_finalimpact select 0) - (_impactPos select 0);
			_dY = (_finalimpact select 1) - (_impactPos select 1);
			_angle = _dX atan2 _dY;
			if (_angle >= 180) then {_angle = _angle - 180};
			_dXb = (_distance/2) * (sin _angle);
			_dYb = (_distance/2) * (cos _angle);
			_posX2 = (_impactPos select 0) + _dXb;
			_posY2 = (_impactPos select 1) + _dYb;

			_i = "mark2" + str (_battery);
			_i = createMarker [_i,[_posX2,_posY2]];
			_i setMarkerColor "ColorBlack";
			_i setMarkerShape "RECTANGLE";
			_i setMarkerSize [0.5,_distance/2];
			_i setMarkerBrush "Solid";
			_i setMarkerdir _angle;

			_i = "mark3" + str (_battery);
			_i = createMarker [_i,_impactPos];
			_i setMarkerColor "ColorBlack";
			_i setMarkerShape "ICON";
			_i setMarkerType "DOT";

			_i = "mark4" + str (_battery);
			_i = createMarker [_i,_finalimpact];
			_i setMarkerColor "ColorRed";
			_i setMarkerShape "ICON";
			_i setMarkerType "DOT";
			_i setMarkerText (str (round (_distance)) + "m" + "/" + str (round (_spawndisp)) + "m" + " - " + _Ammo);

			[_i,_battery,_distance,_spawndisp,_Ammo,_batlead,_target] spawn
				{
				private ["_mark","_battery","_distance","_spawndisp","_Ammo","_target","_alive","_stoper","_TOF","_batlead"];

				_mark = _this select 0;
				_battery = _this select 1;
				_distance = _this select 2;
				_spawndisp = _this select 3;
				_Ammo = _this select 4;
				_batlead = _this select 5;
				_target = _this select 6;

				_alive = true;

				waitUntil 
					{
					if (isNull _batlead) then {_alive = false};
					if not (alive _batlead) then {_alive = false};
					((_battery getVariable "ARTY_SHOTCALLED") or not (_alive))
					};

				_stoper = time;
				_TOF = 0;

				while {(not (_battery getVariable "ARTY_SPLASH") and not (_TOF > 100))} do
					{
					if (isNull _batlead) exitWith {(leader _target) setvariable ["CFF_Taken" + str (leader _target),false]};
					if not (alive _batlead) exitWith {(leader _target) setvariable ["CFF_Taken" + str (leader _target),false]};
					_TOF = (round (10 * (time - _stoper)))/10;
					_mark setMarkerText (str (round (_distance)) + "m" + "/" + str (round (_spawndisp)) + "m" + " - " + _Ammo + " - TOF: " + (str _TOF));
					sleep 0.1
					};

				if (isNull _batlead) exitWith {deleteMarker _mark};
				if not (alive _batlead) exitWith {deleteMarker _mark};

				_mark setMarkerText (str (round (_distance)) + "m" + "/" + str (round (_spawndisp)) + "m" + " - " + _Ammo + " - SPLASH!");
				};

			_i = "mark5" + str (_battery);
			_i = createMarker [_i,_finalimpact];
			_i setMarkerColor "ColorRed";
			_i setMarkerShape "ELLIPSE";
			_i setMarkerSize [_spawndisp,_spawndisp];

			_i = str _battery;
			if (_first == 1) then 
				{
				_i = createMarker [_i,getpos (vehicle _batlead)];
				_i setMarkerColor "ColorBlack";
				_i setMarkerShape "ICON";
				_i setMarkerType "n_empty";
				_i setMarkerText (_i + " - " + str (typeof (vehicle _batlead)))
				}
			else
				{
				(str _battery) setMarkerPos getpos (vehicle _batlead)
				}

			};

		_alive = true;

		waituntil 
			{
			sleep 1;
			
				{
					{
					_AmmoN = _x ammo (primaryWeapon (vehicle _x)); 
					if (_AmmoN == 0) then 
						{
						sleep 0.1;
						reload (vehicle _x)
						}
					}
				foreach units (group _x)
				}
			foreach (synchronizedObjects _battery);

			if (isNull _batlead) then {_alive = false};
			if not (alive _batlead) then {_alive = false};
			
			(([_battery, _template] call BIS_ARTY_F_Available) or not (_alive))
			};

		if not (_alive) exitWith {};

		if (((count _phaseF) == 2) and (_x == 1)) then 
			{
			_alive = true;			

			waitUntil 
				{
				sleep 1;

				if (isNull _batlead) then {_alive = false};
				if not (alive _batlead) then {_alive = false};

				((_battery getVariable "ARTY_SPLASH") or not (_alive))
				};

			sleep 10;

				{
				deleteMarker ("mark" + str (_x) + str (_battery));
				}
			foreach [0,1,2,3,4,5];

			if not (_alive) exitWith {};
			};

		}
	foreach _phaseF;

	_battery setVariable [("CFF_Trg" + _batname),_target];

	_alive = true;

	if (_waitFor) then
		{
		waitUntil 
			{
			sleep 1;

			if (isNull _batlead) then {_alive = false};
			if not (alive _batlead) then {_alive = false};

			((_battery getVariable "ARTY_SPLASH") or not (_alive))
			};

		sleep 10;

		};

			{
			deleteMarker ("mark" + str (_x) + str (_battery));
			}
		foreach [0,1,2,3,4,5];

	if not (_alive) exitWith {(leader _target) setvariable ["CFF_Taken" + str (leader _target),false]};

	(leader _target) setvariable ["CFF_Taken" + str (leader _target),false];

	_battery setvariable [("CFF_Ready" + _batname),true];
	};

RYD_CFF = 
	{//[RydFAW_ArtG,RydFAW_KnEnemies,(RydFAW_EnHArmor + RydFAW_EnMArmor + RydFAW_EnLArmor),RydFAW_Friends,RydFAW_Debug] call RYD_CFF;
	private ["_artG","_knEnemies","_enArmor","_friends","_Debug","_CFFMissions","_tgt","_ammo","_bArr","_possible","_amount"];

	_artG = _this select 0;
	_knEnemies = _this select 1;
	_enArmor = _this select 2;
	_friends = _this select 3;
	_Debug = _this select 4;
	_amount = _this select 5;

	_CFFMissions = ceil (random (count _artG));

	for "_i" from 1 to _CFFMissions do
		{
		_tgt = [_knEnemies] call RYD_CFF_TGT;
		if not (isNull _tgt) then
			{
			_ammo = "HE";
			if ((random 100) > 75) then {_ammo = "WP"};
			if (_tgt in _enArmor) then {_ammo = "SADARM"};	

			_bArr = [(getPosATL _tgt),_artG,_ammo,_amount,objNull] call RYD_ArtyMission;
			_possible = _bArr select 0;
			if (_possible) then
				{
				[_bArr select 1,_tgt,_bArr select 2,_ammo,_friends,_Debug] spawn RYD_CFF_FFE
				}
			else
				{
				switch (true) do
					{
					case (_ammo in ["SADARM","WP"]) : {_ammo = "HE"};
					case (_ammo in ["HE"]) : {_ammo = "WP"};
					};

				_bArr = [(getPosATL _tgt),_artG,_ammo,_amount,objNull] call RYD_ArtyMission;

				_possible = _bArr select 0;
				if (_possible) then
					{
					[_bArr select 1,_tgt,_bArr select 2,_ammo,_friends,_Debug] spawn RYD_CFF_FFE
					}
				}
			};

		sleep (5 + (random 5))
		}
	};