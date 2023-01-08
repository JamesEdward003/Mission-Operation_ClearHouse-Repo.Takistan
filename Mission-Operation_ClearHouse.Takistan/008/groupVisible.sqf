//////////////////////////////////////////////////////////////////
{_x hideobject false} forEach units (group Player);

{_x setBehaviour "AWARE"} forEach units (group Player);

{[_x] execVM "008\twirlyMrkr2.sqf"} forEach units (group player);

player commandChat format["%1 group has been made visible", name player];