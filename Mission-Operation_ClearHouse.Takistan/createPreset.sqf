private ['_weapons','_magazines','_ruckweps','_ruckmags'];

_weapons = weapons player;

_magazines = [];
_tempmagazines = magazines player;
while{count _tempmagazines > 0} do{
	_currmag = _tempmagazines select 0;
	_count = {_x == _currmag} count _tempmagazines;
	_magazines = _magazines + [[_currmag,_count]];
	_tempmagazines = _tempmagazines - [_currmag];
};

Rucksacks=["ACE_Rucksack_MOLLE_Green","ACE_Rucksack_MOLLE_Brown","ACE_Rucksack_MOLLE_Wood","ACE_Rucksack_MOLLE_ACU","ACE_Rucksack_MOLLE_WMARPAT","ACE_Rucksack_MOLLE_DMARPAT","ACE_Rucksack_MOLLE_Green_Medic","ACE_Rucksack_MOLLE_Brown_Medic","ACE_Rucksack_MOLLE_ACU_Medic","ACE_Rucksack_MOLLE_WMARPAT_Medic","ACE_Rucksack_MOLLE_DMARPAT_Medic"];
_haveRuck = (count _weapons) - (count (_weapons - Rucksacks)) < (count _weapons);
if(_haveRuck) then{
	_ruckweps = player getVariable "ACE_RuckWepContents";
	_ruckmags = player getVariable "ACE_RuckMagContents";
};

if(isNil "_ruckweps") then{_ruckweps = []};
if(isNil "_ruckmags") then{_ruckmags = []};
_weapononback = player getVariable "ACE_weapononback";
if(isNil "_weapononback") then{_weapon = ""};



copyToClipboard format['
	_presetname = "<give me a name>"; 
	_presetclass = ""; 
	_weapons = %1; 
	_magazines = %2; 
	_ruckweps = %3; 
	_ruckmags = %4;
	_weapononback = "%5";
	preset"<give me a number>" = [_presetname,_presetclass,_weapons,_magazines,_ruckweps,_ruckmags,_weapononback];
',_weapons,_magazines,_ruckweps,_ruckmags,_weapononback];


if(true) exitWith{hint "Current gear loadout converted and copied to clipboard."};