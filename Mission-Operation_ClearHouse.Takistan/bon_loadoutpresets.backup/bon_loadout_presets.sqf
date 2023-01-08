//by Bon_Inf* for my 10th mates. Requires ACE2

if(not local player) exitWith{};

WaitUntil{not isNull player};

private ['_playername','_weapons','_magazines','_ruckweapons','_ruckmags'];
_uid = _this select 0;

if(not isMultiplayer) then{_uid="my_uid"};

#include "presets.sqf"
_presetdlg = createDialog "PresetDialog";

if(true) exitWith{};