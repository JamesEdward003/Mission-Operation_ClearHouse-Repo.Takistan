//////////////////////////////////////////////////////////////////
// Function file for Armed Assault
// Created by:  DieHard - Function file for ArmA 2: Operation Arrowhead
///////////////////////////////////////////////////////////////////////////////
//  Heli Door Script v1                                                		//
//  Execute from any compatible Helicopter init field:                       //
//  0 = [this] execVM "scripts\heliDoors.sqf";                            	//
//                                                                           //
//  Credits:                                                                 //
//    Delta 1 Actual for his Heli Door Open Script                           //
//    DJPorterNZ for CH-49 and Mi-48 fix                                     //
//                                                                           //
//  Compatible Aircraft:                                                     //
//    OFrP_Caracal                                                        	//
//                                                                			//
//                                                               			//
///////////////////////////////////////////////////////////////////////////////

if (!isServer) exitWith {};

private ["_veh","_alt","_speed"];

_veh = _this select 0;

switch (typeof _veh) do {
    // OFrP_Caracal
    case "OFrP_Caracal": {
    while {alive _veh} do {
      sleep 0.5;
      _alt = getPos _veh select 2;
      _speed = (sqrt ((velocity _veh select 0)^2 + (velocity _veh select 1)^2 + (velocity _veh select 2)^2));
      if ((_alt < 8) && (_speed < 12)) then {
        _veh animateDoor ['door_R',1]; 
        _veh animateDoor ['door_L',1];
      } else {
        _veh animateDoor ['door_R',0]; 
        _veh animateDoor ['door_L',0];
      };
    };
  };