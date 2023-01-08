//////////////////////////////////////////////////////////////////
// Function file for Armed Assault
// Created by: RALPH BELL AMI
//////////////////////////////////////////////////////////////////
uisleep 2;
_myalt = getPos player select 2;
_myalt = round(_myalt);
//debug start
//diag_log(format["ALTIMETER STARTED: %1m ", _myalt]);
 
//titleText ["Open the chute BEFORE 200 meters!", "PLAIN DOWN", 0.1];
["<t size='0.5' color='#fff000'>" + "Open the chute BEFORE 300 meters!" + "</t>",0.0,0.1,5,0] spawn bis_fnc_dynamicText;

uisleep 10;

while {(_myalt) > 200 && alive player} do {
 
// Display my altitude text.
_myalt = getPos player select 2;
_myalt = round(_myalt);

//["<t size='1.0' color='#fff000'>" + "   ALTITUDE: " + str _myalt + "                              																																							Open the chute BEFORE 200 meters!" + "</t>",0,0,5,0] spawn bis_fnc_dynamictext; 
//titleText [("ALTITUDE: " + str _myalt + "\n  Open the chute BEFORE 200 meters!"), "PLAIN DOWN", 0.1];

//titleText ["Open the chute BEFORE 200 meters!", "PLAIN DOWN", 0.1];
//["<t size='0.5'>" + "Open the chute BEFORE 200 meters!" + "</t>",0.0,0.1,5,0] spawn bis_fnc_dynamicText;
["<t size='0.5' color='#fff000'>" + "ALTITUDE:  " + str _myalt + " meters" + "</t>",0.0,0.1,5,0] spawn bis_fnc_dynamictext;
//1001 cutText ["Open the chute BEFORE 200 meters!","PLAIN DOWN"];
uisleep 0.1;
};
//debug Stop
//diag_log(format["ALTIMETER STOPPED: %1m ", _myalt]);
