//////////////////////////////////////////////////////////////////
_target = _this select 0;
_target setDamage 1;

player commandChat format["%1 destroyed by %2", typeOf _target, name player];
