// targetsArray.sqf //
_targetsarray = [];
_targetsarray = position player nearentities ["Man", 350];
_mrkrarray = [];

{
 	_mrkrname = format ["%1",_foreachindex];
 	_markertext = format["%1",faction _x];
    _mrkrarray = _mrkrarray + [_mrkrname];
    _marker = createMarkerLocal [_mrkrname, getPos _x];
    _marker setMarkerTypeLocal "DOT";
    _marker setMarkerTextLocal "";
    _marker setMarkerSizeLocal [.75,.75];

    _mrkrcolor = switch (side _x) do 
      {
        case west:     		{"colorblue"};
        case east:     		{"colorred"};
        case resistance: 	{"colorgreen"};
        case civilian:   	{"coloryellow"};
      };
    _marker setMarkerColorLocal _mrkrcolor;

} forEach _targetsarray;

//hintsilent format ["Targets-%1,Markers-%2",_targetsarray,_mrkrarray];

player globalChat "Targets on the map!";
uisleep 20;
{deleteMarker _x} forEach _mrkrArray;

