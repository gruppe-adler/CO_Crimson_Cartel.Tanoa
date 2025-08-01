if (!isServer || !canSuspend) exitWith { _this remoteExec [_fnc_scriptName, 2]; };

grad_cc_hapuruHeli engineOn true;
[grad_cc_hapuruHeli] call grad_cc_fnc_mansionToGeorgetown;

sleep 5;
waitUntil { isTouchingGround grad_cc_hapuruHeli };
if (!alive grad_cc_tekoriHapuru) exitWith {};
sleep 5;

moveOut grad_cc_tekoriHapuru;
private _grp = group grad_cc_tekoriHapuru;
_grp leaveVehicle grad_cc_hapuruHeli;
unassignVehicle grad_cc_tekoriHapuru;
private _wp = _grp addWaypoint [getPosASL grad_cc_hapuru_pos_1, -1];
_wp setWaypointBehaviour "SAFE";
_wp setWaypointSpeed "LIMITED";

sleep 12;

sleep 15;
[] call GRAD_CC_fnc_factory;

waitUntil { isTouchingGround grad_cc_hapuruHeli };
grad_cc_hapuruHeli engineOn false;

// schedule time
