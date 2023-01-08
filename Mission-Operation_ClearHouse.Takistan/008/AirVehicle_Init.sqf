//////////////////////////////////////////////////////////////////
// Function file for Armed Assault
// Created by:  DieHard - Function file for ArmA 2: Operation Arrowhead
//////////////////////////////////////////////////////////////////
_vehicle = _this select 0;

_vehicle setVehicleInit
"
this setvehiclelock 'unlocked'; 
addSwitchableUnit (driver this);
this addWeaponCargo ['SCAR_H_STD_TWS_SD',1]; 
this addMagazineCargo ['20Rnd_762x51_SB_SCAR',8]; 
this addWeaponCargo ['JAVELIN',1]; 
this addMagazineCargo ['JAVELIN',4];
[this] execVM '008\loadoutAir.sqf';
[this] execVM '008\SeatAction\seat_action.sqf';
this addAction['<t color=''#FFD700''>Deploy RallyPoint</t>', 'RallyPoint.sqf',[],6,false,true,'',''];
this addAction ['Alternate Landing Zone', '008\altLZcommand.sqf',[],3,false,true,'',''];
this addEventHandler ['Fired',{[_this select 0,getNumber (configFile/'CfgAmmo'/(_this select 4)/'explosive')] spawn {if (_this select 1==1) then {sleep 0.5};_this select 0 setVehicleAmmo 1}}];
this addEventHandler ['killed', {[_this select 0, _this select 1, [lzPickup, lzDropOff, 'hEnd']] execVM '008\onKilled.sqf'}];
this addEventHandler ['handleDamage', { (damage (_this select 0)) +  0.01; (damage (_this select 2)) +  0.01 }]; 
{(_x) addEventHandler ['handleDamage', { (damage (_this select 0)) +  0.01; (damage (_this select 2)) +  0.01 }];
} forEach crew this;
this addeventhandler ['getin', {_nul=[_this select 2] execVM '008\adfalse.sqf'}];
this addeventhandler ['getout', {_nul=[_this select 2] execVM '008\adtrue.sqf'}];
"
processInitCommands;