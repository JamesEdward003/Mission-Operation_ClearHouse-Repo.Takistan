//////////////////////////////////////////////////////////////////
// Function file for Armed Assault
// Created by:  DieHard - Function file for ArmA 2: Operation Arrowhead
//////////////////////////////////////////////////////////////////
_vehicle = vehicle player;
_type = typeOf _vehicle;
[_vehicle,_rearmInterval,(configFile >> "CfgVehicles" >> _type),[]] call rearmTurretRecursive; // highest level call contains essential starting conditions in params 2 and 3


rearmTurretRecursive = {
    private ["_vehicle","_config","_rearmInterval","_turretConfig","_turretPath","_currentTurretPath","_max"];
    _vehicle = _this select 0;
    _rearmInterval = _this select 1;
    _config = _this select 2;
    _turretPath = _this select 3;
    _currentTurretPath = +_turretPath;

    _turretConfig = (_config >> "Turrets");
    _max = count _turretConfig;
    if ( _max > 0 ) then {
        for "_i" from 0 to (_max - 1) do {
            _turret = _turretConfig select _i;
            _turretName = getText (_turret >> "gunnerName");

            _vehicle vehicleChat format ["Rearming %1", _turretName];
            _currentTurretPath set [count _turretPath,_i]; // working around some BI variable scoping fubar
            _magazines = getArray (_turret >> "magazines");
            {
                sleep _rearmInterval;
                _vehicle removeMagazinesTurret [_x,_currentTurretPath];
                sleep _rearmInterval;
                _vehicle vehicleChat format ["... %1", _x];
                _vehicle addMagazineTurret [_x,_currentTurretPath];
            } count _magazines;

            [_vehicle,_rearmInterval,_turretConfig,_currentTurretPath] call rearmTurretRecursive;
        };
    };
};