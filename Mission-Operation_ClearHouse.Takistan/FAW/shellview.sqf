waitUntil {sleep 1; (RydFAW_Debug)};

RydFAW_SVStart = false;

OnMapSingleClick 
	'
	if not (RydFAW_SVStart) then
		{
		RydFAW_SVStart = true; 
		
		_i = createMarker ["rangemark",_pos];
		_i setMarkerColor "ColorGreen";
		_i setMarkerShape "ELLIPSE";
		_i setMarkerSize [1500,1500];
		_i setMarkerBrush "Border";

		missionNamespace setVariable ["shellVMark",_i];
		};

	if ((RydFAW_SVStart) and (_alt)) then 
		{
		RydFAW_SVStart = false;
		_svcircle = missionNamespace getVariable ["shellVMark",""];
		_shells = missionNamespace getVariable ["shellVShells",[]];

			{
			deleteMarker _x
			} 
		foreach _shells; 

		missionNamespace setVariable ["shellVShells",nil];

		deleteMarker _svcircle;

		missionNamespace setVariable ["shellVMark",nil]
		}
	';

while {RydFAW_ShellView} do
	{
	while {((RydFAW_SVStart) and (RydFAW_Debug))} do
		{
		_svPos = getMarkerPos (missionNamespace getVariable ["shellVMark",""]);
		_shellsA = [_svPos,1500] call BIS_ARTY_F_ShellsInRadius;
		_shells = [];

			{
			if ((typeName _x) == "OBJECT") then
				{
				if not (_x isKindOf "AllVehicles") then
					{
					_shells set [(count _shells),_x]
					}
				}
			}
		foreach _shellsA;

		_shellMarks = [];

			{
			_shellpos = getposATL _x;
			_i = "shell" + (str _x) + (str (random 100));
			_i = createMarker [_i,_shellpos];
			_i setMarkerColor "ColorOrange";
			_i setMarkerShape "ICON";
			_i setMarkerType "DOT";
			_shellMarks set [(count _shellMarks),_i]
			}
		foreach _shells;

		missionNameSpace setVariable ["shellVShells",_shellMarks];



			{
			[_x] spawn
				{
				_mark = _this select 0;
				_size = 1;
				while {_size > 0.1} do
					{
					_size = _size - 0.03;
					_mark setMarkerSize [_size,_size];
					sleep 0.025
					};

				deleteMarker _mark
				}
			}
		foreach _shellMarks;
		sleep 0.2;
		missionNameSpace setVariable ["shellVShells",nil];
		sleep 0.05
		};

	sleep 2
	};
