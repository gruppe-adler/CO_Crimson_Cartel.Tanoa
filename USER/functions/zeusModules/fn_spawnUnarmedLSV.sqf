if (!isServer || !canSuspend) exitWith { _this remoteExec [_fnc_scriptName, 2]; };

params ["_posASL"];

private _posAGL = ASLToAGL _posASL;
private _veh = "O_T_LSV_02_unarmed_F" createVehicle _posAGL;
private _grp = createGroup independent;
{
	private _unit = _grp createUnit [_x, _posAGL, [], 0, "NONE"];
	_unit moveInAny _veh;
} forEach ["I_C_Soldier_Para_2_F", "I_C_Soldier_Para_4_F", "I_C_Soldier_Para_1_F", "I_C_Soldier_Para_5_F", "I_C_Soldier_Para_7_F", "I_C_Soldier_Para_7_F"];
