/*       execVM "cly_addweapon_Sa58P_EP1.sqf"        */
_unit = _this select 0;
_handGun = [];
_handGrenade = [];
_smokeShell = [];
switch (side _unit) do {
    case west: {
        _handGun = "Colt1911";
        _handGrenade = "HandGrenade_West";
        _smokeShell = "SmokeShellGreen";
    };
    case east: {
        _handGun = "Makarov";
        _handGrenade = "HandGrenade_East";
        _smokeShell = "SmokeShellRed";
    };
    case resistance: {
        _handGun = "UZI_EP1";
        _handGrenade = "HandGrenade";
        _smokeShell = "SmokeShellOrange";
    };
    case civilian: {
        _handGun = "glock17_EP1";
        _handGrenade = "HandGrenade_Stone";
        _smokeShell = "SmokeShellYellow";
    };
 };

_nul = [_unit,["Sa58P_EP1",7,"30Rnd_762x39_SA58"],[_handGun,8],[_handGrenade,1],["pipebomb",1],[_smokeShell,1],"NVGoggles","Binocular_Vector"] execVM "Cly_AddWeapon\cly_addweapon.sqf";

//_nul = [_unit] execVM "Cly_addweapon\cly_unlimited.sqf";





