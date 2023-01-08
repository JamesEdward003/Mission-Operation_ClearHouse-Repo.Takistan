// MH47Emgmt.sqf //
_vehicle = _this select 0;
//_vehicle setVariable ["kyo_wipersOn", false];
//[_vehicle, false] execVM "animateWipers.sqf";

while {alive _vehicle} do {

		switch true do 
			{
			case (((getpos _vehicle) select 2 < 1)): {if (_vehicle animationPhase "Ani_Ramp" > 0.2) then {_vehicle animate["Ani_Ramp",0]}};
			case (((getpos _vehicle) select 2 > 10)): {if (_vehicle animationPhase "Ani_Ramp" < 0.5) then {_vehicle animate["Ani_Ramp",1]}};
			default {};
			};	
			sleep 1;
		switch true do 
			{
			case (rain < .1): {if (_vehicle getVariable ["kyo_wipersOn", false]) then {(_vehicle setVariable ["kyo_wipersOn", false]);[(vehicle player), false] execVM "animateWipers.sqf";}};
			case (rain > .1): {if (_vehicle getVariable ["kyo_wipersOn", true]) then {(_vehicle setVariable ["kyo_wipersOn", true]);[vehicle player, true] execVM "animateWipers.sqf";}};
			default {};
			};	
			sleep 1;
		switch true do 
			{
			case (damage _vehicle > .1): {[_vehicle] execVM "x_reload.sqf"};
			case (damage _vehicle < .1): {};
			default {};
			};
		sleep 10;
};
//_null=[] spawn { if (WeatherCheck) then {WeatherCheck = false; publicVariable "WeatherCheck"; hintSilent "Weather Check is OFF"; uisleep 10; hintSilent "";} else {WeatherCheck = true; publicVariable "WeatherCheck"; hintSilent "Weather Check is ON"; uisleep 10; hintSilent "";};};
//_null=[] spawn { if ((vehicle player) getVariable ["kyo_wipersOn", false]) then {((vehicle player) setVariable ["kyo_wipersOn", false]);[(vehicle player), false] execVM "animateWipers.sqf"; hintSilent "Windshield Wipers turned OFF"; uisleep 10; hintSilent "";} else {((vehicle player) setVariable ["kyo_wipersOn", true]);[vehicle player, true] execVM "animateWipers.sqf"; hintSilent "Windshield Wipers turned ON"; uisleep 10; hintSilent "";};};
