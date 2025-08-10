params ["_names"];

private _totalTime = 154;
private _timePerName = _totalTime / (count _names);

0 fadeMusic 0;
playMusic "pursuitOfLiberty";
5 fadeMusic 1;

sleep 4;

{
	private _displayX = [safeZoneW + (2 * safeZoneX), safeZoneX] select ((_forEachIndex % 2) == 0);
	_displayX = _displayX * (random[0.7, 1, 1.3]);
	private _displayY = (safeZoneH + (2 * safeZoneY)) * (random[0.7, 1, 1.3]);
	[_x,_displayX, _displayY, 0.35 * _timePerName, 0.3 * _timePerName, 0, 789] spawn grad_cc_fnc_customDynamicText;
	sleep _timePerName;
} forEach _names;

sleep 3;

["Foo", -1, -1, 8, 1] spawn BIS_fnc_dynamicText;
