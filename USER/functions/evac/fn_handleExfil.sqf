if (!isServer || !canSuspend) exitWith { _this remoteExec [_fnc_scriptName, 2]; };

// ([[7231.64, 6990.06, 100], 347.857, "O_T_VTOL_02_infantry_dynamicLoadout_F", independent] call BIS_fnc_spawnVehicle) params ["_vtol_1", "_crew_1", "_grp_1"];
// private _vtol_wp_1 = [_vtol_1, [6711.83,13297.7,0], -1, "SAD", "AWARE", "YELLOW", "FULL"] call CBA_fnc_addWaypoint;
// ([[3013.67,23487.4, 500], 160.710, "B_Plane_Fighter_01_Stealth_F", west] call BIS_fnc_spawnVehicle) params ["_jet_1", "_jetCrew_1", "_jetGrp_1"];
// _jet_1 reveal [_vtol_1, 4];
// private _jet_wp_1 = [_jet_1, [6711.83,13297.7,0], -1, "DESTROY", "AWARE", "YELLOW", "FULL"] call CBA_fnc_addWaypoint;
// _jet_wp_1 waypointAttachVehicle _vtol_1;

// sleep 10;

// ([[7231.99, 6924.71, 100], 347.857, "O_T_VTOL_02_infantry_dynamicLoadout_F", independent] call BIS_fnc_spawnVehicle) params ["_vtol_2", "_crew_2", "_grp_2"];
// private _vtol_wp_2 = [_vtol_2, [6708.83,13295.7,0], -1, "SAD", "AWARE", "YELLOW", "FULL"] call CBA_fnc_addWaypoint;
// ([[3013.67,23487.4, 500], 160.710, "B_Plane_Fighter_01_Stealth_F", west] call BIS_fnc_spawnVehicle) params ["_jet_2", "_jetCrew_2", "_jetGrp_2"];
// _jet_2 reveal [_vtol_2, 4];
// private _jet_wp_2 = [_jet_2, [6711.83,13297.7,0], -1, "DESTROY", "AWARE", "YELLOW", "FULL"] call CBA_fnc_addWaypoint;
// _jet_wp_2 waypointAttachVehicle _vtol_2;

// sleep 80;

[] spawn GRAD_CC_fnc_blackfishCAS;

sleep 180;

([[4102.99,19390.8,533.443], 157.097, "B_Heli_Transport_03_F", west] call BIS_fnc_spawnVehicle) params ["_veh", "_crew", "_grp"];
_veh allowDamage false;
{
	_x disableAI "AUTOTARGET";
	_x disableAI "AUTOCOMBAT";
} forEach _crew;

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

_grp setBehaviour "CARELESS";
_veh engineOn false;
sleep 1;
_veh engineOn true;
_veh animateDoor ["Door_rear_source", 1, false];

waitUntil { missionNamespace getVariable ["grad_cc_takeOff", false] };

private _wp = [_veh, [2567.08,21600, 300], -1, "MOVE", "AWARE", "YELLOW", "FULL"] call CBA_fnc_addWaypoint;
_veh animateDoor ["Door_rear_source", 0, false];
