// Player hands on head using TAB key (15) 
// place this next line in a trigger or init.sqf, it won't work from a units init. 
// hoh=(findDisplay 46) displayAddEventHandler ["keyDown", "if ((_this select 1) == 15) then {_null = [player] execvm 'handsUp.sqf'}"]; 
// it may take a second or two to take hands off the head 

private ["_unit"];
hands_up = true; 

_unit = _this select 0; 
_unit setCaptive true;
_unit disableAI "Anim";		
_unit disableAI "MOVE";

//_unit playMove "AidlPercMstpSnonWnonDnon04";

_unit playaction "surrender"; 

while {hands_up} do { 
           
         _unit playaction "surrender"; 
         _unit setCaptive true;          
         sleep 0.01;
          
    }; 