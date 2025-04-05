params ["_position"];

private _nearest = objNull;
private _nearestDist = worldSize;

{
	if (isPlayer _x) then {
		private _currentDist = _position distance2D _x;
		if (_currentDist < _nearestDist) then {
			_nearest = _x;
			_nearestDist = _currentDist;
		};
	};
} forEach ([switchableUnits, playableUnits] select isMultiplayer);

// systemChat format["%1 | %2m", name _nearest, _nearestDist];

_nearest
