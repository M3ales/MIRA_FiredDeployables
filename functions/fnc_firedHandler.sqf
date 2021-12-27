#include "function_macros.hpp"

params["_unit", "_weapon", "_muzzle", "_mode", "_ammo", "_magazine", "_projectile"];

if(!local _unit) exitWith { LOG("Fired Deployable not local"); };

if (isNull _projectile) then {
	_projectile = nearestObject [_unit, _ammo];
};
private _config = configFile >> "CfgAmmo" >> _ammo;
private _deployable = getNumber (_config >> QGVAR(enabled));
private _direction = direction _unit;

if (_deployable == 1) then {
	[
		{
			params["_projectile"];
			private _speed = vectorMagnitude (velocity _projectile);
			!(isNil "_projectile") && (alive _projectile) && _speed <= 0.1
		},
		{
			params["_projectile", "_ammo", "", "", "_direction"];
			private _position = getPosATL _projectile;
			[QGVAR(deployServer), [_ammo, _position, _direction]] call CBA_fnc_serverEvent;
			deleteVehicle _projectile;
		},
		[_projectile, _ammo, _magazine, _unit, _direction],
		10,
		{ 
			params["", "", "_magazine", "_unit"];
			systemChat "Something went wrong with your order, we apologise for the inconvenience.";
			systemChat "You can complain to your unit's mod people to feel better.";
			[
				{
					params["_unit", "_mag"];
					_unit addItem _mag;
					systemChat "We've provided a complementary replacement of the original item if you had any inventory space.";
				},
				[_unit, _magazine],
				2
			] call CBA_fnc_waitAndExecute;
		}
	] call CBA_fnc_waitUntilAndExecute;
};

