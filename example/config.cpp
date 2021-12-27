class CfgPatches {
	class mira_fired_deployable_example
	{		
        name = "Fired Deployable Example";
		author = "M3ales";
		url = "https://github.com/M3ales/mira_fired_deployable";
		version[] = { 1, 0, 0, 0 }; //Negative last digit indicates alpha/beta
		requiredAddons[] = {"mira_fired_deployable"};
		units[] = {
            "mira_example_temp_quadbike"
        };
		weapons[] = {
            "mira_example_grenade"
        };
	};
};

// Just a headsup this doesn't actually work, but it does pretty much show where stuff needs to be defined for it to work
// I'm pretty lazy to go figure out the class hierarchy stuff again for vanilla. Config scares me.

// Actual Grenade
class CfgAmmo {
    class mira_example_grenade
    {
        // Prevent it exploding, can maybe do fuse time thats high too
        hit=0;
        indirectHit=0;
        indirectHitRange=0;

        mira_fired_deployable_enabled = 1;
        mira_fired_deployable_object = "mira_example_temp_quadbike";
        mira_fired_deployable_timeToLive = 60;

        simulation="shotShell";
    };
};

// Thing that gets deployed (to use the sound loop stuff)
class CfgVehicles
{
    class mira_example_temp_quadbike
    {
        //...
        mira_fired_deployable_loopSound = "mira_example_quad_loop";
        mira_fired_deployable_loopDuration = 2;
        mira_fired_deployable_endSound = "mira_example_quad_end";
        mira_fired_deployable_endDuration = 1;
        mira_fired_deployable_soundDistance = 300;
        mira_fired_deployable_ignoreDamage = 1;
    };
};

class CfgSounds
{
	class mira_example_quad_loop
	{
		// how the sound is referred to in the editor (e.g. trigger effects)
		name = "mira_example_quad_loop";

		// filename, volume, pitch, distance (optional)
		sound[] = { "@a3\Ui_F_Curator\Data\Sound\CfgSound\visionMode", 4, 1, 300 };

		// subtitle delay in seconds, subtitle text
		titles[] = { 1, "*LOOP SOUND*" };
	};
	class mira_example_quad_end
	{
		// how the sound is referred to in the editor (e.g. trigger effects)
        name="mira_example_quad_end"

		// filename, volume, pitch, distance (optional)
		sound[] = { "@a3\Ui_F_Curator\Data\Sound\CfgSound\visionMode", 4, 1, 300 };

		// subtitle delay in seconds, subtitle text
		titles[] = { 1, "*END SOUND*" };
	};
};