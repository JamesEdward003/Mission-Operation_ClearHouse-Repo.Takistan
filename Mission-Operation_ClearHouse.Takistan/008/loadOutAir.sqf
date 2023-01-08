///////////// loadOutAir.sqf //////////////
_vehicle = _this select 0;
_vehicleName	= vehicleVarName _vehicle;
		
 // helis with pilot armed only
 If (typeOf _vehicle in ["MAF_GazelleHOTD","AH6X_EP1","AH6J_EP1","AH6J"]) then 
 {
	_vehicle addMagazineTurret ["120Rnd_CMFlare_Chaff_Magazine",[-1]];
	_vehicle addMagazineTurret ["1350Rnd_30mmAP_A10",[-1]];
	_vehicle addMagazineTurret ["38Rnd_FFAR",[-1]];
	_vehicle addMagazineTurret ["8Rnd_Hellfire",[-1]];
	_vehicle addMagazineTurret ["8Rnd_Sidewinder_AH64",[-1]];
	_vehicle addweapon "CMFlareLauncher";
	_vehicle addweapon "GAU8";
	_vehicle addweapon "FFARLauncher";
	_vehicle addweapon "HellfireLauncher";
	_vehicle addweapon "SidewinderLaucher_AH64";
 }; 
 
 // helis with copilot armed or gunners only
 If (typeOf _vehicle in ["CH_47F_EP1","Mi17_rockets_RU","UH60M_EP1","MH60S","UH1H_TK_EP1","UH1Y","UH1H_TK_GUE_EP1","Ka137_MG_PMC","MAF_NH90_TTH","OFrP_Caracal","OFrP_Caracal_DAOS","OFrP_Puma_CE_Pirate","OFrP_Transall_C160","OFrP_Hawkeye"]) then
 {	
	_vehicle addMagazineTurret ["120Rnd_CMFlare_Chaff_Magazine",[0]];
	_vehicle addMagazineTurret ["1350Rnd_30mmAP_A10",[0]];
	_vehicle addMagazineTurret ["38Rnd_FFAR",[0]];
	_vehicle addMagazineTurret ["8Rnd_Hellfire",[0]];
	_vehicle addMagazineTurret ["8Rnd_Sidewinder_AH64",[0]];
	_vehicle addweapon "CMFlareLauncher";
	_vehicle addweapon "GAU8";
	_vehicle addweapon "FFARLauncher";
	_vehicle addweapon "HellfireLauncher";
	_vehicle addweapon "SidewinderLaucher_AH64";
 }; 
 
  // helis with special case only
 If (typeOf _vehicle in ["UH1H_TK_GUE_EP1"]) then
 {	
	_vehicle addweapon "GAU8";
	_vehicle removeMagazine "1350Rnd_30mmAP_A10";
	_vehicle addMagazine "1350Rnd_30mmAP_A10";
 }; 
		
 // helis with both pilot and copilot armed
 If (typeOf _vehicle in ["OFrP_Tiger_HAD_CE","AH1Z","AH64D","AH64D_EP1","Ka52","Ka52Black"]) then
 {
	_vehicle addMagazineTurret ["120Rnd_CMFlare_Chaff_Magazine",[-1]];
	_vehicle addMagazineTurret ["1350Rnd_30mmAP_A10",[-1]];
	_vehicle addMagazineTurret ["38Rnd_FFAR",[-1]];
	_vehicle addMagazineTurret ["8Rnd_Hellfire",[-1]];
	_vehicle addMagazineTurret ["8Rnd_Sidewinder_AH64",[-1]];
	_vehicle addMagazineTurret ["120Rnd_CMFlare_Chaff_Magazine",[0]];
	_vehicle addMagazineTurret ["SmokeLauncherMag",[0]];
	_vehicle addMagazineTurret ["1350Rnd_30mmAP_A10",[0]];
	_vehicle addMagazineTurret ["38Rnd_FFAR",[0]];
	_vehicle addMagazineTurret ["8Rnd_Hellfire",[0]];
	_vehicle addMagazineTurret ["8Rnd_Sidewinder_AH64",[0]];
	_vehicle addweapon "CMFlareLauncher";
	_vehicle addweapon "GAU8";
	_vehicle addweapon "FFARLauncher";
	_vehicle addweapon "HellfireLauncher";
	_vehicle addweapon "SidewinderLaucher_AH64";
 }; 

 // planes with pilot armed only
 If (typeOf _vehicle in ["AV8B","AV8B2","Su25_CDF","Su25_Ins","Su25_TK_EP1","Su39"]) then 
 {
	_vehicle addMagazineTurret ["120Rnd_CMFlare_Chaff_Magazine",[-1]];
	_vehicle addMagazineTurret ["6Rnd_Mk82",[-1]];
	_vehicle addMagazineTurret ["1350Rnd_30mmAP_A10",[-1]];
	_vehicle addMagazineTurret ["38Rnd_FFAR",[-1]];
	_vehicle addMagazineTurret ["8Rnd_Hellfire",[-1]];
	_vehicle addMagazineTurret ["8Rnd_Sidewinder_AH64",[-1]];
	_vehicle addweapon "CMFlareLauncher";
	_vehicle addweapon "Mk82BombLauncher_6";
	_vehicle addweapon "GAU8";
	_vehicle addweapon "FFARLauncher";
	_vehicle addweapon "HellfireLauncher";
	_vehicle addweapon "SidewinderLaucher_AH64";
 }; 
 
 // planes with pilot and co-pilot armed only
 If (typeOf _vehicle in ["Su34"]) then 
 {
	_vehicle addMagazineTurret ["120Rnd_CMFlare_Chaff_Magazine",[-1]];
	_vehicle addMagazineTurret ["6Rnd_Mk82",[-1]];
	_vehicle addMagazineTurret ["1350Rnd_30mmAP_A10",[-1]];
	_vehicle addMagazineTurret ["38Rnd_FFAR",[-1]];
	_vehicle addMagazineTurret ["8Rnd_Hellfire",[-1]];
	_vehicle addMagazineTurret ["8Rnd_Sidewinder_AH64",[-1]];
	_vehicle addweapon "CMFlareLauncher";
	_vehicle addweapon "Mk82BombLauncher_6";
	_vehicle addweapon "GAU8";
	_vehicle addweapon "FFARLauncher";
	_vehicle addweapon "HellfireLauncher";
	_vehicle addweapon "SidewinderLaucher_AH64";
 }; 