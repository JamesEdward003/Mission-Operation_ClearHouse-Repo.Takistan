presetDialogUpdate = compile (preprocessFileLineNumbers "bon_loadoutpresets\bon_func_presetdlgUpdate.sqf"); sleep 0.1;


if(not isServer) exitWith{};

_classnames = [		// each element presents one class, ["<classname>",<limitation>]
	["Rifleman",-1],
	["Grenadier",-1],
	["Machinegunner",-1],
	["Anti-Tank MAAWS",-1],
	["Anti-Tank RPG7",-1],
	["Anti-Tank Javelin",-1],
	["Sniper",-1]
];

{
	missionNamespace setVariable [_x select 0,_x select 1];
} foreach _classnames;

