private ["_plyr","_kilr"];

_plyr = _this select 0;
_kilr = _this select 1;

//Optional camera control. If true camera will pan...if false camera will move instantly and fade from black.
//If these variables aren't set somewhere. They will be created with default values of TRUE
TWIRL_DeathCamMoveToKiller = TRUE;
TWIRL_DeathCamMoveToNewUnit = TRUE;

//If you want to respawn at a marker...call the script like this...
_null = [_plyr,_kilr,"respawn_west"] execVM "playerKilled.sqf";

//If you want to respawn as a playable AI...call the script like this...
//_null = [_plyr,_kilr] execVM "playerKilled.sqf";