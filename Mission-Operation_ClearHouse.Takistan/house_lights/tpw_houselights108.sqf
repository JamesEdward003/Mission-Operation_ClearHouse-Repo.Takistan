// THIS SCRIPT WON'T RUN ON DEDICATED SERVERS
if (isDedicated) exitWith {};
     
/*
  TPW HOUSELIGHTS v 1.08
  This script causes flickering lights to automatically come on in enterable
  buildings around the player. It will work on any map with ALICE2 compatible
  enterable buildings, and will simply ignore unenterable ALICE buildings.
  Please feel free to modify and improve this script, on the proviso that you
  post your improvements for others to benefit from.
  
  Thanks:
  * CarlGustaffa for the azimuth code
  * Rydygier for the inspiration for the flickering code
  * RogueTrooper for the improved code for determining enterable buildings
  * Xeno for config and server help
  * Demon Cleaner and Muzzleflash for code cleanup and optimisation
     
  TPW 20120603
*/  

sleep 10; // Allow other scripts time to settle down
    
////////////////
// VARIABLES //
//////////////
private ["_housedistance","_houseperc","_flickerdistance","_brightdistance","_hint"];
     
// Distance around player to scan for houses to light.
_housedistance = 200;

// Houses greater than this distance will be brighter, to compensate for engine.
_brightdistance = 100;
     
// Percentage of houses to receive lights.
_houseperc = 100;

// How close player must be to a light to see it flickering - use a lower value if flickering lights are too CPU demanding
_flickerdistance = 50;

// Initialisation hint. 0 = no hint 
_hint = 0;
     
/* 
  LIGHT-TYPE VALUES
  Light-type will be picked at random.
  Each individual light array consists of: [red,green,blue,maximum brightness,minimum brightness,%chance of flickering,%brightness to flicker]
  Example: [255,127,24,60,30,80,10] = warm yellow, brightness between 20-60, 80% chance of flickering, 10% brightness variation when flickering 
  Red, green and blue values are 0-255
  Brightness values are 0-255
  Flickering values are 0-100
  Light sources don't really stress the engine, but flickering lightsources can.
  If you want no flickering, set all %chance of flickering values to 0.
*/

private ["_candle","_incan","_tv","_ratio"];
_candle =[255,127,24,60,30,80,10]; // warm yellow/orange (candle or fire)
_incan = [255,200,100,80,40,20,5]; // yellow/white (incandesecent)
_tv = [100,200,255,60,30,100,30]; // blue/white (television or fluorescent)
_ratio = [4,2,1]; // ratio of candle:incan:tv
     
///////////////////////////////////////////////
// PROCESS LIGHT ARRAYS INTO USEABLE VALUES //
/////////////////////////////////////////////
private [
  "_lightarray",
  "_proclightarray",
  "_red",
  "_green",
  "_blue",
  "_max",
  "_min",
  "_flperc",
  "_flvar",
  "_proclight"
];
     
_lightarray = [];
for "_x" from 1 to (_ratio select 0) do {_lightarray set [count _lightarray,_candle]};
for "_x" from 1 to (_ratio select 1) do {_lightarray set [count _lightarray,_incan]};
for "_x" from 1 to (_ratio select 2) do {_lightarray set [count _lightarray,_tv]};
     
_proclightarray = [];
{ _red = _x select 0;
  _red = _red / 255;
  _green = _x select 1;
  _green = _green / 255;
  _blue = _x select 2;
  _blue = _blue / 255;
  _max = _x select 3;
  _min = _x select 4;
  _flperc = _x select 5;
  _flvar = _x select 6;
  _flvar = _flvar / 100;
  _proclight = [_red,_green,_blue,_max,_min,_flperc,_flvar];
  _proclightarray set [count _proclightarray,_proclight]
} foreach _lightarray;
     
///////////////////////
// FLICKER FUNCTION //
/////////////////////
tpw_flicker = {
private ['_lt0','_br','_fv','_rng','_brmax','_brmin','_op','_inc','_br2','_fd','_ct'];
_lt0 = _this select 0; // Light source
_br = _this select 1; // Brightness
_fv = _this select 2; // Brightness variation
_fd = _this select 3; // Distance from player to flicker
_rng = _br * _fv; // Brightness range
_brmax = (_br + _rng); // Initial maximum brightness
_brmin = (_br - _rng); // Initital minimum brightness
_op = 1; // Operator, will be +/-
_inc = _rng / (random 10); // Initial brightness increment
_br2 = _br;
_ldist = (vehicle player) distance _lt0; // Initial distance from player
_ct = 0;
while {not (isNull _lt0)} do { // Only run if lightsource object exists 
_ct = _ct + 1;
if (_ldist < _fd) then { // Only flicker if close enough to player
 _br2 = _br2 + (_op * _inc); // Increment/decrement brightness (depends on operator)
 _lt0 setLightBrightness _br2; // Set brightness
 if (_br2 > _brmax) then { // If brightness exceeds maximum, then change operator so it will decrease
   _op = -1;
   _brmax = _br + (random _rng); // New maximum
   _inc = _rng / ((random 10) + 1); // New increment
	};
 if (_br2 < _brmin) then { // If brightness less than minimum, then change operator so it will increase
   _op = 1;
   _brmin = _br - (random _rng); // New minimum
   _inc = _rng / ((random 10) + 1); // New increment
	};
 };
 sleep (random 0.1); // Random time between each increment/decrement
if (_ct > 100) then {_ldist = (vehicle player) distance _lt0; _ct = 0}; // Only determine distance from player every second or 2, to save CPU
};
};

///////////////
// SUN ANGLE//
/////////////
[] spawn {
while {true} do 
 {
private ["_lat","_day","_hour","_sunangle"];
_lat = -1 * getNumber(configFile >> "CfgWorlds" >> worldName >> "latitude");
_day = 360 * (dateToNumber date);
_hour = (daytime / 24) * 360;
tpw_houselights_sunangle = ((12 * cos(_day) - 78) * cos(_lat) * cos(_hour)) - (24 * sin(_lat) * cos(_day));  
sleep 60; 
 };
};

///////////////////////////
// INITIALISE ALL HOUSES//
/////////////////////////
private ["_allhouses","_houses"];
_allhouses = nearestObjects [getPosATL (vehicle player),["House"],20000]; // All houses within 20k radius of player
_houses = []; 
{if ((((_x buildingpos 0) select 0) != 0) and ((random 100) < _houseperc)) then {_houses set [count _houses,_x]}} foreach _allhouses; // Pool of enterable houses that can be lit
tpw_housecount = count _houses; //public variable for debugging

///////////////////////////////////////////////
// LIGHT PARAMETERS FOR EACH LIGHTABLE HOUSE//
/////////////////////////////////////////////
private ["_light","_r","_g","_b","_col","_br","_lp"];
{_light = _proclightarray select (floor (random (count _proclightarray))); // Select light type
_r = _light select 0;_g = _light select 1;_b = _light select 2;_col = [_r,_g,_b]; // Light colour values
_max = _light select 3;_min = _light select 4;// Light brightness range
_flperc = _light select 5; _flvar = 0; if (random 100 < _flperc) then {_flvar = _light select 6};// Light flickering parameters
_br = 0.1 * ((_min + (random (_max - _min))) / 255);// Random brightness between specified range
_params = [_col,_br,_flvar]; // Bundle them up into a single variable
_x setvariable ["light_parameters",_params]; // Associate these parameters with this house
_x setvariable ["lit",0]; // Mark it as unlit
} foreach _houses; 

////////////////
// START HINT//
//////////////
if (_hint > 0) then {
[] spawn {
hintsilent format ["TPW Houselights 1.08\n%1 Lightable Houses",tpw_housecount];
sleep 5;
hintsilent "";
};
};

///////////////
// MAIN LOOP//
/////////////
tpw_lithouses = 0; // public variable for debugging
while {true} do 
{
// IF IT'S DARK
if (tpw_houselights_sunangle < 0) then 
 {
  {
private ["_lit","_light","_params","_dist"];
//Lighting variables associated with each house
_lit = _x getvariable "lit"; 
_light = _x getvariable "light_source"; 
_params = _x getvariable "light_parameters";
_dist = (vehicle player) distance _x;

if (_lit == 0) then 
	{ 
//UNLIT HOUSES
//Light house if close enough to player
if (_dist < _housedistance) then 
     { 
_col = _params select 0; // Colour
_br = _params select 1; // Brightness
_flvar = _params select 2; // Flickering amount	
_lp =  createVehicle ["#lightpoint", (getposatl _x),[],0,""] ; // Create light
_lp setLightColor _col; // Set its colour
_lp setLightBrightness _br; // Set its brightness
_lp lightAttachObject [_x, [1,1,1]]; // Position it within house
if (_flvar > 0) then {[_lp,_br,_flvar,_flickerdistance] spawn tpw_flicker}; // Flicker if flickering value greater than 0
_x setvariable ["light_source",_lp]; // Assign this lightsource to this house
_x setvariable ["lit",1]; // Mark house as lit
tpw_lithouses= tpw_lithouses + 1; // Increment lit house counter
	 };
	} else 
    {
//LIT HOUSES	
//Remove lights from houses greater than specified distance		
if  (_dist > _housedistance) then 
	 {
deletevehicle _light; // Remove light source
_x setvariable ["lit",0]; // Mark house as unlit
tpw_lithouses= tpw_lithouses - 1; // Decrement lit house counter
	 };

//Increase the brightness of distant house lights		
if (_dist > _brightdistance) then 
	 {
_br = (_params select 1) * 1.5; // Increase brightness
_light setlightbrightness _br;
	 };	

//Normal brightness of close house lights		
if (_dist < _brightdistance) then 
	 {
_br = _params select 1; // Normal brightness
_light setlightbrightness _br;
	 };			
    } 
   } foreach _houses;
 } else
 {
// IF IT'S LIGHT THEN DELETE ALL HOUSE LIGHTS
 if (tpw_lithouses > 0) then 
  {
   {
 _lit = _x getvariable "lit"; 
 if (_lit == 1) then 
	{
_light = _x getvariable "light_source"; 
deletevehicle _light; // Remove light source
_x setvariable ["lit",0]; // Mark house as unlit
tpw_lithouses = tpw_lithouses - 1; // Decrement lit house counter
    };
   } foreach _houses;
  };
 };
sleep 15;
};