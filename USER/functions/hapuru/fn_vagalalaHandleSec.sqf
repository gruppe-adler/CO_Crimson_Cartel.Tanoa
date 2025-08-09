if (!isServer || !canSuspend) exitWith { _this remoteExec [_fnc_scriptName, 2]; };

{
	_x enableSimulation true;
	_x engineOn true;	
} forEach [grad_cc_sec3Otokar, grad_cc_sec4Otokar];


private _wpUnload_4 = [grad_cc_sec4Otokar, [11198.1,9782.57,0], -1, "TR UNLOAD", "SAFE"] call CBA_fnc_addWaypoint;
private _wpGetOut_4_2 = [grad_cc_sec4grp_2, [11154.6,9820.5,0], -1, "GETOUT", "SAFE"] call CBA_fnc_addWaypoint;
private _wpGetOut_4_1 = [grad_cc_sec4grp_1, [11153.8,9792.57,0], -1, "GETOUT", "SAFE"] call CBA_fnc_addWaypoint;
_wpUnload_4 synchronizeWaypoint [_wpGetOut_4_1, _wpGetOut_4_2];

sleep 5;

private _wpUnload_3 = [grad_cc_sec3Otokar, [10978.7,9836.54,0], -1, "TR UNLOAD", "SAFE"] call CBA_fnc_addWaypoint;
private _wpGetOut_3_1 = [grad_cc_sec3grp_1, [10927,9820.17,0], -1, "GETOUT", "SAFE"] call CBA_fnc_addWaypoint;
private _wpGetOut_3_2 = [grad_cc_sec3grp_2, [10961.4,9854.2,0], -1, "GETOUT", "SAFE"] call CBA_fnc_addWaypoint;
_wpUnload_3 synchronizeWaypoint [_wpGetOut_3_1, _wpGetOut_3_2];

// sec 3
[
	{
		private _allUnits = (units grad_cc_sec3grp_1) + (units grad_cc_sec3grp_2);
		(count (_allUnits select { (vehicle _x) isNotEqualTo grad_cc_sec3Otokar })) == (count _allUnits)
	},
	{
		grad_cc_sec3Otokar engineOn false;
		// grp 1
		private _pathAmount = 4;
		for "_i" from 1 to _pathAmount do {
			private _pos = getPos (call(compile format ["grad_cc_sec3PatrolGrp1_%1",_i]));
			private _wp = [grad_cc_sec3grp_1, _pos, -1, "MOVE", "SAFE", "YELLOW", "LIMITED"] call CBA_fnc_addWaypoint;
		};
		[grad_cc_sec3grp_1, getPos (call(compile format ["grad_cc_sec3PatrolGrp1_%1", _pathAmount])), 0, "CYCLE", "SAFE", "YELLOW", "LIMITED"] call CBA_fnc_addWaypoint;

		// grp 2
		_pathAmount = 5;
		for "_i" from 1 to _pathAmount do {
			private _pos = getPos (call(compile format ["grad_cc_sec3PatrolGrp2_%1",_i]));
			private _wp = [grad_cc_sec3grp_2, _pos, -1, "MOVE", "SAFE", "YELLOW", "LIMITED"] call CBA_fnc_addWaypoint;
		};
		[grad_cc_sec3grp_2, getPos (call(compile format ["grad_cc_sec3PatrolGrp2_%1", _pathAmount])), 0, "CYCLE", "SAFE", "YELLOW", "LIMITED"] call CBA_fnc_addWaypoint;
	},
	[]
] call CBA_fnc_waitUntilAndExecute;


// sec 4
[
	{
		private _allUnits = (units grad_cc_sec4grp_1) + (units grad_cc_sec4grp_2);
		(count (_allUnits select { (vehicle _x) isNotEqualTo grad_cc_sec4Otokar })) == (count _allUnits)
	},
	{
		grad_cc_sec4Otokar engineOn false;
		// grp 1
		private _pathAmount = 4;
		for "_i" from 1 to _pathAmount do {
			private _pos = getPos (call(compile format ["grad_cc_sec4PatrolGrp1_%1",_i]));
			private _wp = [grad_cc_sec4grp_1, _pos, -1, "MOVE", "SAFE", "YELLOW", "LIMITED"] call CBA_fnc_addWaypoint;
		};
		[grad_cc_sec4grp_1, getPos (call(compile format ["grad_cc_sec4PatrolGrp1_%1", _pathAmount])), 0, "CYCLE", "SAFE", "YELLOW", "LIMITED"] call CBA_fnc_addWaypoint;

		// grp 2
		_pathAmount = 10;
		for "_i" from 1 to _pathAmount do {
			private _pos = getPos (call(compile format ["grad_cc_sec4PatrolGrp2_%1",_i]));
			private _wp = [grad_cc_sec4grp_2, _pos, -1, "MOVE", "SAFE", "YELLOW", "LIMITED"] call CBA_fnc_addWaypoint;
		};
		[grad_cc_sec4grp_2, getPos (call(compile format ["grad_cc_sec4PatrolGrp2_%1", _pathAmount])), 0, "CYCLE", "SAFE", "YELLOW", "LIMITED"] call CBA_fnc_addWaypoint;
	},
	[]
] call CBA_fnc_waitUntilAndExecute;
