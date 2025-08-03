if (!isServer || !canSuspend) exitWith { _this remoteExec [_fnc_scriptName, 2]; };



{
	_x enableSimulation true;
	_x engineOn true;	
} forEach [grad_cc_sec1Heli, grad_cc_sec2Heli];

sleep 20;

[] call Grad_cc_fnc_sec1ToFactory;
[] call Grad_cc_fnc_sec2ToFactory;

sleep 20;

// sec 1
[
	{
		isTouchingGround grad_cc_sec1Heli
	},
	{
		grad_cc_sec1Heli animateDoor ["Door_6_source", 1, false];
		[
			{
				grad_cc_sec1Heli engineOn false;
				{
					_x leaveVehicle grad_cc_sec1Heli;					
				} forEach [grad_cc_sec1grp_1, grad_cc_sec1grp_2, grad_cc_sec1grp_3];
				// grp 1
				private _pathAmount = 10;
				private _wp = [grad_cc_sec1grp_1, getPos (call(compile format ["grad_cc_sec1PatrolGrp1_1"])), 0, "MOVE", "AWARE", "YELLOW", "FULL"] call CBA_fnc_addWaypoint;
				[
					{
						params ["_wp"];
						_wp setWaypointSpeed "LIMITED";
						_wp setWaypointBehaviour "SAFE";
					},
					[_wp],
					40
				] call CBA_fnc_waitAndExecute;
				for "_i" from 2 to _pathAmount do {
					private _pos = getPos (call(compile format ["grad_cc_sec1PatrolGrp1_%1",_i]));
					private _wp = [grad_cc_sec1grp_1, _pos, -1, "MOVE", "SAFE", "YELLOW", "LIMITED"] call CBA_fnc_addWaypoint;
				};
				[grad_cc_sec1grp_1, getPos (call(compile format ["grad_cc_sec1PatrolGrp1_%1", _pathAmount])), 0, "CYCLE", "SAFE", "YELLOW", "LIMITED"] call CBA_fnc_addWaypoint;
				// grp 2
				private _pathAmount = 5;
				private _wp = [grad_cc_sec1grp_2, getPos (call(compile format ["grad_cc_sec1PatrolGrp2_1"])), 0, "MOVE", "AWARE", "YELLOW", "FULL"] call CBA_fnc_addWaypoint;
				[
					{
						params ["_wp"];
						_wp setWaypointSpeed "LIMITED";
						_wp setWaypointBehaviour "SAFE";
					},
					[_wp],
					20
				] call CBA_fnc_waitAndExecute;
				for "_i" from 2 to _pathAmount do {
					private _pos = getPos (call(compile format ["grad_cc_sec1PatrolGrp2_%1",_i]));
					private _wp = [grad_cc_sec1grp_2, _pos, -1, "MOVE", "SAFE", "YELLOW", "LIMITED"] call CBA_fnc_addWaypoint;
				};
				[grad_cc_sec1grp_2, getPos (call(compile format ["grad_cc_sec1PatrolGrp2_%1", _pathAmount])), 0, "CYCLE", "SAFE", "YELLOW", "LIMITED"] call CBA_fnc_addWaypoint;
				// grp 3
				_pathAmount = 5;
				private _wp = [grad_cc_sec3grp_1, getPos (call(compile format ["grad_cc_sec3PatrolGrp1_1"])), 0, "MOVE", "AWARE", "YELLOW", "FULL"] call CBA_fnc_addWaypoint;
				[
					{
						params ["_wp"];
						_wp setWaypointSpeed "LIMITED";
						_wp setWaypointBehaviour "SAFE";
					},
					[_wp],
					20
				] call CBA_fnc_waitAndExecute;
				for "_i" from 2 to _pathAmount do {
					private _pos = getPos (call(compile format ["grad_cc_sec1PatrolGrp3_%1",_i]));
					private _wp = [grad_cc_sec1grp_3, _pos, -1, "MOVE", "SAFE", "YELLOW", "LIMITED"] call CBA_fnc_addWaypoint;
				};
				[grad_cc_sec1grp_3, getPos (call(compile format ["grad_cc_sec1PatrolGrp3_%1", _pathAmount])), 0, "CYCLE", "SAFE", "YELLOW", "LIMITED"] call CBA_fnc_addWaypoint;
			},
			[],
			3
		] call CBA_fnc_waitAndExecute;
	},
	[]
] call CBA_fnc_waitUntilAndExecute;


// sec 2
[
	{
		isTouchingGround grad_cc_sec2Heli
	},
	{
		grad_cc_sec2Heli animateDoor ["Door_6_source", 1, false];
		[
			{
				grad_cc_sec2Heli engineOn false;
				{
					_x leaveVehicle grad_cc_sec2Heli;					
				} forEach [grad_cc_sec2grp_1, grad_cc_sec2grp_2, grad_cc_sec2grp_3];
				// grp 1
				private _pathAmount = 6;
				private _wp = [grad_cc_sec2grp_1, getPos (call(compile format ["grad_cc_sec2PatrolGrp1_1"])), 0, "MOVE", "AWARE", "YELLOW", "FULL"] call CBA_fnc_addWaypoint;
				[
					{
						params ["_wp"];
						_wp setWaypointSpeed "LIMITED";
						_wp setWaypointBehaviour "SAFE";
					},
					[_wp],
					30
				] call CBA_fnc_waitAndExecute;
				for "_i" from 2 to _pathAmount do {
					private _pos = getPos (call(compile format ["grad_cc_sec2PatrolGrp1_%1",_i]));
					_wp = [grad_cc_sec2grp_1, _pos, -1, "MOVE", "SAFE", "YELLOW", "LIMITED"] call CBA_fnc_addWaypoint;
				};
				[grad_cc_sec2grp_1, getPos (call(compile format ["grad_cc_sec2PatrolGrp1_%1", _pathAmount])), 0, "CYCLE", "SAFE", "YELLOW", "LIMITED"] call CBA_fnc_addWaypoint;
				// grp 2
				private _pathAmount = 8;
				private _wp = [grad_cc_sec2grp_2, getPos (call(compile format ["grad_cc_sec2PatrolGrp2_1"])), 0, "MOVE", "AWARE", "YELLOW", "FULL"] call CBA_fnc_addWaypoint;
				[
					{
						params ["_wp"];
						_wp setWaypointSpeed "LIMITED";
						_wp setWaypointBehaviour "SAFE";
					},
					[_wp],
					20
				] call CBA_fnc_waitAndExecute;
				for "_i" from 2 to _pathAmount do {
					private _pos = getPos (call(compile format ["grad_cc_sec2PatrolGrp2_%1",_i]));
					_wp = [grad_cc_sec2grp_2, _pos, -1, "MOVE", "SAFE", "YELLOW", "LIMITED"] call CBA_fnc_addWaypoint;
				};
				[grad_cc_sec2grp_2, getPos (call(compile format ["grad_cc_sec2PatrolGrp2_%1", _pathAmount])), 0, "CYCLE", "SAFE", "YELLOW", "LIMITED"] call CBA_fnc_addWaypoint;
				// grp 3
				_pathAmount = 8;
				private _wp = [grad_cc_sec2grp_3, getPos (call(compile format ["grad_cc_sec2PatrolGrp3_1"])), 0, "MOVE", "AWARE", "YELLOW", "FULL"] call CBA_fnc_addWaypoint;
				[
					{
						params ["_wp"];
						_wp setWaypointSpeed "LIMITED";
						_wp setWaypointBehaviour "SAFE";
					},
					[_wp],
					20
				] call CBA_fnc_waitAndExecute;
				for "_i" from 2 to _pathAmount do {
					private _pos = getPos (call(compile format ["grad_cc_sec2PatrolGrp3_%1",_i]));
					_wp = [grad_cc_sec2grp_3, _pos, -1, "MOVE", "SAFE", "YELLOW", "LIMITED"] call CBA_fnc_addWaypoint;
				};
				[grad_cc_sec2grp_3, getPos (call(compile format ["grad_cc_sec2PatrolGrp3_%1", _pathAmount])), 0, "CYCLE", "SAFE", "YELLOW", "LIMITED"] call CBA_fnc_addWaypoint;
			},
			[],
			3
		] call CBA_fnc_waitAndExecute;
	},
	[]
] call CBA_fnc_waitUntilAndExecute;
