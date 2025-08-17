params ["_crate"];

private _onAction = {
	private _clothSound = playSoundUI ["change_clothes"];

	[
		10,
		_clothSound,
		{
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
		},
		{
			params ["_clothSound"];
			stopSound _clothSound;
		},
		"Fescher neuer Look..."
	] call ace_common_fnc_progressBar;
};

private _action = [
	"GRAD_toggleLoadout",
	"Umziehen",
	"",
	_onAction,
	{true},
	{},
	[],
	[0,0,0]
] call ace_interact_menu_fnc_createAction;
[_crate, 0, ["ACE_MainActions"], _action] call ace_interact_menu_fnc_addActionToObject;
