#include "functions\function_macros.hpp"

LOG("PreInit Begin");

private _version = getArray(configFile >> "CfgPatches" >> QUOTE(ADDON) >> "version");
LOGF_1("Version: %1", _version);

LOG("PREP Begin");
#include "XEH_PREP.sqf"
LOG("PREP Complete");

if(isServer) then {
	[QGVAR(deployServer), {
        _this call FUNC(deployServer);
	}] call CBA_fnc_addEventHandler;
};

if(hasInterface) then {
	["ace_firedPlayer", {
		_this call FUNC(firedHandler);
	}] call CBA_fnc_addEventHandler;

	[QGVAR(soundLoop), {
		_this call FUNC(loopSoundLocal);
	}] call CBA_fnc_addEventHandler;

	[QGVAR(soundEnd), {
		_this call FUNC(endSoundLocal);
	}] call CBA_fnc_addEventHandler;
};

LOG("PreInit Complete");