//////////////////////////////////////////////////////////////////
// null = [this, 60] execVM "speedlimit.sqf";
_vehicle = _this select 0;
_maxspeed = _this select 1;

// Figure current speed.
_curspeed = speed _vehicle;

// If we're going to fast...
if (_curspeed > _maxspeed) then {

// Grab the current velocity and direction of the vehicle.
_vel = velocity _vehicle;
_dir = direction _vehicle;

// Limit it's to bring it back down to the max amount.
_speed = _curspeed - _maxspeed;

// This is math I don't understand, grabbed it from the biki. :)
//_vehicle setVelocity [(_vel select 0)-(sin _dir*_speed),(_vel select 1)- (cos _dir*_speed),(_vel select 2)];
_vehicle setVelocity [(_vel select 0)/curspeed * maxspeed,(_vel select 1)/curspeed * maxspeed,(_vel select 2)/curspeed * maxspeed];

}; // End of if

// Sleep tenth of a second, this might be too much processing.  I dunno, slower and the ride get jerkier though.
sleep 0.1;

// Call the script again.
_null = [_vehicle, _maxspeed] execVM "008\speedlimit.sqf";