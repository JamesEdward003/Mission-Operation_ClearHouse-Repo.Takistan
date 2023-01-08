///////////////////////////////////////
_object 	= _this select 0;
_object2	= player;

if ((date select 3) < 6 or (date select 3) > 19) then {camUseNVG true} else {camUseNVG false};

if (alive _object) then 

{

ShowCinemaborder false;

_camera = "camera" camcreate [(getpos _object2 select 0) +8, (getpos _object2 select 1) -6, 5];
_camera CameraEffect ["EXTERNAL","FRONT"];
_camera camPrepareTarget _object2;
_camera camPreparePos [(getpos _object select 0) +8, (getpos _object select 1) -6, 5];
_camera camPrepareFOV 1.000;
_camera camCommitPrepared 0;

uisleep 3;

_camera camPrepareTarget [(getpos _object select 0) +8, (getpos _object select 1) -6, 5];
_camera CameraEffect ["EXTERNAL","BACK"];
_camera camPreparePos [(getpos _object2 select 0) +8, (getpos _object2 select 1) -6, 5];
_camera camPrepareFOV 1.000;
_camera camCommitPrepared 5;

};
