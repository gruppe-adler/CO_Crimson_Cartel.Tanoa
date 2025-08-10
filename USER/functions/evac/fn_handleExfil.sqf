if (!isServer || !canSuspend) exitWith { _this remoteExec [_fnc_scriptName, 2]; };

([[4102.99,19390.8,533.443], 157.097, "B_Heli_Transport_03_F", west] call BIS_fnc_spawnVehicle) params ["_veh", "_crew", "_grp"];
_veh allowDamage false;

[_veh] call grad_cc_fnc_exfil;

waitUntil { _veh inArea grad_cc_exfilGearDown };

private _handle = [
	{
		params ["_args", "_handle"];
		_args params ["_veh", "_time"];

		if ((time >= _time) && !(isTouchingGround _veh)) exitWith {
			[_handle] call CBA_fnc_removePerFrameHandler;
		};

		if (time <= _time) then {
			_veh action ["LandGear", _veh];
		};

		_veh setVelocity [0, 0, -2];
	},
	0,
	[_veh, time + 20]
] call CBA_fnc_addPerFrameHandler;

waitUntil { isTouchingGround _veh };

_veh engineOn false;
sleep 1;
_veh engineOn true;
_veh animateDoor ["Door_rear_source", 1, false];

waitUntil { missionNamespace getVariable ["grad_cc_takeOff", false] };

private _wp = [_veh, [2567.08,21600, 300], -1, "MOVE", "AWAE", "YELLOW", "FULL"] call CBA_fnc_addWaypoint;
_veh animateDoor ["Door_rear_source", 0, false];
