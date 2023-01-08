// allDead.sqf //
enmc = 0;
enmc = {alive _x and (side _x == east or side _x == independent) and player distance _x < 150} count allUnits; 
{_x addEventHandler ["killed", {enmc = enmc -1; if (enmc != 0) then {hintsilent format["Enemy remaining : %1",enmc]} else {(_this select 0) cameraEffect ["Fixedwithzoom","top"]}; _mrk = createMarkerLocal [format["%1", enmc], getpos (_this select 0)]; format["%1", enmc] setMarkerTypeLocal "dot"; "_mrk" setMarkerColorLocal "ColorRed"}]} foreach allunits;
sleep 0.5;
player removeAllEventHandlers "killed";
titletext ["KILL 'EM ALL","plain down"];
titleFadeOut 2;
sleep 3;
hintsilent format["Enemy remaining : %1",enmc];
waitUntil {enmc == 0};
sleep 6;
cuttext ["All enemy have been eliminated, rechecking...","plain down"];
sleep 6;
cuttext ["","plain down"];

//execVM "allDead.sqf";

/*
titletext ["MISSION COMPLETED","plain",0.4];
cuttext ["","black out"];
sleep 4;
endMission "END1";
*/
