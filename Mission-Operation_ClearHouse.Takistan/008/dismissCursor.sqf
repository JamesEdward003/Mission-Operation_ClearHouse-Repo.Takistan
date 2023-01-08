_target = cursorTarget;

_target action ["eject",vehicle _target];
sleep 2;

hintSilent format["%1 %2 has been dismissed",getText (configFile >> "CfgVehicles" >> typeOf _target >> "displayname"),name _target];
deleteVehicle _target;