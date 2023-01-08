///////////////////////////////////////
_object 	= _this select 0;

if ((date select 3) < 6 or (date select 3) > 19) then {camUseNVG true} else {camUseNVG false};

if (alive _object) then 

{

ShowCinemaborder false;

_camera = "camera" camcreate position _object;
_camera CameraEffect ["EXTERNAL","Back"];
_camera CamSetTarget _object;
_camera camSetRelPos [-100,0,100];
_camera attachTo [_object, [-0.5,-0.5,0]];
_camera CamCommit 10;

};


