//////////////////////////////////////////////////////////////////
//Gas masks
_unit = _this select 0;
gasMasks = ["H_CrewHelmetHeli_B","H_CrewHelmetHeli_O","H_CrewHelmetHeli_I"];

//Are we near a smoke shell
fnc_smokeNear = {

//Are we not wearing a gas mask
if ( !( headgear _unit in gasMasks ) ) then {

	//Get nearest smoke shell
	_smokeShell = nearestObject [ getPosATL _unit, "SmokeShell" ];

	//If there is a smoke shell
	if !( isNull _smokeShell ) then {

		//Is it at rest AND within 10 meters of the player ( will need to experiment with magnitude threshold )
		vectorMagnitudeSqr velocity _smokeShell <= 0.5 && { _smokeShell distance _unit < 10 }

	//There is no smoke shell
	}else{

		//Return false
		false
	};

//If we are wearing a gas mask
}else{

	//Return false as it does not matter if a smoke shell is near
	false
};

};

//We are in smoke
fnc_inSmoke = {

//Set a variable on the player so we know we are in smoke
_unit setVariable [ "inSmoke", true ];

//Do effect
"dynamicBlur" ppEffectEnable true;
   "dynamicBlur" ppEffectAdjust [15];
"dynamicBlur" ppEffectCommit 5;
enableCamShake true;
addCamShake [10, 45, 10];
5 fadeSound 0.1;

//While were in smoke
while { [] call fnc_smokeNear } do {

	//Damage the player
	_unit setDamage (damage _unit + 0.12);
   	sleep 2.5;
};

//We are no longer in smoke
[] call fnc_smokeClear;

};

//We are not in smoke
fnc_smokeClear = {

//Reset the player variable
_unit setVariable [ "inSmoke", false ];

//Clear effects
"dynamicBlur" ppEffectEnable true;
   "dynamicBlur" ppEffectAdjust [0];
   "dynamicBlur" ppEffectCommit 10;
   resetCamShake;
   20 fadeSound 1;

};

//Check each frame if we are near smoke
//If we are not already flagged as in smoke AND near a smoke shell
	//Start gas effects
smokeNearSEHID = [ "smokeNear", "onEachFrame", {

if ( !( _unit getVariable [ "inSmoke", false ] ) && { [] call fnc_smokeNear } ) then {
	_inSmokeThread = [] spawn fnc_inSmoke;
};

}] call BIS_fnc_addStackedEventHandler;