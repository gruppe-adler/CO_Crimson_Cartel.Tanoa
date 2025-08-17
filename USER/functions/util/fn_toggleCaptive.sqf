params ["_object"];

if (isNull _object) exitWith {};

if (_object isKindOf "CAManBase") exitWith {
	private _currentState = captive _object;
	[_object, not _currentState] remoteExec ["setCaptive", _object];
};

private _veh = vehicle _object;
{
	private _currentState = captive _x;
	[_x, not _currentState] remoteExec ["setCaptive", _x];
} forEach (units _veh);
