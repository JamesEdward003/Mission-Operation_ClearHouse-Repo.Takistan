// revealEnemy.sqf //
/*
    Author: Revo

    Description:
    Reveals units which are not on the player's side - != playerSide
    rev.
    Reveals units which are not on the player's side and are not civilian - ((side _unit != playerSide) and (side _unit != civilian))
    Parameter(s):
        0: number - Size of the area
        1: object - Center of the area to search in
        2: number - Delay between creation and deletion of markers
        3: number - Tolerance of positions in meters
    Returns:
    -
*/

_radius = 1000;
_center = speaker1;
_deleteTime = 10;
_posTolerance = 3;

_nearestUnits = nearestObjects [_center, ["man"], _radius];

systemChat "Radar Scan in progress...";

hintSilent parseText format ["<br/><t color='#ff0000' size='1.0'>Radar Scan in progress...</t>"];

_hostiles = [];
for "_i" from 0 to (count _nearestUnits) - 1 do
{
    _unit = _nearestUnits select _i;
    _mrkrcolor = switch (side _unit) do 
      {
        case WEST:        {"colorblue"};
        case EAST:        {"colorred"};
        case RESISTANCE:  {"colorgreen"};
        case CIVILIAN:    {"coloryellow"};
        default           {"colorwhite"};
      };
    if ((side _unit != playerSide) and (side _unit != civilian)) then
    {
        _marker = createMarker [format ["tempMarker_%1",_i], [_unit, _posTolerance, random(360)] call BIS_fnc_relPos];
        _marker setMarkerType "dot";
        _marker setMarkerColor _mrkrcolor;
        _marker setMarkerSize [1.25, 1.25];
        _hostiles = _hostiles + [_i];

        [_unit,_marker] spawn {
            while {alive (_this select 0)} do {
              (_this select 1) setMarkerPos getPos (_this select 0);
              (_this select 1) setMarkerDir getDir (_this select 0);  
              if (vehicle (_this select 0) != (_this select 0)) then {(_this select 1) setMarkerAlphaLocal 0} else {(_this select 1) setMarkerAlphaLocal 1};
              sleep 1;
            };
            deleteMarker (_this select 1);
        };        
    };
    sleep 1;
};

/*
for "_i" from 0 to (count _nearestUnits) - 1 do
{
    _unit = _nearestUnits select _i;
    if ((side _unit != playerSide) and (side _unit != civilian)) then
    {
        _marker = createMarker [format ["tempMarker_%1",_i], [_unit, _posTolerance, random(360)] call BIS_fnc_relPos];
        format ["tempMarker_%1",_i] setMarkerType "dot";
        format ["tempMarker_%1",_i] setMarkerColor "ColorRed";
        format ["tempMarker_%1",_i] setMarkerSize [1.25, 1.25];
        _hostiles = _hostiles + [_i];

        [_unit,_i] spawn {
            while {alive (_this select 0)} do {
              format ["tempMarker_%1",_i] setMarkerPos getPos (_this select 0);
              format ["tempMarker_%1",_i] setMarkerDir getDir (_this select 0);  
              if (vehicle (_this select 0) != (_this select 0)) then {format ["tempMarker_%1",_i] setMarkerAlphaLocal 0} else {format ["tempMarker_%1",_i] setMarkerAlphaLocal 1};
              sleep 1;
            };
            deleteMarker format ["tempMarker_%1",_i];
        };        
    };
    sleep 1;
};
*/
systemChat format ["%1 hostile Entities found.",count _hostiles];
hintSilent parseText format ["<br/><t color='#ff0000' size='1.0'>%1 hostile Entities found</t>",count _hostiles];
sleep _deleteTime;
hintSilent "";
/*
for "_i" from 0 to (count _hostiles) - 1 do
{
    _num = _hostiles select _i;
    deleteMarker format ["tempMarker_%1",_num];
    sleep 1;
};
*/


