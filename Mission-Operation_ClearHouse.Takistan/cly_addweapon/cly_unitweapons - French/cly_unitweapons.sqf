////////////////////////////////////////////////////////////////////
_unit 		= _this select 0;
_unitname 	= vehicleVarName _unit;
_loadOut 	= [];

if (isNil "_loadOut") then {_loadOut = objNull};

if (isMultiplayer) then {	

_unit addMPEventHandler ["MPRespawn",{_this execVM "Cly_addweapon\cly_unitweapons.sqf"}];

};

if (daytime > 18.25 || daytime < 5.50) then {
		    
switch (typeOf _unit) do {

    case "OFrP_Soldier_CoS_TeamLeader"			: {
    	_loadOut = "Cly_AddWeapon\cly_addweapon_OFrP_Minimi_para_Optronic_HG_ERYX.sqf";
        };		    
    case "OFrP_Soldier_CoS_CPA_Minimi"				: {
    	_loadOut = "Cly_AddWeapon\cly_addweapon_OFrP_Minimi_para_Optronic_HG_LRAC.sqf";
        };
    case "OFrP_Soldier_CoS_Minimi"				: {
    	_loadOut = "Cly_AddWeapon\cly_addweapon_OFrP_Minimi_para_Optronic_HG_LRAC.sqf";
        };
    case "OFrP_Soldier_CoS_Maximi"				: {
    	_loadOut = "Cly_AddWeapon\cly_addweapon_OFrP_Minimi_para_Optronic_HG_ABL.sqf";
        };
    case "OFrP_Soldier_CoS_Medic"					: {
    	_loadOut = "Cly_AddWeapon\cly_addweapon_OFrP_FAMAS_FE_Optronic_eotech_LRAC.sqf";
        };
    case "OFrP_Soldier_CoS_ABL"			: {
    		_loadOut = "Cly_AddWeapon\cly_addweapon_OFrP_Minimi_para_Optronic_HG_ABL.sqf";
        };
    case "OFrP_Soldier_CoS_ERYX"				: {
    	_loadOut = "Cly_AddWeapon\cly_addweapon_OFrP_Minimi_para_Optronic_HG_ERYX.sqf";
        };
    case "OFrP_Soldier_Cos_Javelin"				: {
    	_loadOut = "Cly_AddWeapon\cly_addweapon_dmr_javelin.sqf";
        };
    case "OFrP_Soldier_CoS_Saboteur"				: {
    	_loadOut = "Cly_AddWeapon\cly_addweapon_OFrP_Minimi_para_Optronic_HG_ABL.sqf";
        };
    case "OFrP_Soldier_CoS"				: {
    	_loadOut = "Cly_AddWeapon\cly_addweapon_OFrP_Minimi_para_Optronic_HG_ABL.sqf";
        };
    case "OFrP_Soldier_CoS_Laser"				: {
    	_loadOut = "Cly_AddWeapon\cly_addweapon_OFrP_Laserdesignator_dmr_javelin.sqf";
        };
    case "OFrP_Soldier_CoS_Grenadier"			: {
    		_loadOut = "Cly_AddWeapon\cly_addweapon_OFrP_FAMAS_FE_Optronic_M203_ABL.sqf";
        };
    case "OFrP_Soldier_COS_Radio"				: {
    	_loadOut = "Cly_AddWeapon\cly_addweapon_OFrP_FAMAS_FE_Optronic_M203_ABL.sqf";
        };
    case "OFrP_Soldier_COS_SniperFRF2"				: {
    	_loadOut = "Cly_AddWeapon\cly_addweapon_OFrP_FAMAS_FE_Optronic_M203_ERYX.sqf";
        };
    case "OFrP_Soldier_COS_SniperHK417"				: {
    	_loadOut = "Cly_AddWeapon\cly_addweapon_OFrP_FAMAS_FE_Optronic_M203_ABL.sqf";
        };
    case "OFrP_Soldier_T3"		: {
    	_loadOut = "Cly_AddWeapon\cly_addweapon_OFrP_FAMAS_FE_Optronic_M203_ABL.sqf";
        };
    case "OFrP_Soldier_T3_INF"			: {
    	_loadOut = "Cly_AddWeapon\cly_addweapon_OFrP_FAMAS_FE_Optronic_eotech_LRAC.sqf";
        };
    case "OFrP_Soldier_T3_LEGION"		: {
    	_loadOut = "Cly_AddWeapon\cly_addweapon_OFrP_FAMAS_FE_Optronic_M203_LRAC.sqf";
        };
    case "OFrP_Soldier_T3_PARA"		: {
    		_loadOut = "Cly_AddWeapon\cly_addweapon_OFrP_Minimi_para_Optronic_HG_ABL.sqf";
        };
    case "OFrP_Soldier_T3_CIRAS_Inf"				: {
    	_loadOut = "Cly_AddWeapon\cly_addweapon_OFrP_Minimi_para_Optronic_HG_ABL.sqf";
        };
    case "OFrP_Soldier_T3_DE"		: {
    	_loadOut = "Cly_AddWeapon\cly_addweapon_OFrP_Minimi_para_Optronic_HG_LRAC.sqf";
        };
    case "OFrP_Soldier_T3_DE_INF"			: {
    	_loadOut = "Cly_AddWeapon\cly_addweapon_OFrP_Minimi_para_Optronic_HG_ERYX.sqf";
        };
    case "OFrP_Soldier_T3_DE_LEGION"					: {
    	_loadOut = "Cly_AddWeapon\cly_addweapon_OFrP_Minimi_para_Optronic_HG_LRAC.sqf";
        };
    case "OFrP_Soldier_T3_DE_PARA"			: {
    	_loadOut = "Cly_AddWeapon\cly_addweapon_OFrP_Minimi_para_Optronic_HG_ABL.sqf";
        };
        
    };
      
} else {
	    
switch (typeOf _unit) do {

    case "OFrP_Soldier_CoS_TeamLeader"			: {
    	_loadOut = "Cly_AddWeapon\cly_addweapon_OFrP_Maximi_para_eotech_HG_ERYX.sqf";
        };	
    case "OFrP_Soldier_CoS_CPA_Minimi"				: {
    	_loadOut = "Cly_AddWeapon\cly_addweapon_dmr.sqf";
        };	    
    case "OFrP_Soldier_CoS_Minimi"				: {
    	_loadOut = "Cly_AddWeapon\cly_addweapon_dmr.sqf";
        };
    case "OFrP_Soldier_CoS_Maximi"				: {
    	_loadOut = "Cly_AddWeapon\cly_addweapon_OFrP_Maximi_para_eotech_HG_LRAC.sqf";
        };
    case "OFrP_Soldier_CoS_Medic"					: {
    	_loadOut = "Cly_AddWeapon\cly_addweapon_m249_tws.sqf";
        };
    case "OFrP_Soldier_CoS_ABL"			: {
    		_loadOut = "Cly_AddWeapon\cly_addweapon_m249_tws.sqf";
        };
    case "OFrP_Soldier_CoS_ERYX"				: {
    	_loadOut = "Cly_AddWeapon\cly_addweapon_m249_tws.sqf";
        };
    case "OFrP_Soldier_Cos_Javelin"				: {
    	_loadOut = "Cly_AddWeapon\cly_addweapon_M249_TWS_M136.sqf";
        };
    case "OFrP_Soldier_CoS_Saboteur"				: {
    	_loadOut = "Cly_AddWeapon\cly_addweapon_dmr_smaw.sqf";
        };
    case "OFrP_Soldier_CoS"				: {
    	_loadOut = "Cly_AddWeapon\cly_addweapon_dmr_javelin.sqf";
        };
    case "OFrP_Soldier_CoS_Laser"				: {
    	_loadOut = "Cly_AddWeapon\cly_addweapon_m249_tws_stinger.sqf";
        };
    case "OFrP_Soldier_CoS_Grenadier"			: {
    		_loadOut = "Cly_AddWeapon\cly_addweapon_m249_tws.sqf";
        };
    case "OFrP_Soldier_COS_Radio"				: {
    	_loadOut = "Cly_AddWeapon\cly_addweapon_m249_tws.sqf";
        };
    case "OFrP_Soldier_COS_SniperFRF2"				: {
    	_loadOut = "Cly_AddWeapon\cly_addweapon_OFrP_FRF2_J8_CamoDE_var2_ERYX.sqf";
        };
    case "OFrP_Soldier_COS_SniperHK417"				: {
    	_loadOut = "Cly_AddWeapon\cly_addweapon_OFrP_HK_417D_J8_HG_CamoDE_LRAC.sqf";
        };
    case "OFrP_Soldier_T3"		: {
    	_loadOut = "Cly_AddWeapon\cly_addweapon_dmr.sqf";
        };
    case "OFrP_Soldier_T3_INF"			: {
    	_loadOut = "Cly_AddWeapon\cly_addweapon_M107_TWS.sqf";
        };
    case "OFrP_Soldier_T3_LEGION"		: {
    	_loadOut = "Cly_AddWeapon\cly_addweapon_M110_TWS.sqf";
        };
    case "OFrP_Soldier_T3_PARA"		: {
    		_loadOut = "Cly_AddWeapon\cly_addweapon_dmr.sqf";
        };
    case "OFrP_Soldier_T3_CIRAS_Inf"				: {
    	_loadOut = "Cly_AddWeapon\cly_addweapon_OFrP_Maximi_para_eotech_HG_ERYX.sqf";
        };
    case "OFrP_Soldier_T3_DE"		: {
    	_loadOut = "Cly_AddWeapon\cly_addweapon_OFrP_Maximi_para_eotech_HG_ERYX.sqf";
        };
    case "OFrP_Soldier_T3_DE_INF"			: {
    	_loadOut = "Cly_AddWeapon\cly_addweapon_OFrP_Maximi_para_eotech_HG_ERYX.sqf";
        };
    case "OFrP_Soldier_T3_DE_LEGION"					: {
    	_loadOut = "Cly_AddWeapon\cly_addweapon_OFrP_Maximi_para_eotech_HG_ERYX.sqf";
        };
    case "OFrP_Soldier_T3_DE_PARA"			: {
    	_loadOut = "Cly_AddWeapon\cly_addweapon_MP5SD.sqf";
        };
        
    };
    
};

_nul=[_unit] execvm _loadOut;

_loadOut