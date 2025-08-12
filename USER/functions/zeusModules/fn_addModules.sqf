["Crimson Cartel", "1 - Start Intro",
{
	params ["_posASL", "_objectAttached"];
	[] call GRAD_CC_fnc_handleIntro;
}] call zen_custom_modules_fnc_register;

["Crimson Cartel", "2 - Start Intro Music",
{
	params ["_posASL", "_objectAttached"];
	missionNamespace setVariable ["grad_cc_playIntroMusic", true, true];
}] call zen_custom_modules_fnc_register;

["Crimson Cartel", "3 - Reinforcements Unarmed LSV",
{
	params ["_posASL", "_objectAttached"];
	[_posASL] call GRAD_CC_fnc_spawnUnarmedLSV;
}] call zen_custom_modules_fnc_register;

["Crimson Cartel", "4 - Reinforcements Armed LSV",
{
	params ["_posASL", "_objectAttached"];
	[_posASL] call GRAD_CC_fnc_spawnArmedLSV;
}] call zen_custom_modules_fnc_register;

["Crimson Cartel", "5 - Reinforcements Otokar",
{
	params ["_posASL", "_objectAttached"];
	[_posASL] call GRAD_CC_fnc_spawnOtokar;
}] call zen_custom_modules_fnc_register;

["Crimson Cartel", "6 - Reinforcements Elite",
{
	params ["_posASL", "_objectAttached"];
	[_posASL] call GRAD_CC_fnc_spawnElite;
}] call zen_custom_modules_fnc_register;

["Crimson Cartel", "7 - Convert Group To Elite",
{
	params ["_posASL", "_objectAttached"];
	if ((not (_objectAttached isKindOf "CAManBase")) || ((side _objectAttached) isNotEqualTo independent)) exitWith {};
	private _grp = group _objectAttached;
	{
		[_x] call GRAD_CC_fnc_convertToElite;
		[_x, 0.7] remoteExecCall ["setSkill", _x];
	} forEach (units _grp);
}] call zen_custom_modules_fnc_register;

["Crimson Cartel", "8 - Init Exfil",
{
	params ["_posASL", "_objectAttached"];
	[] call grad_cc_fnc_handleExfil;
}] call zen_custom_modules_fnc_register;

["Crimson Cartel", "9 - Init Takeoff",
{
	params ["_posASL", "_objectAttached"];
	missionNamespace setVariable ["grad_cc_takeOff", true, true];
}] call zen_custom_modules_fnc_register;
