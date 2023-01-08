// Syntax:
// setWind [x, y, forced]
// Parameters:
// [x, y, forced]: Array
// x: Number - Easterly component (in m/s, positive = to the east)
// y: Number - Northerly component (in m/s, positive = to the north)
// Forced: Boolean - (Optional, default false) set to true to lock the wind to constantly blows in set direction
// texts[] = {"North","NorthEast","East","SouthEast","South","SouthWest","West","NorthWest"};
// texts[] = {"Dead Still","Whisper","Gentle Breeze","Moderate Breeze","Strong Breeze","High Winds","Near Gale","Gale Force"};

	case 1: {
		
		case 1:	{[0, 1.25, true]};	
		case 2:	{[0, 2.50, true]};
		case 3:	{[0, 3.75, true]};
		case 4:	{[0, 5,    true]};
		case 5:	{[0, 6.25, true]};
		case 6:	{[0, 7.50, true]};
		case 7:	{[0, 8.75, true]};
		case 8:	{[0, 10,   true]};    
	};
	case 2:

		case 1:	{[1.25, 1.25, true]};	
		case 2:	{[2.50, 2.50, true]};
		case 3:	{[3.75, 3.75, true]};
		case 4:	{[5, 5,       true]};
		case 5:	{[6.25, 6.25, true]};
		case 6:	{[7.50, 7.50, true]};
		case 7:	{[8.75, 8.75, true]};
		case 8:	{[10, 10,     true]};			
	};
	case 3:
		
		case 1:	{[1.25, 0, true]};	
		case 2:	{[2.50, 0, true]};
		case 3:	{[3.75, 0, true]};
		case 4:	{[5, 0,    true]};
		case 5:	{[6.25, 0, true]};
		case 6:	{[7.50, 0, true]};
		case 7:	{[8.75, 0, true]};
		case 8:	{[10, 0,   true]};						
	};
	case 4:

		case 1:	{[1.25, -1.25, true]};
		case 2:	{[2.50, -2.50, true]};
		case 3:	{[3.75, -3.75, true]};
		case 4:	{[5, -5,       true]};
		case 5:	{[6.25, -6.25, true]};
		case 6:	{[7.50, -7.50, true]};
		case 7:	{[8.75, -8.75, true]};
		case 8:	{[10, -10,     true]};					
	};
	case 5:
		
		case 1:	{[0, -1.25, true]};
		case 2:	{[0, -2.50, true]};
		case 3:	{[0, -3.75, true]};
		case 4:	{[0, -5,    true]};
		case 5:	{[0, -6.25, true]};
		case 6:	{[0, -7.50, true]};
		case 7:	{[0, -8.75, true]};
		case 8:	{[0, -10,   true]};								
	};
	case 6:

		case 1:	{[-1.25, -1.25, true]};	
		case 2:	{[-2.50, -2.50, true]};
		case 3:	{[-3.75, -3.75, true]};
		case 4:	{[-5, -5,       true]};
		case 5:	{[-6.25, -6.25, true]};
		case 6:	{[-7.50, -7.50, true]};
		case 7:	{[-8.75, -8.75, true]};
		case 8:	{[-10, -10,     true]};			
	};
	case 7:
		
		case 1:	{[-1.25, 0, true]};	
		case 2:	{[-2.50, 0, true]};
		case 3:	{[-3.75, 0, true]};
		case 4:	{[-5, 0,    true]};
		case 5:	{[-6.25, 0, true]};
		case 6:	{[-7.50, 0, true]};
		case 7:	{[-8.75, 0, true]};
		case 8:	{[-10, 0,   true]};						
	};
	case 8:

		case 1:	{[-1.25, 1.25, true]};
		case 2:	{[-2.50, 2.50, true]};
		case 3:	{[-3.75, 3.75, true]};
		case 4:	{[-5, 5,       true]};
		case 5:	{[-6.25, 6.25, true]};
		case 6:	{[-7.50, 7.50, true]};
		case 7:	{[-8.75, 8.75, true]};
		case 8:	{[-10, 10,     true]};											
	};



