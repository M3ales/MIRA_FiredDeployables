#include "config_macros.hpp"
class CfgPatches {
	class ADDON
	{		
        name = ADDON_NAME;
		author = "M3ales";
		url = "https://github.com/M3ales/mira_fired_deployable";
		version[] = { 1, 0, 0, 0 }; //Negative last digit indicates alpha/beta
		requiredAddons[] = {"ace_interact_menu", "cba_settings"};
		units[] = {};
		weapons[] = {};
	};
};

class Extended_PreInit_EventHandlers {
    class ADDON {
        init = QUOTE(call COMPILE_FILE(XEH_preInit));
    };
};

class Extended_PostInit_EventHandlers {
    class ADDON {
        init = QUOTE(call COMPILE_FILE(XEH_postInit));
    };
};