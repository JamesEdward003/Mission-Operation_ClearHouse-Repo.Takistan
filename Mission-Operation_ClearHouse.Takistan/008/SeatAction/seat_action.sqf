//////////////////////////////////////////////////////////////////
// Function file for Armed Assault
// Created by:  DieHard - Function file for ArmA 2: Operation Arrowhead
//////////////////////////////////////////////////////////////////

 {
 If (typeOf _x in ["CH_47F_BAF","CH_47F_EP1","MH60S","Mi17_CDF","Mi17_Ins","Mi17_rockets_RU","Mi17_TK_EP1","Mi17_UN_CDF_EP1","Mi171Sh_CZ_EP1","Mi171Sh_rockets_CZ_EP1","Mi24_D","Mi24_D_TK_EP1","Mi24_P","Mi24_V","UH1H_TK_EP1","UH1H_TK_GUE_EP1","UH1Y","UH60M_EP1","OFrP_Caracal","OFrP_Caracal_DAOS","OFrP_Puma_CE_Pirate","OFrP_Transall_C160","OFrP_Hawkeye"]) then //Helis with 10+ seats with gunner
 {
 nul = _x addAction ["To Pilot's Seat","008\SeatAction\switchseat.sqf",["pilot"],5,false,true,"","player in (assignedVehicle _target) and driver _target != player"];
 nul = _x addAction ["To Gunner's Seat","008\SeatAction\switchseat.sqf",["gunner"],5,false,true,"","driver _target == player"];
 nul = _x addAction ["To Backseat","008\SeatAction\switchseat.sqf",["back"],5,false,true,"","driver _target == player"];
 };

 If (typeOf _x in ["Ka60_PMC","Mi17_Civilian","Mi17_medevac_CDF","Mi17_medevac_Ins","Mi17_medevac_RU","UH60M_MEV_EP1"]) then //Helis with 10+ seats no gunner
 {
 nul = _x addAction ["To Pilot's Seat","008\SeatAction\switchseat.sqf",["pilot"],5,false,true,"","player in (assignedVehicle _target) and driver _target != player"];
 nul = _x addAction ["To Backseat","008\SeatAction\switchseat.sqf",["back"],5,false,true,"","driver _target == player"];
 };

 If (typeOf _x in ["AH6J","AH6J_EP1","AH6X_EP1","GNT_C185","GNT_C185C","GNT_C185F","GNT_C185R","GNT_C185U","MAF_GazelleHOTD"]) then //Helis with 2-4 seats no gunner
 {
 nul = _x addAction ["To Pilot's Seat","008\SeatAction\switchseat.sqf",["pilot"],5,false,true,"","player in (assignedVehicle _target) and driver _target != player"];
 nul = _x addAction ["To Backseat","008\SeatAction\switchseat.sqf",["back"],5,false,true,"","driver _target == player"];
 };

 If (typeOf _x in ["AH1Z","AH64D","AH64D_EP1","BAF_Apache_AH1_D","Ka52","Ka52Black","Ka137_MG_PMC"]) then //Helis with 2 seats including gunner
 {
 nul = _x addAction ["To Pilot's Seat","008\SeatAction\switchseat.sqf",["pilot"],5,false,true,"","player in (assignedVehicle _target) and driver _target != player"];
 nul = _x addAction ["To Gunner's Seat","008\SeatAction\switchseat.sqf",["gunner"],5,false,true,"","driver _target == player"];
 };

 If (typeOf _x in ["MH6J_EP1"]) then //Helis with <7 seats no gunner
 {
 nul = _x addAction ["To Pilot's Seat","008\SeatAction\switchseat.sqf",["pilot"],5,false,true,"","player in (assignedVehicle _target) and driver _target != player"];
 nul = _x addAction ["To Backseat","008\SeatAction\switchseat.sqf",["back"],5,false,true,"","driver _target == player"];
 };
 } forEach (vehicles);