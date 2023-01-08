// transportHeliH.sqf // Kilo6_5 - BIS_transportHeliH - BIS_transportHomeH - som_transport - BIS_transportMarker
_transport = _this select 0;
_heliH =  _this select 1;
_heliH2 = _this select 2;
_heliHMrkr = _this select 3;
_debug = false;

waitUntil { (_transport getVariable "supPhase") == 1 };

hintSilent "Transport is in Operation";

sleep 10;

_heliH setPos getMarkerPos "BIS_transportMarker";

_heliHMrkr setMarkerPos getMarkerPos "BIS_transportMarker";

sleep 10;

if (_debug) then { hintSilent format ["Transport Destination: %1\nSupPhase: %2",getMarkerPos "BIS_TransportMarker",_transport getVariable "supPhase"]; copytoclipboard format ["Position: %1\nSupPhase: %2",getMarkerPos "BIS_TransportMarker",_transport getVariable "supPhase"]; };

waitUntil { (_transport getVariable "supPhase") == 4 };

sleep 10;

_heliH setPos getMarkerPos "BIS_transportMarker";

_heliHMrkr setMarkerPos getMarkerPos "BIS_transportMarker";

sleep 10;

if (_debug) then { hintSilent format ["Transport Destination: %1\nSupPhase: %2",getMarkerPos "BIS_TransportMarker",_transport getVariable "supPhase"]; copytoclipboard format ["Position: %1\nSupPhase: %2",getMarkerPos "BIS_TransportMarker",_transport getVariable "supPhase"]; };

waitUntil { (_transport getVariable "supPhase") == 0 };

sleep 10;

_heliH setPos getPos _heliH2;

_heliHMrkr setMarkerPos getMarkerPos "BIS_transportMarker";

sleep 10;

if (_debug) then { hintSilent format ["Transport Destination: %1\nSupPhase: %2",getMarkerPos "BIS_TransportMarker",_transport getVariable "supPhase"]; copytoclipboard format ["Position: %1\nSupPhase: %2",getMarkerPos "BIS_TransportMarker",_transport getVariable "supPhase"]; };

sleep 10;

[_transport,_heliH,_heliH2,_heliHMrkr] execVM "transportHeliH.sqf";

