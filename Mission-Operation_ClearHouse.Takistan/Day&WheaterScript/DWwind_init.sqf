/*==============================================
Day&Weather Script - by Moerderhoschi - revised
================================================*/
_P = [];
if (isNil "paramsArray") then { // SP or Editor Preview
	if (isClass (missionConfigFile/"Params")) then {
		for "_i" from 0 to (count (missionConfigFile/"Params") - 1) do {
			_paramName = configName ((missionConfigFile >> "Params") select _i);
			missionNamespace setVariable [_paramName, getNumber (missionConfigFile >> "Params" >> _paramName >> "default")];
			_P = _P + [_paramName];
		};
	};
} else { // MP
	for "_i" from 0 to (count paramsArray - 1) do {
		_paramName = configName ((missionConfigFile >> "Params") select _i);
		missionNamespace setVariable [configName ((missionConfigFile >> "Params") select _i), paramsArray select _i];
		_P = _P + [_paramName];
	};
};
_debug = false;
Day_Time = missionNamespace getVariable "Day_Time";
Weather = missionNamespace getVariable "Weather";
FogParam = missionNamespace getVariable "FogParam";
WindDirection = missionNamespace getVariable "WindDirection";
WindStrength = missionNamespace getVariable "WindStrength";
////////////////////////////////////////////////
//             DAY & TIME SETTINGS            //
////////////////////////////////////////////////
		switch (Day_Time) do {

			case 1: {skiptime (ceil random 96)};
			case 2: {setDate [2020, 7, 25, 4, 0];};
			case 3: {setDate [2020, 7, 25, 5, 0];};
			case 4: {setDate [2020, 7, 25, 12, 0];};
			case 5: {setDate [2020, 7, 25, 19, 0];};
			case 6: {setDate [2020, 7, 25, 20, 0];};
			case 7: {setDate [2020, 7, 25, 1, 0];};
			case 8: {setDate [2020, 7, 20, 1, 0];};
		};
///////////////////////////////////////////////
//             OVERCAST SETTINGS             //
///////////////////////////////////////////////
		switch (Weather) do {

			case 1:	{0 setOvercast random 1};
			case 2: {0 setOvercast 0};
			case 3: {0 setOvercast 0.3};
			case 4: {0 setOvercast 0.5};
			case 5: {0 setOvercast 0.8};
			case 6: {0 setOvercast 1};	
		};
///////////////////////////////////////////////
//               RAIN SETTINGS               //
///////////////////////////////////////////////
		switch (Weather) do {

			case 1:	{0 setRain random 1};
			case 2: {0 setRain 0};
			case 3: {0 setRain 0.3};
			case 4: {0 setRain 0.5};
			case 5: {0 setRain 0.8};
			case 6: {0 setRain 1};	
		};
///////////////////////////////////////////////
//       		  FOG SETTINGS       		 //
///////////////////////////////////////////////
		switch (FogParam) do {

			case 1:	{0 setFog random 1};
			case 2: {0 setFog 0};
			case 3: {0 setFog 0.3};
			case 4: {0 setFog 0.5};
			case 5: {0 setFog 0.8};
			case 6: {0 setFog 1};	
		};
///////////////////////////////////////////////
// 			    WIND SETTINGS			     //
///////////////////////////////////////////////
		switch (WindDirection) do {

			case 1: {switch (WindStrength) do {

				case 1:	{setWind [0, 1.25, true];};
				case 2:	{setWind [0, 2.50, true];};
				case 3:	{setWind [0, 3.75, true];};
				case 4:	{setWind [0, 5,    true];};
				case 5:	{setWind [0, 6.25, true];};
				case 6:	{setWind [0, 7.50, true];};
				case 7:	{setWind [0, 8.75, true];};
				case 8:	{setWind [0, 10,   true];};
			}};
			case 2: {switch (WindStrength) do {

				case 1:	{setWind [1.25, 1.25, true];};
				case 2:	{setWind [2.50, 2.50, true];};
				case 3:	{setWind [3.75, 3.75, true];};
				case 4:	{setWind [5, 5,       true];};
				case 5:	{setWind [6.25, 6.25, true];};
				case 6:	{setWind [7.50, 7.50, true];};
				case 7:	{setWind [8.75, 8.75, true];};
				case 8:	{setWind [10, 10,     true];};
			}};
			case 3: {switch (WindStrength) do {

				case 1:	{setWind [1.25, 0, true];};
				case 2:	{setWind [2.50, 0, true];};
				case 3:	{setWind [3.75, 0, true];};
				case 4:	{setWind [5, 0,    true];};
				case 5:	{setWind [6.25, 0, true];};
				case 6:	{setWind [7.50, 0, true];};
				case 7:	{setWind [8.75, 0, true];};
				case 8:	{setWind [10, 0,   true];};
			}};
			case 4: {switch (WindStrength) do {

				case 1:	{setWind [1.25, -1.25, true];};
				case 2:	{setWind [2.50, -2.50, true];};
				case 3:	{setWind [3.75, -3.75, true];};
				case 4:	{setWind [5, -5,       true];};
				case 5:	{setWind [6.25, -6.25, true];};
				case 6:	{setWind [7.50, -7.50, true];};
				case 7:	{setWind [8.75, -8.75, true];};
				case 8:	{setWind [10, -10,     true];};
			}};
			case 5: {switch (WindStrength) do {

				case 1:	{setWind [0, -1.25, true];};
				case 2:	{setWind [0, -2.50, true];};
				case 3:	{setWind [0, -3.75, true];};
				case 4:	{setWind [0, -5,    true];};
				case 5:	{setWind [0, -6.25, true];};
				case 6:	{setWind [0, -7.50, true];};
				case 7:	{setWind [0, -8.75, true];};
				case 8:	{setWind [0, -10,   true];};	
			}};
			case 6: {switch (WindStrength) do {

				case 1:	{setWind [-1.25, -1.25, true];};
				case 2:	{setWind [-2.50, -2.50, true];};
				case 3:	{setWind [-3.75, -3.75, true];};
				case 4:	{setWind [-5, -5,       true];};
				case 5:	{setWind [-6.25, -6.25, true];};
				case 6:	{setWind [-7.50, -7.50, true];};
				case 7:	{setWind [-8.75, -8.75, true];};
				case 8:	{setWind [-10, -10,     true];};
			}};
			case 7: {switch (WindStrength) do {

				case 1:	{setWind [-1.25, 0, true];};
				case 2:	{setWind [-2.50, 0, true];};
				case 3:	{setWind [-3.75, 0, true];};
				case 4:	{setWind [-5, 0,    true];};
				case 5:	{setWind [-6.25, 0, true];};
				case 6:	{setWind [-7.50, 0, true];};
				case 7:	{setWind [-8.75, 0, true];};
				case 8:	{setWind [-10, 0,   true];};
			}};
			case 8: {switch (WindStrength) do {

				case 1:	{setWind [-1.25, 1.25, true];};
				case 2:	{setWind [-2.50, 2.50, true];};
				case 3:	{setWind [-3.75, 3.75, true];};
				case 4:	{setWind [-5, 5,       true];};
				case 5:	{setWind [-6.25, 6.25, true];};
				case 6:	{setWind [-7.50, 7.50, true];};
				case 7:	{setWind [-8.75, 8.75, true];};
				case 8:	{setWind [-10, 10,     true];};
			}};
		};
///////////////////////////////////////////////
//             DEBUG SETTINGS		         //
///////////////////////////////////////////////		
if (_debug) then {
	[] spawn {
		while {alive player} do {
		uisleep 5; hintSilent format ["Date: %1\nOvercast: %2\nRain: %3\nFog: %4\nWind: %5",date,overcast,rain,fog,wind]; copytoclipboard format ["Date: %1\nOvercast: %2\nRain: %3\nFog: %4\nWind: %5",date,overcast,rain,fog,wind]; uisleep 10; hintSilent "";
		uisleep 60; 
		}; 
	}; 
};
///////////////////////////////////////////////
//     CLIENT WEATHER SETTINGS TO START      //
///////////////////////////////////////////////	
	240 setOvercast Weather;
	300 setRain Weather;
	WeatherSet=true;publicVariable "WeatherSet";
///////////////////////////////////////////////
//     CLIENT WEATHER SETTINGS OVER TIME     //
///////////////////////////////////////////////
300 setOvercast Weather/3;
360 setRain Weather/3;
///////////////////////////////////////////////
//     CLIENT WEATHER SETTINGS UNTIL TIME    //
///////////////////////////////////////////////
/*
WaitUntil { WeatherSet };
while { WeatherSet } do {	
	6 setOvercast Weather;
	uisleep 6;
	6 setRain Weather;
	uisleep 6;
};
*/
///////////////////////////////////////////////
//     		CLIENT WEATHER SETTINGS   		 //
//     		  AFTER TIME OR EVENT   		 //
///////////////////////////////////////////////
WaitUntil { OpforElim };
	60 setOvercast 0.25;
	60 setRain 0.25;
	60 setFog 0.10;
	setWind [3.75, 0, true];

/*
Date: [2020,7,25,4,8]\nOvercast: 0.750614\nRain: 0\nFog: 0.251518\nWind: [-8.12051,-0.602651,0.0417355]
Date: [2020,7,25,4,1]\nOvercast: 0.797956\nRain: 0\nFog: 0.29932\nWind: [-8.67613,-0.29371,0.0829026]
Date: [2020,7,25,4,2]\nOvercast: 0.802281\nRain: 0.0910621\nFog: 0.300317\nWind: [-8.75,0,0]
*/

