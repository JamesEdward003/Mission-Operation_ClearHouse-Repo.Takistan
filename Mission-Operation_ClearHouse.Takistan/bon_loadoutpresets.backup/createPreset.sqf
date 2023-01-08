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

Rucksacks=["US_Assault_Pack_EP1","US_Patrol_Pack_EP1","US_Backpack_EP1","CZ_Backpack_EP1","CZ_VestPouch_EP1","TK_ALICE_Pack_EP1","TK_Assault_Pack_EP1"];
_haveRuck = (count _weapons) - (count (_weapons - Rucksacks)) < (count _weapons);
if(_haveRuck) then{
	_ruckweps = player getVariable "RuckWepContents";
	_ruckmags = player getVariable "RuckMagContents";
};

if(isNil "_ruckweps") then{_ruckweps = []};
if(isNil "_ruckmags") then{_ruckmags = []};
_weapononback = player getVariable "Weapononback";
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