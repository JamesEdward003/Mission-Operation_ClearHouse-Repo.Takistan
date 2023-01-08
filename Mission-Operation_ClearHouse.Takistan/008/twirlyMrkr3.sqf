//////////////////////////////////////////////////////////////////
private ["_unit","_marker"];
_unit      = _this select 0;
_name      = name _unit;
_rank      = rank _unit;
_grp       = group _unit;
_type      = typeOf _unit;
_ldr       = leader _grp;
_colormrkr = [];

if (isMultiplayer) then {	
	_unit addMPEventHandler ["MPRespawn",{_this execVM "008\twirlyMrkr3.sqf"}];
};

switch (side _unit) do { 
    case  WEST      : {_colormrkr = "ColorBlue"};
    case  EAST      : {_colormrkr = "ColorRed"};
    case  RESISTANCE    : {_colormrkr = "ColorGreen"};
    case  CIVILIAN      : {_colormrkr = "ColorOrange"};
};

_text = toArray(str(_grp));
_text set[0,"**DELETE**"];
_text set[1,"**DELETE**"];
_text = _text - ["**DELETE**"];
_txt = toString(_text);

_text2 = toArray(str(_name));
//_text2 set[0,"**DELETE**"];
//_text2 set[1,"**DELETE**"];
//_text2 set[2,"**DELETE**"];
//_text2 set[3,"**DELETE**"];
//_text2 set[4,"**DELETE**"];
//_text2 set[5,"**DELETE**"];
//_text2 set[6,"**DELETE**"];
//_text2 set[7,"**DELETE**"];
//_text2 set[8,"**DELETE**"];
_text2 = _text2 - ["**DELETE**"];
_txt2  = toString(_text2);

_marker = createMarkerLocal [_name, position _unit];
_marker setMarkerTypeLocal "mil_dot";
_marker setMarkerColorLocal _colormrkr;
_marker setMarkerSizeLocal [0.75,0.75];
_marker setMarkerTextLocal _txt2;

if (_unit == _ldr)then
    {
    _marker setMarkerTextLocal _txt;
    } else {
    _marker setMarkerTextLocal _txt2;
};
        
while {alive _unit} do {
    _marker setMarkerPos (getPos _unit);
    sleep 2;
};

//_marker setMarkerColorLocal "ColorBlack";
//deleteMarker _marker;

_marker setMarkerTypeLocal "hd_objective";
_marker setMarkerColorLocal "ColorOrange";
_marker setMarkerAlphaLocal 0.4;
