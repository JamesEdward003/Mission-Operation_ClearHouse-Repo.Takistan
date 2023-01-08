/////////////////////////////////execVM "cly_addweapon_SCAR_L_STD_EGLM_RCO_javelin.sqf"////////////////////////////////
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

_nul = [_unit,["SCAR_L_STD_EGLM_RCO",6,0,8,2],["Javelin",1],[_handGun,8],[_handGrenade,1],[_smokeShell,1],"NVGoggles","Binocular_Vector"] execVM "Cly_AddWeapon\cly_addweapon.sqf";

//_nul = [_unit] execVM "Cly_addweapon\cly_unlimited.sqf";




	


