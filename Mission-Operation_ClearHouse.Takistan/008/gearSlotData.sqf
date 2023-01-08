//////////////////////////////////////////////////////////////////
// Function file for Armed Assault
// Created by: RALPH BELL AMI
//////////////////////////////////////////////////////////////////
private "_dspl";
disableSerialization;

waitUntil {
    _dspl = findDisplay 106;
    ! isNull _dspl;
};

uiNamespace setVariable ["/VDMJ/RscDisplayGear/SlotDataEH", {
    _self = _this select 0;
    _weaponName = gearSlotData _self;
    _conf = configFile >> _confSection >> _weaponName;
    _name = getText(_conf >> "displayName");
    _desc = getText(_conf >> "Library" >> "libTextDesc");
    _image = getText(_conf >> "picture");
    hintSilent parseText format[
        '<t size="1.3" align="center" shadow="true" shadowColor="#000000">%1</t><br /><img image="%2" size="6" align="center" /><br />%3<br />%4',
        _name, _image, _desc
    ];
}];


for "_i" from 107 to 145 do {
    _dspl displayCtrl _i ctrlAddEventHandler ["ButtonClick",
        format [
            '_confSection = "%1"; _this call (uiNamespace getVariable "/VDMJ/RscDisplayGear/SlotDataEH");',
            if( _i >= 109 && _i <= 129 ) then { "CfgMagazines" } else { "CfgWeapons" }
        ]
    ];
};
