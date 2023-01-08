///////////////////////////////////////////////////////////
PlayerSupport_Menu = 
[
	["Player Support",False],
	["Unit Cursor Arrest",[2],"",-5,[["expression","nul=[cursorTarget,player] execvm '008\ArrestScript.sqf'"]],"1","1"],
	["Unit Cursor Marker",[3],"",-5,[["expression","nul=[] execvm '008\twirlyMrkrCursor.sqf'"]],"1","1"],
	["Unit Cursor Dismiss",[4],"",-5,[["expression","nul=[] execvm '008\dismissCursor.sqf'"]],"1","1"],
	["Unit Cursor Heal",[5],"",-5,[["expression","nul=[player] execvm '008\heal\heal.sqf'"]],"1","1"],
	["Unit Cursor Destroy",[6],"",-5,[["expression","nul=[] execvm '008\destroy.sqf'"]],"1","1"],
	["Unit Heal Self",[7],"",-5,[["expression","nul=[player] execvm '008\healSelf\healSelf.sqf'"]],"1","1"],
	["Unit Cursor Allow Damage False",[8],"",-5,[["expression","nul=[cursorTarget] execvm '008\adFalse.sqf'"]],"1","1"],
	["Unit Cursor Allow Damage True",[9],"",-5,[["expression","nul=[cursorTarget] execvm '008\adTrue.sqf'"]],"1","1"],
	["Gear Slot Data",[10],"",-5,[["expression","nul=[] execvm '008\gearSlotData.sqf'"]],"1","1"]
];

PlayerSupport_Menu2 = 
[
	["Player Support",False],
	["Respawn Marker Player",[2],"",-5,[["expression","nul=[player] execvm '008\RallyPoint.sqf'"]],"1","1"],
	["Respawn Marker On MapClick",[3],"",-5,[["expression","nul=[] execvm '008\RallyPointOMC.sqf'"]],"1","1"],
	["Player Waypoint Attach",[4],"",-5,[["expression","nul=[player] execvm '008\attachWPunit.sqf'"]],"1","1"],
	["Player Waypoints Delete",[5],"",-5,[["expression","nul=[] execvm '008\deleteWPplayer.sqf'"]],"1","1"],
	["Vehicle Cursor Unlock",[6],"",-5,[["expression","nul=[] execvm '008\unlock.sqf'"]],"1","1"],
	["Vehicle Cursor Service",[7],"",-5,[["expression","nul=[cursorTarget] execvm '008\vehicleService.sqf'"]],"1","1"],
	["Teleport Player",[8],"",-5,[["expression","nul=[player] execvm '008\teleport.sqf'"]],"1","1"],
	["Teleport Group Player",[9],"",-5,[["expression","nul=[player] execvm '008\teleportGroup.sqf'"]],"1","1"],
	["HALO Player",[10],"",-5,[["expression","nul=[] execvm '008\flagpoleHALO.sqf'"]],"1","1"]
];

DayWeaponSupport_Menu = 
[
	["Day Weapon Support",False],
	["SCAR_H_STD_EGLM_Spect_SMAW",[2],"",-5,[["expression","nul=[player] execvm 'Cly_AddWeapon\cly_addweapon_SCAR_H_STD_EGLM_Spect_smaw.sqf'"]],"1","1"],
	["SCAR_H_STD_EGLM_Spect_JAVELIN",[3],"",-5,[["expression","nul=[player] execvm 'Cly_AddWeapon\cly_addweapon_SCAR_H_STD_EGLM_Spect_Javelin.sqf'"]],"1","1"],
	["SCAR_H_STD_EGLM_Spect_STINGER",[4],"",-5,[["expression","nul=[player] execvm 'Cly_AddWeapon\cly_addweapon_SCAR_H_STD_EGLM_Spect_Stinger.sqf'"]],"1","1"],
	["SCAR_H_STD_EGLM_Spect_M136",[5],"",-5,[["expression","nul=[player] execvm 'Cly_AddWeapon\cly_addweapon_SCAR_H_STD_EGLM_Spect_M136.sqf'"]],"1","1"],
	["SCAR_H_STD_EGLM_Spect_SMAW",[6],"",-5,[["expression","nul=[player] execvm 'Cly_AddWeapon\cly_addweapon_SCAR_H_STD_EGLM_Spect_smaw.sqf'"]],"1","1"],
	["SCAR_l_STD_EGLM_RCO_JAVELIN",[7],"",-5,[["expression","nul=[player] execvm 'Cly_AddWeapon\cly_addweapon_scar_l_std_eglm_rco_javelin.sqf'"]],"1","1"],
	["SCAR_l_STD_EGLM_RCO_SMAW",[8],"",-5,[["expression","nul=[player] execvm 'Cly_AddWeapon\cly_addweapon_scar_l_std_eglm_rco_smaw.sqf'"]],"1","1"],
	["M249_SCOPED_SMAW",[9],"",-5,[["expression","nul=[player] execvm 'Cly_AddWeapon\cly_addweapon_m249_scoped_smaw.sqf'"]],"1","1"],
	["M240_SCOPED_SMAW",[10],"",-5,[["expression","nul=[player] execvm 'Cly_AddWeapon\cly_addweapon_m240_scoped.sqf'"]],"1","1"]
];
//cly_addweapon_SCAR_H_LNG_Sniper
NightWeaponSupport_Menu =
[
	["Night Weapon Support",False],
	["DMR_SMAW",[2],"",-5,[["expression","nul=[player] execvm 'Cly_AddWeapon\cly_addweapon_dmr_smaw.sqf'"]],"1","1"],
	["DMR_JAVELIN",[3],"",-5,[["expression","nul=[player] execvm 'Cly_AddWeapon\cly_addweapon_dmr_javelin.sqf'"]],"1","1"],
	["M107_TWS_SMAW",[4],"",-5,[["expression","nul=[player] execvm 'Cly_AddWeapon\cly_addweapon_M107_TWS_smaw.sqf'"]],"1","1"],
	["M110_TWS_SMAW",[5],"",-5,[["expression","nul=[player] execvm 'Cly_AddWeapon\cly_addweapon_M110_TWS_smaw.sqf'"]],"1","1"],
	["M110_NVG_SMAW",[6],"",-5,[["expression","nul=[player] execvm 'Cly_AddWeapon\cly_addweapon_M110_NVG_smaw.sqf'"]],"1","1"],
	["M249_TWS_JAVELIN",[7],"",-5,[["expression","nul=[player] execvm 'Cly_AddWeapon\cly_addweapon_M249_TWS_Javelin.sqf'"]],"1","1"],
	["M249_TWS_M136",[8],"",-5,[["expression","nul=[player] execvm 'Cly_AddWeapon\cly_addweapon_m249_tws_smaw.sqf'"]],"1","1"],
	["M249_TWS_STINGER",[9],"",-5,[["expression","nul=[player] execvm 'Cly_AddWeapon\cly_addweapon_m249_tws_stinger.sqf'"]],"1","1"]
];	

MusicSupport_Menu = 
[
	["Music Support",False],
	["Born On The Bayou",[2],"",-5,[["expression","nul=[] execvm 'Music\BornOnTheBayou.sqf'"]],"1","1"],
	["Fortunate Son",[3],"",-5,[["expression","nul=[] execvm 'Music\FortunateSon.sqf'"]],"1","1"],
	["Fortunate Son 2",[4],"",-5,[["expression","nul=[] execvm 'Music\FortunateSon2.sqf'"]],"1","1"],
	["Good Golly Miss Molly",[5],"",-5,[["expression","nul=[] execvm 'Music\GoodGollyMissMolly.sqf'"]],"1","1"],
	["Keep On Chooglin",[6],"",-5,[["expression","nul=[] execvm 'Music\KeepOnChooglin.sqf'"]],"1","1"],
	["Run Through The Jungle",[7],"",-5,[["expression","nul=[] execvm 'Music\RunThroughTheJungle.sqf'"]],"1","1"],
	["Did You Ever Have To Make Up Your Mind",[8],"",-5,[["expression","nul=[] execvm 'Music\DidYouEverHaveToMakeUpYourMind.sqf'"]],"1","1"],
	["Up On The Roof",[9],"",-5,[["expression","nul=[] execvm 'Music\UpOnTheRoof.sqf'"]],"1","1"],
	["The Magdalene Laundries",[10],"",-5,[["expression","nul=[] execvm 'Music\TheMagdaleneLaundries.sqf'"]],"1","1"]
];

MusicSupport_Menu2 =
[
	["Music Support",False],
	["AM92Intro",[2],"",-5,[["expression","nul=[] execvm 'Music\AM92Intro.sqf'"]],"1","1"],
	["DirtyCity",[3],"",-5,[["expression","nul=[] execvm 'Music\DirtyCity.sqf'"]],"1","1"],
	["Fortunate Son 2",[4],"",-5,[["expression","nul=[] execvm 'Music\FortunateSon2.sqf'"]],"1","1"],
	["Good Golly Miss Molly",[5],"",-5,[["expression","nul=[] execvm 'Music\GoodGollyMissMolly.sqf'"]],"1","1"],
	["Keep On Chooglin",[6],"",-5,[["expression","nul=[] execvm 'Music\KeepOnChooglin.sqf'"]],"1","1"],
	["Run Through The Jungle",[7],"",-5,[["expression","nul=[] execvm 'Music\RunThroughTheJungle.sqf'"]],"1","1"],
	["Did You Ever Have To Make Up Your Mind",[8],"",-5,[["expression","nul=[] execvm 'Music\DidYouEverHaveToMakeUpYourMind.sqf'"]],"1","1"],
	["Up On The Roof",[9],"",-5,[["expression","nul=[] execvm 'Music\UpOnTheRoof.sqf'"]],"1","1"],
	["The Magdalene Laundries",[10],"",-5,[["expression","nul=[] execvm 'Music\TheMagdaleneLaundries.sqf'"]],"1","1"]
];	

AirSupport_Menu = 
[
	["Air Support",False],
	["Air Cursor LAND",[2],"",-5,[["expression","nul=[] execvm '008\airLand.sqf'"]],"1","1"],
	["Air Transport",[3],"",-5,[["expression","nul=[player] execVM '008\plannedExtraction.sqf'"]],"1","1"],
	["Air Alternate LZ",[4],"",-5,[["expression","nul=[] execvm '008\altLZcommand2.sqf'"]],"1","1"],
	["Air Strike",[5],"",-5,[["expression","nul=[player] execvm '008\airStrike.sqf'"]],"1","1"],
	["Missile Strike",[6],"",-5,[["expression","nul=[player] execvm '008\MissileStrike\missile_airstrike_init.sqf'"]],"1","1"],
	["Fixed-Wing CAS",[7],"",-5,[["expression","nul=[player] execvm '008\plannedFixedWing.sqf'"]],"1","1"],
	["Rotary-Wing CAS",[8],"",-5,[["expression","nul=[player] execvm '008\plannedRotaryWing.sqf'"]],"1","1"]
];

AirSupport_Menu2 =
[
	["Air Support 2",False],
	["Vehicle Player LZ",[2],"",-5,[["expression","nul=[vehicle player] execvm '008\altLZ.sqf'"]],"1","1"],
	["Vehicle Player Redirect",[3],"",-5,[["expression","nul=[] execvm '008\altLZcommand.sqf'"]],"1","1"],
	["Vehicle Cursor LAND",[4],"",-5,[["expression","nul=[] execvm '008\airLand.sqf'"]],"1","1"],
	["Vehicle Cursor Repair",[5],"",-5,[["expression","nul=[] execvm '008\repair.sqf'"]],"1","1"],
	["Vehicle Cursor Unlock",[6],"",-5,[["expression","nul=[] execvm '008\unlock.sqf'"]],"1","1"],
	["Vehicle Cursor Service",[7],"",-5,[["expression","nul=[cursorTarget] execvm '008\vehicleService.sqf'"]],"1","1"],
	["LaserTarget OMC",[8],"",-5,[["expression","nul=[] execvm '008\laseTarget_OMC.sqf'"]],"1","1"],
	["Cursor LaserTarget",[9],"",-5,[["expression","nul=[player] execvm '008\cursorLaserTarget.sqf'"]],"1","1"]
];	

GroundSupport_Menu = 
[
	["Ground Support",False],
	["Arma2 Infantry On MapClick",[2],"",-5,[["expression","nul=[player] execvm '008\createInfantry.sqf'"]],"1","1"],
	["Arma2 Special Infantry On MapClick",[3],"",-5,[["expression","nul=[player] execvm '008\createRazorInfantry.sqf'"]],"1","1"],
	["Arma2 Motorized Infantry On MapClick",[4],"",-5,[["expression","nul=[player] execvm '008\createMotorizedInfantry.sqf'"]],"1","1"],
	["Arma2 Mechanized Infantry On MapClick",[5],"",-5,[["expression","nul=[player] execvm '008\createMechanizedInfantry.sqf'"]],"1","1"],
	["Arma2 Armored Infantry On MapClick",[6],"",-5,[["expression","nul=[player] execvm '008\createArmoredInfantry.sqf'"]],"1","1"],
	["Arma2 OA Infantry On MapClick",[7],"",-5,[["expression","nul=[player] execvm '008\createOAInfantry.sqf'"]],"1","1"],
	["Arma2 OA Motorized Infantry On MapClick",[8],"",-5,[["expression","nul=[player] execvm '008\createOAMotorizedInfantry.sqf'"]],"1","1"],
	["Arma2 OA Mechanized Infantry On MapClick",[9],"",-5,[["expression","nul=[player] execvm '008\createOAMechanizedInfantry.sqf'"]],"1","1"],
	["Arma2 OA Armored Infantry On MapClick",[10],"",-5,[["expression","nul=[player] execvm '008\createOAArmoredInfantry.sqf'"]],"1","1"]
];

[] call BIS_fnc_commsMenuCreate; 

Main_Menu =
[
	["Support Menu",False],
	["Ground Support Options",[10],"#USER:GroundSupport_Menu",-5,[["expression",""]],"1","1"]
];

BIS_MENU_GroupCommunication = 
[
	[localize "STR_SOM_COMMUNICATIONS", false],
	[">> DaiZy+ >>",[2],"#USER:Main_Menu",-5,[["expression",""]],"1","1"],
	[">> Set Time <<",[3],"#USER:Main_Menu",-5,[["expression",""]],"1","1"]
];

//BIS_MENU_GroupCommunication =+ MY_MENU_communication
//showCommandingMenu "#USER:Main_Menu";
//waituntil {!isnil "BIS_MENUS"};