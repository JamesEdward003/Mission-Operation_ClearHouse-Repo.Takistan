/*
A script for SP Respawn.
By Twirly - 6th July 2011
Version 1.1
Last updated 12th July 2011.
Revised 2022.

Execute this script from OnPlayerKilled.sqs or OnPlayerKilled.sqf which must exist in your mission folder.

Here is the code for OnPlayerKilled.sqf

	private ["_plyr","_kilr"];

	_plyr = _this select 0;
	_kilr = _this select 1;

	//Optional camera control. If true camera will pan...if false camera will move instantly and fade from black.
	//If these variables aren't set somewhere. They will be created with default values of TRUE
	TWIRL_DeathCamMoveToKiller = false;
	TWIRL_DeathCamMoveToNewUnit = false;

	//If you want to respawn at a marker...call the script like this...
	_null = [_plyr,_kilr,"wrespawn0"] execVM "playerKilled.sqf";

	//If you want to respawn as a playable AI...call the script like this...
	//_null = [_plyr,_kilr] execVM "playerKilled.sqf";

Should be easy enough to follow. It's well commented.

*/

private ["_plyr","_kilr","_type","_group","_dist","_camera","_found","_rand","_unit"];

_plyr = _this select 0;
_kilr = _this select 1;
_mrkr = if (count _this >2) then {_this select 2};
_isLeader = if ( isFormationLeader _plyr ) then {TRUE} else {FALSE};

if (isNil "_kilr") then {_kilr = objNull};

//if these variables are not set...set them
if (isNil "TWIRL_DeathCamMoveToKiller") then {TWIRL_DeathCamMoveToKiller = true};
if (isNil "TWIRL_DeathCamMoveToNewUnit") then {TWIRL_DeathCamMoveToNewUnit = true};

//grab some stuff we need later
_type = typeOf _plyr;
_rank = rank _plyr;
_varName = vehicleVarname _plyr;
_group = group _plyr;
_dist = _plyr distance _kilr;

//camera initialisation
_camera = "camera" camCreate getpos _plyr;
_camera cameraEffect ["internal","back"];

//camera look at player
_camera camSetTarget vehicle _plyr;
_camera camSetRelPos [0.2,0.4,2];
_camera camSetFOV 0.143;
_camera camCommit 0;
waituntil {(camCommitted _camera)};

//camera zooms out over 5 seconds
_camera camSetRelPos [0,8,3.5];
_camera camSetFOV 0.7;
_camera camCommit 5;
waituntil {(camCommitted _camera)};

//hide and delete the body
hideBody _plyr;
sleep 3;
deleteVehicle _plyr;

if (not (isNull _kilr)) then {
	titleText [format ["Player killed by %1 at %2m",name _kilr,round _dist],"plain down"];
} else {
	titleText ["Player killed by UNKNOWN","plain down"];
};

sleep 2;

//check if killer exists.... skip if killed by artillery, bomb, unknown etc...
if (not (isNull _kilr)) then {
	//camera move to killer
	_camera camSetTarget vehicle _kilr;
	_camera camSetRelPos [2,5,2];

	if (TWIRL_DeathCamMoveToKiller) then {
		if (_dist > 500) then {_camera camCommit 10} else {_camera camCommit 5};
	} else {
		//titlecut [" ","black out",1];
		_camera camCommit 0;
		//fade from black 5 seconds
		titlecut ["","black in",5];
	};

	waituntil {(camCommitted _camera)};
};

_found = false;

if (count _this > 2) then {
//if (not (isNil _mrkr)) then {
	//create the new unit.... same group
	//_unit = group player createUnit ["SoldierWB", position player, [], 0, "FORM"];
	//_unit = _group createUnit [_type, (getMarkerPos _mrkr), [], 0, "NONE"];
	//"soldierWB" createUnit [getMarkerPos "marker_1", groupAlpha,"loon1 = this ; this addweapon {binocular}", 0.6, "corporal"];
	_spwnPos = [getMarkerPos _mrkr, 10, 180] call BIS_fnc_relPos;
	_type createUnit [_spwnPos, _group, "this setUnitPos 'DOWN'; selectPlayer this; addSwitchableUnit this;"];
	player setRank _rank;
	if ( _isLeader ) then { _group selectLeader player };
	player setVehicleVarName _varName;
	player setIdentity _varName;
	sleep 2;
	_found = true;
	//titleText [format ["Switching to new player - %1",name player],"plain down"];
} else {
	//try to find a random playable unit
	while {(not (_found)) and ((count switchableunits) >=1)} do {
		_unit = switchableunits select (floor (random (count switchableunits)));
		if (alive _unit) then {
			//if unit is not in a vehicle then make him go prone
			if (vehicle _unit == _unit) then {_unit setUnitPos "DOWN"};
			sleep 2;				//need time for unit get down
			selectplayer _unit;		//make the unit the player
			_found = true;			//stop looping
		};
		sleep 0.01;
	};
};

//if no available units for respawn then end game
if (not (_found)) exitWith {
	titleText ["No units available for respawn!","plain down"];
	sleep 2;
	enableEndDialog;
};

sleep 2;

titleText [format ["Switching to new player - %1",name player],"plain down"];

//camera move to new dude
_camera camSetTarget vehicle player;
_camera camSetRelPos [2,5,2];

//if distance is greater then 500m then take longer to move the camera
if (TWIRL_DeathCamMoveToNewUnit) then {
	if (_kilr distance player > 500) then {_camera camCommit 5} else {_camera camCommit 3};
} else {
	_camera camCommit 0;
	//fade from black 5 seconds
	titlecut [" ","black in",5];
};

waituntil {(camCommitted _camera)};

//camera move to directly above new dude
_camera camSetRelPos [0,0,4];
_camera camCommit 2;
waituntil {(camCommitted _camera)};

//camera move to a position that depends on if AI is in vehicle or not
if (vehicle player != player) then {_camera camSetRelPos [0,0,2]} else {_camera camSetRelPos [0,0.5,0.65]};

//_camera camSetRelPos [0,0,1.7];
_camera camCommit 2;
waituntil {(camCommitted _camera)};

//quick fade-in on internal point of view of the next unit
_camera camSetTarget player;
vehicle player switchCamera "INTERNAL";
player cameraEffect ["terminate","back"];

//fade from black 3 seconds
titlecut [" ","black in",3];
camDestroy _camera;

//run any initialization scripts for the player here
//_null = [] execVM "blahblahblah.sqf";
//_null = [_plyr,_kilr,"respawn_west"] execVM "playerKilled.sqf";
[] execVM "briefing.sqf";
[player,0.2,0.15,3,true] execVM "cly_heal.sqf";
[player] execVM "weaponrespawn.sqf";
[player] execVM "markerID.sqf";
[player] execVM "OnLeaderRespawn.sqf";
[player] execVM "safeWeapon.sqf";
