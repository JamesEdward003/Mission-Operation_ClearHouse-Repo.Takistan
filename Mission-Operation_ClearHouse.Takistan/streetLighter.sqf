/* 	
	streetLighter.sqf 

	_null=[object,height,bright] execVM "streetlighter.sqf";
	_object = the object at which the light will appear

	_lightheight = height above the _object at which the light will appear (example-5 will make the light
	appear 5 meters above _object)

	lightcolor = the color of the light,its in [R,G,B]>>>>[1,1,1] for white;[0,0,0] for black

	lightambient=the same as above (this affects environment while lightcolor only affects the color of light source)

	lightbrightness= its the result of the first number divide by the second one;
	If 1/10 the result will be 0.1 and the light will appear dim.
	The greater value the number is ,the brighter the light is.

	Note : Increasing the value also increases the range of the light

	To attach to objects: _light lightAttachObject [_object, [-0.5,-0.25,1]];
*/

_object = _this select 0;
_lightheight = _this select 1;
_lightbrightness = _this select 2;

_light="#lightpoint" createvehicle position _object;
_light setpos [(getpos _object select 0),(getpos _object select 1),_lightheight];
_light setlightcolor [1,1,1];
_light setlightambient [0.5,0.5,0.5];
_light setlightbrightness _lightbrightness;
