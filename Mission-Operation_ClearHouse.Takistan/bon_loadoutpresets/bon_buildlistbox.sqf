//by Bon_Inf*
disableSerialization;
#include "dialog\definitions.sqf"

private ["_display", "_ctrlListBox","_builded"];

//_builded = false;
_display = findDisplay BON_PRESET_DIALOG;

HW_preset_subtree_index = 0;

_ctrlListBox = _display displayCtrl BON_PRESET_LIST;

ctrlSetText [BON_PRESET_TITLE, format["Hello %1. Choose your custom preset.",name player]];

While{dialog} do{
	if(HW_preset_subtree_index == 0) then{
		ctrlSetText [BON_PRESET_PRESETSECTION, "Available Classes:"];
		lbClear _ctrlListBox;
		HW_preset_classlist = [];
		{
			_class = _x select 1;
			if(not (_class in HW_preset_classlist)) then{
				HW_preset_classlist = HW_preset_classlist + [_class];
				_classremaining = missionNamespace getVariable format["%1",_class];
				if(_classremaining < 0) then{_classremaining="-"};
				_ctrlListBox lbAdd format["%1 (%2)",(_x select 1),_classremaining];
			};
		} foreach presets;
	};
	sleep 0.25; 
};


if(true) exitWith{};