// OnLeaderRespawn.sqf //
OnLeaderRespawn = true;publicVariable "OnLeaderRespawn";

player addEventHandler ["Respawn", {[] execVM "OnLeaderRespawn.sqf"}];

while {alive player and OnLeaderRespawn} do {
   	_spawnPos = getPos leader player;
   	"respawn_west" setMarkerPos _spawnPos;
   	"respawn_west" setMarkerText "";
  	sleep 5;
};

/*
To make respawn marker stationary put in radio trigger: (ceil (estimatedEndServerTime - serverTime) / 60)
if (shownMap) then {openMap true}; player globalChat "Click on map to place stationary respawn marker";  onMapSingleClick "OnLeaderRespawn = false; 'respawn_west' setMarkerPos _pos; openMap false; true; onMapSingleClick '';";

To create and place respawn marker put in radio trigger:
if (shownMap) then {openMap true}; player globalChat "Click on map to place stationary respawn marker";  onMapSingleClick "deleteMarker 'respawn_west'; OnLeaderRespawn = false; _marker = createmarker ['respawn_west',_pos]; 'respawn_west' setMarkerType 'Dot';  'respawn_west' setMarkerSize [1, 1]; 'respawn_west' setMarkerDir 0.9999; 'respawn_west' setMarkerColor 'ColorGreen'; 'respawn_west' setMarkerText ([daytime, 'HH:MM:SS'] call BIS_fnc_timeToString);  openMap false; true; onMapSingleClick '';";

To teleport player put in radio trigger:
if (shownMap) then {openMap true}; player globalChat "Click on map to teleport";  onMapSingleClick "player setPos _pos; player globalChat 'Player has been teleported'; openMap false; true; onMapSingleClick '';"

To teleport player group put in radio trigger:
if (shownMap) then {openMap true}; player globalChat "Click on map to teleport";  onMapSingleClick "{_x setPos _pos} forEach units group player; player globalChat 'Player has been teleported'; openMap false; true; onMapSingleClick '';";

if (musicVolume > 0) then { 1 fadeMusic 0; player globalChat "Music volume - 0"; } else { 1 fadeMusic 1; player globalChat "Music volume - 1"; };

_null=[] spawn { if (shownMap) then {openMap true}; titleText ["To Get Group Info, Use Your Radio To Turn On Group Icons! '0-0-6' -> 'Radio' -> 'ICONS ON/OFF!'", "PLAIN DOWN"]; sleep 10; titleText ["LeftClick On Group Icons To Get Info", "PLAIN DOWN"]; sleep 10; titleText ["Alt-LeftClick On Group Icons To Get Camera View", "PLAIN DOWN"]; };

if (groupIconsVisible select 0 or groupIconsVisible select 1) then {setGroupIconsVisible [false,false]; player globalChat "Military Icons OFF"} else {setGroupIconsVisible [true,true]; player globalChat "Military Icons ON"};

if (set_h_time) then { player globalChat "Player set time done"; set_h_time=false;publicVariable "setTime"; } else { player globalChat "Player setting time"; set_h_time=true;publicVariable "set_h_time"; _null=[] spawn {while {set_h_time} do { skipTime 1; sleep 1; };};};

if (set_m_time) then { player globalChat "Player set time done"; set_m_time=false;publicVariable "set_m_time"; } else { player globalChat "Player setting time"; set_m_time=true;publicVariable "set_m_time"; _null=[] spawn {while {set_m_time} do { skipTime 0.00333; sleep 0.1; };};};

if (shownMap) then {openMap true}; player globalChat "Click on map to place stationary respawn marker";  onMapSingleClick "deleteMarker 'respawn_west'; OnLeaderRespawn = false; _marker = createmarker ['respawn_west',_pos]; 'respawn_west' setMarkerType 'Dot';  'respawn_west' setMarkerSize [1, 1]; 'respawn_west' setMarkerDir 0.9999; 'respawn_west' setMarkerColor 'ColorGreen'; 'respawn_west' setMarkerText ([daytime, 'HH:MM:SS'] call BIS_fnc_timeToString);  openMap false; true; onMapSingleClick '';";

[["transport", "aerial_reconnaissance", "supply_drop", "tactical_airstrike", "artillery_barrage", "gunship_run"], player] call BIS_SOM_addSupportRequestFunc;

titleText ["To Start The Mission, Use Your Radio To Launch Operation! '0-0-1' -> 'Radio' -> 'Launch Operation!'", "PLAIN DOWN"];

this enableSimulation false
*/

