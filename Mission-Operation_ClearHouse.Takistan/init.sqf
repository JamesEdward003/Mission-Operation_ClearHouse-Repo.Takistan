// init.sqf //
0 fadeSound 1;
0 fadeMusic 1;

if (isMultiplayer) then {
	[] execVM "Day&WheaterScript\DWwind_init.sqf";
	//[1, 1, 1, [-8.75, 0, true]] execVM "DRN\DynamicWeatherEffects\DynamicWeatherEffects.sqf";
} else {
	[] execVM "Day&WheaterScript\DWwind_init.sqf";
	//[1, 1, 1, [-8.75, 0, true]] execVM "DRN\DynamicWeatherEffects\DynamicWeatherEffects.sqf";
};

//RydFAW_OnePhase = true;
//RydFAW_Manual = true;
RydFAW_2PhWithoutFO = true;
RydFAW_Monogamy = false;
RydFAW_FO = [];
RydFAW_Safe = 20;
RydFAW_Debug = true;
RydFAW_ShellView = true;

[] execVM "FAW\faw.sqf";

[] execVM "briefing.sqf";

[] execvm "House_Lights\tpw_houselights108.sqf";

[] execVM "bon_loadoutpresets\bon_init_loadoutpresets.sqf";

[objNull,player] execVM "OnLeaderRespawn.sqf";

[player] execVM "safeWeapon.sqf";

[player,0.1,0.05,-1,true] execVM "cly_heal.sqf";

onTeamSwitch { [_from, _to] execVM "OnTeamSwitch.sqf" };

[str ("Operation Clear House") ,  str(date select 1) + "." + str(date select 2) + "." + str(date select 0), str("Takistan")] spawn BIS_fnc_infoText;

set_h_time=false;publicVariable "set_h_time";

set_m_time=false;publicVariable "set_m_time";

weathercheck=false;publicVariable "weathercheck";

OpforElim = false;publicVariable "OpforElim";

onGroupIconClick  { 

	_is3D = _this select 0;
	_group = _this select 1;
	_wpID = _this select 2;
	_RMB = _this select 3;
	_posx = _this select 4;
	_posy = _this select 5;
	_shift = _this select 6;
	_ctrl = _this select 7;
	_alt = _this select 8;

    (vehicle ((units _group) select 0)) cameraEffect ["FixedWithZoom","LEFT TOP"];if (moonIntensity < .3) then {showCinemaBorder false;camUseNVG true};
    if (_RMB == 1) then { (vehicle ((units _group) select 0)) cameraEffect ["FixedWithZoom","FRONT TOP"];if (moonIntensity < .3) then {showCinemaBorder false;camUseNVG true}; };
    titleText [format ["GROUP: %1\nLEADER GROUP: %2",_group,leader _group],"PLAIN DOWN"];
};

{if (!isPlayer _x) then {_x addEventHandler["Fired",{if(_this select 2=="HandGrenadeMuzzle")then{deleteVehicle(_this select 6);};}];}} forEach units player;

{if (isPlayer _x) then {_x addEventHandler["Fired",{if(_this select 2=="HandGrenadeMuzzle")then{(_this select 0) addMagazine (_this select 5)};}];}} forEach units player;

{if (isPlayer _x) then {_x addEventHandler["Fired",{if((_this select 2=="M203Muzzle") or (_this select 2=="EGLMMuzzle") or (_this select 2=="XM320Muzzle") or (_this select 2=="AK_74Muzzle") or (_this select 2=="GP25Muzzle"))then{(_this select 0) addMagazine (_this select 5)};}];}} forEach units player;

{if (isPlayer _x) then {_x setUnitRecoilCoefficient 0.50}} forEach units player;

{if (side _x == sideEnemy) then {_x removeWeapon "NVGoggles"}} forEach allUnits;

if (moonIntensity > .7) then {
	{if (_x hasWeapon "NVGoggles" ) then  {_x removeweapon "NVGoggles"}} forEach (if ismultiplayer then {playableunits} else {switchableunits});
};

if ( Miles hasWeapon "NVGoggles" ) then  { Miles removeweapon "NVGoggles"; addSwitchableUnit Miles };

{if (( !isPlayer _x ) and (_x hasWeapon "BINOCULAR" )) then  {_x removeweapon "BINOCULAR"}} forEach (if ismultiplayer then {playableunits} else {switchableunits});

{if (( !isPlayer _x ) and (_x hasWeapon "BINOCULAR_VECTOR" )) then  {_x removeweapon "BINOCULAR_VECTOR"}} forEach (if ismultiplayer then {playableunits} else {switchableunits});

{if (( !isPlayer _x ) and (_x hasWeapon "LASERDESIGNATOR" )) then  {_x removeweapon "LASERDESIGNATOR"}} forEach (if ismultiplayer then {playableunits} else {switchableunits});

["ca\missions_pmc\data\ui_gps_ca.paa",-0.01, 0.1] call bis_fnc_customGPS;

[Kilo6_5,BIS_transportHeliH,BIS_transportHomeH,"som_transport"] execVM "transportHeliH.sqf";

_timeleft = 300;

uisleep 1;

while {true} do {

	_timeleft = _timeleft -1;

	uisleep 1;

if (_timeleft < 1) exitWith{ WeatherSet=nil;publicVariable "WeatherSet"; };
};

/*
//[player,0.6,0.6,true] call bis_fnc_sandstorm;

//BIS_DeathBlur ppEffectAdjust [0.0];
//BIS_DeathBlur ppEffectCommit 0.0;

{if (isPlayer _x) then {_x addEventHandler["Fired",{hintSilent format ["%1,%2,%3,%4,%5,%6,%7",(_this select 0),(_this select 1),(_this select 2),(_this select 3),(_this select 4),(_this select 5),(_this select 6)];}];}} forEach units player;

this addEventHandler ["GetOut", {_unit = _this select 2;[_unit] spawn { while {sleep 1; alive _this} do { if ((damage _x > .1) and (side _x == playerSide)) then { _this action ["heal", _x];sleep 60}} foreach (allUnits)}}];

this addEventHandler ["GetOut", {_unit = _this select 2;[_unit] spawn { while {sleep 1; alive _this} do { if ((damage _x > .1) and (side _x == playerSide)) then { _this action ["heal", _x];sleep 60}} foreach (allUnits)}}]; 

this addEventHandler ["GetOut", {_unit = _this select 2;[_unit] spawn { while {sleep 1; alive _this} do { if ((damage _x > .1) and (side _x == playerSide)) then { _this action ["heal", _x];sleep 60}} foreach (allUnits)}}]; 

_unit addeventhandler ["fired", {if((_this select 1) in ["Put","Throw"]) then {
(_this select 0) addMagazine (_this select 5);};}];

camera cameraEffect [effectName, effectPosition, r2tName]
"Internal", "External", "Fixed", "FixedWithZoom", "Terminate"
"TOP"
"LEFT"
"RIGHT"
"FRONT"
"BACK"
"LEFT FRONT"
"RIGHT FRONT"
"LEFT BACK"
"RIGHT BACK"
"LEFT TOP"
"RIGHT TOP"
"FRONT TOP"

(driver this) setIdentity "Echo1_1"; _null=[this] execVM "markerID.sqf"; Echo1 = group this; this flyinheight 0; Echo1_1 engineOn true; this addAction ["Get Equipment Preset","bon_loadoutpresets\bon_loadout_presets.sqf",[],-99,true,true,"","_this in _target"]; this addAction ["Save Loadout","OnRespawnLoadout.sqf",[],-99,true,true,"","_this in _target"]; this addEventHandler ["GetOut","(_this select 2) setBehaviour 'COMBAT';(_this select 0) lockCargo false"]; this lockCargo true; this addEventHandler ["Fired",{(_this select 0) setVehicleAmmo 1}]; this addAction ["Service","x_reload.sqf",[],-99,true,true,"","_this in _target"];

(driver this) setIdentity "Kilo6_2"; _null=[this] execVM "markerID.sqf"; Kilo6_2 = group this; this flyInHeight 40; this addAction ["Get Equipment Preset","bon_loadoutpresets\bon_loadout_presets.sqf",[],-99,true,true,"","_this in _target"]; this addAction ["Save Loadout","OnRespawnLoadout.sqf",[],-99,true,true,"","_this in _target"]; randID = ["Kilo6_6","Kilo6_7","Kilo6_8","Kilo6_9"]; {_x setIdentity (randID call BIS_fnc_selectRandom)} forEach units group this - [leader group this]; this addEventHandler ["GetOut","(_this select 2) setBehaviour 'COMBAT'"]; this addAction ["Service","x_reload.sqf",[],-99,true,true,"","_this in _target"];

(group this) addVehicle sov1; {[_x] action ["getInTurret", sov1, [_forEachIndex]];[_x] orderGetIn true} forEach units group this; {_x moveInTurret [sov1, [_forEachIndex]]} forEach units group this;

(group this) addVehicle sov2; {[_x] action ["getInTurret", sov2, [_forEachIndex]];[_x] orderGetIn true} forEach units group this; {_x moveInTurret [sov2, [_forEachIndex]]} forEach units group this;

(group this) addVehicle sov1; {_x action ["getInTurret", sov1, [_forEachIndex]];[_x] orderGetIn true} forEach units group this;

(group this) addVehicle sov2; {_x action ["getInTurret", sov2, [_forEachIndex]];[_x] orderGetIn true} forEach units group this;

if (weathercheck) then { weathercheck=false;publicVariable "weathercheck"; hintSilent "Weather Check is OFF"; } else { weathercheck=true; publicVariable "weathercheck"; hintSilent "Weather Check is ON"; };

if (set_h_time) then { player globalChat "Player set time done"; set_h_time=false;publicVariable "setTime"; } else { player globalChat "Player setting time"; set_h_time=true;publicVariable "set_h_time"; _null=[] spawn {while {set_h_time} do { skipTime 1; sleep 1; };};};

if (!isEngineOn Echo1_AH6J_1) then { Echo1_AH6J_1 engineOn true; (driver Echo1_AH6J_1) action ["engineOn", Echo1_AH6J_1]; }; if (!isEngineOn Echo1_AH6J_2) then { Echo1_AH6J_2 engineOn true; (driver Echo1_AH6J_2) action ["engineOn", Echo1_AH6J_2];}; Echo1_AH6J_1 flyInHeight 45; Echo1_AH6J_2 flyInHeight 40; StartedMission = true; publicVariable "StartedMission";
*/
