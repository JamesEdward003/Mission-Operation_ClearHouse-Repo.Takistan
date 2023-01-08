/*===============================================================================================
Day&Weather Script - by Moerderhoschi
Armed-Assault.de
Version: 1.2
Date: 30.11.2012
===============================================================================================*/

//////////////////////////////////////////////////
// DEFINE VARIABLES
//////////////////////////////////////////////////
_p1 = 1;
_p2 = 1;

if (isMultiplayer) then
{
_p1 = paramsArray select 0;
_p2 = paramsArray select 1;
};

//////////////////////////////////////////////////
// GLOBAL WIND SETTINGS
//////////////////////////////////////////////////
if (isServer) then
{
if (isNil "MdhDwWx") then
{
	MdhDwWx = (switch (_p2) do
	{
		case 1: {(-10+(random 20))};
		case 2: {((-0.5)+(random 1))};
		case 3: {(-1+(random 2))};
		case 4: {(-2.5+(random 5))};
		case 5: {(-5+(random 10))};
		case 6: {(-10+(random 20))};
	});

	publicvariable "MdhDwWx";
};

if (isNil "MdhDwWy") then
{
	MdhDwWy = (switch (_p2) do
	{
		case 1: {(-10+(random 20))};
		case 2: {((-0.5)+(random 1))};
		case 3: {(-1+(random 2))};
		case 4: {(-2.5+(random 5))};
		case 5: {(-5+(random 10))};
		case 6: {(-10+(random 20))};
	});

	publicvariable "MdhDwWy";
};

//////////////////////////////////////////////////
// SERVER DAYTIME SETTINGS
//////////////////////////////////////////////////
switch (_p1) do
{
	case 1: {skiptime (ceil random 96)};
	case 2: {setDate [2020, 7, 25, 4, 0]};
	case 3: {setDate [2020, 7, 25, 5, 0]};
	case 4: {setDate [2020, 7, 25, 12, 0]};
	case 5: {setDate [2020, 7, 25, 20, 0]};
	case 6: {setDate [2020, 7, 25, 1, 0]};
	case 7: {setDate [2020, 7, 20, 1, 0]};
};

//////////////////////////////////////////////////
// SERVER WEATHER AND RAIN SETTINGS
//////////////////////////////////////////////////
if (isNil "MdhDwAktWeather") then
{
	switch (_p2) do
	{
		case 1:	{MdhDwAktWeather = random 1};
		case 2: {MdhDwAktWeather = 0};
		case 3: {MdhDwAktWeather = 0.25};
		case 4: {MdhDwAktWeather = 0.5};
		case 5: {MdhDwAktWeather = 0.75};
		case 6: {MdhDwAktWeather = 1};	
	};

	0 setOvercast MdhDwAktWeather;
	0 setrain MdhDwAktWeather;
	publicvariable "MdhDwAktWeather";
};
};

//////////////////////////////////////////////////
// WAITUNTIL PLAYER EXISTS
//////////////////////////////////////////////////
if (!isDedicated) then
{
waitUntil {!(isNull player)};
waitUntil {player == player};
waitUntil {!isNil"MdhDwAktWeather"};
};

//////////////////////////////////////////////////
// CLIENT WEATHER SETTINGS
//////////////////////////////////////////////////
sleep 1;
0 setOvercast MdhDwAktWeather;
sleep 1;

//////////////////////////////////////////////////
// CLIENT WETAHER SETTINGS FOR LONG TIME
//////////////////////////////////////////////////
36000 setOvercast MdhDwAktWeather;

//////////////////////////////////////////////////
// PERMANENT FORCED CLIENT WIND AND RAIN SETTINGS
//////////////////////////////////////////////////
while {!isNil"MdhDwAktWeather"} do
{	
setwind [MdhDwWx,MdhDwWy,true];
3 setrain MdhDwAktWeather;
sleep 1;
};
