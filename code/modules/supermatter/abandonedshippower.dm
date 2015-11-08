
#define NITROGEN_RETARDATION_FACTOR 0.20	//Higher == N2 slows reaction more
#define THERMAL_RELEASE_MODIFIER 10000		//Higher == more heat released during reaction
#define PHORON_RELEASE_MODIFIER 1500		//Higher == less phoron released by reaction
#define OXYGEN_RELEASE_MODIFIER 15000		//Higher == less oxygen released at high temperature/power
#define REACTION_POWER_MODIFIER 1.1			//Higher == more overall power

/*
	How to tweak the SM

	POWER_FACTOR		directly controls how much power the SM puts out at a given level of excitation (power var). Making this lower means you have to work the SM harder to get the same amount of power.
	CRITICAL_TEMPERATURE	The temperature at which the SM starts taking damage.

	CHARGING_FACTOR		Controls how much emitter shots excite the SM.
	DAMAGE_RATE_LIMIT	Controls the maximum rate at which the SM will take damage due to high temperatures.
*/

//Controls how much power is produced by each collector in range - this is the main parameter for tweaking SM balance, as it basically controls how the power variable relates to the rest of the game.
#define POWER_FACTOR 2.0
#define DECAY_FACTOR 2000			//Affects how fast the supermatter power decays
#define CRITICAL_TEMPERATURE 7000	//K
#define CHARGING_FACTOR 0.02
#define DAMAGE_RATE_LIMIT 6			//damage rate cap at power = 300, scales linearly with power


//These would be what you would get at point blank, decreases with distance
#define DETONATION_RADS 500
#define DETONATION_HALLUCINATION 750


#define WARNING_DELAY 20			//seconds between warnings.

/obj/machinery/power/supermatter/asm
	name = "Supermatter"
	desc = "A strangely translucent and iridescent crystal. \red You get headaches just from looking at it."
	icon = 'icons/obj/engine.dmi'
	icon_state = "darkmatter"
	density = 1
	anchored = 0
	light_range = 4

	gasefficency = 0.50

	base_icon_state = "darkmatter"

	damage = 0
	damage_archived = 0
	safe_alert = "Crystaline hyperstructure returning to safe operating levels."
	safe_warned = 0
	public_alert = 0 //Stick to Engineering frequency except for big warnings when integrity bad
	warning_point = 200
	warning_alert = "Danger! Crystal hyperstructure instability!"
	emergency_point = 900
	emergency_alert = "CRYSTAL DELAMINATION IMMINENT."
	explosion_point = 1400

	light_color = "#8A8A00"
	warning_color = "#B8B800"
	emergency_color = "#D9D900"

	grav_pulling = 0
	pull_radius = 14
	// Time in ticks between delamination ('exploding') and exploding (as in the actual boom)
	pull_time = 100
	explosion_power = 12

	emergency_issued = 0

	// Time in 1/10th of seconds since the last sent warning
	lastwarning = 0

	// This stops spawning redundand explosions. Also incidentally makes supermatter unexplodable if set to 1.
	exploded = 0

	power = 0
	oxygen = 0

	//Temporary values so that we can optimize this
	//How much the bullets damage should be multiplied by when it is added to the internal variables
	config_bullet_energy = 2
	//How much of the power is left after processing is finished?
//        var/config_power_reduction_per_tick = 0.5
	//How much hallucination should it produce per unit of power?
	config_hallucination_power = 0.1



	debug = 0