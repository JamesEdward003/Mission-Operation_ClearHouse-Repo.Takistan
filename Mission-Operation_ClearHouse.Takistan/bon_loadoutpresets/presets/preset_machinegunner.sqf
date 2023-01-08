_presetclass = "Machinegunner";




_presetname = "MG36 + Ammo";

_primaryweapon = "MG36_camo";

_secondaryweapon = "US_Backpack_EP1";

_items_sidearm = ["NVGoggles","ItemMap","ItemGPS","ItemCompass","ItemWatch","ItemRadio","Binocular"];

_magazines = [["100Rnd_556x45_BetaCMag",5],["SmokeShell",1],["IR_Strobe_Marker",1]]; 
_ruckmags = [["100Rnd_556x45_BetaCMag",5],["PipeBomb",1]];

_ruckweaps = [];

_preset1 = [_presetname,_presetclass,_primaryweapon,_secondaryweapon,_items_sidearm,_magazines,_ruckmags,_ruckweaps];




_presetname = "M240 Scope";

_primaryweapon = "m240_scoped_EP1";

_secondaryweapon = "";

_items_sidearm = ["NVGoggles","ItemMap","ItemGPS","ItemCompass","ItemWatch","ItemRadio","Binocular"];
_magazines = [["100Rnd_762x51_M240",5],["SmokeShell",1],["IR_Strobe_Marker",1]];

_ruckmags = [];

_ruckweaps = [];

_preset2 = [_presetname,_presetclass,_primaryweapon,_secondaryweapon,_items_sidearm,_magazines,_ruckmags,_ruckweaps];




_presetname = "M249 SAW";

_primaryweapon = "M249_EP1";

_secondaryweapon = "";

_items_sidearm = ["NVGoggles","ItemMap","ItemGPS","ItemCompass","ItemWatch","ItemRadio","Binocular"];

_magazines = [["100Rnd_556x45_M249",5],["SmokeShell",1],["IR_Strobe_Marker",1]];

_ruckmags = [];

_ruckweaps = [];

_preset3 = [_presetname,_presetclass,_primaryweapon,_secondaryweapon,_items_sidearm,_magazines,_ruckmags,_ruckweaps];




_presetname = "M249 SAW Scope";

_primaryweapon = "M249_m145_EP1";

_secondaryweapon = "";

_items_sidearm = ["NVGoggles","ItemMap","ItemGPS","ItemCompass","ItemWatch","ItemRadio","Binocular"];

_magazines = [["100Rnd_556x45_M249",5],["SmokeShell",1],["IR_Strobe_Marker",1]];

_ruckmags = [];

_ruckweaps = [];

_preset4 = [_presetname,_presetclass,_primaryweapon,_secondaryweapon,_items_sidearm,_magazines,_ruckmags,_ruckweaps];



_presetname = "M249 SAW TWS";
_primaryweapon = "M249_TWS_EP1";

_secondaryweapon = "";

_items_sidearm = ["NVGoggles","ItemMap","ItemGPS","ItemCompass","ItemWatch","ItemRadio","Binocular"];

_magazines = [["100Rnd_556x45_M249",5],["SmokeShell",1],["IR_Strobe_Marker",1]];

_ruckmags = [];

_ruckweaps = [];

_preset5 = [_presetname,_presetclass,_primaryweapon,_secondaryweapon,_items_sidearm,_magazines,_ruckmags,_ruckweaps];





_presetname = "M60E4";

_primaryweapon = "M60A4_EP1";

_secondaryweapon = "";

_items_sidearm = ["NVGoggles","ItemMap","ItemGPS","ItemCompass","ItemWatch","ItemRadio","Binocular"];

_magazines = [["100Rnd_762x51_M240",5],["SmokeShell",1],["IR_Strobe_Marker",1]];

_ruckmags = [];

_ruckweaps = [];

_preset6 = [_presetname,_presetclass,_primaryweapon,_secondaryweapon,_items_sidearm,_magazines,_ruckmags,_ruckweaps];




_presetname = "Mk48 Mod 0";

_primaryweapon = "Mk_48_DES_EP1";

_secondaryweapon = "";

_items_sidearm = ["NVGoggles","ItemMap","ItemGPS","ItemCompass","ItemWatch","ItemRadio","Binocular"];

_magazines = [["100Rnd_762x51_M240",5],["SmokeShell",1],["IR_Strobe_Marker",1]];

_ruckmags = [];

_ruckweaps = [];

_preset7 = [_presetname,_presetclass,_primaryweapon,_secondaryweapon,_items_sidearm,_magazines,_ruckmags,_ruckweaps];




_presetname = "PKM";
_primaryweapon = "PK";

_secondaryweapon = "";

_items_sidearm = ["NVGoggles","ItemMap","ItemGPS","ItemCompass","ItemWatch","ItemRadio","Binocular"];

_magazines = [["100Rnd_762x54_PK",5],["SmokeShell",1],["IR_Strobe_Marker",1]];

_ruckmags = [];

_ruckweaps = [];

_preset8 = [_presetname,_presetclass,_primaryweapon,_secondaryweapon,_items_sidearm,_magazines,_ruckmags,_ruckweaps];




_presetname = "RPK + Ammo";

_primaryweapon = "RPK_74";

_secondaryweapon = "US_Backpack_EP1";

_items_sidearm = ["NVGoggles","ItemMap","ItemGPS","ItemCompass","ItemWatch","ItemRadio","Binocular"];

_magazines = [["SmokeShell",1],["75Rnd_545x39_RPK",5],["IR_Strobe_Marker",1]];

_ruckmags = [["75Rnd_545x39_RPK",5],["PipeBomb",1]];

_ruckweaps = [];

_preset9 = [_presetname,_presetclass,_primaryweapon,_secondaryweapon,_items_sidearm,_magazines,_ruckmags,_ruckweaps];







presets=presets+[_preset1,_preset2,_preset3,_preset4,_preset5,_preset6,_preset7,_preset8,_preset9];





////////////////// BAF /////////////////////////////
if(isNil "tfor_BAF") then {tfor_BAF = false};

_presetname = "L110A1 AIM";
_primaryweapon = "BAF_L110A1_Aim";
_secondaryweapon = "";
_items_sidearm = ["NVGoggles","ItemMap","ItemGPS","ItemCompass","ItemWatch","ItemRadio","Binocular"];
_magazines = [["200Rnd_556x45_L110A1",5],["SmokeShell",1],["IR_Strobe_Marker",1]];
_ruckmags = [];
_ruckweaps = [];
_preset_baf_1 = [_presetname,_presetclass,_primaryweapon,_secondaryweapon,_items_sidearm,_magazines,_ruckmags,_ruckweaps];



_presetname = "L7A2 GPMG";
_primaryweapon = "BAF_L7A2_GPMG";
_secondaryweapon = "";
_items_sidearm = ["NVGoggles","ItemMap","ItemGPS","ItemCompass","ItemWatch","ItemRadio","Binocular"];
_magazines = [["100Rnd_762x51_M240",5],["SmokeShell",1],["IR_Strobe_Marker",1]];
_ruckmags = [];
_ruckweaps = [];
_preset_baf_2 = [_presetname,_presetclass,_primaryweapon,_secondaryweapon,_items_sidearm,_magazines,_ruckmags,_ruckweaps];


if(tfor_BAF) then{
	presets = presets + [_preset_baf_1,_preset_baf_2];
};





////////////////// PMC /////////////////////////////
if(isNil "tfor_PMC") then {tfor_PMC = false};

_presetname = "XM8 SAW + Ammo";
_primaryweapon = "m8_SAW";
_secondaryweapon = "US_Backpack_EP1";
_items_sidearm = ["NVGoggles","ItemMap","ItemGPS","ItemCompass","ItemWatch","ItemRadio","Binocular"];
_magazines = [["100Rnd_556x45_BetaCMag",5],["SmokeShell",1],["IR_Strobe_Marker",1]];
_ruckmags = [["100Rnd_556x45_BetaCMag",5],["PipeBomb",1]];
_ruckweaps = [];
_preset_pmc_1 = [_presetname,_presetclass,_primaryweapon,_secondaryweapon,_items_sidearm,_magazines,_ruckmags,_ruckweaps];

if(tfor_PMC) then{
	presets = presets + [_preset_pmc_1];
};