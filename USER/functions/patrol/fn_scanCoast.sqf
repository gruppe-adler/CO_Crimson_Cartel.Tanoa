if (!isServer || !canSuspend) exitWith { _this remoteExec [_fnc_scriptName, 2]; };

params ["_boat"];

private _handler = [
	{
		params ["_args", "_handle"];
		_args params ["_boat", "_commander"];

		if (((behaviour _commander) isEqualTo "COMBAT") || !(alive _boat) || !(alive _commander) || ((vehicle _commander) != _boat) || ((date select 3) >= 6)) exitWith {
			[_handle] call CBA_fnc_removePerFrameHandler;
			_commander doWatch objNull;
			private _oldTarget = _commander getVariable ["GRAD_CC_patrolTarget", objNull];
			deleteVehicle _oldTarget;
		};

		private _oldTarget = _commander getVariable ["GRAD_CC_patrolTarget", objNull];
		deleteVehicle _oldTarget;
		private _nearestTree = selectRandom (nearestTerrainObjects [_commander, ["BUSH", "SMALL TREE", "TREE", "WALL", "ROAD"], 200, false, true]) ;
		private _pos = getPos _nearestTree;
		_pos set [2, 0];
		private _target = createVehicle ["CBA_B_InvisibleTargetVehicle", _pos, [], 0, "CAN_COLLIDE"];
		_commander setVariable ["GRAD_CC_patrolTarget", _target];
		_commander reveal [_target, 4];
		_commander lookAt _target;
		_commander doWatch _target;
		_commander doTarget _target;
	},
	4,
	[_boat, commander _boat]
] call CBA_fnc_addPerFrameHandler;
