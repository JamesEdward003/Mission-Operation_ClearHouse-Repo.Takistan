// markerID.sqf //
private ["_unit","_dead","_varName","_rank","_mrkrCnt","_mrkrName","_mrkrcolor","_marker","_mrkr"];
_unit = _this select 0;    
_varName = vehicleVarName _unit;
_rank = rank _unit;

  if (!(isNil { _unit getVariable "markerCount"})) then
      {
      _mrkrCnt = (_unit getVariable "markerCount") select 2;
      _mrkrCnt = _mrkrCnt + 1;
      _unit setVariable ["markerCount", [_varName,_rank,_mrkrCnt], true];
  } else {   
      _mrkrCnt = 1;
      _unit setVariable ["markerCount", [_varName,_rank,_mrkrCnt], true];
  };

switch true do 
  {
  case (!isMultiplayer): {
    _mrkrcolor = switch (_rank) do 
      {
        case "COLONEL":   {"colorblack"};
        case "MAJOR":     {"colorbrown"};
        case "CAPTAIN":   {"colorred"};
        case "LIEUTENANT":  {"colororange"};
        case "SERGEANT":  {"coloryellow"};
        case "CORPORAL":  {"colorgreen"};
        case "PRIVATE":   {"colorblue"};
        default           {"colorwhite"};
      };
    _marker = createMarkerLocal [_varName, getPos _unit];
    _marker setMarkerTypeLocal "Start";
    _marker setMarkerColorLocal _mrkrcolor;
    _marker setMarkerTextLocal "";
    _marker setMarkerSizeLocal [.5,.5];
    while {alive _unit} do {
      _marker setMarkerPos getPos _unit;
      _marker setMarkerDir getDir _unit;  
      if (vehicle _unit != _unit) then {_marker setMarkerAlphaLocal 0} else {_marker setMarkerAlphaLocal 1};
      sleep 0.5;
    };
    deleteMarker _marker;
    if (!(isNil { _unit getVariable "markerCount"})) then
        {
        _mrkrCnt = (_unit getVariable "markerCount") select 2;
        _mrkrCnt = _mrkrCnt + 1;
        _unit setVariable ["markerCount", [_varName,_rank,_mrkrCnt], true];
    } else {   
        _mrkrCnt = 1;
        _unit setVariable ["markerCount", [_varName,_rank,_mrkrCnt], true];
    };
    _mrkrCnt = (_unit getVariable "markerCount") select 2;  
    _mrkrName = format ["%1_%2",_varName,_mrkrCnt];
    _mrkr = createMarkerLocal [_mrkrName, getPos _unit];
    _mrkr setMarkerTypeLocal "End";
    _mrkr setMarkerColorLocal "ColorBlack";
    _mrkr setMarkerTextLocal "";
    _mrkr setMarkerSizeLocal [.5,.5];
    _mrkr setMarkerAlphaLocal .5;
    };
  case (isMultiplayer): {
  _unit addMPEventHandler ["MPRespawn", {[(_this select 0),(_this select 1)] spawn {
    private ["_unit","_dead","_varName","_rank"];
    _unit = _this select 0;
    _dead = _this select 1;
    _varName = (_dead getVariable "markerCount") select 0;
    _rank = (_dead getVariable "markerCount") select 1;
    _mrkrCnt = (_dead getVariable "markerCount") select 2;  
    _unit setVehicleVarname _varName;
    _unit setIdentity _varName;
    _unit setRank _rank;
    [_unit] execVM "markerID.sqf";
  }}];
  _mrkrcolor = switch _rank do 
    {
      case "COLONEL":   {"colorblack"};
      case "MAJOR":     {"colorbrown"};
      case "CAPTAIN":   {"colorred"};
      case "LIEUTENANT":  {"colororange"};
      case "SERGEANT":  {"coloryellow"};
      case "CORPORAL":  {"colorgreen"};
      case "PRIVATE":   {"colorblue"};
      default           {"colorwhite"};
    };
    _marker = createMarkerLocal [_varName, getPos _unit];
    _marker setMarkerTypeLocal "Start";
    _marker setMarkerColorLocal _mrkrcolor;
    _marker setMarkerTextLocal "";
    _marker setMarkerSizeLocal [.5,.5];
    while {alive _unit} do {
      _marker setMarkerPos getPos _unit;
      _marker setMarkerDir getDir _unit;  
      if (vehicle _unit != _unit) then {_marker setMarkerAlphaLocal 0} else {_marker setMarkerAlphaLocal 1};
      sleep 0.5;
    };
    deleteMarker _marker;
    if (!(isNil { _unit getVariable "markerCount"})) then
        {
        _mrkrCnt = (_unit getVariable "markerCount") select 2;
        _mrkrCnt = _mrkrCnt + 1;
        _unit setVariable ["markerCount", [_varName,_rank,_mrkrCnt], true];
    } else {   
        _mrkrCnt = 1;
        _unit setVariable ["markerCount", [_varName,_rank,_mrkrCnt], true];
    };
    _mrkrCnt = (_unit getVariable "markerCount") select 2;  
    _mrkrName = format ["%1_%2",_varName,_mrkrCnt];
    _mrkr = createMarkerLocal [_mrkrName, getPos _unit];
    _mrkr setMarkerTypeLocal "End";
    _mrkr setMarkerColorLocal "ColorBlack";
    _mrkr setMarkerTextLocal "";
    _mrkr setMarkerSizeLocal [.5,.5];
    _mrkr setMarkerAlphaLocal .5;
   }; 
 };


