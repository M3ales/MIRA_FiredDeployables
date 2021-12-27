#include "function_macros.hpp"

params["_object", "_loopSound", "_loopDuration", "_totalDuration", "_distance"];

if(!hasInterface) exitWith {
	LOG("No Interface to play sounds from");
};

if(isNil "_object" || !alive _object) exitWith {
	LOG("No target object to play remote sound");
};

private _currentSource = _object getVariable [QGVAR(loopSoundSource), objNull];

if(!(isNil "_currentSource") && !(_currentSource isEqualTo objNull)) exitWith {
	LOG("Source already exists, removing");
	detach _currentSource;
	deleteVehicle _currentSource;
	_object setVariable [QGVAR(loopSoundSource), objNull, false];
	[_object, _loopSound, _loopDuration, _totalDuration, _distance] call FUNC(loopSoundLocal);
};

_currentSource = "#dynamicsound" createVehicleLocal ASLToAGL getPosWorld _object;
_currentSource attachTo [_object, [0, 0, 0]];
_object setVariable [QGVAR(loopSoundSource), _currentSource, false];

private _repeats = ceil (_totalDuration / _loopDuration);
for "_i" from 0 to _repeats step 1 do {
	private _delay = ((_loopDuration * _i) - 0.1) max 0.1; //offset by a bit to ensure loop doesn't have a hitch
	private _last = _repeats == _i;
	LOGF_2("Queuing Up Repeat %1 for delay %2", _i, _delay);
	[
		{
			params["_currentSource", "_loopSound", "_distance", "_last"];
			if(isNil "_currentSource" || !alive _currentSource) exitWith { diag_log "No Source, Exiting." };
			[_currentSource, player] say3D [_loopSound, _distance, 1, false];
			if(_last) then {
				LOG("[Loop Sound Local] Last Loop, Deleting");
				detach _currentSource;
				deleteVehicle _currentSource;
			};
		},
		[_currentSource, _loopSound, _distance, _last],
		_delay
	] call CBA_fnc_waitAndExecute;
};
_currentSource