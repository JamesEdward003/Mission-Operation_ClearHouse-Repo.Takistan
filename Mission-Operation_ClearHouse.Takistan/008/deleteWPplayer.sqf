//////////////////////////////////////////////////////////////////
// Function file for Armed Assault
// Created by: RALPH BELL AMI
//////////////////////////////////////////////////////////////////

	while {(count (waypoints player)) > 0} do {
		deleteWaypoint ((waypoints player) select 0);
		sleep 0.01;
		};
		
//	if ((count (waypoints player)) > 0) then {
//		deleteWaypoint ((waypoints player) select 0);
