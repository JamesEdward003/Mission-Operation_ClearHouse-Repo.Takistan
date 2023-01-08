///////////////////////////////////////
_object 	= _this select 0;

if ((date select 3) < 6 or (date select 3) > 19) then {camUseNVG true} else {camUseNVG false};

if (alive _object) then 

{

ShowCinemaborder false;

_camera = "camera" camcreate position _object;
_camera CameraEffect ["EXTERNAL","Back"];
_camera CamSetTarget _object;
_camera camSetRelPos [10,-30,6];
_camera attachTo [_object, [10,-30,6]];
_camera CamCommit 0.01;

uisleep 20;

};


