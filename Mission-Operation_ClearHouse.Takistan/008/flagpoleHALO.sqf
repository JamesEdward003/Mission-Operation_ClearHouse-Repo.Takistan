///////////////////////////////////////////////////////////////
// Function file for Armed Assault
// hint 'Close the map and don''t forget to open your chute!';
///////////////////////////////////////////////////////////////
hintSilent "Click on the map where you'd like to HALO.";
uisleep 0.25;
openMap true;
uisleep 0.25;

haloed = true;
onMapSingleClick "player setPos _pos; haloed = false;";
waitUntil{!haloed};
onMapSingleClick "";

[player, 2000] exec 'ca\air2\halo\data\Scripts\HALO_init.sqs';
[player] execVM '008\altimeter.sqf';

uisleep 0.5;
openMap false;
	
//	_tmpaction = player addAction["foo", "foo.sqf"];
		
//while {_tmpaction >= 0} do {
//	player removeAction _tmpaction;
//	_tmpaction = _tmpaction - 1;
//  };
  