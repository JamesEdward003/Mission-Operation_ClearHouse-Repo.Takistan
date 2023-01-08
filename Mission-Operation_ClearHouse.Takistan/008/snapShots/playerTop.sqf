//////////////////////////////////////////////////////////////////
cam = "camera" camcreate position player;
cam hideObject true;
cam attachTo [player, [0,0,10]];
cam setVectorUp [0,0.99,0.01];
cam switchCamera "Internal";
findDisplay 46 displayAddEventHandler ["MouseButtonDown", {
	if (_this select 1 == 0) then {
		player fire [currentMuzzle player, currentWeaponMode player];
	};
	false
}];
findDisplay 46 displayAddEventHandler ["KeyDown", {
	if (_this select 1 in actionKeys "ReloadMagazine") then {
		reload player;
	};
	false
}];