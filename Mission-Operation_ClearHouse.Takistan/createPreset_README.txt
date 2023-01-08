********************************************************
/***** by Bon_Inf*, 10th-community.com, 12/2009
********************************************************
****** this script provides a menu from which the player
****** can choose custom loadout presets the mission maker
****** defined in a scriptfile. It is also possible to
****** limit the availability of each loadout.
********************************************************
********************************************************/


Usage instructions

1. Copy the example mission folder "loadout_preset.utes" into your user mission directory (must be something like C:\Users\...\Documents\ArmA 2 Other Profiles\profilename\missions\).

2. Copy the "bon_loadoutpresets" folder into your own mission folder.

3. Write the line in the Init.sqf file into your own Init.sqf.
   If you don't have one yet, just copy the Init.sqf into your mission folder.

4. Merge the content of the Description.ext file with your own Description.ext file.
   If you don't have one yet, just copy the Description.ext into your mission folder.
   Note: If you already have a "bon_Common.hpp" file included from one of my other script packs,
         replace the old one with this one. Make sure the "bon_Common.hpp" is included before all
         the other .hpp files.

5. Now create your presets. Open "bon_loadoutpresets\presets.sqf".
      - First load this mission into the editor,
      - place the ammo boxes you need (press F1, doubleclick on the map, choose side=Empty, class=Ammo (or ACE Ammunition etc.), choose the unit, then press OK.
      - Start the mission in the editor preview.

      - Gear yourself up, then open the map (default pressing M) and click on the radio button. Your current preset will be copied to the clipboard.
      - Paste with CTRL+V the stored preset into the "presets.sqf" file. Add linebreaks for better readability if you want.

      - Give the preset an appropriate name, e.g. presetname = "<give me a name>"; -> presetname = "Sniper";

      - Give the preset a presetnumber, e.g. preset"<give me a number>" = ...; -> preset4 = ...;

      - Then add the preset<number> into the presets array at the end of the file.

   Note: The "copyPreset.sqf" is related to this example mission and helps you to gear up in this mission and store your loadout to the clipboard in its correct form.
	 However, you do not need to copy it into your own mission folder.

6. Define classes for presets. Open "bon_loadoutpresets\bon_init_loadoutpresets.sqf".
      - Edit and add classnames and how many of each should be available:  ["classname",limit]
      - Assign a classname to each preset in the "presets.sqf" file, e.g. _presetclass = "" -> _presetclass = "Medic";
        If you want a class to be unlimited available, set the limit to -1.

7. Load your mission into the editor and place a gamelogic onto the map. Give the logic the name "Server".


Here you are done. To open the Preset-Menu use the following command: [] execVM "bon_loadoutpresets\bon_loadout_presets.sqf";


Full lists of weapon/magazine classnames you can find here:
	ArmA2: http://community.bistudio.com/wiki/ArmA_2:_Weapons
	A.C.E.2: http://community.bistudio.com/wiki/Class_Lists_for_ACE2
		 http://community.bistudio.com/wiki/Class_Lists_for_ACEX

For further questions write a PM to me in the Bohemia Interactive Forum.
Link to thread: http://forums.bistudio.com/showthread.php?s=a09d7dbfb7e1054712322e005995d386&t=92150