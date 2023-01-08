//................................
//	Fill Ammo Box Script by Lzryde (v0.2)
//................................

// Settings
_amountWeapon = 20;
_amountAmmo = 100;
_refreshTime = 360; // refill every 5 minutes

_this allowDamage false;

// Loop forever
while {true} do
{

// Clear box
clearWeaponCargo _this;
clearMagazineCargo _this;

// Fill box

// US Army Weapons & Ammo
_this addWeaponCargo ["M14_EP1", _amountWeapon]; _this addMagazineCargo ["20Rnd_762x51_DMR", _amountAmmo];
_this addWeaponCargo ["M16A2", _amountWeapon];
_this addWeaponCargo ["M16A2GL", _amountWeapon]; _this addMagazineCargo ["1Rnd_HE_M203", _amountAmmo];
_this addMagazineCargo ["FlareWhite_M203", _amountAmmo];
_this addMagazineCargo ["FlareGreen_M203", _amountAmmo];
_this addMagazineCargo ["FlareRed_M203", _amountAmmo];
_this addMagazineCargo ["FlareYellow_M203", _amountAmmo];
_this addMagazineCargo ["1Rnd_Smoke_M203", _amountAmmo];
_this addMagazineCargo ["1Rnd_SmokeRed_M203", _amountAmmo];
_this addMagazineCargo ["1Rnd_SmokeGreen_M203", _amountAmmo];
_this addMagazineCargo ["1Rnd_SmokeYellow_M203", _amountAmmo];

_this addWeaponCargo ["M4A1", _amountWeapon];
_this addWeaponCargo ["M4A3_RCO_GL_EP1", _amountWeapon];
_this addWeaponCargo ["M4A3_CCO_EP1", _amountWeapon];
_this addWeaponCargo ["SCAR_L_CQC_CCO_SD", _amountWeapon];
_this addWeaponCargo ["SCAR_L_CQC", _amountWeapon];
_this addWeaponCargo ["SCAR_L_CQC_Holo", _amountWeapon];
_this addWeaponCargo ["SCAR_L_CQC_EGLM_Holo", _amountWeapon];
_this addWeaponCargo ["SCAR_L_STD_EGLM_RCO", _amountWeapon];
_this addWeaponCargo ["SCAR_L_STD_EGLM_TWS", _amountWeapon];
_this addWeaponCargo ["SCAR_L_STD_HOLO", _amountWeapon];
_this addWeaponCargo ["SCAR_L_STD_Mk4CQT", _amountWeapon];
_this addWeaponCargo ["SCAR_H_CQC_CCO", _amountWeapon]; _this addMagazineCargo ["20Rnd_762x51_B_SCAR", _amountAmmo];
_this addWeaponCargo ["SCAR_H_CQC_CCO_SD", _amountWeapon]; _this addMagazineCargo ["20Rnd_762x51_SB_SCAR", _amountAmmo];
_this addWeaponCargo ["SCAR_H_STD_EGLM_Spect", _amountWeapon];
_this addWeaponCargo ["SCAR_H_LNG_Sniper", _amountWeapon];
_this addWeaponCargo ["SCAR_H_LNG_Sniper_SD", _amountWeapon];
_this addWeaponCargo ["SCAR_H_STD_TWS_SD", _amountWeapon];

_this addWeaponCargo ["m240_scoped_EP1", _amountWeapon]; _this addMagazineCargo ["100Rnd_762x51_M240", _amountAmmo];
_this addWeaponCargo ["M249_EP1", _amountWeapon]; _this addMagazineCargo ["200Rnd_556x45_M249", _amountAmmo];
_this addMagazineCargo ["100Rnd_556x45_M249", _amountAmmo];

_this addWeaponCargo ["M249_m145_EP1", _amountWeapon];
_this addWeaponCargo ["M249_TWS_EP1", _amountWeapon];
_this addWeaponCargo ["M60A4_EP1", _amountWeapon];
_this addWeaponCargo ["Mk_48_DES_EP1", _amountWeapon];

_this addWeaponCargo ["m107", _amountWeapon]; _this addMagazineCargo ["10Rnd_127x99_m107", _amountAmmo];
_this addWeaponCargo ["m107_TWS_EP1", _amountWeapon];
_this addWeaponCargo ["M110_NVG_EP1", _amountWeapon];
_this addWeaponCargo ["M110_TWS_EP1", _amountWeapon];
_this addWeaponCargo ["M24_des_EP1", _amountWeapon]; _this addMagazineCargo ["5Rnd_762x51_M24", _amountAmmo];

_this addWeaponCargo ["Colt1911", _amountWeapon]; _this addMagazineCargo ["7Rnd_45ACP_1911", _amountAmmo];
_this addWeaponCargo ["M9", _amountWeapon]; _this addMagazineCargo ["15Rnd_9x19_M9", _amountAmmo];
_this addMagazineCargo ["15Rnd_9x19_M9SD", _amountAmmo];
_this addWeaponCargo ["M9SD", _amountWeapon];

_this addWeaponCargo ["Javelin", _amountWeapon]; _this addMagazineCargo ["Javelin", _amountAmmo];
_this addWeaponCargo ["Stinger", _amountWeapon]; _this addMagazineCargo ["Stinger", _amountAmmo];
_this addWeaponCargo ["M136", _amountWeapon]; _this addMagazineCargo ["M136", _amountAmmo];
_this addWeaponCargo ["M47Launcher_EP1", _amountWeapon]; _this addMagazineCargo ["Dragon_EP1", _amountAmmo];
_this addWeaponCargo ["MAAWS", _amountWeapon]; _this addMagazineCargo ["MAAWS_HEAT", _amountAmmo];
_this addMagazineCargo ["MAAWS_HEDP", _amountAmmo];
_this addWeaponCargo ["MetisLauncher", _amountWeapon]; _this addMagazineCargo ["AT13", _amountAmmo];

_this addWeaponCargo ["Mk13_EP1", _amountWeapon];
_this addWeaponCargo ["M32_EP1", _amountWeapon]; _this addMagazineCargo ["6Rnd_HE_M203", _amountAmmo];
_this addWeaponCargo ["M79_EP1", _amountWeapon];

_this addMagazineCargo ["HandGrenade_West", _amountAmmo];

// German Weapons
_this addWeaponCargo ["G36A_camo", _amountWeapon]; _this addMagazineCargo ["30Rnd_556x45_G36", _amountAmmo];
_this addMagazineCargo ["100Rnd_556x45_BetaCMag", _amountAmmo];
_this addMagazineCargo ["30Rnd_556x45_G36SD", _amountAmmo];
_this addMagazineCargo ["30Rnd_556x45_Stanag", _amountAmmo];
_this addMagazineCargo ["30Rnd_556x45_StanagSD", _amountAmmo];
_this addMagazineCargo ["20Rnd_556x45_Stanag", _amountAmmo];

_this addWeaponCargo ["G36C_camo", _amountWeapon];
_this addWeaponCargo ["G36_C_SD_camo", _amountWeapon];
_this addWeaponCargo ["G36K_camo", _amountWeapon];

_this addWeaponCargo ["MG36_camo", _amountWeapon];

_this addWeaponCargo ["glock17_EP1", _amountWeapon]; _this addMagazineCargo ["17Rnd_9x19_glock17", _amountAmmo];

// Czeck Weapons
_this addWeaponCargo ["Sa58P_EP1", _amountWeapon]; _this addMagazineCargo ["30Rnd_762x39_SA58", _amountAmmo];
_this addWeaponCargo ["Sa58V_EP1", _amountWeapon];
_this addWeaponCargo ["Sa58V_RCO_EP1", _amountWeapon];
_this addWeaponCargo ["Sa58V_CCO_EP1", _amountWeapon];

_this addWeaponCargo ["Sa61_EP1", _amountWeapon]; _this addMagazineCargo ["20Rnd_B_765x17_Ball", _amountAmmo];

// Other Weapons
_this addWeaponCargo ["UZI_EP1", _amountWeapon]; _this addMagazineCargo ["30Rnd_9x19_UZI", _amountAmmo];
_this addWeaponCargo ["UZI_SD_EP1", _amountWeapon]; _this addMagazineCargo ["30Rnd_9x19_UZI_SD", _amountAmmo];

_this addMagazineCargo ["SmokeShell", _amountAmmo];
_this addMagazineCargo ["SmokeShellRed", _amountAmmo];
_this addMagazineCargo ["SmokeShellGreen", _amountAmmo];
_this addMagazineCargo ["SmokeShellYellow", _amountAmmo];
_this addMagazineCargo ["SmokeShellOrange", _amountAmmo];
_this addMagazineCargo ["SmokeShellPurple", _amountAmmo];
_this addMagazineCargo ["SmokeShellBlue", _amountAmmo];
_this addMagazineCargo ["TimeBomb", _amountAmmo];
_this addMagazineCargo ["PipeBomb", _amountAmmo];
_this addMagazineCargo ["Mine", _amountAmmo];
_this addMagazineCargo ["MineE", _amountAmmo];
_this addMagazineCargo ["HandGrenade_Stone", _amountAmmo];

_this addWeaponCargo ["Binocular_Vector", _amountWeapon];
_this addWeaponCargo ["Binocular", _amountWeapon];
_this addWeaponCargo ["Laserdesignator", _amountWeapon]; _this addMagazineCargo ["Laserbatteries", _amountAmmo];
_this addWeaponCargo ["NVGoggles", _amountWeapon];
_this addMagazineCargo ["IRStrobe", _amountWeapon];
_this addMagazineCargo ["IR_Strobe_Marker", _amountWeapon];
//_this addWeaponCargo ["ItemCompass", _amountWeapon];
//_this addWeaponCargo ["ItemGPS", _amountWeapon];
//_this addWeaponCargo ["ItemMap", _amountWeapon];
//_this addWeaponCargo ["ItemRadio", _amountWeapon];
//_this addWeaponCargo ["ItemWatch", _amountWeapon];

// Taki Weapons & Ammo
_this addWeaponCargo ["AK_74", _amountWeapon]; _this addMagazineCargo ["30Rnd_545x39_AK", _amountAmmo];

_this addWeaponCargo ["AK_74_GL", _amountWeapon]; _this addMagazineCargo ["1Rnd_HE_GP25", _amountAmmo];
_this addMagazineCargo ["FlareWhite_GP25", _amountAmmo];
_this addMagazineCargo ["FlareGreen_GP25", _amountAmmo];
_this addMagazineCargo ["FlareRed_GP25", _amountAmmo];
_this addMagazineCargo ["FlareYellow_GP25", _amountAmmo];
_this addMagazineCargo ["1Rnd_Smoke_GP25", _amountAmmo];
_this addMagazineCargo ["1Rnd_SmokeRed_GP25", _amountAmmo];
_this addMagazineCargo ["1Rnd_SmokeGreen_GP25", _amountAmmo];
_this addMagazineCargo ["1Rnd_SmokeYellow_GP25", _amountAmmo];

_this addWeaponCargo ["AK_74_GL_kobra", _amountWeapon];
_this addWeaponCargo ["AK_47_M", _amountWeapon]; _this addMagazineCargo ["30Rnd_762x39_AK47", _amountAmmo];
_this addWeaponCargo ["AK_47_S", _amountWeapon];
_this addWeaponCargo ["AKS_74", _amountWeapon];
_this addWeaponCargo ["AKS_74_GOSHAWK", _amountWeapon];
_this addWeaponCargo ["AKS_74_kobra", _amountWeapon];
_this addWeaponCargo ["AKS_74_NSPU", _amountWeapon];
_this addWeaponCargo ["AKS_74_pso", _amountWeapon];
_this addWeaponCargo ["AKS_74_U", _amountWeapon];
_this addWeaponCargo ["FN_FAL", _amountWeapon];
_this addWeaponCargo ["FN_FAL_ANPVS4", _amountWeapon];

_this addWeaponCargo ["LeeEnfield", _amountWeapon]; _this addMagazineCargo ["10x_303", _amountAmmo];

_this addWeaponCargo ["PK", _amountWeapon]; _this addMagazineCargo ["100Rnd_762x54_PK", _amountAmmo];
_this addWeaponCargo ["RPK_74", _amountWeapon]; _this addMagazineCargo ["75Rnd_545x39_RPK", _amountAmmo];
_this addMagazineCargo ["30Rnd_545x39_AKSD", _amountAmmo];

_this addWeaponCargo ["KSVK", _amountWeapon]; _this addMagazineCargo ["5Rnd_127x108_KSVK", _amountAmmo];
_this addWeaponCargo ["SVD_des_EP1", _amountWeapon]; _this addMagazineCargo ["10Rnd_762x54_SVD", _amountAmmo];
_this addWeaponCargo ["SVD", _amountWeapon];
_this addWeaponCargo ["SVD_NSPU_EP1", _amountWeapon];

_this addWeaponCargo ["Makarov", _amountWeapon]; _this addMagazineCargo ["8Rnd_9x18_Makarov", _amountAmmo];
_this addWeaponCargo ["MakarovSD", _amountWeapon]; _this addMagazineCargo ["8Rnd_9x18_MakarovSD", _amountAmmo];
_this addWeaponCargo ["revolver_EP1", _amountWeapon]; _this addMagazineCargo ["6Rnd_45ACP", _amountAmmo];
_this addWeaponCargo ["revolver_gold_EP1", _amountWeapon];

_this addWeaponCargo ["Igla", _amountWeapon]; _this addMagazineCargo ["Igla", _amountAmmo];
_this addWeaponCargo ["RPG7V", _amountWeapon]; _this addMagazineCargo ["PG7V", _amountAmmo];
_this addMagazineCargo ["PG7VL", _amountAmmo];
_this addMagazineCargo ["PG7VR", _amountAmmo];
_this addMagazineCargo ["OG7", _amountAmmo];
_this addWeaponCargo ["RPG18", _amountWeapon]; _this addMagazineCargo ["RPG18", _amountAmmo];
_this addWeaponCargo ["Strela", _amountWeapon]; _this addMagazineCargo ["Strela", _amountAmmo];

_this addMagazineCargo ["HandGrenade", _amountAmmo];
_this addMagazineCargo ["HandGrenade_East", _amountAmmo];

// Wait the duration of _refreshTime
sleep _refreshTime;
};