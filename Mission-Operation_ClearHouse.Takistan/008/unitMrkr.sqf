//////////////////////////////////////////////////////////////////
_unit = _this select 0;
_varname = name _unit;

if (alive _unit) then {
	
createMarkerLocal [_varname, [0,0]];
_varname setMarkerShapeLocal "ICON";
_varname setMarkerColorLocal "ColorBlack";
_varname setMarkerSizeLocal [1,1];
_varname setMarkerTypeLocal "mil_dot";

while {true} do {
    waitUntil {
        alive _unit;
    };

    while {alive _unit} do {
        if (side _unit == west) then {
            _varname setMarkerColorLocal "ColorBlue";
        };
        if (side _unit == east) then {
            _varname setMarkerColorLocal "ColorRed";
        };
        if (side _unit == resistance) then {
            _varname setMarkerColorLocal "ColorGreen";
        };
        if (side _unit == civilian) then {
            _varname setMarkerColorLocal "ColorYellow";
        };
        _varname setMarkerDirLocal getDir _unit;
        _varname setMarkerPosLocal getPos _unit;
    
        sleep 0.5;
    };
    _varname setMarkerColorLocal "ColorBlack";
    sleep 3;
};

};