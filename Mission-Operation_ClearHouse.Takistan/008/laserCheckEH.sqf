//////////////////////////////////////////////////////////////////
// Function file for Armed Assault
// Created by: RALPH BELL AMI
//////////////////////////////////////////////////////////////////

LaserCheck = 
{
	private ["_laserPos"];
	_source = _this select 0;
	_weapon = _this select 1;
	_ammo = _this select 4;

	if (_weapon == "Laserdesignator") then
	{
		LaserTarget = objNull;
		
		_laser = nearestObject [_source, _ammo];
		
		while {!isNull _laser} do
		{
			_laserPos = getPos _laser;
			Sleep 0.001;
		};
		
		_targets = nearestObjects [_laserPos, ["LaserTarget"], 1.5];
		_target = _targets select 0;
		LaserTarget = _target;
		//Now you can use LaserTarget in other scripts or stuff
		hint format ["%1",LaserTarget];
	};
};

player addEventHandler ["Fired", {_this spawn LaserCheck}];