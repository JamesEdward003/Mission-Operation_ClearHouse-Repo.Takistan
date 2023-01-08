///////////////////////////////////////
_objectArray 	= _this;

{
if (isNil "_x") then {
	_objectArray set [_forEachIndex, -1]
} else {
	if (!alive _x) then {
		_objectArray set [_forEachIndex, -1]
	}
}
} forEach _objectArray;

_objectArray = _objectArray - [-1];

_object = _objectArray select 0;

//if (_x in _objectArray && alive _x) then {_objectList = _objectList + _x} forEach _objectArray;

if ((date select 3) < 6 or (date select 3) > 19) then {camUseNVG true} else {camUseNVG false};

ShowCinemaborder false;

_camera = "camera" camcreate position _object;
_camera CameraEffect ["INTERNAL","Back"];
_camera CamSetTarget _object;
_camera camSetRelPos [10,-25,16];
_camera attachTo [_object, [0,-25,16]];
_camera CamCommit 0.01;

