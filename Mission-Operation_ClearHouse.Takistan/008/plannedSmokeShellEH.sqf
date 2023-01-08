//////////////////////////////////////////////////////////////////
_objectForEH = player;
objPos = getPos player;
_smokeShellHandler = _objectForEH addEventHandler ["Fired", {
   muzzleFired = _this select 2;
   ammoFired = _this select 4;
   projectileObj = _this select 6;

   if (muzzleFired == "SmokeShellMuzzle") then {   
     null=projectileObj spawn { 
      waituntil {speed  _this  == 0};
     _obj = createVehicle ["FlagChecked_F",getPos _this,[],0,"can_collide"];

       hint "Smoke shell landed and marked!";  
  }; } else {
       hint "You have used a different weapon!";
   }; 
}];