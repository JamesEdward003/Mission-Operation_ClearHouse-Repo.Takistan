//////////////////////////////////////////////////////////////////
_target = _this select 0;
_caller = _this select 1;
_actionID = _this select 2;

_caller removeAction _actionID;

5 fadeMusic 1;
playMusic "BornOnTheBayou";