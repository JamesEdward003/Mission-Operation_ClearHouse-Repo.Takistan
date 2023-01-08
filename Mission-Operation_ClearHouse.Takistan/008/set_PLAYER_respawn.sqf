//////////////////////////////////////////////////////////////////
// Function file for Armed Assault
// Created by:  DieHard - Function file for ArmA 2: Operation Arrowhead
//////////////////////////////////////////////////////////////////
//"respawn_west" setMarkerPosLocal [markerPos "respawn_West" select 0, markerPos "respawn_West" select 1, 15.9];
_unit= _this select 0;
_vehicleVarName = vehicleVarName _unit;

"respawn_west" setMarkerPos [getPos _unit select 0, getPos _unit select 1 + 5, 0];

PAPABEAR=[West,"HQ"]; PAPABEAR SideChat format ["Relocating respawn marker to your position, %1.", _vehicleVarName];
