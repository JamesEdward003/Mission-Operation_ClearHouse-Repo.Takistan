// by Bon_Inf*
tfor_arma2 = true; // add ArmA2 equipment
tfor_BAF = true;   // add BAF equipment
tfor_PMC = true;  // add PMC equipment
tfor_ACE = false;   // add ACE2 equipment
tfor_acre = 0;

_cache = _this select 0;


_weapons = [
	"M14_EP1","M16A2","M16A2GL","M4A1","M4A3_RCO_GL_EP1","M4A3_CCO_EP1","SCAR_L_CQC_CCO_SD",
	"SCAR_L_CQC","SCAR_L_CQC_Holo","SCAR_L_CQC_EGLM_Holo","SCAR_L_STD_EGLM_RCO",
	"SCAR_L_STD_EGLM_TWS","SCAR_L_STD_HOLO","SCAR_L_STD_Mk4CQT","SCAR_H_CQC_CCO",
	"SCAR_H_CQC_CCO_SD","SCAR_H_STD_EGLM_Spect","SCAR_H_LNG_Sniper","SCAR_H_LNG_Sniper_SD",
	"SCAR_H_STD_TWS_SD","m240_scoped_EP1","M249_EP1","M249_m145_EP1","M249_TWS_EP1",
	"M60A4_EP1","Mk_48_DES_EP1","MG36_camo","m107","m107_TWS_EP1","M110_NVG_EP1",
	"M110_TWS_EP1","M24_des_EP1","M9","M9SD","Javelin","M136","MAAWS","Stinger",
	"M47Launcher_EP1","AK_74","AK_74_GL","AK_74_GL_kobra","AK_47_M","AK_47_S","AKS_74",
	"AKS_74_GOSHAWK","AKS_74_kobra","AKS_74_NSPU","AKS_74_pso","AKS_74_U","FN_FAL",
	"FN_FAL_ANPVS4","G36A_camo","G36C_camo","G36_C_SD_camo","G36K_camo","LeeEnfield",
	"Sa58P_EP1","Sa58V_EP1","Sa58V_RCO_EP1","Sa58V_CCO_EP1","PK","RPK_74","KSVK",
	"SVD_des_EP1","SVD","SVD_NSPU_EP1","glock17_EP1","Makarov","MakarovSD","Colt1911",
	"revolver_EP1","revolver_gold_EP1","Sa61_EP1","UZI_EP1","UZI_SD_EP1","Igla",
	"MetisLauncher","RPG7V","RPG18","Strela","Binocular","Binocular_Vector","NVGoggles",
	"ItemGPS","LaserDesignator","ItemRadio"
];


_magazines = [
	"20Rnd_762x51_DMR","20Rnd_762x51_B_SCAR","20Rnd_762x51_SB_SCAR","30Rnd_556x45_Stanag",
	"30Rnd_556x45_StanagSD","100Rnd_762x51_M240","200Rnd_556x45_M249","10Rnd_127x99_m107",
	"5Rnd_762x51_M24","15Rnd_9x19_M9","15Rnd_9x19_M9SD","1Rnd_HE_M203","1Rnd_Smoke_M203",
	"1Rnd_SmokeGreen_M203","1Rnd_SmokeRed_M203","1Rnd_SmokeYellow_M203","FlareGreen_M203",
	"FlareRed_M203","FlareWhite_M203","FlareYellow_M203","Javelin","M136","MAAWS_HEAT",
	"MAAWS_HEDP","Stinger","Dragon_EP1","HandGrenade_West","30Rnd_545x39_AK",
	"30Rnd_762x39_AK47","20Rnd_762x51_FNFAL","100Rnd_556x45_BetaCMag","30Rnd_556x45_G36",
	"30Rnd_556x45_G36SD","30Rnd_762x39_SA58","10x_303","100Rnd_762x54_PK","75Rnd_545x39_RPK",
	"5Rnd_127x108_KSVK","10Rnd_762x54_SVD","8Rnd_9x18_Makarov","8Rnd_9x18_MakarovSD",
	"7Rnd_45ACP_1911","17Rnd_9x19_glock17","6Rnd_45ACP","20Rnd_B_765x17_Ball","30Rnd_9x19_UZI",
	"30Rnd_9x19_UZI_SD","1Rnd_HE_GP25","1Rnd_Smoke_GP25","1Rnd_SmokeGreen_GP25",
	"1Rnd_SmokeRed_GP25","1Rnd_SmokeYellow_GP25","FlareGreen_GP25","FlareRed_GP25",
	"FlareWhite_GP25","FlareYellow_GP25","Igla","AT13","RPG18","Strela","PG7V","PG7VL","PG7VR",
	"OG7","LaserBatteries","HandGrenade_East","SmokeShell","SmokeShellGreen","SmokeShellRed",
	"SmokeShellYellow","SmokeShellBlue","SmokeShellPurple","SmokeShellOrange","PipeBomb","Mine",
	"IR_Strobe_Target","IR_Strobe_Marker"
];



if(tfor_arma2) then {
	#include "ammo_arma2.sqf"
};
if(tfor_BAF) then {
	#include "ammo_baf.sqf"
};
if(tfor_PMC) then {
	#include "ammo_pmc.sqf"
};
if(tfor_ACE) then {
	#include "ammo_ace.sqf"
};

if(tfor_acre == 1) then {
	_weapons = _weapons + ["ACRE_PRC148","ACRE_PRC148_UHF","ACRE_PRC117F","ACRE_PRC119","ACRE_PRC343"];
};





//remove duplicates:
{
	_magazines = (_magazines - [_x]) + [_x];
} foreach _magazines;
{
	_weapons = (_weapons - [_x]) + [_x];
} foreach _weapons;


tfor_loadable_magazines = _magazines;



_weaponcapacity = 0 max getNumber (configFile >> "CfgVehicles" >> typeOf _cache >> "transportMaxWeapons") - 100;
_magazinecapacity = 0 max getNumber (configFile >> "CfgVehicles" >> typeOf _cache >> "transportMaxMagazines") - 100;


while {alive _cache} do {

	{deleteVehicle _x} foreach nearestObjects [position _cache,["WeaponHolder"],30];

	clearMagazineCargo _cache;
	clearWeaponCargo _cache;

	{
		_cache addWeaponCargo [_x, floor(_weaponcapacity / (count _weapons))];
	} foreach _weapons;

	{
		_cache addMagazineCargo [_x, floor(_magazinecapacity / (count _magazines))];
	} foreach _magazines;


	// restock time.
	sleep 1800;
}; 