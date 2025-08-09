if (!isServer || !canSuspend) exitWith { _this remoteExec [_fnc_scriptName, 2]; };

{
	_x enableSimulation true;
	_x engineOn true;	
} forEach [grad_cc_sec5LSV, grad_cc_sec6LSV, grad_cc_sec7LSV];


private _wpLSV5Move = [grad_cc_sec5LSV, [9068.41,7910.08,0], -1, "MOVE"] call CBA_fnc_addWaypoint;
private _wpUnload_5 = [grad_cc_sec5LSV, [10947.4,8129.02,0], -1, "TR UNLOAD"] call CBA_fnc_addWaypoint;
private _wpGetOut_5_1 = [grad_cc_sec5grp, [10923.7,8126.37,0], -1, "GETOUT", "SAFE"] call CBA_fnc_addWaypoint;
_wpUnload_5 synchronizeWaypoint [_wpGetOut_5_1];

sleep 8;

private _wpLSV6Move = [grad_cc_sec6LSV, [9068.41,7910.08,0], -1, "MOVE"] call CBA_fnc_addWaypoint;
_wpLSV6Move = [grad_cc_sec6LSV, [10868.2,8179.8,0], -1, "MOVE"] call CBA_fnc_addWaypoint;
private _wpUnload_6 = [grad_cc_sec6LSV, [10852.3,8133.37,0], -1, "TR UNLOAD"] call CBA_fnc_addWaypoint;
private _wpGetOut_6_1 = [grad_cc_sec6grp, [10828.3,8132.63,0], -1, "GETOUT", "SAFE"] call CBA_fnc_addWaypoint;
_wpUnload_6 synchronizeWaypoint [_wpGetOut_6_1];

sleep 8;

private _wpLSV7Move = [grad_cc_sec7LSV, [9068.41,7910.08,0], -1, "MOVE"] call CBA_fnc_addWaypoint;
private _wpUnload_7 = [grad_cc_sec7LSV, [10793.5,8212.42,0], -1, "TR UNLOAD"] call CBA_fnc_addWaypoint;
private _wpGetOut_7_1 = [grad_cc_sec7grp, [10798.8,8224.41,0], -1, "GETOUT", "SAFE"] call CBA_fnc_addWaypoint;
_wpUnload_7 synchronizeWaypoint [_wpGetOut_7_1];

// sec 5
[
	{
		private _allUnits = units grad_cc_sec5grp;
		(count (_allUnits select { (vehicle _x) isNotEqualTo grad_cc_sec5LSV })) == (count _allUnits)
	},
	{
		grad_cc_sec5LSV engineOn false;
		private _pathAmount = 8;
		for "_i" from 1 to _pathAmount do {
			private _pos = getPos (call(compile format ["grad_cc_sec5PatrolGrp_%1",_i]));
			private _wp = [grad_cc_sec5grp, _pos, -1, "MOVE", "SAFE", "YELLOW", "LIMITED"] call CBA_fnc_addWaypoint;
		};
		[grad_cc_sec5grp, getPos (call(compile format ["grad_cc_sec5PatrolGrp_%1", _pathAmount])), 0, "CYCLE", "SAFE", "YELLOW", "LIMITED"] call CBA_fnc_addWaypoint;
	},
	[]
] call CBA_fnc_waitUntilAndExecute;

// sec 6
[
	{
		private _allUnits = units grad_cc_sec6grp;
		(count (_allUnits select { (vehicle _x) isNotEqualTo grad_cc_sec6LSV })) == (count _allUnits)
	},
	{
		grad_cc_sec6LSV engineOn false;
		private _pathAmount = 6;
		for "_i" from 1 to _pathAmount do {
			private _pos = getPos (call(compile format ["grad_cc_sec6PatrolGrp_%1",_i]));
			private _wp = [grad_cc_sec6grp, _pos, -1, "MOVE", "SAFE", "YELLOW", "LIMITED"] call CBA_fnc_addWaypoint;
		};
		[grad_cc_sec6grp, getPos (call(compile format ["grad_cc_sec6PatrolGrp_%1", _pathAmount])), 0, "CYCLE", "SAFE", "YELLOW", "LIMITED"] call CBA_fnc_addWaypoint;
	},
	[]
] call CBA_fnc_waitUntilAndExecute;

// sec 7
[
	{
		private _allUnits = units grad_cc_sec7grp;
		(count (_allUnits select { (vehicle _x) isNotEqualTo grad_cc_sec7LSV })) == (count _allUnits)
	},
	{
		grad_cc_sec7LSV engineOn false;
		private _pathAmount = 2;
		for "_i" from 1 to _pathAmount do {
			private _pos = getPos (call(compile format ["grad_cc_sec7PatrolGrp_%1",_i]));
			private _wp = [grad_cc_sec7grp, _pos, -1, "MOVE", "SAFE", "YELLOW", "LIMITED"] call CBA_fnc_addWaypoint;
		};
		[grad_cc_sec7grp, getPos (call(compile format ["grad_cc_sec7PatrolGrp_%1", _pathAmount])), 0, "CYCLE", "SAFE", "YELLOW", "LIMITED"] call CBA_fnc_addWaypoint;
	},
	[]
] call CBA_fnc_waitUntilAndExecute;
