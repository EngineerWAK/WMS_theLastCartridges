//Hierarchy: "Land_BagBunker_Tower_F", "BagBunker_base_F", "Strategic", "Building", "Static", "All"
//Hierarchy: "Land_BagBunker_01_large_green_F", "Land_BagBunker_Large_F", "BagBunker_base_F", "Strategic", "Building", "Static", "All"
//Hierarchy: "Land_Cargo_Tower_V4_F", "Cargo_Tower_base_F", "House_F", "House", "HouseBase", "NonStrategic", "Building", "Static", "All"
//Hierarchy: "Land_Barracks_02_F", "House_F", "House", "HouseBase", "NonStrategic", "Building", "Static", "All"
//Hierarchy: "Land_Hotel", "House", "HouseBase", "NonStrategic", "Building", "Static", "All"
//Hierarchy: "Land_Barn_01_brown_F", "House_F", "House", "HouseBase", "NonStrategic", "Building", "Static", "All"
//Hierarchy: "Land_Factory_Main_F", "House_F", "House", "HouseBase", "NonStrategic", "Building", "Static", "All"
//Hierarchy: "Land_IndustrialShed_01_F", "House_F", "House", "HouseBase", "NonStrategic", "Building", "Static", "All"
_this spawn {
	private ["_SpawnLootRad","_SpawnLoopTime","_SpawnLootDistToMove","_BuildingList","_houses","_lootPos","_lootStatus", "_lootAllowed", "_lootTimer"];

	params["_target"];

	_SpawnLootRad 			= getNumber(missionConfigFile >> "CfgLootSettings" >> "SpawnLootRad");
	_SpawnLootDistToMove 	= getNumber(missionConfigFile >> "CfgLootSettings" >> "SpawnLootDistToMove");
	_SpawnLoopTime 			= getNumber(missionConfigFile >> "CfgLootSettings" >> "SpawnLoopTime");
	_SpawnLootLifeTime 		= getNumber(missionConfigFile >> "CfgLootSettings" >> "LootlifeTime");
	_LootBL 				= getArray(missionConfigFile >> "CfgLootBlacklist" >> "buildings");
	_BuildingList 	= []; //pushback [_house,_lootPos,_lootType];
	_houses 		= objNull;
    _lootPos 		= [];
	_lootType 		= "default";//change if building is in a specific _buildingClass_List
    systemChat format ["lootSpawn activated on %1", name _this];
    while {alive _target} do {
	    if (
			(vehicle _target == _target) &&
			(alive _target) &&
			{!(_target getVariable ["PlayerInTraderZone", false])} &&
			{(_target distance2d (_target getVariable ["_spawnLootLastPos", [0,0,0]])) > _SpawnLootDistToMove}
			) then {
	        _houses = position _target nearObjects ["Building", _SpawnLootRad]; //only one type   // _houses = _houses select {!(isObjectHidden _x)};
	    	_houses = _houses select {!(isObjectHidden _x)};
			//systemChat format ["%1 buildings found", count _houses];     
	    	{
				if (typeOf _x in _LootBL) then {
					if (WMS_MissionDebug) then {diag_log format ["[SPAWNLOOT|WAK|TNA|WMS| The Building Is Blacklisted: %1", typeOf _x]};
				}else{
					//if(local _x)then{ //it seems all buildings are local, need to get a variable for ACE_Fortify, fix later, keep an eye on abusers
					if(false)then{
						if (WMS_MissionDebug) then {diag_log format ["[SPAWNLOOT|WAK|TNA|WMS| The Building Is LOCAL (fortify?): %1", typeOf _x]};
					}else{
						if("invisiblepath" in (typeOf _x))then{
							if (WMS_MissionDebug) then {diag_log format ["[SPAWNLOOT|WAK|TNA|WMS| The Building Is 'invisiblepath': %1", typeOf _x]};
						}else{
		    				_lootStatus = _x getVariable ["_lootSpawned",0];
		    				_lootAllowed = _x getVariable ["_lootAllowed",true];//var should be serverTime to add delay to the next loot spawn, if (serverTime > (_x getVariable ["_lootSpawned",0])) then { spawnLoot };
              				_lootTimer = _x getVariable ["_lootTimer",(serverTime-5)];
		       				if ((_lootStatus == 0) && {(_lootAllowed)} && {(serverTime > _lootTimer)}) then {
								if !(count (_x buildingPos -1) == 0) then {
									if (typeOf _x in getArray(missionConfigFile >> "CfgBuildingsCategories" >> "BuildingClass_Spe" >> "items")) then {_lootType = "special"};
									if (typeOf _x in getArray(missionConfigFile >> "CfgBuildingsCategories" >> "BuildingClass_Mil" >> "items")) then {_lootType = "military"};
									if (typeOf _x in getArray(missionConfigFile >> "CfgBuildingsCategories" >> "BuildingClass_Med" >> "items")) then {_lootType = "medical"};
									if (typeOf _x in getArray(missionConfigFile >> "CfgBuildingsCategories" >> "BuildingClass_ind" >> "items")) then {_lootType = "industrial"};
									_lootPos = selectRandom (_x buildingPos -1);
			      					_BuildingList pushBack [_x,_lootPos,_lootType];
									if (WMS_MissionDebug) then {diag_log format ["[SPAWNLOOT|WAK|TNA|WMS| The Building Is Valid: %1", ([typeOf _x,_lootPos,_lootType])]};
								};
		      				};
						};
					};
				};
				_lootType = "default";
		    }forEach _houses;
			if !(count _BuildingList == 0) then {
      			_BuildingList remoteExec ["WMS_fnc_spawnLootManager",2];
	    		//systemChat format ["Calling for lootSpawn, %1 pos", (count _BuildingList)];
			};
			_BuildingList = [];
			_target setVariable ["_spawnLootLastPos", (position _target)]
        };
        uisleep _SpawnLoopTime;
    };
};