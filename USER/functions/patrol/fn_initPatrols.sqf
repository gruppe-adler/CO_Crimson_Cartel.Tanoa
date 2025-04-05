if (!isServer || !canSuspend) exitWith { _this remoteExec [_fnc_scriptName, 2]; };

params ["_boats"];

private _routeMarkerPositions = [];
private _startMarkerNumber = 1;
private _finishMarkerNumber = 178;
for "_i" from _startMarkerNumber to _finishMarkerNumber do  {  
	private _marker = call(compile format ["Grad_boatPatrol_pos_%1",_i]);
	private _markerPosASL = getPosASL _marker;
	_markerPosASL set [2, 0];
	_marker setPosASL _markerPosASL;
	_routeMarkerPositions pushBack _markerPosASL; 
};

{
	private _boat = _x;
	private _initialPos = [_routeMarkerPositions, getPosASL _boat] call BIS_fnc_nearestPosition;
	private _initalWP = [_boat, _initialPos, -1, "MOVE", "AWARE", "WHITE"] call CBA_fnc_addWaypoint;
	private _index = _routeMarkerPositions find _initialPos;
	for "_i" from _index to (_index + (count _routeMarkerPositions) - 1) do {
		[_boat, _routeMarkerPositions select (_i mod (count _routeMarkerPositions)), 0, "MOVE", "AWARE", "WHITE", "LIMITED"] call CBA_fnc_addWaypoint;
	};
	[_boat, _routeMarkerPositions select _index, -1, "CYCLE", "AWARE", "WHITE", "LIMITED"] call CBA_fnc_addWaypoint;
	_boat forceSpeed 11;
	[_boat] call GRAD_CC_fnc_scanCoast;
	[_boat] remoteExec ["GRAD_CC_fnc_initSearchLightLocal", [0, -2] select isMultiplayer, _boat];
} forEach _boats;
