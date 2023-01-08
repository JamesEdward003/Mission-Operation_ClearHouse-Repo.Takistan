//////////////////////////////////////////////////////////////////
// Function file for Armed Assault
// Created by: RALPH BELL AMI
//////////////////////////////////////////////////////////////////
fncGetClosestTown = {

  private ["_pos","_locations","_closest"];



  _pos = _this;

  if (typename _pos == typename objNull) then {_pos = getpos _pos};

  _locations = [["NameCityCapital","NameCity","NameVillage"],[_pos,100000]] call BIS_fnc_locations;

  _closest = objNull;



  if (count _locations > 0) then {

    _closest = _locations select 0;

    {

      if (_x distance _pos < _closest distance _pos) then {

        _closest = _x;

      };

    } foreach _locations;

  };

  _closest

};



loc = player call fncGetClosestTown;

hint (loc getvariable "name");
