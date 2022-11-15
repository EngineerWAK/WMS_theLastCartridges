/**
 * randomizeSpawnPos.sqf
 *
 * TNA-Community
 * https://discord.gg/Zs23URtjwF
 * © 2021 {|||TNA|||}WAKeupneo
 *
 * This work is licensed under the Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License. 
 * To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-nd/4.0/.
 */
/*private _playerTraits = [
    player getVariable ["WMS_Specialist_Bambi",false],
    player getVariable ["WMS_Specialist_Breacher",false],
    player getVariable ["WMS_Specialist_Engineer",false],
    player getVariable ["WMS_Specialist_Sniper",false],
    player getVariable ["WMS_Specialist_Medic",false]
];*/
private ["_pos","_customRespawnPos","_hight","_spawnAllowed","_customRespawnToDelete"];
params["_target"];
_pos = position _target;
_hight = 1000;
_spawnAllowed = true;
_customRespawnPos = missionNamespace getVariable["WMS_client_customRespawnPos",[-999,-999,-999]];
_customRespawnToDelete = missionNamespace getVariable["WMS_client_customRespawnToDelete",[]];
_customPlayerTraits = missionNamespace getVariable["WMS_client_customRespawnTra",[false,false,false,false,false]];
if (WMS_MissionDebug) then {diag_log format ["[RandomizeSpawnPosition]|WAK|TNA|WMS|Randomazing Position: _customRespawnPos %1, _pos %2, _target %3, Traits %4", _customRespawnPos, _pos, (name _target),_customPlayerTraits]};	

if (missionNamespace getVariable["WMS_client_canCustomRespawn",true] && {((position _target) distance _customRespawnPos) <= 25})then {
	//"CustomRespawn"
	player allowDamage false;
	if(((ASLtoATL _customRespawnPos) select 2) >= 0)then{
		player setPosASL _customRespawnPos;
	};
	[_customPlayerTraits]spawn {
		diag_log "[WMS_ANTI_ACE_BULSHIT]Launched";
		_customPlayerTraits = _this select 0;
		removeallassigneditems player;
		removeallweapons player;
		removeallitems player;
		removebackpack player;
		removevest player;	
		removeuniform player;
		removeheadgear player;
		removegoggles player;
		uisleep 1;
		[player,WMS_client_customRespawnInv]spawn WMS_fnc_client_restoreLoadoutFromVar;
		uisleep 2;
		if (count (missionNamespace getVariable["WMS_client_customRespawnAce",[]]) != 0) then {[player,WMS_client_customRespawnAce]call WMS_fnc_client_restoreAceFromVar;};
		uisleep 1;
		if(((player getVariable ['playerInRestrictionZone',-1]) == -1)) then {player setVariable ['playerInRestrictionZone',0]};
   		player setVariable ["WMS_Specialist_Bambi",(_customPlayerTraits select 0)];
    	player setVariable ["WMS_Specialist_Breacher",(_customPlayerTraits select 1)];
    	player setVariable ["WMS_Specialist_Engineer",(_customPlayerTraits select 2)];
    	player setVariable ["WMS_Specialist_Sniper",(_customPlayerTraits select 3)];
    	player setVariable ["WMS_Specialist_Medic",(_customPlayerTraits select 4)];
		//if ((_customPlayerTraits select 0))then{}; do nothing for Bambi status at custom Respawn
		if ((_customPlayerTraits select 1))then{
			player setUnitTrait ["explosiveSpecialist",true];
    		player setVariable ["ace_IsEngineer",1,true];
			//[playerSide, 'PAPA_BEAR'] commandChat 'You now have Breacher Skill';
			systemChat 'SKILL SET | You now have Breacher Skill';
		};
		if ((_customPlayerTraits select 2))then{
    		player setVariable ["ace_IsEngineer",2,true];
			player setUnitTrait ["Engineer",true];
			//[playerSide, 'PAPA_BEAR'] commandChat 'You are now Advanced Engineer';
			systemChat 'SKILL SET | You are now Advanced Engineer';
		};
		if ((_customPlayerTraits select 3))then{
    		player setVariable ["WMS_CamoCoef",[0.8,0.1],true];
    		player setVariable ["WMS_AudiCoef",[0.8,0.1],true];
			player setUnitTrait ["audibleCoef",0.8];
			player setUnitTrait ["camouflageCoef",0.8];
			//[playerSide, 'PAPA_BEAR'] commandChat 'You now have Sniper Skill';
			systemChat 'SKILL SET | You now have Sniper Skill';
		};
		if ((_customPlayerTraits select 4))then{
    		player setVariable ["ace_medical_medicclass", 2, true];
			player setUnitTrait ["Medic",true];
			//[playerSide, 'PAPA_BEAR'] commandChat 'You are now Doctor';
			systemChat 'SKILL SET | You are now Doctor';
		};
		player allowDamage true;
		missionNamespace setVariable["WMS_client_customRespawnPos",[-999,-999,-999]];
		missionNamespace setVariable["WMS_client_customRespawnAce",[]];
		missionNamespace setVariable["WMS_client_canCustomRespawn",false];
		missionNamespace setVariable["WMS_client_customRespawnTra",[false,false,false,false,false]];
		diag_log "[WMS_ANTI_ACE_BULSHIT]player ready to die again";
	};
}else{
	//"randomiseSpawnPos"
	if ((getPlayerUID player) in WMS_customRespawnList) then {	
		[_target] remoteExec ["WMS_fnc_deleteRespawnData",2];
	};
	//////////CUSTOM SPAWN POSITION FILTER//////////
	_markersToCheck = getArray(missionConfigFile >> "CfgOfficeTrader" >> "MarkersToCheck");
	_markerTraders = [(_markersToCheck select 0)];
	_markerTerritory = [(_markersToCheck select 2)];
	_territoryOfficeData = getArray(missionConfigFile >> "CfgOfficeTrader" >> "territory");
	_zoneTrader = (_territoryOfficeData select 2);
	_zoneTerritory = (_territoryOfficeData select 6);
	/////Is it too close to a marker:
	{
		if (markertype _x in _markerTraders) then {
			if((position _target distance2D (getMarkerPos _x)) <= _zoneTrader)ExitWith{
				_spawnAllowed = false;
				["EventWarning", ["Custom Spawn", "Too Close To Traders"]] call BIS_fnc_showNotification;
			};
		};
		if (markertype _x in _markerTerritory) then {
			if((position _target distance2D (getMarkerPos _x)) <= _zoneTerritory)ExitWith{
				_spawnAllowed = false;
				hint parseText "<t color='#ff0000'>CustomSpawn Too Close To Territory</t>";
				["EventWarning", ["Custom Spawn", "Too Close To Territory"]] call BIS_fnc_showNotification;
			};
		};
	}forEach allMapMarkers;
	//////////////////////////////
	if (_spawnAllowed) then {
		_pos = [[[position _target, 300]],[]] call BIS_fnc_randomPos;
		_hight = 750;
	}else {
		_pos = [position _target, 1500, 2500, 0, 1] call BIS_fnc_findSafePos;
		_hight = 300;
	};
	removeBackpackGlobal _target;
	_target addBackpackGlobal "B_Parachute";
	_target setposATL [(_pos select 0), (_pos select 1), _hight];
	_target execVM "InitPlayerSetTrait.sqf";
};

if ((getPlayerUID player) in WMS_customRespawnList) then {
	if (WMS_MissionDebug) then {diag_log format ["[RandomizeSpawnPosition]|WAK|TNA|WMS|Deleting CustomSpawn information _customRespawnToDelete %1", _customRespawnToDelete]};
	[player] remoteExec ["WMS_fnc_deleteRespawnData",2];
	_customRespawnToDelete call BIS_fnc_removeRespawnPosition;
};
_target setVariable ["_spawnedPlayerReadyToFight", true, true];
setCurrentChannel 3; //Force Group Channel test
//_target execVM "InitPlayerSetTrait.sqf";
if (WMS_MissionDebug) then {diag_log format ["[RandomizeSpawnPosition]|WAK|TNA|WMS|player respawned and ready to fight %1", time]};