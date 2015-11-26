
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
	metabolism =  TOXREM // 0.05 by default. They last a while and slowly kill you.
	var/strength = 2.5 // How much damage it deals per unit

/datum/reagent/toxin/affect_blood(var/mob/living/carbon/M, var/alien, var/removed)
	if(strength)
		M.adjustToxLoss(strength * TOXMOD)

// Basic - Toxins //

/datum/reagent/toxin/plasticide
	name = "Plasticide"
	id = "plasticide"
	description = "Liquid plastic, do not eat."
	reagent_state = LIQUID
	color = "#CF3600"
	strength = 5

/datum/reagent/toxin/amatoxin
	name = "Amatoxin"
	id = "amatoxin"
	description = "A powerful poison derived from certain species of mushroom."
	reagent_state = LIQUID
	color = "#792300"
	strength = 6

/datum/reagent/toxin/carpotoxin
	name = "Carpotoxin"
	id = "carpotoxin"
	description = "A deadly neurotoxin produced by the dreaded space carp."
	reagent_state = LIQUID
	color = "#003333"
	strength = 10

/datum/reagent/toxin/spidervenom
	name = "Spider Venom"
	id = "spidervenom"
	description = "A deadly neurotoxin produced by the dreaded space carp."
	reagent_state = LIQUID
	color = "#003333"
	strength = 10

/datum/reagent/lipolicide
	name = "Lipolicide"
	id = "lipolicide"
	description = "A compound found in many seedy dollar stores in the form of a weight-loss tonic."
	reagent_state = SOLID
	color = "#D1DED1"

/datum/reagent/lipolicide/affect_blood(var/mob/living/M as mob)
	if(!M) M = holder.my_atom
	if(!holder.has_reagent("nutriment"))
		M.adjustToxLoss(1)
	M.nutrition -= 10 * REM
	M.overeatduration = 0
	if(M.nutrition < 0)//Prevent from going into negatives.
		M.nutrition = 0
	..()
	return

/datum/reagent/formaldehyde
	name = "Formaldehyde"
	id = "formaldehyde"
	description = "Formaldehyde is a common industrial chemical and is used to preserve corpses and medical samples. It is highly toxic and irritating."
	reagent_state = LIQUID
	color = "#DED6D0"

/datum/reagent/itching_powder
	name = "Itching Powder"
	id = "itching_powder"
	description = "An abrasive powder beloved by cruel pranksters."
	reagent_state = LIQUID
	color = "#B0B0B0"
	metabolism = 0.3

/datum/reagent/itching_powder/on_mob_life(var/mob/living/M as mob)
	if(!M) M = holder.my_atom
	if(prob(rand(5,50)))
		M << "You scratch at your head."
		M.adjustBruteLoss(0.2*REM)
	if(prob(rand(5,50)))
		M << "You scratch at your leg."
		M.adjustBruteLoss(0.2*REM)
	if(prob(rand(5,50)))
		M << "You scratch at your arm."
		M.adjustBruteLoss(0.2*REM)
	..()
	return

// Phoron //

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

// Advanced - Toxins //

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
	M.adjustOxyLoss(2.5)
	if(prob(60))
		M << "<span class = 'danger'>You cannot breathe!</span>"
		M.losebreath += 1
	if(prob(40))
		M << "<span class = 'danger'>You feel horrendously weak!</span>"
		M.AdjustStunned(2)
	if(prob(20))
		M.adjustOxyLoss(2.5)

/datum/reagent/toxin/potassium_chloride
	name = "Potassium Chloride"
	id = "potassium_chloride"
	description = "A delicious salt that stops the heart when injected into cardiac muscle."
	reagent_state = SOLID
	color = "#FFFFFF"
	strength = 0
	overdose = REAGENTS_OVERDOSE

/datum/reagent/toxin/potassium_chloride/overdose(var/mob/living/carbon/M, var/alien)
	..()
	if(ishuman(M))
		var/mob/living/carbon/human/H = M
		if(H.stat != 1)
			if(H.losebreath >= 10)
				H.losebreath = max(10, H.losebreath - 10)
			H.adjustOxyLoss(2)
			H.Weaken(10)

/datum/reagent/toxin/potassium_chlorophoride
	name = "Potassium Chlorophoride"
	id = "potassium_chlorophoride"
	description = "A specific chemical based on Potassium Chloride to stop the heart for surgery. Not safe to eat!"
	reagent_state = SOLID
	color = "#FFFFFF"
	strength = 10
	overdose = 20

/datum/reagent/toxin/potassium_chlorophoride/affect_blood(var/mob/living/carbon/M, var/alien, var/removed)
	..()
	if(ishuman(M))
		var/mob/living/carbon/human/H = M
		if(H.stat != 1)
			if(H.losebreath >= 10)
				H.losebreath = max(10, M.losebreath-10)
			H.adjustOxyLoss(2)
			H.Weaken(10)

/datum/reagent/neurotoxin2
	name = "Neurotoxin"
	id = "neurotoxin2"
	description = "A dangerous toxin that attacks the nervous system."
	reagent_state = LIQUID
	color = "#60A584"
	metabolism = 1

/datum/reagent/neurotoxin2/on_mob_life(var/mob/living/M as mob)
	if(dose <= 4)
		M.reagents.add_reagent("neurotoxin2", 1.0)
	if(dose >= 5)
		if(prob(5))
			M.emote("drool")
		if(M.getBrainLoss() < 60)
			M.adjustBrainLoss(1*REM)
		M.adjustToxLoss(1*REM)
	if(dose >= 9)
		M.drowsyness = max(M.drowsyness, 10)
	if(dose >= 13)
		M.Paralyse(8)
	switch(dose)
		if(5 to 45)
			M.confused = max(M.confused, 15)
	..()

/datum/reagent/lexorin
	name = "Lexorin"
	id = "lexorin"
	description = "Lexorin temporarily stops respiration. Causes tissue damage."
	reagent_state = LIQUID
	color = "#C8A5DC"
	overdose = REAGENTS_OVERDOSE

/datum/reagent/lexorin/affect_blood(var/mob/living/carbon/M, var/alien, var/removed)
	if(alien == IS_DIONA)
		return
	M.take_organ_damage(3 * removed, 0)
	if(M.losebreath < 15)
		M.losebreath++

// Unstable - Mutagen //

/datum/reagent/mutagen
	name = "Unstable mutagen"
	id = "mutagen"
	description = "Might cause unpredictable mutations. Keep away from children."
	reagent_state = LIQUID
	color = "#13BC5E"

/datum/reagent/mutagen/affect_touch(var/mob/living/carbon/M, var/alien, var/removed)
	if(prob(33))
		affect_blood(M, alien, removed)

/datum/reagent/mutagen/affect_ingest(var/mob/living/carbon/M, var/alien, var/removed)
	if(prob(67))
		affect_blood(M, alien, removed)

/datum/reagent/mutagen/affect_blood(var/mob/living/carbon/M, var/alien, var/removed)
	if(M.dna)
		if(prob(removed * 0.1)) // Approx. one mutation per 10 injected/20 ingested/30 touching units
			randmuti(M)
			if(prob(98))
				randmutb(M)
			else
				randmutg(M)
			domutcheck(M, null)
			M.UpdateAppearance()
	M.apply_effect(10 * removed, IRRADIATE, 0)

// Plant - Toxins //

/datum/reagent/toxin/fertilizer //Reagents used for plant fertilizers.
	name = "fertilizer"
	id = "fertilizer"
	description = "A chemical mix good for growing plants with."
	reagent_state = LIQUID
	strength = 0.5 // It's not THAT poisonous.
	color = "#664330"

/datum/reagent/toxin/fertilizer/eznutrient
	name = "EZ Nutrient"
	id = "eznutrient"

/datum/reagent/toxin/fertilizer/left4zed
	name = "Left-4-Zed"
	id = "left4zed"

/datum/reagent/toxin/fertilizer/robustharvest
	name = "Robust Harvest"
	id = "robustharvest"

/datum/reagent/toxin/plantbgone
	name = "Plant-B-Gone"
	id = "plantbgone"
	description = "A harmful toxic mixture to kill plantlife. Do not ingest!"
	reagent_state = LIQUID
	color = "#49002E"
	strength = 5

/datum/reagent/toxin/plantbgone/touch_turf(var/turf/T)
	if(istype(T, /turf/simulated/wall))
		var/turf/simulated/wall/W = T
		if(locate(/obj/effect/overlay/wallrot) in W)
			for(var/obj/effect/overlay/wallrot/E in W)
				qdel(E)
			W.visible_message("<span class='notice'>The fungi are completely dissolved by the solution!")

/datum/reagent/toxin/plantbgone/touch_obj(var/obj/O, var/volume)
	if(istype(O, /obj/effect/alien/weeds/))
		var/obj/effect/alien/weeds/alien_weeds = O
		alien_weeds.health -= rand(15, 35)
		alien_weeds.healthcheck()
	else if(istype(O, /obj/effect/plant))
		qdel(O)

/datum/reagent/toxin/plantbgone/affect_blood(var/mob/living/carbon/M, var/alien, var/removed)
	..()
	if(alien == IS_DIONA)
		M.adjustToxLoss(50 * removed)

/datum/reagent/toxin/plantbgone/affect_touch(var/mob/living/carbon/M, var/alien, var/removed)
	..()
	if(alien == IS_DIONA)
		M.adjustToxLoss(50 * removed)

// Sleep - Toxins //

/datum/reagent/soporific
	name = "Soporific"
	id = "soporific"
	description = "An effective hypnotic used to treat insomnia."
	reagent_state = LIQUID
	color = "#009CA8"
	metabolism = TOXREM
	overdose = 30

/datum/reagent/soporific/affect_blood(var/mob/living/carbon/M, var/alien, var/removed)
	switch(dose)
		if(0 to 4)
			M.eye_blurry = max(M.eye_blurry, 2)
			if(prob(10))
				M.emote("yawn")
		if(5 to 8)
			M.eye_blurry = max(M.eye_blurry, 5)
			M.drowsyness = max(M.drowsyness, 10)
			if(prob(33))
				M.Weaken(2)
		if(8 to 13)
			M.drowsyness = max(M.drowsyness, 20)
			M.Weaken(2)
			if(prob(33))
				M.sleeping = max(M.sleeping, 5)
		if(13 to INFINITY)
			M.drowsyness = max(M.drowsyness, 20)
			M.sleeping = max(M.sleeping, 10)
			M.Paralyse(2)

/datum/reagent/soporific/overdose(var/mob/living/M as mob)
	M.Paralyse(15)
	M.adjustToxLoss(1*TOXREM)
	M.drowsyness = max(M.drowsyness, 30)

/datum/reagent/chloralhydrate
	name = "Chloral Hydrate"
	id = "chloralhydrate"
	description = "A powerful sedative."
	reagent_state = SOLID
	color = "#000067"
	metabolism = 0.2
	overdose = 15

/datum/reagent/chloralhydrate/affect_blood(var/mob/living/carbon/M, var/alien, var/removed)
	switch(dose)
		if(0 to 3)
			M.eye_blurry = max(M.eye_blurry, 10)
			M.drowsyness = max(M.drowsyness, 10)
			if(prob(10))
				M.emote("yawn")
		if(4 to 6)
			M.eye_blurry = max(M.eye_blurry, 10)
			M.drowsyness = max(M.drowsyness, 10)
			M.sleeping = max(M.sleeping, 5)
			M.Weaken(2.5)
		if(7 to 15)
			M.drowsyness = max(M.drowsyness, 20)
			M.sleeping = max(M.sleeping, 15)
			M.Weaken(5)
		if(16 to INFINITY)
			M.sleeping = max(M.sleeping, 30)
			M.Paralyse(10)
			M.adjustToxLoss(2*TOXREM)

/datum/reagent/chloralhydrate/overdose(var/mob/living/M as mob)
	M.drowsyness = max(M.drowsyness, 40)
	M.adjustOxyLoss(1*TOXREM)

/datum/reagent/chloralhydrate/beer2 //disguised as normal beer for use by emagged brobots
	name = "Beer"
	id = "beer2"
	description = "An alcoholic beverage made from malted grains, hops, yeast, and water. The fermentation appears to be incomplete." //If the players manage to analyze this, they deserve to know something is wrong.
	reagent_state = LIQUID
	color = "#664300"

	glass_icon_state = "beerglass"
	glass_name = "glass of beer"
	glass_desc = "A freezing pint of beer"
	glass_center_of_mass = list("x"=16, "y"=8)


/datum/reagent/syndisleep
	name = "Syndicate Sleeptoxin"
	id = "syndisleep"
	description = "A powerful sedative."
	reagent_state = SOLID
	color = "#000067"
	metabolism = 0.2
	overdose = 10

/datum/reagent/syndisleep/affect_blood(var/mob/living/carbon/M, var/alien, var/removed)
	switch(dose)
		if(0 to 5)
			M.sleeping = max(M.sleeping, 15)
			M.drowsyness = max(M.drowsyness, 20)
		if(6 to 10)
			M.drowsyness = max(M.drowsyness, 25)
			M.sleeping = max(M.sleeping, 25)
			M.Paralyse(10)
		if(11 to INFINITY)
			M.sleeping = max(M.sleeping, 30)
			M.Paralyse(25)
			M.adjustToxLoss(2*TOXREM)

/datum/reagent/syndisleep/overdose(var/mob/living/M as mob)
	M.drowsyness = max(M.drowsyness, 40)
	M.adjustOxyLoss(1*TOXREM)
	M.silent = max(M.silent, 5)

/datum/reagent/toxin/zombiepowder
	name = "Zombie Powder"
	id = "zombiepowder"
	description = "A strong neurotoxin that puts the subject into a death-like state."
	reagent_state = SOLID
	color = "#669900"
	metabolism = REM
	strength = 3

/datum/reagent/toxin/zombiepowder/affect_blood(var/mob/living/carbon/M, var/alien, var/removed)
	..()
	if(alien == IS_DIONA)
		return
	M.status_flags |= FAKEDEATH
	M.adjustOxyLoss(3 * removed)
	M.Weaken(10)
	M.silent = max(M.silent, 10)
	M.tod = worldtime2text()

/datum/reagent/toxin/zombiepowder/Destroy()
	if(holder && holder.my_atom && ismob(holder.my_atom))
		var/mob/M = holder.my_atom
		M.status_flags &= ~FAKEDEATH
	..()

// Poly - Acid //

/datum/reagent/acid/polyacid
	name = "Polytrinic acid"
	id = "pacid"
	description = "Polytrinic acid is a an extremely corrosive chemical substance."
	reagent_state = LIQUID
	color = "#8E18A9"
	power = 10
	meltdose = 4

// Special - Transform //

/datum/reagent/nanites
	name = "Nanomachines"
	id = "nanites"
	description = "Microscopic construction robots."
	reagent_state = LIQUID
	color = "#535E66"

/datum/reagent/nanites/affect_touch(var/mob/living/carbon/M, var/alien, var/removed)
	if(prob(10))
		M.contract_disease(new /datum/disease/robotic_transformation(0), 1) //What

/datum/reagent/nanites/affect_blood(var/mob/living/carbon/M, var/alien, var/removed)
	M.contract_disease(new /datum/disease/robotic_transformation(0), 1)

/datum/reagent/xenomicrobes
	name = "Xenomicrobes"
	id = "xenomicrobes"
	description = "Microbes with an entirely alien cellular structure."
	reagent_state = LIQUID
	color = "#535E66"

/datum/reagent/xenomicrobes/affect_touch(var/mob/living/carbon/M, var/alien, var/removed)
	if(prob(10))
		M.contract_disease(new /datum/disease/xeno_transformation(0), 1)

/datum/reagent/xenomicrobes/affect_blood(var/mob/living/carbon/M, var/alien, var/removed)
	M.contract_disease(new /datum/disease/xeno_transformation(0), 1)

// Slime - Toxin //

/datum/reagent/slimetoxin
	name = "Mutation Toxin"
	id = "mutationtoxin"
	description = "A corruptive toxin produced by slimes."
	reagent_state = LIQUID
	color = "#13BC5E"

/datum/reagent/slimetoxin/affect_blood(var/mob/living/carbon/M, var/alien, var/removed)
	if(ishuman(M))
		var/mob/living/carbon/human/H = M
		if(H.species.name != "Slime")
			M << "<span class='danger'>Your flesh rapidly mutates!</span>"
			H.set_species("Slime")

/datum/reagent/aslimetoxin
	name = "Advanced Mutation Toxin"
	id = "amutationtoxin"
	description = "An advanced corruptive toxin produced by slimes."
	reagent_state = LIQUID
	color = "#13BC5E"

/datum/reagent/aslimetoxin/affect_blood(var/mob/living/carbon/M, var/alien, var/removed) // TODO: check if there's similar code anywhere else
	if(M.monkeyizing)
		return
	M << "<span class='danger'>Your flesh rapidly mutates!</span>"
	M.monkeyizing = 1
	M.canmove = 0
	M.icon = null
	M.overlays.Cut()
	M.invisibility = 101
	for(var/obj/item/W in M)
		if(istype(W, /obj/item/weapon/implant)) //TODO: Carn. give implants a dropped() or something
			qdel(W)
			continue
		W.layer = initial(W.layer)
		W.loc = M.loc
		W.dropped(M)
	var/mob/living/carbon/slime/new_mob = new /mob/living/carbon/slime(M.loc)
	new_mob.a_intent = "hurt"
	new_mob.universal_speak = 1
	if(M.mind)
		M.mind.transfer_to(new_mob)
	else
		new_mob.key = M.key
	qdel(M)

/datum/reagent/slimejelly
	name = "Slime Jelly"
	id = "slimejelly"
	description = "A gooey semi-liquid produced from one of the deadliest lifeforms in existence. SO REAL."
	reagent_state = LIQUID
	color = "#801E28"

/datum/reagent/slimejelly/affect_blood(var/mob/living/carbon/M, var/alien, var/removed)
	if(alien == IS_DIONA)
		return
	if(prob(10))
		M << "<span class='danger'>Your insides are burning!</span>"
		M.adjustToxLoss(rand(100, 300) * removed)
	else if(prob(40))
		M.heal_organ_damage(25 * removed, 0)
