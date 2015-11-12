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
	..()
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
	..()
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

/datum/reagent/oxymorphone/affect_blood(var/mob/living/carbon/M, var/removed)
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
	..()
	var/obj/item/I = M.get_active_hand()
	if(I)
		M.drop_item()
	M.eye_blurry = max(M.eye_blurry, 10)
	M.Paralyse(10)
	if(prob(33))
		M.Dizzy(1)
		M.Jitter(1)

//Anti Toxin T1 | T2 | T3 | T4 //

/datum/reagent/dylovene   //T1
	name = "Dylovene"
	id = "anti_toxin"
	description = "Dylovene is a cheep broad-spectrum antitoxin. It gets the job done if its all ya have!"
	reagent_state = LIQUID
	color = "#00A000"
	scannable = 1

/datum/reagent/dylovene/affect_blood(var/mob/living/carbon/M, var/removed)
	M.adjustToxLoss(-0.75*REM)

/datum/reagent/cedilanid   //T2
	name = "Cedilanid"
	id = "cedilanid"
	description = "Cedilanid is an upgraded form of Dylovene. Studies suggest it can also reduce drowsyness."
	reagent_state = LIQUID
	color = "#00A000"
	scannable = 1

/datum/reagent/cedilanid/affect_blood(var/mob/living/carbon/M, var/removed)
	M.adjustToxLoss(-1.5*REM)
	if(M.drowsyness > 5)
		M.drowsyness = max(M.drowsyness, -2)

/datum/reagent/neodextraminesolution //T3
	name = "Neodextramine Solution"
	id = "neodextraminesolution"
	description = "This potent purgative rids the body of impurities. It is highly toxic however and close supervision is required."
	color = "#FFFF66"
	metabolism = 0.7
	overdose_threshold = 20

/datum/reagent/neodextraminesolution/on_mob_life(var/mob/living/M as mob)
	if(!M) M = holder.my_atom
	for(var/datum/reagent/R in M.reagents.reagent_list)
		if(R != src)
			if(M.health < 50)
				M.reagents.remove_reagent(R.id,5)
	if(M.health < 50)
		M.adjustToxLoss(-3*REM)
	if(M.health > 50)
		M.adjustToxLoss(1*REM)
	if(prob(25))
		M.fakevomit()

/datum/reagent/neodextraminesolution/overdose(var/mob/living/carbon/M, var/removed)
	..()
	switch(current_cycle)
		if(20 to 29)
			M.adjustToxLoss(1.5*REM)
		if(30 to INFINITY)
			M.adjustToxLoss(3*REM)
			M.Jitter(10)
			M.Paralyse(10)
		if(prob(33))
			M.vomit()
		if(M.health < 50)
