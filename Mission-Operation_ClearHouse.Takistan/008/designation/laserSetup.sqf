/*laserSetup.sqf
Known issues:
Laser target may spawn behind a structure meaning you cant lock laser target with R, try from another direction.
Cursor Target doesn't work in 3rd person.
Accidentally dropping more than 1 bomb may cause laserCursor scripts to fail.

Aircraft init:
xhandle = this execVM "designation\laserSetup.sqf";
*/

varone = false;

_this addAction ["<t color='#FF0000'>Designate Target</t>", "008\designation\laserTarget.sqf", "", 6, false, true,"","_this == driver _target"];
_this addAction ["<t color='#FF0000'>Designate Map click</t>", "008\designation\laserMap.sqf", "", 6, false, true,"","_this == driver _target"];
_this addAction ["<t color='#FF0000'>Designate Cursor</t>", "008\designation\laserCursor.sqf", "", 6, false, true,"","_this == driver _target"];

DS_bombtrak = {
_plane = _this select 0;
  _weap = _this select 1;

if ((_weap != "BombLauncher") or (_weap != "BombLauncherA10") or (_weap != "BombLauncherF35")) exitWith {};

    _bomb = _this select 2;
      _target = cursorTarget; 
if (isNull _target) exitWith {};

  waitUntil {!(alive _bomb)};
    deleteVehicle _target;

_plane vehicleChat "Splash - Laser off";
};

_EHfiredIdx = _this addEventHandler ["fired", {_xhandle = [_this select 0,_this select 1,_this select 6] spawn DS_bombtrak;}];

//extra mags for testing - comment out if not required
//if (_weap = "BombLauncher") then {{_this addMagazine "6Rnd_GBU12_AV8B"} forEach [1,2,3,4,5,6]};
//if (_weap = "BombLauncherA10") then {{_this addMagazine "4Rnd_GBU12"} forEach [1,2,3,4,5,6]};
//if (_weap = "BombLauncherF35") then {{_this addMagazine "2Rnd_GBU12"} forEach [1,2,3,4,5,6]};
//{_this addMagazine "120Rnd_CMFlare_Chaff_Magazine"} forEach [1,2,3,4];