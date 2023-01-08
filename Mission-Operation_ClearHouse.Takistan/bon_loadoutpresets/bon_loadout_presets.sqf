//by Bon_Inf*


if(typename _this == "ARRAY") then{
	if(count _this > 1) then { //probably called from an action
		bon_presets_caller = _this select 1;
	} else {bon_presets_caller = player};
} else {
	bon_presets_caller = player;
};



presets = [];
#include "presets\preset_rifleman.sqf"
#include "presets\preset_grenadier.sqf"
#include "presets\preset_machinegunner.sqf"
#include "presets\preset_sniper.sqf"
#include "presets\preset_antitank_maaws.sqf"
#include "presets\preset_antitank_rpg.sqf"
#include "presets\preset_antitank_javelin.sqf"




_presetdlg = createDialog "PresetDialog";