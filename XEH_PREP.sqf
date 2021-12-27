#define PREP(func_name) [QUOTE(ADDON_PATH\functions\CONCAT(fnc_,func_name).sqf), QUOTE(FUNC(func_name))] call cba_fnc_compileFunction; diag_log format["PREP %1", QUOTE(FUNC(func_name))]
PREP(deployServer);
PREP(endSoundLocal);
PREP(firedHandler);
PREP(loopSoundLocal);