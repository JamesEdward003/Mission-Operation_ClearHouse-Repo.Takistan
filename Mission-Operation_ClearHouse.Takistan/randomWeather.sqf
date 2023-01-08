/********************************************************************************

  randomWeather.sqf

  Script by Clayman

  Version 1.3


  Optional Parameters:

  [<_initial | Bool>, <_startDawn | Number>, <_endDawn | Number>, <_nightTime | Number>, <_weatherType | String>, [<_customMinOvercast | Number>, <_customMaxOvercast | Number>], [<_customMinFog | Number>, <_customMaxFog | Number>]]

  _initial:   Should random weather be set initially.
        If you want specific weather at mission start and the random weather to start later, set this to false.
        If you start script at mission start, set this to true, so random values for starting weather will be used.

  _startDawn:    Sets the time (0-24) when dawn beginns (default: 05:00)
  _endDawn:    Sets the time (0-24) when dawn ends (default: 07:00)
  _nightTime:    Sets the time (0-24) when the night starts (default: 20:00)
  _weatherType:   Sets what kind of weather there will be: (default: "Mixed")

              "Good":
           Clear sky to light clouds
           None to light fog during day and night
           Medium to thick fog during dawn
           No rain

              "Average":
           Cloudy sky
           Light to medium fog during day
           Light fog during night
           Light to medium fog during dawn
           No rain

              "Bad":
           Dark clouds
           Medium to thick fog during day
           Light to medium fog during night
           No fog during heavy rain / storm
           Light rain to storm

              "Mixed":
           All of the above can be possible

              "MediumGood":
           Mix of 'Good' and 'Average' weather types

              "MediumBad":
           Mix of 'Average' and 'Bad' weather types

              "Custom":
           Set values for min and max overcast
           Set values for min and max fog
           Slightly more fog during dawn
           Slightly less fog during night
           No fog during heavy rain / storm

  _customMinOvercast:
  _customMaxOvercast:
        Additional parameters for "Custom" weather.
        Sets the minimum and maximum overcast values (0 = clear sky, 1 = storm)

  _customMinFog:
  _customMaxFog:
        Additional parameters for "Custom" weather.
        Sets the minimum and maximum fog values (0 = no fog, 1 = thick fog)


  Examples:

  No parameters - default settings will be used:

     0 = [] execVM "randomWeather.sqf";

  Only parameter for initial setting:

     0 = [false] execVM "randomWeather.sqf";

  Parameters for preset weather types:

     0 = [true, 4.5, 6.5, 19.5, "Average"] execVM "randomWeather.sqf";

  Parameters for custom weather settings:

     0 = [false, 6, 8, 18, "Custom", [0.4, 0.6], [0.2, 0.5]] execVM "randomWeather.sqf";



  To end the script, set global variable 'CLAY_Weather' to false

*********************************************************************************/




private ["_initial", "_startDawn", "_endDawn", "_nightTime", "_weatherType", "_minOvercast", "_maxOvercast", "_overcastAdd", "_minFog", "_maxFog", "_fogAdd"];

If (count _this > 0) Then
{
  _initial = _this select 0;

  If (count _this > 1) Then
  {
     _startDawn = _this select 1;
     _endDawn = _this select 2;
     _nightTime = _this select 3;
     _weatherType = _this select 4;

     If (_weatherType == "Custom") Then
     {
        _minOvercast = (_this select 5) select 0;
        _maxOvercast = (_this select 5) select 1;
        _overcastAdd = _maxOvercast - _minOvercast;

        _minFog = (_this select 6) select 0;
        _maxFog = (_this select 6) select 1;
        _fogAdd = _maxFog - _minFog;
     };
  };
}
Else
{
  _initial = true;
  _startDawn = 5;
  _endDawn = 7;
  _nightTime = 20;
  _weatherType = "Mixed";
};



CLAY_Weather = true;
private ["_f", "_fog"];

switch (_weatherType) do
{
  case "Good":
  {
     If (_initial) Then
     {
        _o = random 0.35;
        If (dayTime > _startDawn && dayTime < _endDawn) Then
        {
           _f = (0.3 + random 0.5);
        }
        Else
        {
           _f = random 0.3;
        };

        0 setOvercast _o;
        0 setFog _f;
     };

     while {CLAY_Weather} do
     {
        _overcast = random 0.4;
        _change = (180 + random 120);
        _delay = (300 + random 300);

        If (dayTime > _startDawn && dayTime < _endDawn) Then
        {
           _fog = (0.2 + random 0.6);
        }
        Else
        {
           _fog = random 0.3;
        };

        _oChange = _overcast - overcast;
        _oStep = _oChange / 300;

        _fChange = _fog - fog;
        _fStep = _fChange / 300;

        _cStep = _change / 300;

        for "_i" from 0 to _change step _cStep do
        {
           _cStep setOvercast (overcast + _oStep);
           sleep _cStep;
           _cStep setFog (fog + _fStep);
           sleep _cStep;
        };

        sleep _delay;
     };
  };
  case "MediumGood":
  {
     If (_initial) Then
     {
        _o = random 0.6;
        If (dayTime > _startDawn && dayTime < _endDawn) Then
        {
           If (_o < 0.4) Then
           {
              _f = (0.3 + random 0.5);
           }
           Else
           {
              _f = (0.2 + random 0.4);
           };
        }
        Else
        {
           _f = random 0.4;
        };

        0 setOvercast _o;
        0 setFog _f;
     };

     while {CLAY_Weather} do
     {
        _overcast = random 0.6;
        _change = (180 + random 120);
        _delay = (300 + random 300);

        If (dayTime > _startDawn && dayTime < _endDawn) Then
        {
           If (_o < 0.4) Then
           {
              _f = (0.3 + random 0.5);
           }
           Else
           {
              _f = (0.2 + random 0.4);
           };
        }
        Else
        {
           _fog = random 0.5;
        };

        _oChange = _overcast - overcast;
        _oStep = _oChange / 300;

        _fChange = _fog - fog;
        _fStep = _fChange / 300;

        _cStep = _change / 300;

        for "_i" from 0 to _change step _cStep do
        {
           _cStep setOvercast (overcast + _oStep);
           sleep _cStep;
           _cStep setFog (fog + _fStep);
           sleep _cStep;
        };

        sleep _delay;
     };
  };
  case "Average":
  {
     If (_initial) Then
     {
        _o = (0.3 + random 0.3);
        If (dayTime > _startDawn && dayTime < _endDawn) Then
        {
           _f = (0.2 + random 0.4);
        }
        Else
        {
           _f = random 0.4;
        };

        0 setOvercast _o;
        0 setFog _f;
     };

     while {CLAY_Weather} do
     {
        _overcast = (0.3 + random 0.3);
        _change = (180 + random 120);
        _delay = (300 + random 300);

        If (dayTime > _startDawn && dayTime < _endDawn) Then
        {
           _fog = (0.2 + random 0.5);
        }
        Else
        {
           If (dayTime < _nightTime) Then
           {
              _fog = random 0.4;
              If (_overcast > 0.5) Then {_fog = (0.2 + random 0.4)};
           }
           Else
           {
              _fog = random 0.3;
           };
        };

        _oChange = _overcast - overcast;
        _oStep = _oChange / 300;

        _fChange = _fog - fog;
        _fStep = _fChange / 300;

        _cStep = _change / 300;

        for "_i" from 0 to _change step _cStep do
        {
           _cStep setOvercast (overcast + _oStep);
           sleep _cStep;
           _cStep setFog (fog + _fStep);
           sleep _cStep;
        };

        sleep _delay;
     };
  };
  case "MediumBad":
  {
     If (_initial) Then
     {
        _o = (0.4 + random 0.6);
        _f = (0.2 + random 0.4);
        If (_o > 0.9) Then {_f = random 0.3};

        0 setOvercast _o;
        0 setFog _f;
     };

     while {CLAY_Weather} do
     {
        _overcast = (0.4 + random 0.6);
        _change = (180 + random 120);
        _delay = (300 + random 300);

        If (dayTime > _endDawn && dayTime < _nightTime) Then
        {
           _fog = (0.35 + random 0.35);
           If (_overcast > 0.8) Then {_fog = (0.3 + random 0.25)};
           If (_overcast > 0.9) Then {_fog = random 0.35};
        }
        Else
        {
           _fog = (0.3 + random 0.5);
           If (_overcast > 0.9) Then {_fog = random 0.2};
        };

        _oChange = _overcast - overcast;
        _oStep = _oChange / 300;

        _fChange = _fog - fog;
        _fStep = _fChange / 300;

        _cStep = _change / 300;

        for "_i" from 0 to _change step _cStep do
        {
           _cStep setOvercast (overcast + _oStep);
           sleep _cStep;
           _cStep setFog (fog + _fStep);
           sleep _cStep;
        };

        sleep _delay;
     };
  };
  case "Bad":
  {
     If (_initial) Then
     {
        _o = (0.65 + random 0.35);
        _f = (0.3 + random 0.4);
        If (_o > 0.9) Then {_f = random 0.3};

        0 setOvercast _o;
        0 setFog _f;
     };

     while {CLAY_Weather} do
     {
        _overcast = (0.6 + random 0.4);
        _change = (180 + random 120);
        _delay = (300 + random 300);

        If (dayTime > _endDawn && dayTime < _nightTime) Then
        {
           _fog = (0.4 + random 0.4);
           If (_overcast > 0.8) Then {_fog = (0.3 + random 0.2)};
           If (_overcast > 0.9) Then {_fog = random 0.3};
        }
        Else
        {
           _fog = (0.2 + random 0.3);
           If (_overcast > 0.9) Then {_fog = random 0.2};
        };

        _oChange = _overcast - overcast;
        _oStep = _oChange / 300;

        _fChange = _fog - fog;
        _fStep = _fChange / 300;

        _cStep = _change / 300;

        for "_i" from 0 to _change step _cStep do
        {
           _cStep setOvercast (overcast + _oStep);
           sleep _cStep;
           _cStep setFog (fog + _fStep);
           sleep _cStep;
        };

        sleep _delay;
     };
  };
  case "Mixed":
  {
     If (_initial) Then
     {
        _o  = random 1;
        If (dayTime > _startDawn && dayTime < _endDawn) Then
        {
           _f = (0.2 + random 0.3);
           If (_o > 0.4) Then {_f = (0.2 + random 0.4)};
           If (_o > 0.6) Then {_f = (0.3 + random 0.3)};
           If (_o > 0.8) Then {_f = (0.4 + random 0.3)};
           If (_o > 0.9) Then {_f = random 0.3};
        }
        Else
        {
           If (dayTime < _nightTime) Then
           {
              _f = random 0.2;
              If (_o > 0.5) Then {_f = (0.2 + random 0.2)};
              If (_o > 0.7) Then {_f = (0.3 + random 0.3)};
              If (_o > 0.9) Then {_f = random 0.3};
           }
           Else
           {
              _f = random 0.2;
              If (_o > 0.5) Then {_f = random 0.3};
              If (_o > 0.7) Then {_f = random 0.4};
           };
        };

        0 setOvercast _o;
        0 setFog _f;
     };

     while {CLAY_Weather} do
     {
        _overcast = random 1;
        _change = (180 + random 120);
        _delay = (300 + random 300);

        If (dayTime > _startDawn && dayTime < _endDawn) Then
        {
           _fog = (0.2 + random 0.4);
           If (_overcast > 0.4) Then {_fog = (0.2 + random 0.4)};
           If (_overcast > 0.6) Then {_fog = (0.3 + random 0.3)};
           If (_overcast > 0.8) Then {_fog = (0.4 + random 0.3)};
           If (_overcast > 0.9) Then {_fog = random 0.3};
        }
        Else
        {
           If (dayTime < _nightTime) Then
           {
              _fog = random 0.2;
              If (_overcast > 0.5) Then {_fog = (0.2 + random 0.2)};
              If (_overcast > 0.7) Then {_fog = (0.3 + random 0.3)};
              If (_overcast > 0.9) Then {_fog = random 0.3};
           }
           Else
           {
              _fog = random 0.2;
              If (_overcast > 0.5) Then {_fog = random 0.3};
              If (_overcast > 0.7) Then {_fog = random 0.4};
           };
        };

        _oChange = _overcast - overcast;
        _oStep = _oChange / 300;

        _fChange = _fog - fog;
        _fStep = _fChange / 300;

        _cStep = _change / 300;

        for "_i" from 0 to _change step _cStep do
        {
           _cStep setOvercast (overcast + _oStep);
           sleep _cStep;
           _cStep setFog (fog + _fStep);
           sleep _cStep;
        };

        sleep _delay;
     };
  };
  case "Custom":
  {
     If (_initial) Then
     {
        _o  = (_minOvercast + random _overcastAdd);
        If (dayTime > _startDawn && dayTime < _endDawn) Then
        {
           _f = (_minFog + random _fogAdd);
           If (_o > 0.6) Then {_f = _f + random 0.1};
           If (_o > 0.8) Then {_f = _f + random 0.2};
           If (_o > 0.9) Then {_f = _minFog};
        }
        Else
        {
           If (dayTime < _nightTime) Then
           {
              _f = (_minFog + random _fogAdd);
              If (_o > 0.9) Then {_f = _minFog};
           }
           Else
           {
              _f = (_minFog + random _fogAdd);
              If (_o < 0.4) Then {_f = _f - random 0.2};
              If (_o > 0.9) Then {_f = _minFog};
           };
        };

        0 setOvercast _o;
        0 setFog _f;
     };

     while {CLAY_Weather} do
     {
        _overcast = (_minOvercast + random _overcastAdd);
        _change = (180 + random 120);
        _delay = (300 + random 300);

        If (dayTime > _startDawn && dayTime < _endDawn) Then
        {
           _fog = (_minFog + random _fogAdd);
           If (_overcast > 0.6) Then {_fog = _fog + random 0.1};
           If (_overcast > 0.8) Then {_fog = _fog + random 0.2};
           If (_overcast > 0.9) Then {_fog = _minFog};
        }
        Else
        {
           If (dayTime < _nightTime) Then
           {
              _fog = (_minFog + random _fogAdd);
           }
           Else
           {
              _fog = (_minFog + random _fogAdd);
              If (_overcast < 0.4) Then {_fog = _fog - random 0.2};
              If (_overcast > 0.9) Then {_fog = _minFog};
           };
        };

        _oChange = _overcast - overcast;
        _oStep = _oChange / 300;

        _fChange = _fog - fog;
        _fStep = _fChange / 300;

        _cStep = _change / 300;

        for "_i" from 0 to _change step _cStep do
        {
           _cStep setOvercast (overcast + _oStep);
           sleep _cStep;
           _cStep setFog (fog + _fStep);
           sleep _cStep;
        };

        sleep _delay;
     };
  };
};
