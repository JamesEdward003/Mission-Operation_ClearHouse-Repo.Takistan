//////////////////////////////////////////////////////////////////
_target = cursorTarget;
_target setDamage 1;

player commandChat format["%1 destroyed by %2", typeOf _target, name player];
