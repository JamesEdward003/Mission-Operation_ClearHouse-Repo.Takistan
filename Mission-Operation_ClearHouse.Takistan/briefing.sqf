waitUntil {!isNil {player}};
waitUntil {player == player};

player createDiaryRecord["Diary", ["Help", "Hints from 'Hellouise':<br/>
	- GPS toggle option set to 'Insert' or 'Home' in Control Options<br/>
	- Use Your Radio To Toggle Group Icons! '0-0-6' -> 'ICONS ON/OFF!'<br/>
	- LeftClick or Alt-LeftClick On Group Icons To Get Info and Camera View
"]];
player createDiaryRecord ["Diary", ["Assets", "Your assets for this mission are:<br/>
	- Four top-notch infantry squads-U.S.Army<br/>
	- Reinforcements-Medics-U.S.Army<br/>
	- Reinforcements-Fireteams-U.S.Army<br/>
	- SecOp Module synced to Bravo 1-1<br/>
	- Artillery Strikes<br/>
	- Air Strikes<br/>
	- UAV Drones<br/>
	- Attack Helicopters<br/>
	- Supply Drops<br/>
	- TPW Houselights 1.08<br/>
	- Razor Team drops in from the North, Wait For Them...Or Not!<br/>
	- Teamswitch in Singleplayer. Try before Launching the Operation!
"]];

player createDiaryRecord["Diary", ["Mission", "Overview: <br/>Since the enemy operations in the AO have been getting worse the U.S. Military has made its presence felt, By setting up more Military instalations and more recently upgraded the Main Air Base in the South.
However throughout the past months the Village Chardarakht, once held by NATO Forces has been retaken and currently held by Local Taliban and or Militant Civilian Forces.
Intel suggests they have chose that Village in particular because of how close it is to Loy Manara Air Base, providing a base of operations for the Enemy to conduct Indirect Mortar Strikes, and even possibly to Start an Offensive Campaign against NATO Forces in the Area!
There is also Intel that Local Taliban Leaders are coming into the Village for some kind of Meeting. Command has given permission for a Special Forces Raid on that Village...Gear Up! <br/>The primary objective is to Clear a suspected Taliban held Village, Where a possible meeting between Local Taliban Leaders may be held. <br/>The secondary objective is to find out If the Meeting is being held,
and if so Eliminate any and all HVT's found! <br/>There are Civilians present so remember the Rules Of Engagment. 
<br/><br/>Mission: <br/>1. Clear a suspected Taliban held Village, Where a possible meeting between Local Taliban Leaders may be held. <br/>According to latest intel you will be facing an unknown sized Enemy Force. <br/>2. Locate and Intercept the Meeting...if being held, Eliminate any and all HVT's found! <br/>HQ only has a rough idea of the meeting location so you need to search high and low.  
<br/><br/>Location: <br/>Your <marker name='start_marker'>starting point</marker> is in the Loy Manara Air Base, Southern Takistan. Your A.O. is hostile so keep your eyes open.  
<br/><br/>Equipment: <br/>Get any Gear needed from the Transport Helicopter or Command Tent.
<br/><br/>Support: <br/>Helicopter Gunships will provide Close Air Support. And Possibly a Fighter for extra CAS.
<br/><br/>Mission is considered a success when the Objective Village is secured and all Enemy Forces Eliminated.
<br/><br/>The A.O. can be very unforgiving, so be safe, good luck and have fun!"]];

switch (group player) do
{
	case Alpha1:	{
		tskRTB = player createSimpleTask ["Return to Base"];
		tskRTB setSimpleTaskDescription ["Return to <marker name='fin_marker'>Base</marker> and play the end game.", "Return to Base", "Return to Base"];
		tskRTB setSimpleTaskDestination (getMarkerPos "fin_marker");
	};
	case Bravo1: 	{
		tskRTB = player createSimpleTask ["Return to Base"];
		tskRTB setSimpleTaskDescription ["Return to <marker name='fin_marker'>Base</marker> and play the end game.", "Return to Base", "Return to Base"];
		tskRTB setSimpleTaskDestination (getMarkerPos "fin_marker");
	};
	case Charlie1: 	{
		tskRTB = player createSimpleTask ["Return to Base"];
		tskRTB setSimpleTaskDescription ["Return to <marker name='fin_marker'>Base</marker> and play the end game.", "Return to Base", "Return to Base"];
		tskRTB setSimpleTaskDestination (getMarkerPos "fin_marker");
	};
	case Delta1: 	{
		tskRTB = player createSimpleTask ["Return to Base"];
		tskRTB setSimpleTaskDescription ["Return to <marker name='fin_marker'>Base</marker> and play the end game.", "Return to Base", "Return to Base"];
		tskRTB setSimpleTaskDestination (getMarkerPos "fin_marker");
	};
	case Echo1: 	{
		tskRTB = player createSimpleTask ["Return to Base"];
		tskRTB setSimpleTaskDescription ["Return to <marker name='fin_marker'>Base</marker> and play the end game.", "Return to Base", "Return to Base"];
		tskRTB setSimpleTaskDestination (getMarkerPos "fin_marker");
	};
	case Venom: 	{
		tskRTB = player createSimpleTask ["Return to Base"];
		tskRTB setSimpleTaskDescription ["Return to <marker name='fin_marker'>Base</marker> and play the end game.", "Return to Base", "Return to Base"];
		tskRTB setSimpleTaskDestination (getMarkerPos "fin_marker");
	};
	case Command: 	{
		tskRTB = player createSimpleTask ["Return to Base"];
		tskRTB setSimpleTaskDescription ["Return to <marker name='fin_marker'>Base</marker> and play the end game.", "Return to Base", "Return to Base"];
		tskRTB setSimpleTaskDestination (getMarkerPos "fin_marker");
	};
};
switch (group player) do
{
	case Alpha1:	{
		tskExvillLZ = player createSimpleTask ["Exvill at LZ Xray"];
		tskExvillLZ setSimpleTaskDescription ["Secure the Landing Zone that is to the far East of the Village Code Named <marker name='LZ_Xray'>LZ XRAY</marker> and wait for Helo pickup", "Exvill at LZ Xray", "Exvill at LZ XRAY"];
		tskExvillLZ setSimpleTaskDestination (getMarkerPos "LZ_Xray");
	};
	case Bravo1: 	{
		tskExvillLZ = player createSimpleTask ["Exvill at LZ Xray"];
		tskExvillLZ setSimpleTaskDescription ["Secure the Landing Zone that is to the far East of the Village Code Named <marker name='LZ_Xray'>LZ XRAY</marker> and wait for Helo pickup", "Exvill at LZ Xray", "Exvill at LZ XRAY"];
		tskExvillLZ setSimpleTaskDestination (getMarkerPos "LZ_Xray");
	};
	case Charlie1: 	{
		tskExvillLZ = player createSimpleTask ["Exvill at LZ Xray"];
		tskExvillLZ setSimpleTaskDescription ["Secure the Landing Zone that is to the far East of the Village Code Named <marker name='LZ_Xray'>LZ XRAY</marker> and wait for Helo pickup", "Exvill at LZ Xray", "Exvill at LZ XRAY"];
		tskExvillLZ setSimpleTaskDestination (getMarkerPos "LZ_Xray");
	};
	case Delta1: 	{
		tskExvillLZ = player createSimpleTask ["Exvill at LZ Xray"];
		tskExvillLZ setSimpleTaskDescription ["Secure the Landing Zone that is to the far East of the Village Code Named <marker name='LZ_Xray'>LZ XRAY</marker> and wait for Helo pickup", "Exvill at LZ Xray", "Exvill at LZ XRAY"];
		tskExvillLZ setSimpleTaskDestination (getMarkerPos "LZ_Xray");
	};
	case Venom: 	{
		tskExvillLZ = player createSimpleTask ["Exvill at LZ Xray"];
		tskExvillLZ setSimpleTaskDescription ["Secure the Landing Zone that is to the far East of the Village Code Named <marker name='LZ_Xray'>LZ XRAY</marker> and wait for Helo pickup", "Exvill at LZ Xray", "Exvill at LZ XRAY"];
		tskExvillLZ setSimpleTaskDestination (getMarkerPos "LZ_Xray");
	};
	case Command: 	{
		tskExvillLZ = player createSimpleTask ["Exvill at LZ Xray"];
		tskExvillLZ setSimpleTaskDescription ["Secure the Landing Zone that is to the far East of the Village Code Named <marker name='LZ_Xray'>LZ XRAY</marker> and wait for Helo pickup", "Exvill at LZ Xray", "Exvill at LZ XRAY"];
		tskExvillLZ setSimpleTaskDestination (getMarkerPos "LZ_Xray");
	};
	case Echo1: 	{
		tskExvillLZ = player createSimpleTask ["Secure the Landing Zone"];
		tskExvillLZ setSimpleTaskDescription ["Secure the Landing Zone that is to the far East of the Village Code Named <marker name='LZ_Xray'>LZ XRAY</marker>", "Secure the Landing Zone", "Secure the Landing Zone"];
		tskExvillLZ setSimpleTaskDestination (getMarkerPos "LZ_Xray");
	};
	case Kilo6_1: 	{
		tskExvillLZ = player createSimpleTask ["Return to Base"];
		tskExvillLZ setSimpleTaskDescription ["Secure the Landing Zone then return to <marker name='start_marker'>Base</marker>", "Return to Base", "Return to Base"];
		tskExvillLZ setSimpleTaskDestination (getMarkerPos "start_marker");
	};
	case Kilo6_2: 	{
		tskExvillLZ = player createSimpleTask ["Return to Base"];
		tskExvillLZ setSimpleTaskDescription ["Secure the Landing Zone then return to <marker name='start_marker'>Base</marker>", "Return to Base", "Return to Base"];
		tskExvillLZ setSimpleTaskDestination (getMarkerPos "start_marker");
	};
	case Kilo6_3: 	{
		tskExvillLZ = player createSimpleTask ["Return to Base"];
		tskExvillLZ setSimpleTaskDescription ["Secure the Landing Zone then return to <marker name='start_marker'>Base</marker>", "Return to Base", "Return to Base"];
		tskExvillLZ setSimpleTaskDestination (getMarkerPos "start_marker");
	};
	case Kilo6_4: 	{
		tskExvillLZ = player createSimpleTask ["Return to Base"];
		tskExvillLZ setSimpleTaskDescription ["Secure the Landing Zone then return to <marker name='start_marker'>Base</marker>", "Return to Base", "Return to Base"];
		tskExvillLZ setSimpleTaskDestination (getMarkerPos "start_marker");
	};
};

tskClearVillage = player createSimpleTask ["Clear suspected Taliban held Village"];
tskClearVillage setSimpleTaskDescription ["Clear a <marker name='target_location'>Village</marker> that is Suspected of being held by Taliban and Foreign Fighters", "Clear all Taliban out of that Location", "Clear all TALIBAN out of that Location"];
tskClearVillage setSimpleTaskDestination (getMarkerPos "target_location");

switch (group player) do
{
	case Alpha1:	{
		tskInsertLZ = player createSimpleTask ["Insert at LZ Alpha"];
		tskInsertLZ setSimpleTaskDescription ["Insert on <marker name='LZ_Alpha'>Landing Zone Alpha</marker> that is just on the out skirts of the Village to the East Code Named LZ ALPHA", "Insert at LZ Alpha", "Insert at LZ Alpha"];
		tskInsertLZ setSimpleTaskDestination (getMarkerPos "LZ_Alpha");
	};
	case Bravo1: 	{
		tskInsertLZ = player createSimpleTask ["Insert at LZ Bravo"];
		tskInsertLZ setSimpleTaskDescription ["Insert on <marker name='LZ_Bravo'>Landing Zone Bravo</marker> that is just on the out skirts of the Village to the East Code Named LZ BRAVO", "Insert at LZ Bravo", "Insert at LZ Bravo"];
		tskInsertLZ setSimpleTaskDestination (getMarkerPos "LZ_Bravo");
	};
	case Charlie1: 	{
		tskInsertLZ = player createSimpleTask ["Insert at LZ Charlie"];
		tskInsertLZ setSimpleTaskDescription ["Insert on <marker name='LZ_Charlie'>Landing Zone Charlie</marker> that is just on the out skirts of the Village to the East Code Named LZ CHARLIE", "Insert at LZ Charlie", "Insert at LZ Charlie"];
		tskInsertLZ setSimpleTaskDestination (getMarkerPos "LZ_Charlie");
	};
	case Delta1: 	{
		tskInsertLZ = player createSimpleTask ["Insert at LZ Delta"];
		tskInsertLZ setSimpleTaskDescription ["Insert on <marker name='LZ_Delta'>Landing Zone Delta</marker> that is just on the out skirts of the Village to the East Code Named LZ DELTA", "Insert at LZ Delta", "Insert at LZ Delta"];
		tskInsertLZ setSimpleTaskDestination (getMarkerPos "LZ_Delta");
	};
	case Echo1: 	{
		tskInsertLZ = player createSimpleTask ["Move to the Village Chardarakht"];
		tskInsertLZ setSimpleTaskDescription ["Move to the <marker name='target_location'>Village Chardarakht</marker> and provide Close Air Support", "Move to the Village Chardarakht", "Move to the Village Chardarakht"];
		tskInsertLZ setSimpleTaskDestination (getMarkerPos "target_location");
	};
	case Kilo6_1: 	{
		tskInsertLZ = player createSimpleTask ["Insert at LZ Alpha"];
		tskInsertLZ setSimpleTaskDescription ["Insert on <marker name='LZ_Alpha'>Landing Zone Alpha</marker> that is just on the out skirts of the Village to the East Code Named LZ ALPHA", "Insert at LZ Alpha", "Insert at LZ Alpha"];
		tskInsertLZ setSimpleTaskDestination (getMarkerPos "LZ_Alpha");	
	};	
	case Kilo6_2: 	{
		tskInsertLZ = player createSimpleTask ["Insert at LZ Bravo"];
		tskInsertLZ setSimpleTaskDescription ["Insert on <marker name='LZ_Bravo'>Landing Zone Bravo</marker> that is just on the out skirts of the Village to the North, Code Named LZ BRAVO", "Insert at LZ Bravo", "Insert at LZ Bravo"];
		tskInsertLZ setSimpleTaskDestination (getMarkerPos "LZ_Bravo");	
	};	
	case Kilo6_3: 	{
		tskInsertLZ = player createSimpleTask ["Insert at LZ Charlie"];
		tskInsertLZ setSimpleTaskDescription ["Insert on <marker name='LZ_Charlie'>Landing Zone Charlie</marker> that is just on the out skirts of the Village to the North, Code Named LZ CHARLIE", "Insert at LZ Charlie", "Insert at LZ Charlie"];
		tskInsertLZ setSimpleTaskDestination (getMarkerPos "LZ_Charlie");	
	};	
	case Kilo6_4: 	{
		tskInsertLZ = player createSimpleTask ["Insert at LZ Delta"];
		tskInsertLZ setSimpleTaskDescription ["Insert on <marker name='LZ_Delta'>Landing Zone Delta</marker> that is just on the out skirts of the Village to the South, Code Named LZ DELTA", "Insert at LZ Delta", "Insert at LZ Delta"];
		tskInsertLZ setSimpleTaskDestination (getMarkerPos "LZ_Delta");	
	};	
};
