// OnPauseScript.sqf //

//player say3d "HellsBells";

//playSound "HellsBells";

if ((lifeState player == "UNCONSCIOUS") || (lifeState player == "ALIVE") and (damage player > .3)) then 
    {
        [] execVM "HealPlayer.sqf";

};

[((units group player) select 5)] spawn 
    {
    _medic = _this select 0; 

    if (alive _medic) then 
        {
            _medic setCaptive true;

            _medic say3d "HellsBells";

            hintSilent parseText format ["%1<br/><t color='#00FF00' size='1.0'>Group Medic Is On Alert !</t>"];    

            uisleep 10;

            hintSilent "";

        } else {

            hintSilent parseText format ["%1<br/><t color='#00FF00' size='1.0'>Group Medic Is Not Alive !</t>"];

            uisleep 10;

            hintSilent "";
    };
};
/*
Arma 3 Script;
h = [] spawn {
    private _fncLightning = {
        params [
            ["_centre", position player, [[]]],
            ["_radius", 300, [0]],
            ["_dir", random 360, [0]]
        ];
        private _pos = _centre getPos [_radius, _dir];
        private _bolt = createVehicle ["LightningBolt", _pos, [], 0, "can collide"];
        _bolt setPosATL _pos;
        _bolt setDamage 1;

        private _light = "#lightpoint" createVehiclelocal _pos;
        _light setPosATL (_pos vectorAdd [0,0,10]);
        _light setLightDayLight true;
        _light setLightBrightness 300;
        _light setLightAmbient [0.05, 0.05, 0.1];
        _light setlightcolor [1, 1, 2];

        sleep 0.1;
        _light setLightBrightness 0;
        sleep (random 0.1);

        private _lightning = (selectRandom ["lightning1_F","lightning2_F"]) createVehiclelocal [100,100,100];
        _lightning setdir _dir;
        _lightning setpos _pos;

        for "_i" from 0 to (3 + random 1) do {
            private _time = time + 0.1;
            _light setLightBrightness (100 + random 100);
            waituntil {
                time > _time
            };
        };

        deletevehicle _lightning;
        deletevehicle _light;
    };
    
    while {true} do {
        _intensity = 2 + floor (random 3);
        for "_i" from 0 to (_intensity -1) do {
            [position player, linearConversion [0, 1, random 1, 300, 800]] call _fncLightning;
        };
        sleep 2 + (random 2);
    };
};
*/
/*
[300] spawn {
private ["_countdown","_serverTime","_totalTime","_numbersToTimeString"];

_serverTime = _this select 0;

_totalTime = 5*60;

_numbersToTimeString = {
   private ["_hours", "_minutes","_chars"];
   _hours = _this select 0;
   _minutes = _this select 1;
   _chars = [];
   _chars set [0, (floor (_hours / 10)) + 48];
   _chars set [1, (floor (_hours mod 10)) + 48];
   _chars set [2, 58];
   _chars set [3, (floor (_minutes / 10)) + 48];
   _chars set [4, (floor (_minutes mod 10)) + 48];
   toString _chars
};

_countdown = _totalTime - time + _serverTime;
while {sleep 0.5; _countdown > 0} do {
   //Find how much time is left
   _countdown = _totalTime - time + _serverTime;
   if (_countdown > 0) then {
       hintSilent parseText format ["<t size='2' color='#ffffba0c'>%1</t>", ([floor (_countdown / 60), _countdown mod 60] call _numbersToTimeString)];
   };
};
};
*/
/*
countDown = {
private ["_remaining", "_timer", "_msg1", "_msg2"];
_timer = _this select 0;
_msg1 = _this select 1;
_msg2 = _this select 2;

"timerMsg" addPublicVariableEventHandler {[] call showCountdown};
if (isnil "timeFormat") then {
timeFormat = {
    private ["_hours", "_minutes", "_seconds"];
    _hours = 0;
    _minutes = 0;
    _seconds = 0;
    _seconds = _this;
    if (_seconds > 59) then {
        _minutes = floor (_seconds / 60);
        _seconds = _seconds - (_minutes * 60);
    };
    if (_minutes > 59) then {
        _hours = floor (_minutes / 60);
        _minutes = _minutes - (_hours * 60);
    };
    if (_seconds < 10) then {
        _seconds = format ["0%1", _seconds];
    };
    if (_minutes < 10) then {
        _minutes = format ["0%1", _minutes];
    };
    [_hours, _minutes, _seconds]
};
};

if (isnil "showCountdown") then {
showCountdown = {
    hintsilent TimerMsg;
};
};

if (isServer) then {
while {_timer != 0} do {
    _remaining = _timer call timeFormat;
    timerMsg = format ["%1\n\n%2:%3:%4",_msg1, (_remaining select 0), (_remaining select 1), (_remaining select 2)];
    publicVariable "timerMsg";
    if (local player) then {[] call showCountdown};
    _timer = _timer - 1;
    sleep 1;
};
};
timerMsg = _msg2;
publicVariable "timerMsg";
if (local player) then {[] call showCountdown};
};

[60,"60 seconds until we arrive...","We are arriving..."] call countDown;
*/
/*

_timeleft = 300;

if (round _timeleft == 300) then { hintsilent format ["%1", [_timeleft/60,"HH:MM"] call bis_fnc_timetostring]; }; 

uisleep 3;

while {true} do {

_timeleft = _timeleft -1;

// 5 minutes counter  
if (round _timeleft < 300) then { hintsilent format ["%1", [_timeleft/60,"HH:MM"] call bis_fnc_timetostring]; };

uisleep 1;

if (_timeleft < 1) exitWith{};
};
*/
