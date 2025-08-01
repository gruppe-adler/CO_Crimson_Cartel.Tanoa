if (!isServer || !canSuspend) exitWith { _this remoteExec [_fnc_scriptName, 2]; };

([[5565.27,17660.5,1000], 180, "B_T_VTOL_01_armed_F", west] call BIS_fnc_spawnVehicle) params ["_veh", "_crew", "_grp"];
_veh allowDamage false;
{
	_x setSkill 1;
	_x allowDamage false;
} forEach _crew;
private _wp = [_grp, grad_cc_blackfishLoiterPoint, 0, "LOITER", "CARELESS", "WHITE", "NORMAL"] call CBA_fnc_addWaypoint;
_grp setBehaviourStrong "CARELESS";
_wp setWaypointLoiterRadius 1100;
_wp setWaypointLoiterAltitude 700;
_wp setWaypointLoiterType "CIRCLE_L";
_veh flyInHeightASL [650, 650, 650];

private _fullCrew = fullCrew _veh;
// private _gunner40mm = ((_fullCrew select { (_x select 6) == "$STR_A3_RIGHT_GUNNER" }) # 0) # 0;
// private _gunnerRest = ((_fullCrew select { (_x select 6) == "$STR_A3_LEFT_GUNNER" }) # 0) # 0;

sleep 17;
_veh forceSpeed 30;
sleep 15;

// private _virtualTarget = createVehicle ["CBA_B_InvisibleTargetVehicle", grad_cc_blackfishLoiterPoint, [], 0, "CAN_COLLIDE"];
// _virtualTarget setPosASL (getPosASL grad_cc_blackfishLoiterPoint);

while {alive _veh} do {
	_veh flyInHeightASL [650, 650, 650];
	private _targets = (nearestObjects [grad_cc_blackfishLoiterPoint, ["CAManBase", "Car", "Tank", "Truck"], 500]) select {!(isPlayer _x) && (alive _x) && !((side _x) in [west, civilian]) && (([_x] call GRAD_CC_fnc_getNearestPlayer) distance2D _x) >= 100};
	if (_targets isEqualTo []) then { continue };
	_veh setVehicleAmmo 1;

	{
		_veh reveal [_x, 4];
	} forEach _targets;

	private _target = selectRandom _targets;
	_veh reveal [_target, 4];
	_veh doTarget _target;
	_veh doWatch _target;	
	
	_gun = selectRandom ["cannon_105mm_VTOL_01", "gatling_20mm_VTOL_01", "autocannon_40mm_VTOL_01", "gatling_20mm_VTOL_01"];
	private _start = time;
	private _stop = _start + 3;	
	waitUntil { ((_veh aimedAtTarget [_target]) > 0) || (time > _stop)};

	if (time > _stop) then {
		systemChat "skipping Target";
		continue
	};	

	systemChat format["Shooting %1 with %2", _target, _gun];

	switch (_gun) do {
		case "gatling_20mm_VTOL_01": {
			for "_i" from 1 to 50 do {
				_veh fireAtTarget [_target, _gun];
				sleep 0.01;
			};
		};
		case "autocannon_40mm_VTOL_01": {
			for "_i" from 1 to 5 do {
				_veh fireAtTarget [_target, _gun];
				sleep 0.6;
			};
		};
		default {
			_veh fireAtTarget [_target, _gun];
		};
	};

	sleep (random[2.5, 3.5, 5]);
};

// [[B Alpha 1-1:1,"driver",-1,[],false,B Alpha 1-1:1,"$STR_POSITION_DRIVER"],[B Alpha 1-1:2,"turret",-1,[0],false,B Alpha 1-1:2,"$STR_A3_COPILOT"],[B Alpha 1-1:3,"gunner",-1,[1],false,B Alpha 1-1:3,"$STR_A3_LEFT_GUNNER"],[B Alpha 1-1:4,"turret",-1,[2],false,B Alpha 1-1:4,"$STR_A3_RIGHT_GUNNER"]]