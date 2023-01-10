// endOperation.sqf //

[] spawn {
	_radio=createTrigger["EmptyDetector",[0,0]];
	_radio setTriggerActivation["Alpha","PRESENT",true];
	_radio setTriggerStatements["this","0 spawn End_Operation",""];
	1 setRadioMsg "END OPERATION";
};
End_Operation = {

	{ for "_i" from count waypoints _x - 1 to 0 step -1 do { deleteWaypoint [_x, _i]; }; } forEach allGroups; 
	hintsilent "Operation Called Off!";
	uisleep 10;
	{ _wp1 = _x addWaypoint [position leader _x, 10]; 
	  _wp1 setWaypointType "GETIN NEAREST"; 
	  _wp1 setWaypointSpeed "FULL"; 
      _wp2 = _x addWaypoint [MarkerPos "fin_marker", 100]; 
	  _wp2 setWaypointType "GETOUT"; } forEach allGroups; 
    hintsilent "Return To Base!";
};

