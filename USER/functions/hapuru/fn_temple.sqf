if (!isServer || !canSuspend) exitWith { _this remoteExec [_fnc_scriptName, 2]; };

waitUntil { ((date select 3) == 6) && ((date select 4) >= 55) };
if (!alive grad_cc_tekoriHapuru) exitWith {};

[] spawn GRAD_CC_fnc_templeHandleSec;

private _hapuruGrp = group grad_cc_tekoriHapuru;
[_hapuruGrp] call CBA_fnc_clearWaypoints;
private _wp = [_hapuruGrp, grad_cc_hapuruKa60, -1, "GETIN", "SAFE", "YELLOW"] call CBA_fnc_addWaypoint;
_wp waypointAttachVehicle grad_cc_hapuruKa60;

waitUntil { (count ((units _hapuruGrp) select { (vehicle _x) isEqualTo grad_cc_hapuruKa60 })) == (count (units _hapuruGrp)) || (!alive grad_cc_tekoriHapuru) };
if (!alive grad_cc_tekoriHapuru) exitWith {};

grad_cc_hapuruKa60 engineOn true;
sleep 25;

[] call grad_cc_fnc_hapuruTemple;

sleep 10;

waitUntil { (isTouchingGround grad_cc_hapuruKa60) || (!alive grad_cc_tekoriHapuru) };
if (!alive grad_cc_tekoriHapuru) exitWith {};

grad_cc_hapuruKa60 engineOn false;
sleep 3;
_hapuruGrp leaveVehicle grad_cc_hapuruKa60;
moveOut grad_cc_tekoriHapuru;

_wp = [_hapuruGrp, [10887.8,8182.63,0], -1, "GETOUT", "SAFE"] call CBA_fnc_addWaypoint;
_wp = [_hapuruGrp, [10869.3,8357.45,0], -1, "MOVE", "SAFE"] call CBA_fnc_addWaypoint;
_wp = [_hapuruGrp, [10880,8387.06,0], -1, "MOVE", "SAFE"] call CBA_fnc_addWaypoint;
_wp = [_hapuruGrp, [10904.4,8414.01,0], -1, "MOVE", "SAFE"] call CBA_fnc_addWaypoint;
_wp = [_hapuruGrp, [10947,8423.4,0], -1, "MOVE", "SAFE"] call CBA_fnc_addWaypoint;
_wp = [_hapuruGrp, [10964.6,8419.6,0], -1, "MOVE", "SAFE"] call CBA_fnc_addWaypoint;
_wp = [_hapuruGrp, [10994.2,8416.11,0], -1, "MOVE", "SAFE"] call CBA_fnc_addWaypoint;
_wp = [_hapuruGrp, [11067.8,8423.5,0], -1, "MOVE", "SAFE"] call CBA_fnc_addWaypoint;
_wp = [_hapuruGrp, [11058.4,8474.19,0], -1, "MOVE", "SAFE"] call CBA_fnc_addWaypoint;
