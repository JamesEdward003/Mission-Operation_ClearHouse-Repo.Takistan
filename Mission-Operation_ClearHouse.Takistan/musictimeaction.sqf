//****** this addaction ["Music", "musictimeaction.sqf"] ******//
_0bj = _this select 0;
_Caller = _this select 1;
_Id = _this select 2;

// _Obj removeAction _Id;

action1 = _0bj addaction ["Born On The Bayou", "Music\BornOnTheBayou.sqf",[],3,false,false,"",""]; 
action2 = _0bj addaction ["Good Golly Miss Molly", "Music\GoodGollyMissMolly.sqf",[],3,false,false,"",""];  
action3 = _0bj addaction ["Fortunate Son", "Music\FortunateSon.sqf",[],3,false,false,"",""];    
action4 = _0bj addaction ["Fortunate Son 2", "Music\FortunateSon2.sqf",[],3,false,false,"",""];  
action5 = _0bj addaction ["Keep On Chooglin", "Music\KeepOnChooglin.sqf",[],3,false,false,"",""];       
action6 = _0bj addaction ["Run Through The Jungle", "Music\RunThroughTheJungle.sqf",[],3,false,false,"",""];

uisleep 20;

//{_Obj removeAction _x} forEach [action1,action2,action3,action4,action5,action6];

