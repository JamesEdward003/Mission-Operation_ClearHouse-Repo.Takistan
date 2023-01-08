////////////////////////////////////////////////
private ["_unit"];
hands_up = false;
hands_back = true;

_unit = _this select 0; 

_unit setCaptive true;
_unit disableAI "Anim";		
_unit disableAI "MOVE";
	
_unit switchMove "UnaErc_UnaErcPoslechVelitele";
