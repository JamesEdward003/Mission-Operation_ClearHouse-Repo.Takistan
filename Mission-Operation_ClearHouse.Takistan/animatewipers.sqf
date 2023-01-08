_heli = _this select 0;
_on = _this select 1;

_heli setVariable ["kyo_wipersOn", _on]; 

if (_on) then 
{ 
    while {(alive _heli) && {_heli getVariable "kyo_wipersOn"}} do 
    { 
        _heli animate ["Ani_wblade1",1]; 
        _heli animate ["Ani_wblade2",1]; 
        sleep 0.5; 
        _heli animate ["Ani_wblade1",0]; 
        _heli animate ["Ani_wblade2",0]; 
        sleep 0.5; 
    }; 
};