# Fired Deployables

Primarily used for grenades, but could be adapted to function for weapons with custom logic since grenades are functionally weapons.

## Configuration Properties

### Enable Fired Deployable

Define `mira_fired_deployable_enabled=1` on the grenade (`CfgAmmo`) to allow it to execute fired deployable logic when thrown.

Where to define: `CfgAmmo -> Grenade Ammo`.

### Deployed Object

The object that will be deployed after the grenade comes to a stop (velocity near 0).
`mira_fired_deployable_object="text"`

Where to define: `CfgAmmo -> Grenade Ammo`.

> `text` should be the class name of an entry in `CfgVehicles`.

### Time to Live

You can specify if the deployed object will delete itself after a specific number of seconds using time to live.

Where to define: `CfgAmmo -> Grenade Ammo`.

`mira_fired_deployable_timeToLive=number`

> `number` is the number of seconds to wait after the object has been deployed, to delete it.

> Setting `number` < 0 will disable time to live, and the object will not be deleted by this module. Setting it to 0 will **delete it immediately**.

Default: `-1`

### Ignore Damage (Invincible)

Runs `allowDamage false` on the deployable when it is thrown (part of instantiation).

`mira_fired_deployable_ignoreDamage=1`

### Sounds

#### Loop Sound

This should point to the CfgSounds config entry you would like to play on loop while the object is alive.

`mira_fired_deployable_loopSound="text"`

> `text` should be the classname of the sound you want to play in CfgSounds.

#### Loop Duration

Defines how long before the loop sound is fired again, this should match the duration of the sound.

`mira_fired_deployable_loopDuration=10`

#### End Sound

This should point to the CfgSounds config entry you would like to play when time to live is near complete. (It'll trigger and overwrite loop sound when `timeToLive - soundDuration` < 0)

`mira_fired_deployable_endSound="text"`

> `text` should be the classname of the sound you want to play in CfgSounds.

#### End Duration

The duration of the end sound. It will determine what time the sound is played at by: `timeToLive - endDuration`.

`mira_fired_deployable_endDuration=5`

#### Sound Distance

The distance at which the sound can be heard (in metres).

`mira_fired_deployable_soundDistance=100`
