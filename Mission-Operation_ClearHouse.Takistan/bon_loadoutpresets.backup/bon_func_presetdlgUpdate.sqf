// by Bon_Inf*
#include "dialog\definitions.sqf"
disableSerialization;

private ["_sel","_ctrl"];

_display = findDisplay BON_PRESET_DIALOG;
_ctrl = _display displayCtrl BON_PRESET_WEAPONS;
_lb = _display displayCtrl BON_PRESET_LIST;
_sel = lbCurSel _lb;
_context = _this select 0;

// Entering presets view from class list:
if(HW_preset_subtree_index == 0) then{
	lbClear _lb;
	_lb lbAdd "..";
	_class = HW_preset_classlist select _sel;
	ctrlSetText [BON_PRESET_PRESETSECTION, format["Presets for class %1:",_class]];

	HW_preset_list = [];
	{
		if(_x select 1 == _class) then{
			HW_preset_list = HW_preset_list + [_x];
			_lb lbAdd format["%1",_x select 0];
		};
	} foreach presets;

	HW_preset_subtree_index = HW_preset_subtree_index + 1;
}

// Class already selected, displaying loadouts
else{

	// returning to class list
	if(_sel == 0) exitWith{
		HW_preset_subtree_index = 0 max HW_preset_subtree_index - 1;
		currentpreset = nil;
	};
	
	currentpreset = HW_preset_list select (_sel - 1);

	switch (_context) do{
		case "weapons" : {
			_weaponstring = "";
			{			
				_displname = getText (configFile >> "CfgWeapons" >> _x >> "displayName");
				_picture = getText (configFile >> "CfgWeapons" >> _x >> "picture");
				_weaponstring = _weaponstring + format["<br/><img image='%2' />    %1",_displname,_picture];
			} foreach (currentpreset select 2);
			_weapononback = currentpreset select 6;
			if(_weapononback != "") then{
				_displname = getText (configFile >> "CfgWeapons" >> _weapononback >> "displayName");
				_picture = getText (configFile >> "CfgWeapons" >> _weapononback >> "picture");
				_weaponstring = _weaponstring + format["<br/><img image='%2' />    %1",_displname,_picture];
			};
			_ctrl ctrlSetStructuredText parseText format["Weapons:<br/>%1",_weaponstring];
		};
		case "magazines" : {
			_magstring = "";
			{
				_displname = getText (configFile >> "CfgMagazines" >> _x select 0 >> "displayName");
				_picture = getText (configFile >> "CfgMagazines" >> _x select 0 >> "picture");
				_magstring = _magstring + format["<br/>%1  <img image='%3' />    %2",_x select 1,_displname,_picture];
			} foreach (currentpreset select 3);
			_ctrl ctrlSetStructuredText parseText format["Magazines:<br/>%1",_magstring];
		};
		case "ruckweps" : {
			_ruckwepstring = "";
			{
				_displname = getText (configFile >> "CfgWeapons" >> _x select 0 >> "displayName");
				_picture = getText (configFile >> "CfgWeapons" >> _x select 0 >> "picture");
				_ruckwepstring = _ruckwepstring + format["<br/>%1  <img image='%3' />    %2",_x select 1,_displname,_picture];
			} foreach (currentpreset select 4);
			_ctrl ctrlSetStructuredText parseText format["Weapons in rucksack:<br/>%1",_ruckwepstring];
		};
		case "ruckmags" : {
			_ruckmagstring = "";
			{
				_displname = getText (configFile >> "CfgMagazines" >> _x select 0 >> "displayName");
				_picture = getText (configFile >> "CfgMagazines" >> _x select 0 >> "picture");
				_ruckmagstring = _ruckmagstring + format["<br/>%1  <img image='%3' />    %2",_x select 1,_displname,_picture];
			} foreach (currentpreset select 5);
			_ctrl ctrlSetStructuredText parseText format["Magazines in rucksack:<br/>%1",_ruckmagstring];
		};
	};
};

_sel