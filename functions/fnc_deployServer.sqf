#include "function_macros.hpp"

params[["_ammo", ""], ["_position", [0,0,0]], ["_direction", 0]];

LOGF_2("Deploying something for %2 at %3", _ammo, _position);

private _config = configFile >> "CfgAmmo" >> _ammo; 
if!(isClass _config) exitWith { 
	LOGF_1("Unable to find class '%1' in CfgAmmo", _ammo); 
}; 

private _isValid = getNumber (_config >> QGVAR(enabled)) == 1;
private _deployable = getText (_config >> QGVAR(object));
private _timeToLive = getNumber (_config >> QGVAR(timeToLive));

if(!_isValid) exitWith {
	private _configName = QGVAR(enabled);
	LOGF_2("Requested throw type '%1' is does not contain %2=1", _ammo, _configName);
};

if(isNil "_deployable" || _deployable isEqualTo "") exitWith {
	private _configName = QGVAR(object);
	LOGF_2("Failed to find %1 defined in ammo type %2", _configName, _ammo);
};

_config = configFile >> "CfgVehicles" >> _deployable;

private _setInvincible = 0;
if(isNumber(_config >> QGVAR(ignoreDamage))) then {
	_setInvincible = getNumber (_config >> QGVAR(ignoreDamage));
};

private _hasLoopSound = isText (_config >> QGVAR(loopSound));
private _loopSound = getText (_config >> QGVAR(loopSound));
private _loopDuration = getNumber (_config >> QGVAR(loopDuration));
private _hasEndSound = isText (_config >> QGVAR(endSound));
private _endSound = getText (_config >> QGVAR(endSound));
private _endDuration = getNumber (_config >> QGVAR(endDuration));
private _soundDistance = getNumber (_config >> QGVAR(soundDistance));

private _deployed = createVehicle [_deployable, _position, [], 0, "CAN_COLLIDE"];
_deployed setPosATL _position;
_deployed setDir _direction;

if(_setInvincible == 1) then {
	_deployed allowDamage false;
};

if(_timeToLive > 0) then {
	[
		{
			params["_deployable"];
			deleteVehicle _deployable;
		},
		[_deployed],
		_timeToLive
	] call CBA_fnc_waitAndExecute;

	if(_hasEndSound && _endSound != "") then {
		[
			{
				params["_deployed", "_endSound", "_endDuration", "_distance"];
				[QGVAR(soundEnd), [_deployed, _endSound, _endDuration, _distance]] call CBA_fnc_globalEvent;
			},
			[_deployed, _endSound, _endDuration, _soundDistance],
			(_timeToLive - _endDuration)
		] call CBA_fnc_waitAndExecute;
	};
};

if(!_hasLoopSound || _loopSound == "") exitWith {
	LOGF_2("Decided not to play sound for: Loop Sound: '%1', Loop Sound: '%2'", _loopSound, _hasLoopSound);
};

[QGVAR(soundLoop), [_deployed, _loopSound, _loopDuration, _timeToLive, _soundDistance]] call CBA_fnc_globalEvent;