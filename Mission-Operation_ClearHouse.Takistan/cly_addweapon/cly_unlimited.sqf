/////////////////////////////////////////////////////////////////////////////////////////////////////		
_unit = _this select 0;

_unit addEventHandler [
	"Fired",
		{		
							    if (_this select 5=="Javelin") then {_this select 0 addMagazine "Javelin"};
							    if (_this select 5=="SMAW_HEAA") then {_this select 0 addMagazine "SMAW_HEAA"}; 
							    if (_this select 5=="SMAW_HEDP") then {_this select 0 addMagazine "SMAW_HEDP"}; 
							    if (_this select 5=="MAAWS_HEAT") then {_this select 0 addMagazine "MAAWS_HEAT"}; 
							    if (_this select 5=="MAAWS_HEDP") then {_this select 0 addMagazine "MAAWS_HEDP"};
							    if (_this select 5=="NLAW") then {_this select 0 addMagazine "NLAW"};
							    if (_this select 5=="M136") then {_this select 0 addMagazine "M136"};
							    if (_this select 5=="Igla") then {_this select 0 addMagazine "Igla"};
							    if (_this select 5=="Stinger") then {_this select 0 addMagazine "Stinger"};
/*#1 = RPG7V PG7VL-MEDIUM*/		if (_this select 5=="PG7VL") then {_this select 0 addMagazine "PG7VL"};
/*#2 = RPG7V PG7VR-HEAVY*/			if (_this select 5=="PG7VR") then {_this select 0 addMagazine "PG7VR"};
/*#3 = RPG7V OG7-LIGHT*/			if (_this select 5=="OG7") then {_this select 0 addMagazine "OG7"};
								if (_this select 5=="AT13") then {_this select 0 addMagazine "AT13"};
								if (_this select 5=="OFrP_1Rnd_89_LRAC") then {_this select 0 addMagazine "OFrP_1Rnd_89_LRAC"};
								if (_this select 5=="OFrP_1Rnd_136_ERYX") then {_this select 0 addMagazine "OFrP_1Rnd_136_ERYX"};
								if (_this select 5=="OFrP_1Rnd_84_ABL") then {_this select 0 addMagazine "OFrP_1Rnd_84_ABL"};
							    if (_this select 5=="SmokeShell") then {_this select 0 addMagazine "SmokeShell"};
							    if (_this select 5=="SmokeShellGreen") then {_this select 0 addMagazine "SmokeShellGreen"};
							    if (_this select 5=="SmokeShellRed") then {_this select 0 addMagazine "SmokeShellRed"};
							    if (_this select 5=="SmokeShellOrange") then {_this select 0 addMagazine "SmokeShellOrange"};
							    if (_this select 5=="SmokeShellYellow") then {_this select 0 addMagazine "SmokeShellYellow"};
							    if (_this select 5=="HandGrenade") then {_this select 0 addMagazine "HandGrenade"};
							    if (_this select 5=="HandGrenade_West") then {_this select 0 addMagazine "HandGrenade_West"};
							    if (_this select 5=="HandGrenade_East") then {_this select 0 addMagazine "HandGrenade_East"}; 
							    if (_this select 5=="PipeBomb") then {_this select 0 addMagazine "PipeBomb"};
/*0=1Rnd_HE_M203*/				if (_this select 5=="1Rnd_HE_M203") then {_this select 0 addMagazine "1Rnd_HE_M203"};
/*5=1Rnd_Smoke_M203*/				if (_this select 5=="1Rnd_Smoke_M203") then {_this select 0 addMagazine "1Rnd_Smoke_M203"};
/*6=1Rnd_SmokeRed_M203*/			if (_this select 5=="1Rnd_SmokeRed_M203") then {_this select 0 addMagazine "1Rnd_SmokeRed_M203"};
/*7=1Rnd_SmokeGreen_M203*/			if (_this select 5=="1Rnd_SmokeGreen_M203") then {_this select 0 addMagazine "1Rnd_SmokeGreen_M203"};
/*8=1Rnd_SmokeYellow_M203*/		if (_this select 5=="1Rnd_SmokeYellow_M203") then {_this select 0 addMagazine "1Rnd_SmokeYellow_M203"};
/*1=FlareWhite_M203*/				if (_this select 5=="FlareWhite_M203") then {_this select 0 addMagazine "FlareWhite_M203"};
/*2=FlareGreen_M203*/				if (_this select 5=="FlareGreen_M203") then {_this select 0 addMagazine "FlareGreen_M203"};
/*3=FlareRed_M203*/				if (_this select 5=="FlareRed_M203") then {_this select 0 addMagazine "FlareRed_M203"};
/*4=FlareYellow_M203*/			if (_this select 5=="FlareYellow_M203") then {_this select 0 addMagazine "FlareYellow_M203"}}];
