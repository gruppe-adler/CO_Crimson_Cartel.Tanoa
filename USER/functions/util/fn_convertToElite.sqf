params ["_unit"];

private _loadout = [];

switch (typeOf _unit) do {
	case "I_C_Soldier_Para_4_F": {
		_loadout = [["MMG_02_black_F","","","optic_Holosight_blk_F",["130Rnd_338_Mag",130],[],"bipod_01_F_blk"],[],["hgun_Pistol_01_F","","","",["10Rnd_9x21_Mag",10],[],""],["U_B_CombatUniform_mcam_wdl_f",[["ACE_fieldDressing",1],["ACE_packingBandage",1],["ACE_morphine",1],["ACE_tourniquet",1]]],["V_CarrierRigKBT_01_heavy_Olive_F",[["10Rnd_9x21_Mag",2,10],["HandGrenade",2,1],["130Rnd_338_Mag",1,130]]],["B_ViperLightHarness_oli_F",[["130Rnd_338_Mag",4,130]]],"H_HelmetHBK_chops_F","",[],["ItemMap","","ItemRadio","ItemCompass","ItemWatch",""]];
	};
	case "I_C_Soldier_Para_5_F": {
		_loadout = [["arifle_AK12_F","","","optic_Holosight_blk_F",["30Rnd_762x39_AK12_Mag_F",30],[],""],["launch_RPG32_green_F","","","",["RPG32_F",1],[],""],["hgun_Pistol_01_F","","","",["10Rnd_9x21_Mag",10],[],""],["U_B_CombatUniform_mcam_wdl_f",[["ACE_fieldDressing",1],["ACE_packingBandage",1],["ACE_morphine",1],["ACE_tourniquet",1],["30Rnd_762x39_AK12_Mag_F",2,30]]],["V_CarrierRigKBT_01_heavy_Olive_F",[["30Rnd_762x39_AK12_Mag_F",8,30],["10Rnd_9x21_Mag",2,10],["HandGrenade",2,1]]],["B_ViperLightHarness_oli_F",[["RPG32_F",4,1]]],"H_HelmetHBK_chops_F","",[],["ItemMap","","ItemRadio","ItemCompass","ItemWatch",""]];
	};
	case "I_C_Soldier_Para_1_F": {
		_loadout = [["srifle_DMR_04_F","","","optic_AMS",["10Rnd_127x54_Mag",10],[],""],[],["hgun_Pistol_01_F","","","",["10Rnd_9x21_Mag",10],[],""],["U_B_CombatUniform_mcam_wdl_f",[["ACE_fieldDressing",1],["ACE_packingBandage",1],["ACE_morphine",1],["ACE_tourniquet",1]]],["V_CarrierRigKBT_01_heavy_Olive_F",[["10Rnd_9x21_Mag",2,10],["HandGrenade",2,1],["10Rnd_127x54_Mag",8,10]]],[],"H_HelmetHBK_chops_F","",[],["ItemMap","","ItemRadio","ItemCompass","ItemWatch",""]];
	};
	default {
		_loadout = [["arifle_AK12_F","","","optic_Holosight_blk_F",["30Rnd_762x39_AK12_Mag_F",30],[],""],[],["hgun_Pistol_01_F","","","",["10Rnd_9x21_Mag",10],[],""],["U_B_CombatUniform_mcam_wdl_f",[["ACE_fieldDressing",1],["ACE_packingBandage",1],["ACE_morphine",1],["ACE_tourniquet",1],["30Rnd_762x39_AK12_Mag_F",2,30]]],["V_CarrierRigKBT_01_heavy_Olive_F",[["30Rnd_762x39_AK12_Mag_F",8,30],["10Rnd_9x21_Mag",2,10],["HandGrenade",2,1]]],[],"H_HelmetHBK_chops_F","",[],["ItemMap","","ItemRadio","ItemCompass","ItemWatch",""]];
	};
};

_unit setUnitLoadout _loadout;
