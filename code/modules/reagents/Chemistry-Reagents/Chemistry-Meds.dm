/* General New Chem Medicine */

//Pain Killers//  T1 | T2 | T3 | T4 | T5

/datum/reagent/ibuprofen //T1
	name = "Ibuprofen"
	id = "ibuprofen"
	description = "A simple, painkiller. Works by recuding inflamation"
	reagent_state = LIQUID
	color = "#CB68FC"
	overdose = 60
	scannable = 1
	metabolism = 0.05
	shock_reduction = 25

/datum/reagent/ketoprofen //T2
	name = "Ketoprofen"
	id = "ketoprofen"
	description = "A simple, yet effective painkiller."
	reagent_state = LIQUID
	color = "#CB68FC"
	overdose = 45
	scannable = 1
	metabolism = 0.05
	shock_reduction = 45

/datum/reagent/ketoprofen/affect_blood(var/mob/living/carbon/M, var/alien, var/removed)
	M.adjustBruteLoss(-0.03*REM)

/datum/reagent/vicodin //T3
	name = "Vicodin"
	id = "vicodin"
	description = "A simple, yet effective painkiller."
	reagent_state = LIQUID
	color = "#CB68FC"
	overdose = 30
	scannable = 1
	metabolism = 0.1
	shock_reduction = 70

/datum/reagent/vicodin/affect_blood(var/mob/living/carbon/M, var/alien, var/removed)
	M.adjustBruteLoss(-0.2*REM)

/datum/reagent/vicodin/overdose(var/mob/living/M as mob)
	M.eye_blurry = max(M.eye_blurry, 5)
	if(prob(33))
		M.Dizzy(1)
		M.Jitter(1)

/datum/reagent/oxycodone //T4
	name = "Oxycodone"
	id = "oxycodone"
	description = "A simple, yet effective painkiller."
	reagent_state = LIQUID
	color = "#CB68FC"
	overdose = 20
	scannable = 1
	metabolism = 0.1
	shock_reduction = 100

/datum/reagent/oxycodone/affect_blood(var/mob/living/carbon/M, var/alien, var/removed)
	switch(current_cycle)
		if(0 to 10)
			if(prob(5))
				M.emote(pick("twitch", "giggle"))
		if(11 to 19)
			M.make_dizzy(5)
			M.druggy = max(M.druggy, 5)
		if(20 to INFINITY)
			M.drowsyness = max(M.drowsyness, 3)

/datum/reagent/oxycodone/overdose(var/mob/living/M as mob)
	M.druggy = max(M.druggy, 10)
	M.hallucination = max(M.hallucination, 5)
	if(prob(33))
		M.Dizzy(1)
		M.Jitter(1)

/datum/reagent/oxymorphone //T5 Special (Hidden Recipe)
	name = "Oxymorphone"
	id = "oxymorphone"
	description = "A simple, yet effective painkiller."
	reagent_state = LIQUID
	color = "#CB68FC"
	overdose = 10
	scannable = 1
	metabolism = 0.05
	shock_reduction = 150

/datum/reagent/oxymorphone/affect_blood(var/mob/living/carbon/M, var/alien, var/removed)
	switch(current_cycle)
		if(0 to 7)
			if(prob(10))
				M.emote(pick("twitch", "giggle"))
			if(prob(5))
				M.emote("yawn")
		if(5 to 6)
			M.drowsyness = max(M.drowsyness, 5)
			M.druggy = max(M.druggy, 5)
		if(7 to 9)
			M.hallucination = max(M.hallucination, 10)
			M.drowsyness = max(M.drowsyness, 10)
			M.druggy = max(M.druggy, 10)
			if(prob(10))
				M.emote(pick("twitch", "giggle"))
		if(10 to INFINITY)
			M.drowsyness = max(M.drowsyness, 15)
			M.Paralyse(5)
			if(prob(10))
				M.emote(pick("twitch", "giggle"))

/datum/reagent/oxymorphone/overdose(var/mob/living/M as mob)
	var/obj/item/I = M.get_active_hand()
	if(I)
		M.drop_item()
	M.eye_blurry = max(M.eye_blurry, 10)
	M.Paralyse(10)
	if(prob(33))
		M.Dizzy(1)
		M.Jitter(1)

//Anti Toxin T1 | T2 | T3 | T4 //

/datum/reagent/dylovene
	name = "Dylovene"
	id = "anti_toxin"
	description = "Dylovene is a broad-spectrum antitoxin."
	reagent_state = LIQUID
	color = "#00A000"
	scannable = 1

/datum/reagent/dylovene/affect_blood(var/mob/living/carbon/M, var/alien, var/removed)
	if(alien != IS_DIONA)
		M.drowsyness = max(0, M.drowsyness - 6 * removed)
		M.hallucination = max(0, M.hallucination - 9 * removed)
		M.adjustToxLoss(-4 * removed)