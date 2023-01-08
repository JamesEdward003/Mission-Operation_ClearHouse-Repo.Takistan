//////////////////////////////////////////////////////////////////
WaitUntil {openMap true}; onMapSingleClick {{_x setPosATL _pos} forEach units player; openmap false; onmapsingleclick {}};