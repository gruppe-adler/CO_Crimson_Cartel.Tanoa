if (!isServer || !canSuspend) exitWith { _this remoteExec [_fnc_scriptName, 2]; };

private _toExecute = [0, -2] select isDedicated;
{
	diwako_dui_main_toggled_off = true;
	"normal" cutText ["", "BLACK OUT", 5];
	5 fadeSound 0;
} remoteExec ["call", _toExecute];

sleep 6;

["normal", ["<t size='5'>Ca. 5 Stunden später</t>", "BLACK FADED", 10, true, true]] remoteExec ["cutText", _toExecute];

private _pairs = [
  [grad_cc_SDV_1, grad_cc_SDV_port_1],
  [grad_cc_SDV_2, grad_cc_SDV_port_2],
  [grad_cc_SDV_3, grad_cc_SDV_port_3],
  [grad_cc_SDV_4, grad_cc_SDV_port_4]
];

{
  _x params ["_veh", "_port"];

  private _empty = _veh emptyPositions "";
  if (_empty >= 4) then {
    continue
  };
  _veh setPos (getPos _port);
  _veh setDir (getDir _port);
  [_veh, true] remoteExec ["engineOn", _veh];
  [_veh, ["Doors", 0, false]] remoteExec ["animateSource", _veh];
  [_veh, true] remoteExec ["setPilotLight", _veh];
} forEach _pairs;

// private _pairs = [
//   [grad_cc_alphaGrp,   grad_cc_SDV_1],
//   [grad_cc_bravoGrp,   grad_cc_SDV_2],
//   [grad_cc_charlieGrp, grad_cc_SDV_3],
//   [grad_cc_deltaGrp,   grad_cc_SDV_4]
// ];

// // --- helper: count all free seats (driver/commander/gunner/turret/cargo)
// private _fnc_freeSeats = {
//   params ["_veh"];
//   private _n = 0;
//   { _n = _n + (_veh emptyPositions _x) } forEach ["driver","commander","gunner","turret","cargo"];
//   _n
// };

// // Units that couldn't fit in the previous vehicle
// private _spillOver = [];

// {
//   _x params ["_grp","_veh"];
  
//   _veh engineOn true;

//   // Eligible units of the group (alive, on foot; also skipping Zeus players if you like that behavior)
//   private _grpUnits = (units _grp) select {
//     alive _x &&
//     isNull objectParent _x &&
//     ([true, isNull (getAssignedCuratorLogic _x)] select isDedicated)
//   };

//   // 1) Finish loading any spillover from the previous vehicle first
//   private _free = _veh emptyPositions "";
//   if (_free > 0 && {count _spillOver > 0}) then {
//     private _take = _free min (count _spillOver);
//     for "_i" from 0 to (_take - 1) do {
//       private _u = _spillOver deleteAt 0;   // pop from front
//       if (!isNull _u && {alive _u}) then { _u moveInAny _veh };
//     };
//     _free = [_veh] call _fnc_freeSeats;     // recalc after loading spillover
//   };

//   // 2) Try to fit the whole current group; otherwise fill what we can and spill the rest
//   if (_free <= 0) then {
//     _spillOver append _grpUnits;
//   } else {
//     private _gCount = count _grpUnits;
//     if (_gCount <= _free) then {
//     	{
// 			_x moveInAny _veh;
// 			[0, 0] remoteExec ["fadeSound", _x];
// 		} forEach _grpUnits;
//     } else {
//       // partial fit
//       for "_i" from 0 to (_free - 1) do {
//         (_grpUnits select _i) moveInAny _veh;
//       };
//       // remainder goes to the next vehicle
//       _spillOver append (_grpUnits select [_free]);
//     };
//   };

  // _veh animateSource ["Doors", 0, false];
  // [_veh, true] remoteExec ["setPilotLight", _veh];
// } forEach _pairs;

setDate [2035, 2, 9, 5, 35];

sleep 5;

[
	[],
	{
		"normal" cutText ["", "BLACK IN", 5];
		5 fadeSound 1;
		sleep 5;
		[] call ace_volume_fnc_lowerVolume;
		diwako_dui_main_toggled_off = false;
	}
] remoteExec ["spawn", _toExecute];

waitUntil { missionNamespace getVariable ["grad_cc_playIntroMusic", false] };

private _units = [switchableUnits select { side _x isEqualTo west}, playableUnits select { (side _x isEqualTo west) && (isNull (getAssignedCuratorLogic _x)) }] select isDedicated;
private _names = _units apply { name _x };
[_names] remoteExec ["grad_cc_fnc_displayNames", [0, -2] select isDedicated];
