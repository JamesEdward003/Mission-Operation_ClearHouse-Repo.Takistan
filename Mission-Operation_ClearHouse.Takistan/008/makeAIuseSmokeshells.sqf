// TAKE NOTE: most comments have been stripped from this file to reduce the overall
// map download size. Do not attempt to understand these raw files. Instead, download
// the fully commented version from http://www.sbs.org.uk/wiki/
private ["_aiUnitHit","_shooter","_hasSmokeGrenade"];
_aiUnitHit = _this select 0;
if (_aiUnitHit != vehicle _aiUnitHit) exitWith {};
_hasSmokeGrenade = false;
_magazinesUnit = magazines _aiUnitHit;
{
if (_x in _magazinesUnit) exitWith {_hasSmokeGrenade = true;};
} forEach ["SmokeShell","SmokeShellYellow","SmokeShellRed","SmokeShellGreen","SmokeShellPurple","SmokeShellBlue","SmokeShellOrange"];
if ((alive _aiUnitHit) && (_hasSmokeGrenade)) then
{
_shooter = _this select 1;
if (!(isNil "_shooter")) then
{
_aiUnitHit doWatch _shooter;
sleep 3;
};
if (alive _aiUnitHit) then
{
_smokeShellHandler = _aiUnitHit addEventHandler ["Fired", {_muzzleFired = _this select 2}];
sleep 1;
_aiUnitHit fire "SmokeShellMuzzle";
};
sleep 3;
if (_muzzleFired == "SmokeShellMuzzle") exitWith {hint "SmokeShell Fired"};   
};

