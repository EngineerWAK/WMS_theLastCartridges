class CfgRemoteExec
{
	class Functions
	{
		mode = 1; //0: no remoteExec, 1: white liste, 2: all autorized
		jip = 0;
		class vxf_interaction_fnc_pointNetReceive		{ allowedTargets=0; };
		class vxf_interaction_fnc_pointNetSend			{ allowedTargets=0; };
		class vxf_interaction_fnc_pointCalculate		{ allowedTargets=0; };
		class vxf_interaction_fnc_pointDraw				{ allowedTargets=0; };
		class vxf_interaction_fnc_pointStart			{ allowedTargets=0; };
		class vxf_interaction_fnc_ButtonDown			{ allowedTargets=0; };
		class vxf_interaction_fnc_ButtonUp				{ allowedTargets=0; };
		class vxf_interaction_fnc_Drag					{ allowedTargets=0; };
		class vxf_interaction_fnc_DragStart				{ allowedTargets=0; };
		class vxf_interaction_fnc_DragStop				{ allowedTargets=0; };
		class vxf_interaction_fnc_KnobAnimate			{ allowedTargets=0; };
		class vxf_interaction_fnc_LeverAbimate			{ allowedTargets=0; };
		
		class vtx_uh60_cas_fnc_registerCautionAdvisory	{ allowedTargets=0; };
		class vtx_uh60_fd_fnc_updatePanel				{ allowedTargets=0; };
		class vtx_uh60_fms_fnc_interaction_pageChange	{ allowedTargets=0; };
		class vtx_uh60_flir_fnc_syncTurret				{ allowedTargets=0; };
		class vtx_uh60_hoist_fnc_canMoveHeliToHook		{ allowedTargets=0; };
		class vtx_uh60_hoist_fnc_deployhook				{ allowedTargets=0; };
		class vtx_uh60_hoist_fnc_lowerhookToGround		{ allowedTargets=0; };
		class vtx_uh60_hoist_fnc_moveHeliToHook			{ allowedTargets=0; };
		class vtx_uh60_hoist_fnc_moveHookToHeli			{ allowedTargets=0; };
		class vtx_uh60_hoist_fnc_raiseHookToHeli		{ allowedTargets=0; };
		class vtx_uh60_hoist_fnc_resetHook				{ allowedTargets=0; };
		class vtx_uh60_hoist_fnc_secureHook				{ allowedTargets=0; };
		class vtx_uh60_jvmf_fnc_receiveMessage			{ allowedTargets=0; };
		class vtx_uh60_jvmf_fnc_receiveReply			{ allowedTargets=0; };
		class vtx_uh60_mfd_fnc_switchpage				{ allowedTargets=0; };
		class vtx_uh60_engine_fnc_engineEH				{ allowedTargets=0; };

		class bis_fnc_debugconsoleexec	{ allowedTargets=2; };
		class bis_fnc_execvm	{ allowedTargets=2; };
		class bis_fnc_sharedobjectives	{ allowedTargets=2; };
		class bis_fnc_arsenal	{ allowedTargets=2; };
		class bis_fnc_objectvar	{ allowedTargets=2; };
		class bis_fnc_unflipVehicle	{ allowedTargets=2; };
		class bis_fnc_reviveinitaddplayer	{ allowedTargets=2; };
		class bis_fnc_effectKilledSecondaries	{ allowedTargets=2; };
		class bis_fnc_curatorrespawn	{ allowedTargets=2; };
		class bis_fnc_showNotification	{ allowedTargets=2; };
		
		class SA_Simulate_Towing { allowedTargets=0; };
		class SA_Attach_Tow_Ropes { allowedTargets=0; };
		class SA_Take_Tow_Ropes { allowedTargets=0; };
		class SA_Put_Away_Tow_Ropes { allowedTargets=0; };
		class SA_Pickup_Tow_Ropes { allowedTargets=0; };
		class SA_Drop_Tow_Ropes { allowedTargets=0; };
		class SA_Set_Owner { allowedTargets=2; };
		class SA_Hint { allowedTargets=1; };
		class SA_Hide_Object_Global { allowedTargets=2; };

		class aur_hide_object_global { allowedTargets=0; };
		
		class aur_play_rappelling_sounds_global { allowedTargets=0; };
		class aur_enable_rappelling_animation { allowedTargets=0; };
		class rhs_fnc_flashbang_effect { allowedTargets=0; };
		
		class WMS_fnc_setVarOnPlayerRespawn	{ allowedTargets=2; };
		class WMS_fnc_spawnLootManager { allowedTargets=2; };
		class WMS_fnc_processCargoDump { allowedTargets=2; };
		class WMS_fnc_buyAction { allowedTargets=2; };
		class WMS_fnc_getCompatWeaponItems { allowedTargets=2; };
		class WMS_fnc_createPermanentVHL { allowedTargets=2; };
		class WMS_fnc_updatePermanentVHL { allowedTargets=2; };
		class WMS_fnc_initVehicleAddAction { allowedTargets=2; };
		class WMS_fnc_ConfLockUnlock { allowedTargets=2; };
		class WMS_fnc_initTraderActions_vehicles { allowedTargets=2; };
		class WMS_fnc_buyFromTrader { allowedTargets=2; };
		class WMS_fnc_buyAmmoOnBox { allowedTargets=2; };
		class WMS_fnc_sellVehicles { allowedTargets=2; };
		class WMS_fnc_CreateTerritory { allowedTargets=2; };
		class WMS_fnc_buyfromoffice { allowedTargets=2; };
		class WMS_fnc_rotateBaseObjects { allowedTargets=2; };
		class WMS_fnc_initBaseRotationEngine { allowedTargets=2; };
		class WMS_fnc_smallTransactions { allowedTargets=2; };
		class WMS_fnc_territoryUpgrade { allowedTargets=2; };
		class WMS_fnc_territoryLayoutActions { allowedTargets=2; };
		class WMS_fnc_territoryLayoutUpgrade { allowedTargets=2; };
		class WMS_fnc_territoryDelete { allowedTargets=2; };
		class WMS_fnc_territoryUpdate { allowedTargets=2; };
		class WMS_fnc_EmergencySupply { allowedTargets=2; };
		class WMS_fnc_claimReward { allowedTargets=2; };
		class WMS_fnc_getOwnedPermanentVhls	{ allowedTargets=2; };
		class WMS_fnc_client_markerOnPersonalVhls	{ allowedTargets=0; };
		class WMS_fnc_HatchetCover { allowedTargets=0; };
		class WMS_fnc_HatchetUnCover { allowedTargets=0; };
		class WMS_fnc_weaponStationInitiate { allowedTargets=2; };
		class WMS_fnc_BaseSafetyPerimeter { allowedTargets=2; };

		class WMS_fnc_Event_HVT		   				{ allowedTargets=2; };
		class WMS_fnc_InfantryProgram_C130		    { allowedTargets=2; };
		class WMS_fnc_infantryProgram_extraction	{ allowedTargets=2; };
		class WMS_fnc_InfantryProgram_ArtySupport	{ allowedTargets=2; };
		class WMS_fnc_infantryProgram_GNDextraction	{ allowedTargets=2; };
		class WMS_fnc_infantryProgram_BlackFish		{ allowedTargets=2; };
		class WMS_fnc_InfantryProgram_buy			{ allowedTargets=2; };
		//class WMS_fnc_DynAI_RwdMsgOnKill			{ allowedTargets=2; }; //filter for HC1 remoteExec EHrewards
		//class WMS_fnc_AMS_EHonKilled				{ allowedTargets=2; }; //filter for HC1 remoteExec EHrewards
		//class WMS_fnc_AI_rewardOnVHLdestroy		{ allowedTargets=2; }; //Deactivated to prevent double EH, client AND server side
		//class WMS_fnc_playerKilled { allowedTargets=2; }; //deactivated to prevent double death (local PLUS server side)
	};
	class Commands
	{
		mode=0;
		jip=0;
	};
};