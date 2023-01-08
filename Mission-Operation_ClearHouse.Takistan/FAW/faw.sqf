private ["_allArty","_civF","_sides","_enemies","_friends","_side","_eSides","_fSides","_getF","_artyGroups","_gp","_isCiv","_knEnemies","_eVeh","_enArmor"];

[] call compile preprocessFile "FAW\faw_fnc.sqf";
Shellview = compile preprocessFile "FAW\Shellview.sqf";

sleep 5;

if (isNil "RydFAW_Active") then {RydFAW_Active = true};
if (isNil "RydFAW_Manual") then {RydFAW_Manual = false};
if (isNil "RydFAW_NoControl") then {RydFAW_NoControl = []};
if (isNil "RydFAW_ArtyShells") then {RydFAW_ArtyShells = 120};
if (isNil "RydFAW_Interval") then {RydFAW_Interval = 10};
if (isNil "RydFAW_Debug") then {RydFAW_Debug = false};
if (isNil "RydFAW_FO") then {RydFAW_FO = []};
if (isNil "RydFAW_2PhWithoutFO") then {RydFAW_2PhWithoutFO = false};
if (isNil "RydFAW_OnePhase") then {RydFAW_OnePhase = false};

if (isNil ("RydFAW_Rate")) then {RydFAW_Rate = 0};
if (isNil ("RydFAW_Amount")) then {RydFAW_Amount = 6};
if (isNil ("RydFAW_Disp")) then {RydFAW_Disp = 0.4};
if (isNil ("RydFAW_Acc")) then {RydFAW_Acc = 2};
if (isNil ("RydFAW_Safe")) then {RydFAW_Safe = 200};
if (isNil ("RydFAW_SpawnM")) then {RydFAW_SpawnM = false};
if (isNil ("RydFAW_Monogamy")) then {RydFAW_Monogamy = true};
if (isNil ("RydFAW_ShellView")) then {RydFAW_ShellView = false};
if (isNil ("RydFAW_FOAccGain")) then {RydFAW_FOAccGain = 1};
if (isNil ("RydFAW_FOClass")) then {RydFAW_FOClass = ["USMC_SoldierS_Spotter","CDF_Soldier_Spotter","RU_Soldier_Spotter","Ins_Soldier_CO","GUE_Soldier_Scout","US_Soldier_Spotter_EP1","CZ_Special_Forces_Scout_DES_EP1","TK_Soldier_Spotter_EP1","TK_INS_Soldier_Sniper_EP1","TK_GUE_Soldier_Sniper_EP1","GER_Soldier_Scout_EP1"]};

_allArty = RydFAW_Howitzer + RydFAW_Mortar + RydFAW_Rocket;
_civF = ["CIV","CIV_RU","BIS_TK_CIV","BIS_CIV_special"];
_sides = [west,east,resistance];

_enemies = [];
_friends = [];
RydFAW_Fire = false;

if (RydFAW_ShellView) then {[] spawn Shellview};

while {RydFAW_Active} do
	{
	if (RydFAW_Manual) then {waitUntil {sleep 0.1;((RydFAW_Fire) or not (RydFAW_Manual))};RydFAW_Fire = false};

		{
		_side = _x;

		_eSides = [];
		_fSides = [];

			{
			_getF = _side getFriend _x;
			if (_getF >= 0.6) then
				{
				_fSides set [(count _fSides),_x]
				}
			else
				{
				_eSides set [(count _eSides),_x]
				}
			}
		foreach _sides;

		if (({((side _x) == _side)} count AllGroups) > 0) then
			{
			_artyGroups = [];
			_enemies = [];
			_friends = [];

				{
				_gp = _x;

				if ((side _gp) == _side) then
					{
					if not (_gp in RydFAW_NoControl) then
						{
							{
							if ((typeOf (vehicle _x)) in _allArty) exitWith
								{
								if not (_gp in _artyGroups) then
									{
									_artyGroups set [(count _artyGroups),_gp]
									}
								}
							} 
						foreach (units _gp)
						}
					};

				_isCiv = false;
				if ((faction (leader _gp)) in _civF) then {_isCiv = true};

				if not (_isCiv) then
					{
					if (not (isNull _gp) and (alive (leader _gp))) then
						{
						if ((side _gp) in _eSides) then 
							{
							if not (_gp in _enemies) then 
								{
								_enemies set [(count _enemies),_gp];
								}
							}
						else
							{
							if ((side _gp) in _fSides) then 
								{
								if not (_gp in _friends) then 
									{
									_friends set [(count _friends),_gp];
									if ((typeOf (leader _x)) in RydFAW_FOClass) then
										{
										if ((count RydFAW_FO) > 0) then
											{
											RydFAW_FO set [(count RydFAW_FO),_gp]
											}
										}
									}
								}
							}
						}
					}
				} 
			foreach allGroups;

			_knEnemies = [];

				{
					{
					_eVeh = vehicle _x;

						{
						if not ((faction (leader _x)) in _civF) then
							{
							if (((count RydFAW_FO) == 0) or (_x in RydFAW_FO)) then
								{
								if ((_x knowsAbout _eVeh) >= 0.05) then 
									{
									if not (_eVeh in _knEnemies) then 
										{
										_knEnemies set [(count _knEnemies),_eVeh]
										}
									}
								}
							}
						}
					foreach _friends
					}
				foreach (units _x)
				}
			foreach _enemies;

			_enArmor = [];

				{
				if ((_x isKindOf "Tank") or (_x isKindOf "Wheeled_APC")) then
					{
					if not (_x in _enArmor) then
						{
						_enArmor set [(count _enArmor),_x]
						}
					}
				}
			foreach _knEnemies;

			[_artyGroups,RydFAW_ArtyShells] call RYD_ArtyPrep;

			[_artyGroups,_knEnemies,_enArmor,_friends,RydFAW_Debug,RydFAW_Amount] call RYD_CFF
			}
		}
	foreach _sides;

	sleep RydFAW_Interval;
	};



