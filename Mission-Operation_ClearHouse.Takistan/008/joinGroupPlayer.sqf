//////////////////////////////////////////////////////////////////
// Function file for Armed Assault
//////////////////////////////////////////////////////////////////
	_target = _this select 0;
	_caller = _this select 1;
	_id = _this select 2;

	_target removeAction _id;
	_target removeAction act1;
	_target removeAction act2;
	_target removeAction act3;
	_target removeAction act4;
			  
	hands_up = false;
	hands_back = false;
	
if (_target iskindof "MAN") then {
		
		_target setCaptive false; 
		
		_target enableAI "Anim";
		
		_target enableAI "MOVE";
		
		_target setUnitPos "AUTO";
		
		_target joinAsSilent [group _caller, 1];
		
		[_target] execVM "008\twirlyMrkr2.sqf";
		 
};

uisleep 0.25;
player commandChat format["%1 joined forces with %2", vehiclevarname _target, vehiclevarname _caller];	 

//		{
	
//		group _target selectLeader _caller;
	        
//	   	} forEach units group _target;
   
//   	}; 