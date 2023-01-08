//////////////////////////////////////////////////////////////////
private ["_unit","_unitname","_marker","_mrkrcolor"];

_unit = _this select 0;
_type = typeOf _unit;

_mrkrcolor 	= [];

switch (side _unit) do {

         case west:			{_mrkrcolor = "ColorBlue"};
         case east:			{_mrkrcolor = "ColorRed"};
         case resistance:	{_mrkrcolor = "ColorGreen"};
         case civilian:		{_mrkrcolor = "ColorYellow"};
};

_arrayM 	= ["TARGET1","TARGET2","TARGET3","TARGET4","TARGET5","TARGET6","TARGET7","TARGET8","TARGET9","TARGET11","TARGET12","TARGET13","TARGET14","TARGET15"];
_randomM	= _arrayM select floor random count _arrayM;

if (isMultiplayer) then {	
	_unit addMPEventHandler ["MPRespawn",{_this execVM "008\twirlyMrkr.sqf"}];
};

While {alive _unit} do {
	_marker = createMarkerLocal [_randomM, position _unit];
	_marker setMarkerTypeLocal "select";
	_marker setMarkerShapeLocal "Icon";  
	_marker setMarkerTextLocal _type;
	_marker setMarkerSizeLocal [0.75,0.75];
	_marker setMarkerColorLocal _mrkrcolor;	
	sleep 2;
	deleteMarkerLocal _marker;
};
