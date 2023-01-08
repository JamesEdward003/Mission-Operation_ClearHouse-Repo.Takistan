/////////////////////////////////execVM "cly_addweapon_OFrP_FRF2_J8_CamoDE_var2_LRAC.sqf"////////////////////////////////
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

_nul = [_unit,["OFrP_FRF2_J8_CamoDE_var2",6,0],["OFrP_LRAC",2,0],[_handGun,8],[_handGrenade,1],[_smokeShell,1],"OFrP_NVG","OFrP_Binocular_JIMMR"] execVM "Cly_AddWeapon\cly_addweapon.sqf";

//_nul = [_unit] execVM "Cly_addweapon\cly_unlimited.sqf";
