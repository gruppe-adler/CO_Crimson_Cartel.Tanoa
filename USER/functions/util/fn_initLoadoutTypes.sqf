if (not hasInterface) exitWith {};

private ["_diveLoadout", "_normalLoadout"];

_diveLoadout = [["arifle_SDAR_F","","","",["20Rnd_556x45_UW_mag",20],[],""],[],[],["U_B_Wetsuit",[["ACE_packingBandage",10],["ACE_elasticBandage",10],["ACE_tourniquet",4],["ACE_salineIV_500",2],["ACE_Flashlight_KSF1",1],["ACE_MapTools",1],["20Rnd_556x45_UW_mag",3,20],["SmokeShell",2,1],["HandGrenade",1,1]]],["V_RebreatherB",[]],[],"","G_B_Diving",["ACE_Vector","","","",[],[],""],["ItemMap","ItemGPS","TFAR_anprc152","ItemCompass","ItemWatch",""]];

switch (typeOf player) do {
	// PTL, SQL and FTL
	case "B_Soldier_SL_F": {
		_normalLoadout = [["arifle_SPAR_02_blk_F","muzzle_snds_M","","optic_ERCO_blk_F",["ACE_30Rnd_556x45_Stanag_Mk318_mag",30],[],"bipod_01_F_blk"],[],["hgun_P07_blk_F","","","",["16Rnd_9x21_Mag",17],[],""],["U_B_CTRG_Soldier_F",[["ACE_CableTie",2],["ACE_MapTools",1],["ACE_Flashlight_XL50",1],["ACE_packingBandage",10],["ACE_elasticBandage",10],["ACE_salineIV_500",2],["ACE_tourniquet",4]]],["V_PlateCarrier1_rgr_noflag_F",[["ACE_30Rnd_556x45_Stanag_Mk318_mag",14,30],["SmokeShell",2,1],["HandGrenade",1,1],["16Rnd_9x21_Mag",1,17]]],["TFAR_bussole",[["SmokeShellYellow",2,1],["SmokeShell",2,1],["SmokeShellBlue",2,1]]],"H_HelmetB_TI_tna_F","G_Balaclava_TI_tna_F",["ACE_Vector","","","",[],[],""],["ItemMap","ItemGPS","TFAR_anprc152","ItemCompass","ItemWatch",""]];
	};

	case "B_medic_F": {
		_normalLoadout = [["arifle_SPAR_02_blk_F","muzzle_snds_M","","optic_ERCO_blk_F",["ACE_30Rnd_556x45_Stanag_Mk318_mag",30],[],"bipod_01_F_blk"],[],["hgun_P07_blk_F","","","",["16Rnd_9x21_Mag",17],[],""],["U_B_CTRG_Soldier_F",[["ACE_CableTie",2],["ACE_MapTools",1],["ACE_Flashlight_XL50",1],["ACE_packingBandage",10],["ACE_elasticBandage",10],["ACE_salineIV_500",2],["ACE_tourniquet",4]]],["V_PlateCarrier1_rgr_noflag_F",[["ACE_30Rnd_556x45_Stanag_Mk318_mag",14,30],["SmokeShell",2,1],["HandGrenade",1,1],["16Rnd_9x21_Mag",1,17]]],["grad_extras_kit_kitbag_rgr_medic",[["ACE_packingBandage",45],["ACE_elasticBandage",45],["ACE_salineIV_500",10],["ACE_salineIV",10],["ACE_surgicalKit",1],["ACE_tourniquet",5],["ACE_splint",10],["ACE_morphine",10],["ACE_epinephrine",10],["ACE_fieldDressing",25]]],"H_HelmetB_TI_tna_F","G_Balaclava_TI_tna_F",["ACE_Vector","","","",[],[],""],["ItemMap","ItemGPS","TFAR_anprc152","ItemCompass","ItemWatch",""]];
	};

	case "B_soldier_UAV_F": {
		_diveLoadout = [["arifle_SDAR_F","","","",["20Rnd_556x45_UW_mag",20],[],""],[],[],["U_B_Wetsuit",[["ACE_packingBandage",10],["ACE_elasticBandage",10],["ACE_tourniquet",4],["ACE_salineIV_500",2],["ACE_Flashlight_KSF1",1],["ACE_MapTools",1],["20Rnd_556x45_UW_mag",3,20],["SmokeShell",2,1],["HandGrenade",1,1]]],["V_RebreatherB",[]],[],"","G_B_Diving",["ACE_Vector","","","",[],[],""],["ItemMap","B_UavTerminal","TFAR_anprc152","ItemCompass","ItemWatch",""]];
		_normalLoadout = [["arifle_SPAR_02_blk_F","muzzle_snds_M","","optic_ERCO_blk_F",["ACE_30Rnd_556x45_Stanag_Mk318_mag",30],[],"bipod_01_F_blk"],[],["hgun_P07_blk_F","","","",["16Rnd_9x21_Mag",17],[],""],["U_B_CTRG_Soldier_F",[["ACE_CableTie",2],["ACE_MapTools",1],["ACE_Flashlight_XL50",1],["ACE_packingBandage",10],["ACE_elasticBandage",10],["ACE_salineIV_500",2],["ACE_tourniquet",4]]],["V_PlateCarrier1_rgr_noflag_F",[["ACE_30Rnd_556x45_Stanag_Mk318_mag",14,30],["SmokeShell",2,1],["HandGrenade",1,1],["16Rnd_9x21_Mag",1,17]]],[],"H_HelmetB_TI_tna_F","G_Balaclava_TI_tna_F",["ACE_Vector","","","",[],[],""],["ItemMap","B_UavTerminal","TFAR_anprc152","ItemCompass","ItemWatch",""]];
	};

	case "B_soldier_AR_F": {
		_normalLoadout = [["arifle_SPAR_02_blk_F","muzzle_snds_M","","optic_ERCO_blk_F",["150Rnd_556x45_Drum_Mag_Tracer_F",150],[],"bipod_01_F_blk"],[],["hgun_P07_blk_F","","","",["16Rnd_9x21_Mag",17],[],""],["U_B_CTRG_Soldier_F",[["ACE_CableTie",2],["ACE_MapTools",1],["ACE_Flashlight_XL50",1],["ACE_packingBandage",10],["ACE_elasticBandage",10],["ACE_salineIV_500",2],["ACE_tourniquet",4]]],["V_PlateCarrier1_rgr_noflag_F",[["SmokeShell",2,1],["HandGrenade",1,1],["16Rnd_9x21_Mag",1,17],["150Rnd_556x45_Drum_Mag_F",3,150]]],["B_AssaultPack_rgr",[["150Rnd_556x45_Drum_Mag_F",5,150]]],"H_HelmetB_TI_tna_F","G_Balaclava_TI_tna_F",["ACE_Vector","","","",[],[],""],["ItemMap","ItemGPS","TFAR_anprc152","ItemCompass","ItemWatch",""]];
	};

	case "B_soldier_exp_F": {
		_normalLoadout = [["arifle_SPAR_02_blk_F","muzzle_snds_M","","optic_ERCO_blk_F",["ACE_30Rnd_556x45_Stanag_Mk318_mag",30],[],"bipod_01_F_blk"],[],["hgun_P07_blk_F","","","",["16Rnd_9x21_Mag",17],[],""],["U_B_CTRG_Soldier_F",[["ACE_CableTie",2],["ACE_MapTools",1],["ACE_Flashlight_XL50",1],["ACE_packingBandage",10],["ACE_elasticBandage",10],["ACE_salineIV_500",2],["ACE_tourniquet",4]]],["V_PlateCarrier1_rgr_noflag_F",[["ACE_30Rnd_556x45_Stanag_Mk318_mag",14,30],["SmokeShell",2,1],["HandGrenade",1,1],["16Rnd_9x21_Mag",1,17]]],["B_Kitbag_rgr",[["ToolKit",1],["ACE_DefusalKit",1],["ACE_M26_Clacker",1],["DemoCharge_Remote_Mag",9,1]]],"H_HelmetB_TI_tna_F","G_Balaclava_TI_tna_F",["ACE_Vector","","","",[],[],""],["ItemMap","ItemGPS","TFAR_anprc152","ItemCompass","ItemWatch",""]];
	};

	case "B_soldier_LAT_F": {
		_normalLoadout = [["arifle_SPAR_02_blk_F","muzzle_snds_M","","optic_ERCO_blk_F",["ACE_30Rnd_556x45_Stanag_Mk318_mag",30],[],"bipod_01_F_blk"],["launch_MRAWS_green_F","","","",["MRAWS_HEAT_F",1],[],""],["hgun_P07_blk_F","","","",["16Rnd_9x21_Mag",17],[],""],["U_B_CTRG_Soldier_F",[["ACE_CableTie",2],["ACE_MapTools",1],["ACE_Flashlight_XL50",1],["ACE_packingBandage",10],["ACE_elasticBandage",10],["ACE_salineIV_500",2],["ACE_tourniquet",4]]],["V_PlateCarrier1_rgr_noflag_F",[["ACE_30Rnd_556x45_Stanag_Mk318_mag",14,30],["SmokeShell",2,1],["HandGrenade",1,1],["16Rnd_9x21_Mag",1,17]]],["B_AssaultPack_rgr",[["MRAWS_HEAT_F",2,1]]],"H_HelmetB_TI_tna_F","G_Balaclava_TI_tna_F",["ACE_Vector","","","",[],[],""],["ItemMap","ItemGPS","TFAR_anprc152","ItemCompass","ItemWatch",""]];
	};

	case "B_soldier_M_F": {
		_normalLoadout = [["arifle_SPAR_03_blk_F","muzzle_snds_B","","optic_AMS",["ACE_20Rnd_762x51_Mk319_Mod_0_Mag",20],[],"bipod_01_F_blk"],[],["hgun_P07_blk_F","","","",["16Rnd_9x21_Mag",17],[],""],["U_B_CTRG_Soldier_F",[["ACE_CableTie",2],["ACE_MapTools",1],["ACE_Flashlight_XL50",1],["ACE_packingBandage",10],["ACE_elasticBandage",10],["ACE_salineIV_500",2],["ACE_tourniquet",4],["ACE_RangeCard",1]]],["V_PlateCarrier1_rgr_noflag_F",[["SmokeShell",2,1],["HandGrenade",1,1],["16Rnd_9x21_Mag",1,17],["ACE_20Rnd_762x51_Mk319_Mod_0_Mag",9,20]]],["B_AssaultPack_rgr",[["ACE_20Rnd_762x51_Mk319_Mod_0_Mag",12,20]]],"H_HelmetB_TI_tna_F","G_Balaclava_TI_tna_F",["ACE_Vector","","","",[],[],""],["ItemMap","ItemGPS","TFAR_anprc152","ItemCompass","ItemWatch",""]];
	};

	case "B_Soldier_GL_F": {
		_normalLoadout = [["arifle_SPAR_01_GL_blk_F","muzzle_snds_M","","optic_ERCO_blk_F",["ACE_30Rnd_556x45_Stanag_Mk318_mag",30],["1Rnd_HE_Grenade_shell",1],""],[],["hgun_P07_blk_F","","","",["16Rnd_9x21_Mag",17],[],""],["U_B_CTRG_Soldier_F",[["ACE_CableTie",2],["ACE_MapTools",1],["ACE_Flashlight_XL50",1],["ACE_packingBandage",10],["ACE_elasticBandage",10],["ACE_salineIV_500",2],["ACE_tourniquet",4]]],["V_PlateCarrier1_rgr_noflag_F",[["SmokeShell",2,1],["HandGrenade",1,1],["16Rnd_9x21_Mag",1,17],["ACE_30Rnd_556x45_Stanag_Mk318_mag",14,30]]],["B_Kitbag_rgr",[["1Rnd_HE_Grenade_shell",35,1],["1Rnd_Smoke_Grenade_shell",20,1],["1Rnd_SmokeYellow_Grenade_shell",5,1],["1Rnd_SmokeRed_Grenade_shell",5,1],["1Rnd_SmokeBlue_Grenade_shell",5,1]]],"H_HelmetB_TI_tna_F","G_Balaclava_TI_tna_F",["ACE_Vector","","","",[],[],""],["ItemMap","ItemGPS","TFAR_anprc152","ItemCompass","ItemWatch",""]];
	};

	default {
		_normalLoadout = [["arifle_SPAR_02_blk_F","muzzle_snds_M","","optic_ERCO_blk_F",["ACE_30Rnd_556x45_Stanag_Mk318_mag",30],[],"bipod_01_F_blk"],[],["hgun_P07_blk_F","","","",["16Rnd_9x21_Mag",17],[],""],["U_B_CTRG_Soldier_F",[["ACE_CableTie",2],["ACE_MapTools",1],["ACE_Flashlight_XL50",1],["ACE_packingBandage",10],["ACE_elasticBandage",10],["ACE_salineIV_500",2],["ACE_tourniquet",4]]],["V_PlateCarrier1_rgr_noflag_F",[["ACE_30Rnd_556x45_Stanag_Mk318_mag",14,30],["SmokeShell",2,1],["HandGrenade",1,1],["16Rnd_9x21_Mag",1,17]]],["B_AssaultPack_rgr",[["ACE_30Rnd_556x45_Stanag_Mk318_mag",20,30]]],"H_HelmetB_TI_tna_F","G_Balaclava_TI_tna_F",["ACE_Vector","","","",[],[],""],["ItemMap","ItemGPS","TFAR_anprc152","ItemCompass","ItemWatch",""]];
	};
};

player setVariable ["grad_cc_normalLoadout", _normalLoadout, true];
player setVariable ["grad_cc_diveLoadout", _diveLoadout, true];
