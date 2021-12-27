#ifndef ADDON
	#define ADDON mira_fired_deployable
	#define ADDON_PATH mira_fired_deployable
	#define ADDON_NAME Fired Deployables
	#define FUNC(name) ADDON##_fnc_##name
	#define EFUNC(module,name) module##_fnc_##name
	#define QUOTE(target) #target
	#define CONCAT(a,b) a##b
	#define COMPILE_FILE(name) compileFinal preprocessFileLineNumbers 'ADDON_PATH\##name##.sqf'
	#define GVAR(name) ADDON##_##name
	#define QGVAR(name) QUOTE(GVAR(name))
	#define ARR_2(a,b) a, b
	#define ARR_3(a,b,c) a, b, c
	#define ARR_4(a,b,c,d) a, b, c, d
	#define ARR_5(a,b,c,d,e) a, b, c, d, e
#endif