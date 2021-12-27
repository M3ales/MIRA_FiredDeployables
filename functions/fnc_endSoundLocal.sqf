#include "function_macros.hpp"

params["_object", "_endSound", "_endDuration", "_distance"];

if(!hasInterface) exitWith {
	LOG("No Interface to play sounds from");
};

if(isNil "_object" || !alive _object) exitWith {
	LOG("No target object to play remote sound");
};

private _currentLoopSource = _object getVariable [QGVAR(loopSoundSource), objNull];
if(!(isNil "_currentLoopSource") && !(_currentLoopSource isEqualTo objNull)) then {
	LOG("Current Loop Source Exists, Deleting");
	deleteVehicle _currentLoopSource;
	_object setVariable [QGVAR(loopSoundSource), objNull, false];
};

private _currentSource = "#dynamicsound" createVehicleLocal ASLToAGL getPosWorld _object;
_currentSource attachTo [_object, [0, 0, 0]];

[_currentSource, player] say3D [_endSound, _distance, 1, false];
[
	{
		params["_currentSource"];
		detach _currentSource;
		deleteVehicle _currentSource;
	},
	[_currentSource],
	(_endDuration + 1)
] call CBA_fnc_waitAndExecute;