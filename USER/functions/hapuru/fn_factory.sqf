if (!isServer || !canSuspend) exitWith { _this remoteExec [_fnc_scriptName, 2]; };

[] spawn GRAD_CC_fnc_factoryHandleSec;

// get in car
private _wp = [grad_cc_tekoriHapuru, grad_cc_hapuruConvoy_car_1, -1, "GETIN", "SAFE"] call CBA_fnc_addWaypoint;
_wp waypointAttachVehicle grad_cc_hapuruConvoy_car_1;

grad_cc_hapuruConvoy_car_1 enableSimulation true;

waitUntil { ((vehicle grad_cc_tekoriHapuru) isEqualTo grad_cc_hapuruConvoy_car_1) || (!alive grad_cc_tekoriHapuru) };
if (!alive grad_cc_tekoriHapuru) exitWith {};

private _hapuruGrp = group grad_cc_tekoriHapuru;
(units grad_hapuru_guard_grp_1) joinSilent _hapuruGrp;
_wp = [_hapuruGrp, [5612.54,11031.8,0], -1, "GETOUT", "SAFE", "YELLOW", "LIMITED"] call CBA_fnc_addWaypoint;

waitUntil { ((vehicle grad_cc_tekoriHapuru) isEqualTo grad_cc_tekoriHapuru) || (!alive grad_cc_tekoriHapuru) };
if (!alive grad_cc_tekoriHapuru) exitWith {};

_wp = [_hapuruGrp, grad_cc_hapuruKa60, -1, "GETIN", "SAFE", "YELLOW"] call CBA_fnc_addWaypoint;
_wp waypointAttachVehicle grad_cc_hapuruKa60;

grad_cc_hapuruKa60 enableSimulation true;

waitUntil { ((vehicle grad_cc_tekoriHapuru) isEqualTo grad_cc_hapuruKa60) || (!alive grad_cc_tekoriHapuru) };
if (!alive grad_cc_tekoriHapuru) exitWith {};

grad_cc_hapuruKa60 engineOn true;

sleep 20;

[] call grad_cc_fnc_hapuruFactory;

sleep 10;

waitUntil { (isTouchingGround grad_cc_hapuruKa60)};
sleep 2;

grad_cc_hapuruKa60 engineOn false;
_hapuruGrp leaveVehicle grad_cc_hapuruKa60;

_wp = [_hapuruGrp, [8512.49,10236.8,0], -1, "GETOUT", "SAFE"] call CBA_fnc_addWaypoint;
_wp = [_hapuruGrp, [8384.48,10244.5,0], -1, "MOVE", "SAFE"] call CBA_fnc_addWaypoint;
_wp = [_hapuruGrp, [8382.91,10373.1,0], -1, "MOVE", "SAFE"] call CBA_fnc_addWaypoint;
