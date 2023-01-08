// Wind_Parameters.sqf // 
// Syntax:
// setWind [x, y, forced]
// Parameters:
// [x, y, forced]: Array
// x: Number - Easterly component (in m/s, positive = to the east)
// y: Number - Northerly component (in m/s, positive = to the north)
// Forced: Boolean - (Optional, default false) set to true to lock the wind to constantly blows in set direction
// texts[] = {"North","NorthEast","East","SouthEast","South","SouthWest","West","NorthWest"};
// texts[] = {"Dead Still","Whisper","Gentle Breeze","Moderate Breeze","Strong Breeze","High Winds","Near Gale","Gale Force"};

switch (_Wind_Dir) do
{
	case 1: {
		
			setWind [0, 1.25, true];	
			setWind [0, 2.50, true];
			setWind [0, 3.75, true];
			setWind [0, 5, true];
			setWind [0, 6.25, true];
			setWind [0, 7.50, true];
			setWind [0, 8.75, true];
			setWind [0, 10, true];
	};
	case 2: {

			setWind [1.25, 1.25, true];	
			setWind [2.50, 2.50, true];
			setWind [3.75, 3.75, true];
			setWind [5, 5, true];
			setWind [6.25, 6.25, true];
			setWind [7.50, 7.50, true];
			setWind [8.75, 8.75, true];
			setWind [10, 10, true];			
	};
	case 3: {
		
			setWind [1.25, 0, true];	
			setWind [2.50, 0, true];
			setWind [3.75, 0, true];
			setWind [5, 0, true];
			setWind [6.25, 0, true];
			setWind [7.50, 0, true];
			setWind [8.75, 0, true];
			setWind [10, 0, true];						
	};
	case 4: {

			setWind [1.25, -1.25, true];
			setWind [2.50, -2.50, true];
			setWind [3.75, -3.75, true];
			setWind [5, -5, true];
			setWind [6.25, -6.25, true];
			setWind [7.50, -7.50, true];
			setWind [8.75, -8.75, true];
			setWind [10, -10, true];					
	};
	case 5: {
		
			setWind [0, -1.25, true];
			setWind [0, -2.50, true];
			setWind [0, -3.75, true];
			setWind [0, -5, true];
			setWind [0, -6.25, true];
			setWind [0, -7.50, true];
			setWind [0, -8.75, true];
			setWind [0, -10, true];								
	};
	case 6: {

			setWind [-1.25, -1.25, true];	
			setWind [-2.50, -2.50, true];
			setWind [-3.75, -3.75, true];
			setWind [-5, -5, true];
			setWind [-6.25, -6.25, true];
			setWind [-7.50, -7.50, true];
			setWind [-8.75, -8.75, true];
			setWind [-10, -10, true];			
	};
	case 7: {
		
			setWind [-1.25, 0, true];	
			setWind [-2.50, 0, true];
			setWind [-3.75, 0, true];
			setWind [-5, 0, true];
			setWind [-6.25, 0, true];
			setWind [-7.50, 0, true];
			setWind [-8.75, 0, true];
			setWind [-10, 0, true];						
	};
	case 8: {

			setWind [-1.25, 1.25, true];
			setWind [-2.50, 2.50, true];
			setWind [-3.75, 3.75, true];
			setWind [-5, 5, true];
			setWind [-6.25, 6.25, true];
			setWind [-7.50, 7.50, true];
			setWind [-8.75, 8.75, true];
			setWind [-10, 10, true];						
	};
};

