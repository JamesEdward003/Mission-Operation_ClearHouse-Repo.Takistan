//////////////////////////////////////////////////////////////////
_array1 = [a,b,c,4,6,8,d,e];
_array2 = [1,2,3,4,5,6,7,8,9,10];

for [{_n=0},{_n < count _array1},{_n=_n+1}] do 
{
	_array1select = _array1 select _n;
	for [{_i=0},{_i < count _array2},{_i=_i+1}] do 
	{
		_array2select = _array2 select _i;
		if (_array2select == _array1select) then 
		{
		    _array2 = _array2 - [_array2select];
		};
	};
};

hint format ["%1", _array2];
