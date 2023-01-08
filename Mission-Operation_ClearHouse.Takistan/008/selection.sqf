//////////////////////////////////////////////////////////////////
// Function file for Armed Assault
// Created by: RALPH BELL AMI
//////////////////////////////////////////////////////////////////
_unit = _this select 0;
_caller = _this select 1;
_id = _this select 2;

_selection = _this select 3 select 0;
_grpName = _this select 3 select 1;

_grpUnit = group _unit;

_unit removeAction _id;
_unit removeAction selectNO;
_unit removeAction selectYES;

hint format ["%1",_selection];

switch (_selection) do

{
	     case YES: {_sel = [
		     
		     [_x] execVM "008\twirlyMrkr2.sqf";
		     [_x] execVM "008\init_dismiss.sqf";
		     ];

	}; 
	     case NO: {_sel = [
		     
		     [_x] execVM "008\twirlyMrkr2.sqf";
		     [_x] execVM "008\init_dismiss.sqf";
		     ];
	};

};

[_sel] foreach units _grpName;