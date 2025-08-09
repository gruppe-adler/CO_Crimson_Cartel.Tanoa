if (!isServer || !canSuspend) exitWith { _this remoteExec [_fnc_scriptName, 2]; };

// sec 1
{
	[_x] call CBA_fnc_clearWaypoints;
	private _wp = [_x, grad_cc_sec1Heli, -1, "GETIN", "AWARE", "YELLOW", "FULL"] call CBA_fnc_addWaypoint;
	_wp waypointAttachVehicle grad_cc_sec1Heli;
} forEach [grad_cc_sec1grp_1, grad_cc_sec1grp_2, grad_cc_sec1grp_3];

[
	{
		private _allUnits = (units grad_cc_sec1grp_1) + (units grad_cc_sec1grp_2) + (units grad_cc_sec1grp_3);
		(count (_allUnits select { (vehicle _x) isEqualTo grad_cc_sec1Heli })) == (count _allUnits)
	},
	{
		grad_cc_sec1Heli engineOn true;
		grad_cc_sec1Heli animateDoor ["Door_6_source", 0, false];
		[
			{
				[] spawn grad_cc_fnc_sec1ToAirport;
			},
			[],
			20
		] call CBA_fnc_waitAndExecute;
	},
	[]
] call CBA_fnc_waitUntilAndExecute;


// sec 2
{
	[_x] call CBA_fnc_clearWaypoints;
	private _wp = [_x, grad_cc_sec2Heli, -1, "GETIN", "AWARE", "YELLOW", "FULL"] call CBA_fnc_addWaypoint;
	_wp waypointAttachVehicle grad_cc_sec2Heli;
} forEach [grad_cc_sec2grp_1, grad_cc_sec2grp_2, grad_cc_sec2grp_3];

[
	{
		private _allUnits = (units grad_cc_sec2grp_1) + (units grad_cc_sec2grp_2) + (units grad_cc_sec2grp_3);
		(count (_allUnits select { (vehicle _x) isEqualTo grad_cc_sec2Heli })) == (count _allUnits)
	},
	{
		grad_cc_sec2Heli engineOn true;
		grad_cc_sec2Heli animateDoor ["Door_6_source", 0, false];
		[
			{
				[] spawn grad_cc_fnc_sec2ToAirport;
			},
			[],
			20
		] call CBA_fnc_waitAndExecute;
	},
	[]
] call CBA_fnc_waitUntilAndExecute;
