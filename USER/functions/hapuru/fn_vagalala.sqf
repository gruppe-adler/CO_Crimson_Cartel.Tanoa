if (!isServer || !canSuspend) exitWith { _this remoteExec [_fnc_scriptName, 2]; };

waitUntil { ((date select 3) == 6) && ((date select 4) >= 40) };
if (!alive grad_cc_tekoriHapuru) exitWith {};

[] spawn GRAD_CC_fnc_vagalalaHandleSec;

private _hapuruGrp = group grad_cc_tekoriHapuru;
[_hapuruGrp] call CBA_fnc_clearWaypoints;
private _wp = [_hapuruGrp, grad_cc_hapuruKa60, -1, "GETIN", "SAFE", "YELLOW"] call CBA_fnc_addWaypoint;
_wp waypointAttachVehicle grad_cc_hapuruKa60;

waitUntil { (count ((units _hapuruGrp) select { (vehicle _x) isEqualTo grad_cc_hapuruKa60 })) == (count (units _hapuruGrp)) || (!alive grad_cc_tekoriHapuru) };
if (!alive grad_cc_tekoriHapuru) exitWith {};

grad_cc_hapuruKa60 engineOn true;
sleep 25;

[] call grad_cc_fnc_hapuruVagalala;
[] call grad_cc_fnc_factoryHandleSecRetreat;

sleep 5;

waitUntil { (isTouchingGround grad_cc_hapuruKa60) || (!alive grad_cc_tekoriHapuru) };
if (!alive grad_cc_tekoriHapuru) exitWith {};

grad_cc_hapuruKa60 engineOn false;
sleep 5;
_hapuruGrp leaveVehicle grad_cc_hapuruKa60;
moveOut grad_cc_tekoriHapuru;

_wp = [_hapuruGrp, [11098.9,9798.23,0], -1, "GETOUT", "SAFE"] call CBA_fnc_addWaypoint;
_wp = [_hapuruGrp, [11055.5,9868.47,0], -1, "MOVE", "SAFE"] call CBA_fnc_addWaypoint;

[] call grad_cc_fnc_temple;
