["Crimson Cartel", "0 - Toggle Captive",
{
	params ["_posASL", "_objectAttached"];
	[_objectAttached] call GRAD_CC_fnc_toggleCaptive;
}] call zen_custom_modules_fnc_register;

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

["Crimson Cartel", "10 - Play Medusa",
{
	params ["_posASL", "_objectAttached"];
	if (isNull _objectAttached) exitWith {};
	[_objectAttached, ["medusa", 400]] remoteExec ["say3D", [0, -2] select isDedicated];
}] call zen_custom_modules_fnc_register;

["Crimson Cartel", "11 - Play FrontRowHustle",
{
	params ["_posASL", "_objectAttached"];
	if (isNull _objectAttached) exitWith {};
	[_objectAttached, ["frontRowHustle", 400]] remoteExec ["say3D", [0, -2] select isDedicated];
}] call zen_custom_modules_fnc_register;

["Crimson Cartel", "12 - Play Avalanche",
{
	params ["_posASL", "_objectAttached"];
	if (isNull _objectAttached) exitWith {};
	[_objectAttached, ["avalanche", 400]] remoteExec ["say3D", [0, -2] select isDedicated];
}] call zen_custom_modules_fnc_register;

["Crimson Cartel", "13 - Toggle Loadout",
{
	params ["_posASL", "_objectAttached"];
	if (not isPlayer _objectAttached) exitWith {};
	private _currentLoadout = getUnitLoadout player;
	private _currentLoadoutType = player getVariable ["grad_cc_currentLoadoutType", "DIVE"];

	if (_currentLoadoutType isEqualTo "NORMAL") then {
		player setVariable ["grad_cc_normalLoadout", _currentLoadout, true];
		private _diveLoadout = player getVariable ["grad_cc_diveLoadout", []];
		player setUnitLoadout [_diveLoadout, false];
		player setVariable ["grad_cc_currentLoadoutType", "DIVE", true];
	} else {
		player setVariable ["grad_cc_diveLoadout", _currentLoadout, true];
		private _normalLoadout = player getVariable ["grad_cc_normalLoadout", []];
		player setUnitLoadout [_normalLoadout, false];
		player setVariable ["grad_cc_currentLoadoutType", "NORMAL", true];
	};
}] call zen_custom_modules_fnc_register;
