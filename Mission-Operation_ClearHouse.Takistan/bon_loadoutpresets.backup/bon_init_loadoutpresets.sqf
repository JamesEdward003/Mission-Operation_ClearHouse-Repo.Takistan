presetDialogUpdate = compile (preprocessFileLineNumbers "bon_loadoutpresets\bon_func_presetdlgUpdate.sqf"); sleep 0.1;


if(not isServer) exitWith{};

_classnames = [		// each element presents one class, ["<classname>",<limitation>]
	["AT",5],
	["Grenadier",-1],
	["Marksman",3],
	["Medic",5],
	["MG",3],
	["Squad Leader",2]
];

{
	Server setVariable [_x select 0,_x select 1,true];
} foreach _classnames;