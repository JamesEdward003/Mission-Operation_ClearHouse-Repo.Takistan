//////////////////////////////////////////////////////////////////
_caller = player;
_target = cursorTarget;

_target setvehiclelock "unlocked"; vehicle _caller setvehiclelock "unlocked";

nul = [_caller] execVM "008\joinGroupPlayer.sqf";

_caller commandChat format["%1 unlocked by %2", typeOf _target, name _caller];