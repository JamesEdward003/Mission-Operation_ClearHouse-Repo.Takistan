/////////////// _null = [_unit] execVM "cly_unitweapons.sqf" ///////////////
private ["_unit", "_loadOut"];
_unit 		= _this select 0;
_loadOut 	= [];

if (daytime > 18.25 || daytime < 5.50) then {
	
switch (side _unit) do {
	
    case west							: {
	    
	    switch (typeOf _unit) do {

	    case "USMC_Soldier_Officer"							: {
		    	_loadOut = "Cly_AddWeapon\cly_addweapon_dmr_smaw.sqf";
        };		    
	    case "USMC_Soldier_SL"								: {
		    	_loadOut = "Cly_AddWeapon\cly_addweapon_SCAR_H_STD_TWS_SD.sqf";
        };
	    case "USMC_Soldier_TL"								: {
		    	_loadOut = "Cly_AddWeapon\cly_addweapon_M249_TWS_M136.sqf";
        };
	    case "USMC_Soldier_Medic"							: {
		    	_loadOut = "Cly_AddWeapon\cly_addweapon_FN_FAL_ANPVS4_RPG7V.sqf";
        };
	    case "USMC_Soldier_LAT"								: {
	    		_loadOut = "Cly_AddWeapon\cly_addweapon_M249_TWS_M136.sqf";
        };
	    case "USMC_Soldier_AT"								: {
		    	_loadOut = "Cly_AddWeapon\cly_addweapon_m249_tws_smaw.sqf";
        };
	    case "USMC_Soldier_HAT"								: {
		    	_loadOut = "Cly_AddWeapon\cly_addweapon_M249_TWS_Javelin.sqf";
        };
	    case "USMC_Soldier_AA"								: {
		    	_loadOut = "Cly_AddWeapon\cly_addweapon_m249_tws_stinger.sqf";
        };
	    case "USMC_SoldierS_Sniper"							: {
		    	_loadOut = "Cly_AddWeapon\cly_addweapon_M107_TWS_smaw.sqf";
        }; 
	    case "USMC_SoldierM_Marksman"							: {
		    	_loadOut = "Cly_AddWeapon\cly_addweapon_M107_TWS_smaw.sqf";
        }; 
	    case "USMC_Soldier_GL"								: {
		    	_loadOut = "Cly_AddWeapon\cly_addweapon_M4A3_RCO_GL_EP1_RPG7V.sqf";
        };
	    case "USMC_Soldier_MG"								: {
		    	_loadOut = "Cly_AddWeapon\cly_addweapon_m249_tws_smaw.sqf";   
	    };
	    case "USMC_SoldierS_Engineer"							: {
	    		_loadOut = "Cly_AddWeapon\cly_addweapon_SVD_NSPU_EP1.sqf";
        };   
	    case "FR_Commander"									: {
		    	_loadOut = "Cly_AddWeapon\cly_addweapon_m249_tws_smaw.sqf";
        };
	    case "FR_TL"										: {
		    	_loadOut = "Cly_AddWeapon\cly_addweapon_SCAR_H_STD_TWS_SD.sqf";
        };
	    case "FR_Assault_R"									: {
		    	_loadOut = "Cly_AddWeapon\cly_addweapon_SCAR_H_STD_TWS_SD.sqf";
        };
	    case "FR_Assault_GL"								: {
		    	_loadOut = "Cly_AddWeapon\cly_addweapon_m249_tws_smaw.sqf";
        };
	    case "FR_GL"										: {
		    	_loadOut = "Cly_AddWeapon\cly_addweapon_m249_tws_smaw.sqf";
        };
	    case "FR_Corpsman"									: {
		    	_loadOut = "Cly_AddWeapon\cly_addweapon_SCAR_H_STD_TWS_SD.sqf";
        };
	    case "FR_AR"										: {
		    	_loadOut = "Cly_AddWeapon\cly_addweapon_m249_tws_smaw.sqf";
        };
	    case "FR_AC"										: {
		    	_loadOut = "Cly_AddWeapon\cly_addweapon_SCAR_H_STD_TWS_SD.sqf";
        };
	    case "FR_Light"										: {
		    	_loadOut = "Cly_AddWeapon\cly_addweapon_SCAR_H_STD_TWS_SD.sqf";
        };
	    case "FR_Sapper"									: {
		    	_loadOut = "Cly_AddWeapon\cly_addweapon_SCAR_H_STD_TWS_SD.sqf";
        };
	    case "FR_R"										: {
		    	_loadOut = "Cly_AddWeapon\cly_addweapon_SCAR_H_STD_TWS_SD.sqf";
        };
	    case "FR_Cooper"									: {
		    	_loadOut = "Cly_AddWeapon\cly_addweapon_M107_TWS_smaw.sqf";
        };
	    case "FR_Miles"										: {
		    	_loadOut = "Cly_AddWeapon\cly_addweapon_M249_TWS_M136.sqf";
        };
	    case "FR_OHara"										: {
		    	_loadOut = "Cly_AddWeapon\cly_addweapon_M249_TWS_M136.sqf";
        };
	    case "FR_Rodriguez"									: {
		    	_loadOut = "Cly_AddWeapon\cly_addweapon_M249_TWS_M136.sqf";
        };
	    case "FR_Sykes"										: {
		    	_loadOut = "Cly_AddWeapon\cly_addweapon_M107_TWS_smaw.sqf";
        };
	    case "US_Soldier_Officer_EP1"							: {
		    	_loadOut = "Cly_AddWeapon\cly_addweapon_M249_TWS_M136.sqf";
        };		    
	    case "US_Soldier_SL_EP1"								: {
		    	_loadOut = "Cly_AddWeapon\cly_addweapon_dmr_smaw.sqf";
        };
	    case "US_Soldier_TL_EP1"								: {
		    	_loadOut = "Cly_AddWeapon\cly_addweapon_M249_TWS_M136.sqf";
        };
	    case "US_Soldier_Spotter_EP1"							: {
	    		_loadOut = "Cly_AddWeapon\cly_addweapon_M110_TWS_smaw.sqf";
        };
	    case "US_Soldier_Sniper_NV_EP1"						: {
		    	_loadOut = "Cly_AddWeapon\cly_addweapon_M110_NVG_smaw.sqf";
        };
	    case "US_Soldier_Sniper_EP1"							: {
		    	_loadOut = "Cly_AddWeapon\cly_addweapon_M107_TWS_smaw.sqf";
        };
	    case "US_Soldier_SniperH_EP1"							: {
		    	_loadOut = "Cly_AddWeapon\cly_addweapon_M110_TWS_smaw.sqf";
        };
	    case "US_Soldier_Pilot_EP1"							: {
		    	_loadOut = "Cly_AddWeapon\cly_addweapon_M249_TWS_M136.sqf";
        }; 
	    case "US_Soldier_Medic_EP1"							: {
		    	_loadOut = "Cly_AddWeapon\cly_addweapon_M249_TWS_M136.sqf";
        }; 
	    case "US_Soldier_Marksman_EP1"						: {
		    	_loadOut = "Cly_AddWeapon\cly_addweapon_dmr_smaw.sqf";
        };
	    case "US_Soldier_MG_EP1"								: {
		    	_loadOut = "Cly_AddWeapon\cly_addweapon_M249_TWS_M136.sqf";   
	    };
	    case "US_Soldier_HAT_EP1"							: {
	    		_loadOut = "Cly_AddWeapon\cly_addweapon_M249_TWS_Javelin.sqf";
        };
	    case "US_Soldier_LAT_EP1"							: {
		    	_loadOut = "Cly_AddWeapon\cly_addweapon_M249_TWS_M136.sqf";
        };
	    case "US_Soldier_GL_EP1"								: {
		    	_loadOut = "Cly_AddWeapon\cly_addweapon_M249_TWS_M136.sqf";
        };
	    case "US_Soldier_Engineer_EP1"						: {
		    	_loadOut = "Cly_AddWeapon\cly_addweapon_M249_TWS_M136.sqf";
        };
	    case "US_Soldier_Crew_EP1"							: {
		    	_loadOut = "Cly_AddWeapon\cly_addweapon_M249_TWS_M136.sqf";
        };
	    case "US_Soldier_Light_EP1"							: {
		    	_loadOut = "Cly_AddWeapon\cly_addweapon_M249_TWS_M136.sqf";
        };
	    case "US_Soldier_EP1"								: {
		    	_loadOut = "Cly_AddWeapon\cly_addweapon_M249_TWS_M136.sqf";
        };
	    case "US_Delta_Force_AR_EP1"							: {
		    	_loadOut = "Cly_AddWeapon\cly_addweapon_M249_TWS_M136.sqf";
        };
	    case "US_Delta_Force_Air_Controller_EP1"				: {
		    	_loadOut = "Cly_AddWeapon\cly_addweapon_dmr_smaw.sqf";
        }; 
	    case "US_Delta_Force_MG_EP1"							: {
		    	_loadOut = "Cly_AddWeapon\cly_addweapon_M249_TWS_M136.sqf";
        }; 
	    case "US_Delta_Force_Assault_EP1"						: {
		    	_loadOut = "Cly_AddWeapon\cly_addweapon_M249_TWS_M136.sqf";
        };
	    case "US_Delta_Force_EP1"							: {
		    	_loadOut = "Cly_AddWeapon\cly_addweapon_M249_TWS_M136.sqf";   
	    };
	    case "US_Delta_Force_M14_EP1"							: {
	    		_loadOut = "Cly_AddWeapon\cly_addweapon_M249_TWS_Javelin.sqf";
        };
	    case "US_Delta_Force_Marksman_EP1"						: {
		    	_loadOut = "Cly_AddWeapon\cly_addweapon_M249_TWS_M136.sqf";
        };
	    case "US_Delta_Force_Medic_EP1"						: {
		    	_loadOut = "Cly_AddWeapon\cly_addweapon_M249_TWS_M136.sqf";
        };
	    case "US_Delta_Force_Night_EP1"						: {
		    	_loadOut = "Cly_AddWeapon\cly_addweapon_M249_TWS_M136.sqf";
        };
	    case "US_Delta_Force_SD_EP1"							: {
		    	_loadOut = "Cly_AddWeapon\cly_addweapon_M249_TWS_M136.sqf";
        };
	    case "US_Delta_Force_TL_EP1"							: {
		    	_loadOut = "Cly_AddWeapon\cly_addweapon_dmr_smaw.sqf";
        };
	    case "US_Delta_Force_Undercover_Takistani06_EP1"			: {
		    	_loadOut = "Cly_AddWeapon\cly_addweapon_M249_TWS_M136.sqf";
        };
	    case "WDL_Mercenary_Default9"							: {
		    	_loadOut = "Cly_AddWeapon\cly_addweapon_dmr_smaw.sqf";
        };		    
	    case "Mercenary_Default11"							: {
		    	_loadOut = "Cly_AddWeapon\cly_addweapon_dmr_smaw.sqf";
        };
      };
    };
    
    case east							: {
	    
	    switch (typeOf _unit) do {
		    
	    case "USMC_Soldier_SL"			: {
		    	_loadOut = "Cly_AddWeapon\cly_addweapon_m249_tws_smaw.sqf";
        };
	    case "USMC_Soldier_TL"			: {
		    	_loadOut = "Cly_AddWeapon\cly_addweapon_m249_tws_smaw.sqf";
        };
	    case "USMC_Soldier_Medic"		: {
		    	_loadOut = "Cly_AddWeapon\cly_addweapon_m249_tws_smaw.sqf";
        };
	    case "USMC_Soldier_LAT"			: {
	    		_loadOut = "Cly_AddWeapon\cly_addweapon_m249_tws_smaw.sqf";
        };
	    case "USMC_Soldier_AT"			: {
		    	_loadOut = "Cly_AddWeapon\cly_addweapon_m249_tws_smaw.sqf";
        };
	    case "USMC_Soldier_HAT"			: {
		    	_loadOut = "Cly_AddWeapon\cly_addweapon_m249_tws_smaw.sqf";
        };
	    case "USMC_Soldier_AA"			: {
		    	_loadOut = "Cly_AddWeapon\cly_addweapon_m249_tws_smaw.sqf";
        };
	    case "USMC_SoldierS_Sniper"		: {
		    	_loadOut = "Cly_AddWeapon\cly_addweapon_m249_tws_smaw.sqf";
        }; 
	    case "USMC_Soldier_GL"			: {
		    	_loadOut = "Cly_AddWeapon\cly_addweapon_m249_tws_smaw.sqf";
        };
	    case "RU_Soldier"				: {
	    		_loadOut = "Cly_AddWeapon\cly_addweapon_FN_FAL_ANPVS4_RPG7V.sqf";
        };  
	    case "RUS_Commander"			: {
		    	_loadOut = "Cly_AddWeapon\cly_addweapon_bizon_silenced_RPG7V.sqf";   
	    }; 
	    case "RUS_Soldier_TL"			: {
		    	_loadOut = "Cly_AddWeapon\cly_addweapon_bizon_JAVELIN.sqf";   
	    };
	    case "RUS_Soldier1"				: {
		    	_loadOut = "Cly_AddWeapon\cly_addweapon_bizon_RPG7V.sqf";   
	    };
	    case "RUS_Soldier2"				: {
		    	_loadOut = "Cly_AddWeapon\cly_addweapon_bizon_silenced_RPG7V.sqf";   
	    };
	    case "RUS_Soldier3"				: {
		    	_loadOut = "Cly_AddWeapon\cly_addweapon_bizon_METIS.sqf";   
	    };
	    case "RUS_Soldier_GL"			: {
		    	_loadOut = "Cly_AddWeapon\cly_addweapon_AKS_74_GOSHAWK_METIS.sqf";   
	    };
	    case "RUS_Soldier_Marksman"		: {
		    	_loadOut = "Cly_AddWeapon\cly_addweapon_bizon_silenced_RPG7V.sqf";   
	    };
	    case "RUS_Soldier_Sab"			: {
		    	_loadOut = "Cly_AddWeapon\cly_addweapon_bizon_silenced_RPG7V.sqf";   
	    };
	    case "ETaliban11"				: {
		    	_loadOut = "Cly_AddWeapon\cly_addweapon_dmr_smaw.sqf";
        };		    
	    case "Ins_Soldier_Sniper"		: {
		    	_loadOut = "Cly_AddWeapon\cly_addweapon_dmr_smaw.sqf";
        };
      };
    };
    case resistance						: {
	    
	    switch (typeOf _unit) do {
		    
	    case "USMC_Soldier_SL"			: {
		    	_loadOut = "Cly_AddWeapon\cly_addweapon_m249_tws_smaw.sqf";
        };
	    case "USMC_Soldier_TL"			: {
		    	_loadOut = "Cly_AddWeapon\cly_addweapon_m249_tws_smaw.sqf";
        };
	    case "USMC_Soldier_Medic"		: {
		    	_loadOut = "Cly_AddWeapon\cly_addweapon_m249_tws_smaw.sqf";
        };
	    case "USMC_Soldier_LAT"			: {
	    		_loadOut = "Cly_AddWeapon\cly_addweapon_m249_tws_smaw.sqf";
        };
	    case "USMC_Soldier_AT"			: {
		    	_loadOut = "Cly_AddWeapon\cly_addweapon_m249_tws_smaw.sqf";
        };
	    case "USMC_Soldier_HAT"			: {
		    	_loadOut = "Cly_AddWeapon\cly_addweapon_m249_tws_smaw.sqf";
        };
	    case "USMC_Soldier_AA"			: {
		    	_loadOut = "Cly_AddWeapon\cly_addweapon_m249_tws_smaw.sqf";
        };
	    case "USMC_SoldierS_Sniper"		: {
		    	_loadOut = "Cly_AddWeapon\cly_addweapon_m249_tws_smaw.sqf";
        }; 
	    case "USMC_Soldier_GL"			: {
		    	_loadOut = "Cly_AddWeapon\cly_addweapon_m249_tws_smaw.sqf";
        };
	    case "USMC_Soldier_MG"			: {
		    	_loadOut = "Cly_AddWeapon\cly_addweapon_m249_tws_smaw.sqf";   
	    };
	    case "USMC_SoldierS_Engineer"		: {
	    		_loadOut = "Cly_AddWeapon\cly_addweapon_m249_tws_smaw.sqf";
        }; 
	    case "Soldier_Sniper_PMC"		: {
		    	_loadOut = "Cly_AddWeapon\cly_addweapon_dmr_smaw.sqf";
        };		    
	    case "Soldier_Sniper_PMC"		: {
		    	_loadOut = "Cly_AddWeapon\cly_addweapon_dmr_smaw.sqf";
        };  
      };
    };
    case civilian						: {
	    
	    switch (typeOf _unit) do {
		    
	    case "TK_CIV_Takistani01_EP1"								: {
		    	_loadOut = "Cly_AddWeapon\cly_addweapon_dmr_smaw.sqf";
        };		    
	    case "TK_CIV_Takistani02_EP1"								: {
		    	_loadOut = "Cly_AddWeapon\cly_addweapon_SCAR_H_STD_TWS_SD.sqf";
        };
	    case "TK_CIV_Takistani03_EP1"								: {
		    	_loadOut = "Cly_AddWeapon\cly_addweapon_M249_TWS_M136.sqf";
        };
	    case "TK_CIV_Takistani04_EP1"								: {
		    	_loadOut = "Cly_AddWeapon\cly_addweapon_FN_FAL_ANPVS4_RPG7V.sqf";
        };
	    case "TK_CIV_Takistani05_EP1"								: {
	    		_loadOut = "Cly_AddWeapon\cly_addweapon_M249_TWS_M136.sqf";
        };
	    case "TK_CIV_Takistani06_EP1"								: {
		    	_loadOut = "Cly_AddWeapon\cly_addweapon_m249_tws_smaw.sqf";
        }; 
	    case "TK_CIV_Worker01_EP1"								: {
		    	_loadOut = "Cly_AddWeapon\cly_addweapon_dmr_smaw.sqf";
        }; 
	    case "TK_CIV_Worker02_EP1"								: {
		    	_loadOut = "Cly_AddWeapon\cly_addweapon_M4A3_RCO_GL_EP1_RPG7V.sqf";
        };
	    case "CIV_EuroMan01_EP1"									: {
		    	_loadOut = "Cly_AddWeapon\cly_addweapon_m249_tws_smaw.sqf";   
	    };
	    case "CIV_EuroMan02_EP1"									: {
	    		_loadOut = "Cly_AddWeapon\cly_addweapon_SVD_NSPU_EP1.sqf";
        };   
	    case "Citizen2_EP1"										: {
		    	_loadOut = "Cly_AddWeapon\cly_addweapon_FN_FAL_ANPVS4_RPG7V.sqf";
        };
	    case "Citizen3_EP1"										: {
	    		_loadOut = "Cly_AddWeapon\cly_addweapon_M249_TWS_M136.sqf";
        };
	    case "Dr_Hladik_EP1"									: {
		    	_loadOut = "Cly_AddWeapon\cly_addweapon_M249_TWS_Javelin.sqf";
        };
	    case "Functionary1_EP1"									: {
		    	_loadOut = "Cly_AddWeapon\cly_addweapon_m249_tws_stinger.sqf";
        };
	    case "Functionary2_EP1"									: {
		    	_loadOut = "Cly_AddWeapon\cly_addweapon_M107_TWS_smaw.sqf";
        }; 
	    case "Haris_Press_EP1"									: {
		    	_loadOut = "Cly_AddWeapon\cly_addweapon_dmr_smaw.sqf";
        }; 
	    case "Pilot_EP1"										: {
		    	_loadOut = "Cly_AddWeapon\cly_addweapon_M4A3_RCO_GL_EP1_RPG7V.sqf";
        };
	    case "Profiteer1_EP1"									: {
		    	_loadOut = "Cly_AddWeapon\cly_addweapon_m249_tws_smaw.sqf";   
	    };  
	    case "RU_Priest"										: {
		    	_loadOut = "Cly_AddWeapon\cly_addweapon_m249_tws_smaw.sqf";
        };
	    case "RU_Pilot"											: {
		    	_loadOut = "Cly_AddWeapon\cly_addweapon_SVD_NSPU_EP1.sqf";
        };
	    case "RU_Policeman"										: {
		    	_loadOut = "Cly_AddWeapon\cly_addweapon_M249_TWS_M136.sqf";
        };
	    case "RU_Doctor"										: {
		    	_loadOut = "Cly_AddWeapon\cly_addweapon_FN_FAL_ANPVS4_RPG7V.sqf";
        };
	    case "RU_Functionary1"									: {
		    	_loadOut = "Cly_AddWeapon\cly_addweapon_FN_FAL_ANPVS4_RPG7V.sqf";
        };
      };
    };
  };  
} else {
	   
switch (side _unit) do {
	
    case west							: {
	    
	    switch (typeOf _unit) do {

	    case "USMC_Soldier_Officer"		: {
		    	_loadOut = "Cly_AddWeapon\cly_addweapon_dmr_smaw.sqf";
        };		    
	    case "USMC_Soldier_SL"			: {
		    	_loadOut = "Cly_AddWeapon\cly_addweapon_dmr_smaw.sqf";
        };
	    case "USMC_Soldier_TL"			: {
		    	_loadOut = "Cly_AddWeapon\cly_addweapon_m240_scoped.sqf";
        };
	    case "USMC_Soldier_Medic"		: {
		    	_loadOut = "Cly_AddWeapon\cly_addweapon_SCAR_H_STD_EGLM_Spect_smaw.sqf";
        };
	    case "USMC_Soldier_LAT"			: {
	    		_loadOut = "Cly_AddWeapon\cly_addweapon_SCAR_H_STD_EGLM_Spect_M136.sqf";
        };
	    case "USMC_Soldier_AT"			: {
		    	_loadOut = "Cly_AddWeapon\cly_addweapon_SCAR_H_STD_EGLM_Spect_smaw.sqf";
        };
	    case "USMC_Soldier_HAT"			: {
		    	_loadOut = "Cly_AddWeapon\cly_addweapon_SCAR_H_STD_EGLM_Spect_Javelin.sqf";
        };
	    case "USMC_Soldier_AA"			: {
		    	_loadOut = "Cly_AddWeapon\cly_addweapon_SCAR_H_STD_EGLM_Spect_Stinger.sqf";
        };
	    case "USMC_SoldierS_Sniper"		: {
		    	_loadOut = "Cly_AddWeapon\cly_addweapon_M107_smaw.sqf";
        }; 
	    case "USMC_SoldierM_Marksman"		: {
		    	_loadOut = "Cly_AddWeapon\cly_addweapon_dmr_smaw.sqf";
        }; 
	    case "USMC_Soldier_GL"			: {
		    	_loadOut = "Cly_AddWeapon\cly_addweapon_SCAR_H_STD_EGLM_Spect_smaw.sqf";
        };
	    case "USMC_Soldier_MG"			: {
		    	_loadOut = "Cly_AddWeapon\cly_addweapon_m240_scoped.sqf";   
	    };
	    case "USMC_SoldierS_Engineer"		: {
	    		_loadOut = "Cly_AddWeapon\cly_addweapon_SCAR_H_STD_EGLM_Spect_smaw.sqf";
        };
	    case "FR_Commander"				: {
		    	_loadOut = "Cly_AddWeapon\cly_addweapon_m240_scoped.sqf";
        };
	    case "FR_TL"					: {
		    	_loadOut = "Cly_AddWeapon\cly_addweapon_dmr_smaw.sqf";
        };
	    case "FR_Assault_R"				: {
		    	_loadOut = "Cly_AddWeapon\cly_addweapon_SCAR_H_STD_EGLM_Spect_M136.sqf";
        };
	    case "FR_Assault_GL"			: {
		    	_loadOut = "Cly_AddWeapon\cly_addweapon_SCAR_H_STD_EGLM_Spect_M136.sqf";
        };
	    case "FR_GL"					: {
		    	_loadOut = "Cly_AddWeapon\cly_addweapon_SCAR_H_STD_EGLM_Spect_M136.sqf";
        };
	    case "FR_Corpsman"				: {
		    	_loadOut = "Cly_AddWeapon\cly_addweapon_SCAR_H_STD_EGLM_Spect_M136.sqf";
        };
	    case "FR_AR"					: {
		    	_loadOut = "Cly_AddWeapon\cly_addweapon_m240_scoped.sqf";
        };
	    case "FR_AC"					: {
		    	_loadOut = "Cly_AddWeapon\cly_addweapon_SCAR_H_STD_EGLM_Spect_M136.sqf";
        };
	    case "FR_Light"					: {
		    	_loadOut = "Cly_AddWeapon\cly_addweapon_SCAR_H_STD_EGLM_Spect_M136.sqf";
        };
	    case "FR_Sapper"				: {
		    	_loadOut = "Cly_AddWeapon\cly_addweapon_SCAR_H_STD_EGLM_Spect_M136.sqf";
        };
	    case "FR_R"					: {
		    	_loadOut = "Cly_AddWeapon\cly_addweapon_SCAR_H_STD_EGLM_Spect_M136.sqf";
        };
	    case "FR_Cooper"				: {
		    	_loadOut = "Cly_AddWeapon\cly_addweapon_m240_scoped.sqf";
        };
	    case "FR_Miles"					: {
		    	_loadOut = "Cly_AddWeapon\cly_addweapon_m240_scoped.sqf";
        };
	    case "FR_OHara"					: {
		    	_loadOut = "Cly_AddWeapon\cly_addweapon_SCAR_H_STD_EGLM_Spect_M136.sqf";
        };
	    case "FR_Rodriguez"				: {
		    	_loadOut = "Cly_AddWeapon\cly_addweapon_m240_scoped.sqf";
        };
	    case "FR_Sykes"					: {
		    	_loadOut = "Cly_AddWeapon\cly_addweapon_dmr_smaw.sqf";
        };
	    case "US_Soldier_Officer_EP1"		: {
		    	_loadOut = "Cly_AddWeapon\cly_addweapon_m240_scoped.sqf";
        };		    
	    case "US_Soldier_SL_EP1"			: {
		    	_loadOut = "Cly_AddWeapon\cly_addweapon_dmr_smaw.sqf";
        };
	    case "US_Soldier_TL_EP1"			: {
		    	_loadOut = "Cly_AddWeapon\cly_addweapon_m240_scoped.sqf";
        };
	    case "US_Soldier_Spotter_EP1"		: {
	    		_loadOut = "Cly_AddWeapon\cly_addweapon_SCAR_H_STD_EGLM_Spect_M136.sqf";
        };
	    case "US_Soldier_Sniper_NV_EP1"	: {
		    	_loadOut = "Cly_AddWeapon\cly_addweapon_M110_TWS_smaw.sqf";
        };
	    case "US_Soldier_Sniper_EP1"		: {
		    	_loadOut = "Cly_AddWeapon\cly_addweapon_M107_smaw.sqf";
        };
	    case "US_Soldier_SniperH_EP1"		: {
		    	_loadOut = "Cly_AddWeapon\cly_addweapon_M107_smaw.sqf";
        };
	    case "US_Soldier_Pilot_EP1"		: {
		    	_loadOut = "Cly_AddWeapon\cly_addweapon_SCAR_H_STD_EGLM_Spect_smaw.sqf";
        }; 
	    case "US_Soldier_Medic_EP1"		: {
		    	_loadOut = "Cly_AddWeapon\cly_addweapon_SCAR_H_STD_EGLM_Spect_smaw.sqf";
        }; 
	    case "US_Soldier_Marksman_EP1"	: {
		    	_loadOut = "Cly_AddWeapon\cly_addweapon_dmr_smaw.sqf";
        };
	    case "US_Soldier_MG_EP1"			: {
		    	_loadOut = "Cly_AddWeapon\cly_addweapon_m240_scoped.sqf";   
	    };
	    case "US_Soldier_HAT_EP1"		: {
	    		_loadOut = "Cly_AddWeapon\cly_addweapon_SCAR_H_STD_EGLM_Spect_Javelin.sqf";
        };
	    case "US_Soldier_LAT_EP1"		: {
		    	_loadOut = "Cly_AddWeapon\cly_addweapon_SCAR_H_STD_EGLM_Spect_M136.sqf";
        };
	    case "US_Soldier_GL_EP1"			: {
		    	_loadOut = "Cly_AddWeapon\cly_addweapon_SCAR_H_STD_EGLM_Spect_M136.sqf";
        };
	    case "US_Soldier_Engineer_EP1"	: {
		    	_loadOut = "Cly_AddWeapon\cly_addweapon_SCAR_H_STD_EGLM_Spect_M136.sqf";
        };
	    case "US_Soldier_Crew_EP1"		: {
		    	_loadOut = "Cly_AddWeapon\cly_addweapon_SCAR_H_STD_EGLM_Spect_M136.sqf";
        };
	    case "US_Soldier_Light_EP1"		: {
		    	_loadOut = "Cly_AddWeapon\cly_addweapon_SCAR_H_STD_EGLM_Spect_M136.sqf";
        };
	    case "US_Soldier_EP1"			: {
		    	_loadOut = "Cly_AddWeapon\cly_addweapon_SCAR_H_STD_EGLM_Spect_M136.sqf";
        };
	    case "US_Delta_Force_AR_EP1"		: {
		    	_loadOut = "Cly_AddWeapon\cly_addweapon_m240_scoped.sqf";
        };
	    case "US_Delta_Force_Air_Controller_EP1"			: {
		    	_loadOut = "Cly_AddWeapon\cly_addweapon_SCAR_H_STD_EGLM_Spect_M136.sqf";
        }; 
	    case "US_Delta_Force_MG_EP1"						: {
		    	_loadOut = "Cly_AddWeapon\cly_addweapon_m240_scoped.sqf";
        }; 
	    case "US_Delta_Force_Assault_EP1"					: {
		    	_loadOut = "Cly_AddWeapon\cly_addweapon_SCAR_H_STD_EGLM_Spect_M136.sqf";
        };
	    case "US_Delta_Force_EP1"						: {
		    	_loadOut = "Cly_AddWeapon\cly_addweapon_m240_scoped.sqf";   
	    };
	    case "US_Delta_Force_M14_EP1"						: {
	    		_loadOut = "Cly_AddWeapon\cly_addweapon_SCAR_H_STD_EGLM_Spect_smaw.sqf";
        };
	    case "US_Delta_Force_Marksman_EP1"					: {
		    	_loadOut = "Cly_AddWeapon\cly_addweapon_dmr_smaw.sqf";
        };
	    case "US_Delta_Force_Medic_EP1"					: {
		    	_loadOut = "Cly_AddWeapon\cly_addweapon_SCAR_H_STD_EGLM_Spect_M136.sqf";
        };
	    case "US_Delta_Force_Night_EP1"					: {
		    	_loadOut = "Cly_AddWeapon\cly_addweapon_SCAR_H_STD_EGLM_Spect_M136.sqf";
        };
	    case "US_Delta_Force_SD_EP1"						: {
		    	_loadOut = "Cly_AddWeapon\cly_addweapon_SCAR_H_STD_EGLM_Spect_M136.sqf";
        };
	    case "US_Delta_Force_TL_EP1"						: {
		    	_loadOut = "Cly_AddWeapon\cly_addweapon_dmr_smaw.sqf";
        };
	    case "US_Delta_Force_Undercover_Takistani06_EP1"		: {
		    	_loadOut = "Cly_AddWeapon\cly_addweapon_SCAR_H_STD_EGLM_Spect_M136.sqf";
        }; 
	    case "WDL_Mercenary_Default9"						: {
		    	_loadOut = "Cly_AddWeapon\cly_addweapon_dmr_smaw.sqf";
        };		    
	    case "Mercenary_Default11"						: {
		    	_loadOut = "Cly_AddWeapon\cly_addweapon_dmr_smaw.sqf";
        };
      };
    };
    
    case east							: {
	    
	    switch (typeOf _unit) do {
		    
	    case "USMC_Soldier_SL"			: {
		    	_loadOut = "Cly_AddWeapon\cly_addweapon_SCAR_H_STD_EGLM_Spect_smaw.sqf";
        };
	    case "USMC_Soldier_TL"			: {
		    	_loadOut = "Cly_AddWeapon\cly_addweapon_SCAR_H_STD_EGLM_Spect_smaw.sqf";
        };
	    case "USMC_Soldier_Medic"		: {
		    	_loadOut = "Cly_AddWeapon\cly_addweapon_SCAR_H_STD_EGLM_Spect_smaw.sqf";
        };
	    case "USMC_Soldier_LAT"			: {
	    		_loadOut = "Cly_AddWeapon\cly_addweapon_SCAR_H_STD_EGLM_Spect_smaw.sqf";
        };
	    case "USMC_Soldier_AT"			: {
		    	_loadOut = "Cly_AddWeapon\cly_addweapon_SCAR_H_STD_EGLM_Spect_smaw.sqf";
        };
	    case "USMC_Soldier_HAT"			: {
		    	_loadOut = "Cly_AddWeapon\cly_addweapon_SCAR_H_STD_EGLM_Spect_smaw.sqf";
        };
	    case "USMC_Soldier_AA"			: {
		    	_loadOut = "Cly_AddWeapon\cly_addweapon_SCAR_H_STD_EGLM_Spect_smaw.sqf";
        };
	    case "USMC_SoldierS_Sniper"		: {
		    	_loadOut = "Cly_AddWeapon\cly_addweapon_SCAR_H_STD_EGLM_Spect_smaw.sqf";
        }; 
	    case "USMC_Soldier_GL"			: {
		    	_loadOut = "Cly_AddWeapon\cly_addweapon_SCAR_H_STD_EGLM_Spect_smaw.sqf";
        };
	    case "RU_Soldier"				: {
	    		_loadOut = "Cly_AddWeapon\cly_addweapon_AKS_74_GOSHAWK_METIS.sqf";
        };  
	    case "RUS_Commander"			: {
		    	_loadOut = "Cly_AddWeapon\cly_addweapon_bizon_silenced_RPG7V.sqf";   
	    }; 
	    case "RUS_Soldier_TL"			: {
		    	_loadOut = "Cly_AddWeapon\cly_addweapon_bizon_JAVELIN.sqf";   
	    };
	    case "RUS_Soldier1"				: {
		    	_loadOut = "Cly_AddWeapon\cly_addweapon_bizon_RPG7V.sqf";   
	    };
	    case "RUS_Soldier2"				: {
		    	_loadOut = "Cly_AddWeapon\cly_addweapon_bizon_silenced_RPG7V.sqf";   
	    };
	    case "RUS_Soldier3"				: {
		    	_loadOut = "Cly_AddWeapon\cly_addweapon_bizon_METIS.sqf";   
	    };
	    case "RUS_Soldier_GL"			: {
		    	_loadOut = "Cly_AddWeapon\cly_addweapon_AKS_74_GOSHAWK_METIS.sqf";   
	    };
	    case "RUS_Soldier_Marksman"		: {
		    	_loadOut = "Cly_AddWeapon\cly_addweapon_bizon_silenced_RPG7V.sqf";   
	    };
	    case "RUS_Soldier_Sab"			: {
		    	_loadOut = "Cly_AddWeapon\cly_addweapon_bizon_silenced_RPG7V.sqf";   
	    };   
	    case "ETaliban11"				: {
		    	_loadOut = "Cly_AddWeapon\cly_addweapon_dmr_smaw.sqf";
        };		    
	    case "Ins_Soldier_Sniper"		: {
		    	_loadOut = "Cly_AddWeapon\cly_addweapon_dmr_smaw.sqf";
        };
      };
    };
    
    case resistance						: {

	    switch (typeOf _unit) do {
		    
	    case "USMC_Soldier_SL"			: {
		    	_loadOut = "Cly_AddWeapon\cly_addweapon_SCAR_H_STD_EGLM_Spect_smaw.sqf";
        };
	    case "USMC_Soldier_TL"			: {
		    	_loadOut = "Cly_AddWeapon\cly_addweapon_SCAR_H_STD_EGLM_Spect_smaw.sqf";
        };
	    case "USMC_Soldier_Medic"		: {
		    	_loadOut = "Cly_AddWeapon\cly_addweapon_SCAR_H_STD_EGLM_Spect_smaw.sqf";
        };
	    case "USMC_Soldier_LAT"			: {
	    		_loadOut = "Cly_AddWeapon\cly_addweapon_SCAR_H_STD_EGLM_Spect_smaw.sqf";
        };
	    case "USMC_Soldier_AT"			: {
		    	_loadOut = "Cly_AddWeapon\cly_addweapon_SCAR_H_STD_EGLM_Spect_smaw.sqf";
        };
	    case "USMC_Soldier_HAT"			: {
		    	_loadOut = "Cly_AddWeapon\cly_addweapon_SCAR_H_STD_EGLM_Spect_smaw.sqf";
        };
	    case "USMC_Soldier_AA"			: {
		    	_loadOut = "Cly_AddWeapon\cly_addweapon_SCAR_H_STD_EGLM_Spect_smaw.sqf";
        };
	    case "USMC_SoldierS_Sniper"		: {
		    	_loadOut = "Cly_AddWeapon\cly_addweapon_SCAR_H_STD_EGLM_Spect_smaw.sqf";
        }; 
	    case "USMC_Soldier_GL"			: {
		    	_loadOut = "Cly_AddWeapon\cly_addweapon_SCAR_H_STD_EGLM_Spect_smaw.sqf";
        };
	    case "USMC_Soldier_MG"			: {
		    	_loadOut = "Cly_AddWeapon\cly_addweapon_SCAR_H_STD_EGLM_Spect_smaw.sqf";  
	    };
	    case "USMC_SoldierS_Engineer"		: {
	    		_loadOut = "Cly_AddWeapon\cly_addweapon_SCAR_H_STD_EGLM_Spect_smaw.sqf";
        }; 
	    case "Soldier_Sniper_PMC"		: {
		    	_loadOut = "Cly_AddWeapon\cly_addweapon_dmr_smaw.sqf";
        };		    
	    case "Soldier_Sniper_PMC"		: {
		    	_loadOut = "Cly_AddWeapon\cly_addweapon_dmr_smaw.sqf";
        };  
      };
    };
   
    case civilian						: {
	    
	    switch (typeOf _unit) do {
		    
	    case "TK_CIV_Takistani01_EP1"		: {
		    	_loadOut = "Cly_AddWeapon\cly_addweapon_dmr_smaw.sqf";
        };		    
	    case "TK_CIV_Takistani02_EP1"		: {
		    	_loadOut = "Cly_AddWeapon\cly_addweapon_dmr_smaw.sqf";
        };
	    case "TK_CIV_Takistani03_EP1"		: {
		    	_loadOut = "Cly_AddWeapon\cly_addweapon_m240_scoped.sqf";
        };
	    case "TK_CIV_Takistani04_EP1"		: {
		    	_loadOut = "Cly_AddWeapon\cly_addweapon_SCAR_H_STD_EGLM_Spect_smaw.sqf";
        };
	    case "TK_CIV_Takistani05_EP1"		: {
	    		_loadOut = "Cly_AddWeapon\cly_addweapon_SCAR_H_STD_EGLM_Spect_M136.sqf";
        };
	    case "TK_CIV_Takistani06_EP1"		: {
		    	_loadOut = "Cly_AddWeapon\cly_addweapon_SCAR_H_STD_EGLM_Spect_smaw.sqf";
        };
	    case "TK_CIV_Worker01_EP1"		: {
		    	_loadOut = "Cly_AddWeapon\cly_addweapon_dmr_smaw.sqf";
        }; 
	    case "TK_CIV_Worker02_EP1"		: {
		    	_loadOut = "Cly_AddWeapon\cly_addweapon_SCAR_H_STD_EGLM_Spect_smaw.sqf";
        };
	    case "CIV_EuroMan01_EP1"			: {
		    	_loadOut = "Cly_AddWeapon\cly_addweapon_m240_scoped.sqf";   
	    };
	    case "CIV_EuroMan02_EP1"			: {
	    		_loadOut = "Cly_AddWeapon\cly_addweapon_SCAR_H_STD_EGLM_Spect_smaw.sqf";
        };
	    case "Citizen2_EP1"				: {
		    	_loadOut = "Cly_AddWeapon\cly_addweapon_SCAR_H_STD_EGLM_Spect_smaw.sqf";
        };
	    case "Citizen3_EP1"				: {
	    		_loadOut = "Cly_AddWeapon\cly_addweapon_SCAR_H_STD_EGLM_Spect_M136.sqf";
        };
	    case "Dr_Hladik_EP1"			: {
		    	_loadOut = "Cly_AddWeapon\cly_addweapon_SCAR_H_STD_EGLM_Spect_Javelin.sqf";
        };
	    case "Functionary1_EP1"			: {
		    	_loadOut = "Cly_AddWeapon\cly_addweapon_SCAR_H_STD_EGLM_Spect_Stinger.sqf";
        };
	    case "Functionary2_EP1"			: {
		    	_loadOut = "Cly_AddWeapon\cly_addweapon_M107_smaw.sqf";
        }; 
	    case "Haris_Press_EP1"			: {
		    	_loadOut = "Cly_AddWeapon\cly_addweapon_dmr_smaw.sqf";
        }; 
	    case "Pilot_EP1"				: {
		    	_loadOut = "Cly_AddWeapon\cly_addweapon_SCAR_H_STD_EGLM_Spect_smaw.sqf";
        };
	    case "Profiteer1_EP1"			: {
		    	_loadOut = "Cly_AddWeapon\cly_addweapon_m240_scoped.sqf";   
	    };
	    case "RU_Priest"				: {
		    	_loadOut = "Cly_AddWeapon\cly_addweapon_SCAR_H_STD_EGLM_Spect_smaw.sqf";
        };
	    case "RU_Pilot"					: {
		    	_loadOut = "Cly_AddWeapon\cly_addweapon_SCAR_H_STD_EGLM_Spect_smaw.sqf";
        };
	    case "RU_Policeman"				: {
		    	_loadOut = "Cly_AddWeapon\cly_addweapon_m240_scoped.sqf";
        };
	    case "RU_Doctor"				: {
		    	_loadOut = "Cly_AddWeapon\cly_addweapon_SCAR_H_STD_EGLM_Spect_smaw.sqf";
        };   
	    case "RU_Functionary1"			: {
		    	_loadOut = "Cly_AddWeapon\cly_addweapon_SCAR_H_STD_EGLM_Spect_smaw.sqf";
        } 
      };
    };
  };
};
_nul=[_unit] execvm _loadOut;
