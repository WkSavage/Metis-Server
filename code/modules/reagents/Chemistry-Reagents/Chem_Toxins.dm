
// This Is Where Toxins Go!!! //

//DEFINES///////////
#define TOXREM 0.05
#define FASTTOX 0.75
#define TOXMOD 0.025
////////////////////

/datum/reagent/toxin
	name = "Toxin"
	id = "toxin"
	description = "A toxic chemical."
	reagent_state = LIQUID
	color = "#CF3600"
	metabolism =  TOXREM // 0.025 by default. They last a while and slowly kill you.
	var/strength = 2.5 // How much damage it deals per unit

/datum/reagent/toxin/affect_blood(var/mob/living/carbon/M, var/alien, var/removed)
	if(strength)
		M.adjustToxLoss(strength * TOXMOD)

/////////////////////////////////////////////////////////////////////////////////////

/datum/reagent/toxin/phoron
	name = "Phoron"
	id = "phoron"
	description = "Phoron in its liquid form."
	reagent_state = LIQUID
	color = "#9D14DB"
	strength = 30

/datum/reagent/toxin/phoron/touch_mob(var/mob/living/L, var/amount)
	if(istype(L))
		L.adjust_fire_stacks(amount / 5)

/datum/reagent/toxin/phoron/affect_touch(var/mob/living/carbon/M, var/alien, var/removed)
	M.take_organ_damage(0, removed * 0.1) //being splashed directly with phoron causes minor chemical burns

/datum/reagent/toxin/phoron/touch_turf(var/turf/simulated/T)
	if(!istype(T))
		return
	T.assume_gas("volatile_fuel", volume, T20C)
	remove_self(volume)

/datum/reagent/toxin/cyanide //Fast and Lethal
	name = "Cyanide"
	id = "cyanide"
	description = "A highly toxic chemical."
	reagent_state = LIQUID
	color = "#CF3600"
	strength = 45
	metabolism = FASTTOX

/datum/reagent/toxin/cyanide/affect_blood(var/mob/living/carbon/M, var/alien, var/removed)
	..()
	H.adjustOxyLoss(2.5)
	if(prob(60))
		M << "<span class = 'danger'>You cannot breathe!</span>"
		M.losebreath += 1
	if(prob(40))
		M << "<span class = 'danger'>You feel horrendously weak!</span>"
		M.AdjustStunned(2)
	if(prob(20))
		H.adjustOxyLoss(2.5)

