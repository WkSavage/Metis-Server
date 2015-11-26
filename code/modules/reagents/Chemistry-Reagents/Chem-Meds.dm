
/* General New Chem Medicine */

//Pain Killers//  T1 | T2 | T3 | T4 | T5

/datum/reagent/ibuprofen //T1
	name = "Ibuprofen"
	id = "ibuprofen"
	description = "A simple anti-inflammatory painkiller."
	reagent_state = LIQUID
	color = "#f4dbee"
	overdose = 60
	scannable = 1
	metabolism = 0.05
	shock_reduction = 25

/datum/reagent/ketoprofen //T2
	name = "Ketoprofen"
	id = "ketoprofen"
	description = "A more effective painkiller. Stronger than Ibuprofen"
	reagent_state = LIQUID
	color = "#f2c6e8"
	overdose = 45
	scannable = 1
	metabolism = 0.05
	shock_reduction = 45

/datum/reagent/ketoprofen/affect_blood(var/mob/living/carbon/M, var/alien, var/removed)
	M.adjustBruteLoss(-0.03*REM)

/datum/reagent/oxycodone //T3
	name = "Oxycodone"
	id = "oxycodone"
	description = "A strong painkiller. Very effective at treating pain."
	reagent_state = LIQUID
	color = "#f4a7e3"
	overdose = 30
	scannable = 1
	metabolism = 0.1
	shock_reduction = 70

/datum/reagent/oxycodone/affect_blood(var/mob/living/carbon/M, var/alien, var/removed)
	M.adjustBruteLoss(-0.2*REM)
	M.AdjustParalysis(-0.5)
	M.AdjustStunned(-0.5)
	M.AdjustWeakened(-1)

/datum/reagent/oxycodone/overdose(var/mob/living/M as mob)
	..()
	M.eye_blurry = max(M.eye_blurry, 5)
	if(prob(33))
		M.make_dizzy(4)
		M.make_jittery(5)

/datum/reagent/norsodine //T4
	name = "Norsodine"
	id = "norsodine"
	description = "A very strong painkiller. Causes adverse hallucination if overdosed. Medicate carefully."
	reagent_state = LIQUID
	color = "#ec86d5"
	overdose = 20
	scannable = 1
	metabolism = 0.1
	shock_reduction = 100

/datum/reagent/norsodine/affect_blood(var/mob/living/carbon/M, var/alien, var/removed)
	M.AdjustParalysis(-0.5)
	M.AdjustStunned(-1)
	M.AdjustWeakened(-2.5)
	switch(dose)
		if(0 to 10)
			if(prob(5))
				M.emote(pick("twitch", "giggle"))
		if(11 to 19)
			M.make_dizzy(5)
			M.druggy = max(M.druggy, 5)
		if(20 to INFINITY)
			M.drowsyness = max(M.drowsyness, 3)

/datum/reagent/norsodine/overdose(var/mob/living/M as mob)
	..()
	M.druggy = max(M.druggy, 10)
	M.hallucination = max(M.hallucination, 5)
	if(prob(33))
		M.make_dizzy(4)
		M.make_jittery(5)

/datum/reagent/morphine //T5 Special (Hidden Recipe)
	name = "Morphine"
	id = "morphine"
	description = "The second strongest painkiller known to man. An overdose on this one is quite the trip."
	reagent_state = LIQUID
	color = "#EA5BC9"
	overdose = 15
	metabolism = 0.05
	shock_reduction = 150

/datum/reagent/morphine/affect_blood(var/mob/living/carbon/M, var/removed)
	M.AdjustParalysis(-5)
	M.AdjustStunned(-5)
	M.AdjustWeakened(-5)
	switch(dose)
		if(0 to 7)
			if(prob(10))
				M.emote(pick("twitch", "giggle"))
			if(prob(5))
				M.emote("yawn")
		if(5 to 9)
			M.drowsyness = max(M.drowsyness, 5)
			M.druggy = max(M.druggy, 5)
		if(10 to 14)
			M.hallucination = max(M.hallucination, 10)
			M.drowsyness = max(M.drowsyness, 10)
			M.druggy = max(M.druggy, 10)
			if(prob(10))
				M.emote(pick("twitch", "giggle"))
		if(15 to INFINITY)
			M.drowsyness = max(M.drowsyness, 15)
			M.Paralyse(6)
			if(prob(10))
				M.emote(pick("twitch", "giggle"))

/datum/reagent/morphine/overdose(var/mob/living/M as mob)
	..()
	var/obj/item/I = M.get_active_hand()
	if(I)
		M.drop_item()
	M.eye_blurry = max(M.eye_blurry, 10)
	M.hallucination = max(M.hallucination, 30)
	M.Paralyse(10)
	if(prob(33))
		M.make_dizzy(4)
		M.make_jittery(5)

/datum/reagent/oxymorphine //T5 Special (Hidden Recipe)
	name = "Oxymorphine"
	id = "oxymorphine"
	description = "The strongest painkiller known to man. An overdose on this one is quite the trip."
	reagent_state = LIQUID
	color = "#EA5BC9"
	overdose = 10
	metabolism = 0.05
	shock_reduction = 250

/datum/reagent/oxymorphone/affect_blood(var/mob/living/carbon/M, var/removed)
	M.AdjustParalysis(-10)
	M.AdjustStunned(-10)
	M.AdjustWeakened(-10)
	switch(dose)
		if(0 to 7)
			if(prob(10))
				M.emote(pick("twitch", "giggle"))
			if(prob(5))
				M.emote("yawn")
		if(5 to 6)
			M.drowsyness = max(M.drowsyness, 10)
			M.druggy = max(M.druggy, 10)
		if(7 to 9)
			M.hallucination = max(M.hallucination, 30)
			M.drowsyness = max(M.drowsyness, 15)
			M.druggy = max(M.druggy, 30)
			if(prob(10))
				M.emote(pick("twitch", "giggle"))
		if(10 to INFINITY)
			M.drowsyness = max(M.drowsyness, 30)
			M.Paralyse(10)

/datum/reagent/oxymorphone/overdose(var/mob/living/M as mob)
	..()
	var/obj/item/I = M.get_active_hand()
	if(I)
		M.drop_item()
	M.AdjustParalysis(-15)
	M.AdjustStunned(-15)
	M.AdjustWeakened(-15)
	M.drowsyness = max(M.drowsyness, 35)
	M.eye_blurry = max(M.eye_blurry, 20)
	M.hallucination = max(M.hallucination, 50)
	M.Paralyse(15)
	if(prob(33))
		M.make_dizzy(6)

//Anti Toxin T1 | T2 | T3 | T4 //

/datum/reagent/dylovene   //T1
	name = "Dylovene"
	id = "dylovene"
	description = "Dylovene is a cheap broad-spectrum antitoxin. It gets the job done if its all ya have!"
	reagent_state = LIQUID
	color = "#010d07"
	metabolism = 0.15
	scannable = 1

/datum/reagent/dylovene/affect_blood(var/mob/living/carbon/M, var/removed)
	M.adjustToxLoss(-0.45*REM)

/datum/reagent/cedilanid   //T2
	name = "Cedilanid"
	id = "cedilanid"
	description = "Cedilanid is an upgraded form of Dylovene. Studies suggest it can also reduce drowsyness."
	reagent_state = LIQUID
	color = "#032414"
	scannable = 1

/datum/reagent/cedilanid/affect_blood(var/mob/living/carbon/M, var/removed)
	M.adjustToxLoss(-1.75*REM)
	if(M.drowsyness > 5)
		M.drowsyness = max(M.drowsyness, -2.5)

/datum/reagent/neodextraminesolution //T3
	name = "Neodextramine Solution"
	id = "neodextraminesolution"
	description = "A fast way to rid a dying paitent of venoms. Neodextramine is engineered to purge the body of toxins."
	color = "#0d5c36"
	metabolism = 0.75
	overdose = 20

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
	if(prob(33))
		M.fakevomit()
	if(M.health < 50)
		M.adjustToxLoss(-6*REM)
	switch(dose)
		if(20 to 29)
			M.adjustToxLoss(2*REM)
		if(30 to INFINITY)
			M.adjustToxLoss(4*REM)
			if(prob(5))
				M.make_jittery(1000)
				M.Paralyse(10)

/datum/reagent/dermalopein //T4
	name = "Dermalopein"
	id = "dermalopein"
	description = "The fastest way to purge all chemicals. Dermalopein cleanse your body of all toxins."
	color = "#0e7e48"
	metabolism = 1.0
	overdose = 15

/datum/reagent/dermalopein/on_mob_life(var/mob/living/M as mob)
	if(!M) M = holder.my_atom
	for(var/datum/reagent/R in M.reagents.reagent_list)
		if(R != src)
			if(M.health < 25)
				M.reagents.remove_reagent(R.id,10)
	if(M.health < 25)
		M.adjustToxLoss(-5*REM)
	if(M.health > 25)
		M.adjustToxLoss(2.5*REM)
	if(prob(50))
		M.fakevomit()

/datum/reagent/dermalopein/overdose(var/mob/living/carbon/M, var/removed)
	if(M.health < 50)
		M.adjustToxLoss(-6*REM)
	if(M.health > 25)
		M.adjustToxLoss(4*REM)
	switch(dose)
		if(20 to 29)
			M.adjustToxLoss(2.5*REM)
		if(30 to INFINITY)
			M.adjustToxLoss(5*REM)
			if(prob(10))
				M.make_jittery(1000)
				M.Paralyse(15)

//Brute Damage T1 | T2 | T3 | T4 //

/datum/reagent/demerol //T1
	name = "Demerol"
	id = "demerol"
	description = "Demerol is an analgesic medication and can be used to treat blunt trauma. Its kinda basic, and won't treat much more than bruises."
	reagent_state = LIQUID
	color = "#380707"
	scannable = 1

/datum/reagent/demerol/affect_blood(var/mob/living/carbon/M, var/removed)
		M.adjustBruteLoss(-0.5*REM)

/datum/reagent/pamelor //T2
	name = "Pamelor"
	id = "pamelor"
	description = "Pamelor is a step up from Demerol. It is more effective aginst full body trauma."
	reagent_state = LIQUID
	color = "#4f0505"
	scannable = 1
	overdose = 40

/datum/reagent/pamelor/affect_blood(var/mob/living/carbon/M, var/removed)
	M.adjustBruteLoss(-1.5*REM)
	M.AdjustWeakened(-0.5*REM)

/datum/reagent/pamelor/overdose(var/mob/living/carbon/M, var/removed)
	M.AdjustWeakened(0.5)
	if(prob(10))
		M.fakevomit()

/datum/reagent/amytal //T3
	name = "Amytal"
	id = "amytal"
	description = "Amytal is a fast acting brute medication for serious or advance trauma."
	reagent_state = LIQUID
	color = "#740f0f"
	scannable = 1
	overdose = 30
	shock_reduction = 15

/datum/reagent/amytal/affect_blood(var/mob/living/carbon/M, var/removed)
	M.adjustBruteLoss(-3*REM)
	M.AdjustWeakened(-1*REM)
	M.make_dizzy(1)

/datum/reagent/amytal/overdose(var/mob/living/carbon/M, var/removed)
	M.AdjustWeakened(-2)
	M.make_jittery(6)
	if(prob(1))
		M.fakepoop()
	if(prob(20))
		M.adjustBruteLoss(1.2*REM)
		M.reagents.remove_reagent("blood", 2.5)
	if(prob(30))
		M.adjustBruteLoss(-4*REM)
	if(prob(20))
		M.AdjustWeakened(10)

/datum/reagent/hqem //T4
	name = "Hyvroxilated Quint-Ethyl Metacetamin"
	id = "hqem"
	description = "This drug is usally used in combination with facial reconstruction surgery. Very effective at healing level 1 brute trama."
	reagent_state = LIQUID
	color = "#8b2d2d"
	overdose = 20
	shock_reduction = 30

/datum/reagent/hqem/affect_blood(var/mob/living/carbon/M, var/removed)
	M.adjustBruteLoss(-6*REM)
	M.AdjustWeakened(-2*REM)
	if(prob(33))
		M.AdjustParalysis(-1)
	if(prob(33))
		M.AdjustStunned(-7)
	if(prob(5))
		M.AdjustParalysis(10)
	if(prob(5))
		M.AdjustStunned(10)

/datum/reagent/hqem/overdose(var/mob/living/carbon/M, var/removed)
	M.AdjustWeakened(6)
	M.make_jittery(10)
	if(prob(30))
		M.adjustBruteLoss(2.2*REM)
		M.reagents.remove_reagent("blood", 5)
	if(prob(60))
		M.adjustBruteLoss(-4*REM)
	if(prob(20))
		M.SetWeakened(0)
	if(prob(10))
		M.AdjustParalysis(-2)
		M.AdjustStunned(-2)

/datum/reagent/aqem //T5
	name = "Alprazaline Quint-Ethyl Metacetamin"
	id = "aqem"
	description = "This drug is usally used in combination with facial reconstruction surgery. Very effective at healing level 1 brute trama."
	reagent_state = LIQUID
	color = "#8b2d2d"
	overdose = 20
	shock_reduction = 30

/datum/reagent/aqem/affect_blood(var/mob/living/carbon/M, var/removed)
	M.adjustBruteLoss(-9*REM)
	M.AdjustWeakened(-2*REM)
	if(prob(33))
		M.AdjustParalysis(-5)
	if(prob(33))
		M.AdjustStunned(-5)
	if(prob(5))
		M.AdjustParalysis(15)
	if(prob(5))
		M.AdjustStunned(15)
	if(ishuman(M))
		var/mob/living/carbon/human/H = M
		for(var/obj/item/organ/I in H.internal_organs)
			if((I.damage > 10) && (I.robotic != 2)) //Peridaxon heals only non-robotic organs
				I.damage = max(I.damage - 2.5*REM)

/datum/reagent/aqem/overdose(var/mob/living/carbon/M, var/removed)
	M.AdjustWeakened(6)
	M.make_jittery(10)
	if(prob(30))
		M.adjustBruteLoss(2.2*REM)
		M.reagents.remove_reagent("blood", 5)
	if(prob(60))
		M.adjustBruteLoss(-4*REM)
	if(prob(20))
		M.SetWeakened(0)
	if(prob(10))
		M.AdjustParalysis(-7)
		M.AdjustStunned(-7)

//Inaprovaline -> Modafinil -> Epinephrine -> Dextroamphetamine T1 = T4 + Special//

/datum/reagent/hyperzine   //L-T1
	name = "Hyperzine"
	id = "hyperzine"
	description = "Hyperzine is a long lasting stimulant. Proivdes lasting energy."
	color = "#479892"
	metabolism = 0.05
	overdose = 60

/datum/reagent/hyperzine/affect_blood(var/mob/living/carbon/M, var/removed)
	M.AdjustStunned(-0.25)
	M.AdjustWeakened(-0.5)

/datum/reagent/hyperzine/overdose(var/mob/living/carbon/M, var/removed)
	M.make_jittery(1.5)
	M.AdjustStunned(-0.5)
	M.AdjustWeakened(-0.75)

/datum/reagent/inaprovaline  //T1
	name = "Inaprovaline"
	id = "inaprovaline"
	description = "Inaprovaline is a faster acting stimulant. Provides a burst of energy!"
	color = "#3EAEA5"
	metabolism = 0.45
	overdose = 45

/datum/reagent/inaprovaline/affect_blood(var/mob/living/carbon/M, var/removed)
	M.AdjustStunned(-1)
	M.AdjustWeakened(-1)

/datum/reagent/inaprovaline/overdose(var/mob/living/carbon/M, var/removed)
	M.make_jittery(3)
	M.AdjustStunned(-2)
	M.AdjustWeakened(-2)
	if(prob(10))
		M.AdjustParalysis(-1)
	if(prob(10))
		M.adjustToxLoss(1*REM)

/datum/reagent/modafinil  //T2
	name = "Modafinil"
	id = "modafinil"
	description = "Modafinil is a more powerful stimulant, helping reduce paralysis in paitents."
	color = "#05a598"
	metabolism = 0.45
	overdose = 30

/datum/reagent/modafinil/affect_blood(var/mob/living/carbon/M, var/removed)
	M.add_chemical_effect(CE_SPEEDBOOST, 1)
	M.AdjustParalysis(-0.5)
	M.AdjustStunned(-2)
	M.AdjustWeakened(-2)

/datum/reagent/modafinil/overdose(var/mob/living/carbon/M, var/removed)
	M.make_jittery(5)
	M.AdjustStunned(-3)
	M.AdjustWeakened(-3)
	if(prob(33))
		M.AdjustParalysis(-2)
	if(prob(33))
		M.adjustToxLoss(1*REM)

/datum/reagent/epinephrine  //T3
	name = "Epinephrine"
	id = "epinephrine"
	description = "A human hormone, more commonly known as adrenaline. This stuff gets you going."
	color = "#43cec3"
	metabolism = 0.3
	overdose = 30
	shock_reduction = 20

/datum/reagent/epinephrine/affect_blood(var/mob/living/carbon/M, var/removed)
	M.add_chemical_effect(CE_SPEEDBOOST, 1)
	M.make_jittery(2.5)
	M.AdjustParalysis(-2)
	M.AdjustStunned(-4)
	M.AdjustWeakened(-4)

/datum/reagent/epinephrine/overdose(var/mob/living/carbon/M, var/removed)
	M.make_jittery(10)
	M.AdjustParalysis(-3)
	M.AdjustStunned(-5)
	M.AdjustWeakened(-5)
	if(prob(33))
		M.adjustToxLoss(2.5*REM)
	if(prob(33))
		M.AdjustParalysis(9)
	if(prob(33))
		M.AdjustParalysis(-6)

/datum/reagent/dextroamphetamine  //T4
	name = "Dextroamphetamine"
	id = "dextroamphetamine"
	description = "A powerful stimulant commonly used to promote the movement of limbs. Did I mention is was powerful?"
	color = "#33e3d5"
	metabolism = 0.2
	overdose = 25
	shock_reduction = 30

/datum/reagent/dextroamphetamine/affect_blood(var/mob/living/carbon/M, var/removed)
	M.add_chemical_effect(CE_SPEEDBOOST, 1)
	M.make_jittery(10)
	M.AdjustParalysis(-6)
	M.AdjustStunned(-9)
	M.AdjustWeakened(-9)
	M.adjustOxyLoss(-2.5*REM)
	M.drowsyness = 0

/datum/reagent/dextroamphetamine/overdose(var/mob/living/carbon/M, var/removed)
	M.make_jittery(30)
	M.AdjustParalysis(-10)
	M.AdjustStunned(-12)
	M.AdjustWeakened(-12)
	M.adjustOxyLoss(-5*REM)
	M.sleeping = 0
	if(prob(66))
		M.adjustToxLoss(5*REM)
	if(prob(33))
		M.AdjustParalysis(-15)
	if(prob(5))
		M.make_jittery(1000)
		M.AdjustParalysis(15)

/datum/reagent/stimpak  //T5 Special
	name = "FastActing StimPak"
	id = "stimpak"
	description = "A mixture of fast acting stimulants! Caution: Overdose may cause irradiation."
	color = "#41df9b"
	metabolism = 1.0
	overdose = 15
	shock_reduction = 40

/datum/reagent/stimpak/affect_blood(var/mob/living/carbon/M, var/removed)
	M.add_chemical_effect(CE_SPEEDBOOST, 1)
	M.AdjustParalysis(-10)
	M.AdjustStunned(-15)
	M.AdjustWeakened(-15)
	M.adjustOxyLoss(-5*REM)
	M.drowsyness = 0
	M.sleeping = 0
	M.adjustToxLoss(0.5*REM)

/datum/reagent/stimpak/overdose(var/mob/living/carbon/M, var/removed)
	M.make_jittery(30)
	M.AdjustParalysis(-15)
	M.AdjustStunned(-20)
	M.AdjustWeakened(-20)
	if(prob(66))
		M.adjustOxyLoss(-7.5*REM)
		M << "<span class='notice'>You feel your lungs open wide!</span>"
	if(prob(66))
		M.adjustToxLoss(0.75*REM)
		M.radiation += 20

/datum/reagent/stimpakultra  //T5 Special Long Lasting.
	name = "StimPakUltra"
	id = "stimpakultra"
	description = "A mixture of long lasting stimulants! Caution: Overdose may cause irradiation."
	color = "#41DF9B"
	metabolism = 0.01
	overdose = 7
	shock_reduction = 40

/datum/reagent/stimpakultra/affect_blood(var/mob/living/carbon/M, var/removed)
	M.add_chemical_effect(CE_SPEEDBOOST, 1)
	M.AdjustParalysis(-6)
	M.AdjustStunned(-6)
	M.AdjustWeakened(-6)
	M.adjustOxyLoss(-2*REM)
	M.drowsyness = 0
	M.sleeping = 0
	if(prob(66))
		M.make_jittery(15)
	if(prob(33))
		M.fakevomit()

/datum/reagent/stimpakultra/overdose(var/mob/living/carbon/M, var/removed)
	M.make_jittery(40)
	M.AdjustStunned(-10)
	M.AdjustWeakened(-10)
	M.AdjustParalysis(-10)
	if(prob(66))
		M.adjustOxyLoss(-5*REM)
		M << "<span class='notice'>You feel your lungs open wide!</span>"
	if(prob(66))
		M.adjustToxLoss(0.75*REM)
		M.radiation += 20

// Brain Damage // T1 | T2 | T3

/datum/reagent/alkysine
	name = "Alkysine"
	id = "alkysine"
	description = "Alkysine is a drug used to lessen the damage to neurological tissue after a minor injury. Can heal minor brain damage."
	reagent_state = LIQUID
	color = "#211698"
	metabolism = 0.4
	scannable = 1

/datum/reagent/alkysine/affect_blood(var/mob/living/carbon/M, var/alien, var/removed)
	M.adjustBrainLoss(-6*REM)

/datum/reagent/hydromel
	name = "Hydromel"
	id = "hydromel"
	description = "Hydromel is a drug used to lessen the damage to neurological tissue after a catastrophic injury. Can heal tramatic brain injuries."
	reagent_state = LIQUID
	color = "#1a08db"
	metabolism = 0.3
	scannable = 1
	overdose = 30

/datum/reagent/hydromel/affect_blood(var/mob/living/carbon/M, var/alien, var/removed)
	M.adjustBrainLoss(-12*REM)

/datum/reagent/hydromel/overdose(var/mob/living/carbon/M, var/removed)
		M.radiation += 3

/datum/reagent/crystodigin
	name = "Crystodigin"
	id = "crystodigin"
	description = "Crystodigin is a experimental drug used to regenerate neurological tissue after a full brain injury. Can heal catastrophic brain damage."
	reagent_state = LIQUID
	color = "#1f0bf4"
	metabolism = 0.2
	scannable = 1
	overdose = 20

/datum/reagent/crystodigin/affect_blood(var/mob/living/carbon/M, var/alien, var/removed)
	M.adjustBrainLoss(-20*REM)

/datum/reagent/crystodigin/overdose(var/mob/living/carbon/M, var/removed)
	M.radiation += 10
	if(prob(5))
		M.adjustBrainLoss(30*REM)
		M << "<span class='notice'>You seem to have forgeten what you were doing!</span>"
	if(prob(5))
		M.adjustBrainLoss(-30*REM)
		M << "<span class='notice'>You seem smarter for some reason!</span>"
	if(prob(33))
		M.adjustOxyLoss(2.5*REM)

// Oxygen Damage // T1 | T2 | T3 | T4

/datum/reagent/osmotrol //T1
	name = "Osmotrol"
	id = "osmotrol"
	description = "Osmotrol is used in the treatment of oxygen deprivation."
	reagent_state = LIQUID
	color = "#a0bcc9"
	metabolism = 0.2
	scannable = 1
	overdose = 60

/datum/reagent/osmotrol/affect_blood(var/mob/living/carbon/M, var/alien, var/removed)
	M.adjustOxyLoss(-1*REM)

/datum/reagent/osmotrol/overdose(var/mob/living/carbon/M, var/removed)
	M.adjustOxyLoss(-2*REM)
	M.adjustToxLoss(0.5*REM)

/datum/reagent/isoprovalyn //T2
	name = "Isoprovalyn"
	id = "isoprovalyn"
	description = "Improves on Osmotrol, Has a faster reaction time preventing further damage."
	reagent_state = LIQUID
	color = "#8caebf"
	metabolism = 0.2
	scannable = 1
	overdose = 45

/datum/reagent/isoprovalyn/affect_blood(var/mob/living/carbon/M, var/alien, var/removed)
	if(M.losebreath >= 8)
		M.losebreath -= 2
	M.adjustOxyLoss(-3*REM)

/datum/reagent/isoprovalyn/overdose(var/mob/living/carbon/M, var/removed)
	M.adjustOxyLoss(-5*REM)
	M.adjustToxLoss(1.25*REM)

/datum/reagent/hexadrol //T3
	name = "Hexadrol"
	id = "hexadrol"
	description = "Hexadrol works by converting C02 in our body to oxygen using water."
	reagent_state = LIQUID
	color = "#659ab4"
	metabolism = 0.3
	scannable = 1
	overdose = 25

/datum/reagent/hexadrol/affect_blood(var/mob/living/carbon/M, var/alien, var/removed)
	M << "<span class='notice'>You feel your lungs open wide!</span>"
	M.adjustOxyLoss(-8*REM)
	if(M.losebreath >= 4)
		M.losebreath -= 4
	if(prob(5))
		M << "<span class='notice'>You feel your lungs open wide!</span>"
	M.AdjustWeakened(-1.5*REM)
	M.AdjustStunned(-0.5*REM)

/datum/reagent/hexadrol/overdose(var/mob/living/carbon/M, var/removed)
	M.silent = max(M.silent, 1)
	M.adjustOxyLoss(-12*REM)
	M.adjustToxLoss(2*REM)
	if(prob(10))
		M << "<span class='notice'>You feel your lungs fill with air!</span>"
	if(prob(25))
		M.AdjustParalysis(1*REM)

/datum/reagent/oxycocet_osmo //T4
	name = "Oxycocet Osmo"
	id = "oxycocet_osmo"
	description = "Oxycocet Osmo doubles the rate at which oxygen is generated from C02. It is a very effective medication."
	reagent_state = LIQUID
	color = "#4d91b2"
	metabolism = 0.4
	overdose = 15

/datum/reagent/oxycocet_osmo/affect_blood(var/mob/living/carbon/M, var/alien, var/removed)
	if(M.losebreath >= 2)
		M.losebreath -= 3
	M << "<span class='notice'>You feel your lungs open wide!</span>"
	M.adjustOxyLoss(-20*REM)
	if(prob(5))
		M << "<span class='notice'>You feel your lungs open wide!</span>"
	M.AdjustWeakened(-2*REM)
	M.AdjustStunned(-2*REM)

/datum/reagent/oxycocet_osmo/overdose(var/mob/living/carbon/M, var/removed)
	M.silent = max(M.silent, 5)
	M.adjustOxyLoss(-25*REM)
	M.adjustToxLoss(2*REM)
	if(prob(10))
		M << "<span class='notice'>You feel your lungs fill with air!</span>"
	if(prob(25))
		M.AdjustParalysis(2*REM)

/datum/reagent/oxycodan_hexadro //T5 Special
	name = "Oxycodan Hexadro"
	id = "oxycodan_hexadro"
	description = "Oxycodan Hexadro shows promise in artificial breathing. Side effects seem to include long term lung damage."
	reagent_state = LIQUID
	color = "#2a91c3"
	metabolism = 0.1
	overdose = 10

/datum/reagent/oxycodan_hexadro/affect_blood(var/mob/living/carbon/M, var/alien, var/removed)
	if(M.losebreath >= 4)
		M.losebreath -= 4
	M << "<span class='notice'>You feel an air bubble form in your lungs!</span>"
	M.adjustOxyLoss(-35*REM)
	M.AdjustWeakened(-4*REM)
	M.AdjustStunned(-4*REM)
	M.silent = max(M.silent, 5)

/datum/reagent/oxycodan_hexadro/overdose(var/mob/living/carbon/M, var/alien/A, var/removed)
	M.silent = max(M.silent, 7)
	M.adjustOxyLoss(-45*REM)
	M.adjustToxLoss(3*REM)
	M << "<span class='notice'>Your lungs start to burn!</span>"
	if(prob(25))
		M.AdjustParalysis(5*REM)
	if(ishuman(M))
		var/mob/living/carbon/human/H = M
		var/obj/item/organ/lungs/E = H.internal_organs_by_name["lungs"]
		if(E && istype(E))
			E.damage = max(2*REM)

// Fire Damage // T1 | T2 | T3

/datum/reagent/kelotane //T1
	name = "Kelotane"
	id = "kelotane"
	description = "Kelotane is a drug used to treat burns."
	reagent_state = LIQUID
	color = "#FFFF66"
	metabolism = 0.2
	overdose = 40

/datum/reagent/kelotane/affect_blood(var/mob/living/carbon/M, var/alien, var/removed)
	M.adjustFireLoss(-1.5*REM)

/datum/reagent/kelotane/overdose(var/mob/living/carbon/M, var/alien/A, var/removed)
	M.adjustToxLoss(-0.5*REM)

/datum/reagent/asinolyathin //T2
	name = "Asinolyathin"
	id = "asinolyathin"
	description = "Asinolyathin is a drug used to treat burns. It is much faster then Kelotane."
	reagent_state = LIQUID
	color = "#FFFF66"
	metabolism = 0.2
	overdose = 30

/datum/reagent/asinolyathin/affect_blood(var/mob/living/carbon/M, var/alien, var/removed)
	M.adjustFireLoss(-3*REM)
	M.AdjustStunned(-1*REM)

/datum/reagent/asinolyathin/overdose(var/mob/living/carbon/M, var/alien/A, var/removed)
	M.adjustToxLoss(1*REM)

 /datum/reagent/dramacline //T3
	name = "Dramacline"
	id = "dramacline"
	description = "Dramacline is fast and effective at treating deep tissue burns."
	reagent_state = LIQUID
	color = "#FFFF66"
	metabolism = 0.2
	overdose = 20

/datum/reagent/dramacline/affect_blood(var/mob/living/carbon/M, var/alien, var/removed)
	M.adjustFireLoss(-6*REM)
	M.AdjustStunned(-2*REM)

/datum/reagent/dramacline/overdose(var/mob/living/carbon/M, var/alien/A, var/removed)
	M.adjustToxLoss(2.5*REM)

//Anti-Rads// T1 | T2 | T3
#define RADMESSAGE_DELAY 2*60*10

/datum/reagent/hyronalin //T1
	name = "Hyronalin"
	id = "hyronalin"
	description = "A drug used to treat radiation sickness. Pretty effective. May cause headaches."
	reagent_state = LIQUID
	color = "#1fd447"
	metabolism = 0.2
	overdose = 30

/datum/reagent/hyronalin/affect_blood(var/mob/living/carbon/M, var/alien, var/removed)
	if(prob(80))
		M.radiation--
	if(world.time > data + RADMESSAGE_DELAY)
		data = world.time
		switch(dose)
			if(1 to 15)
				M << "<span class='warning'>You feel a light pain in your head!</span>"
			if(16 to 26)
				M << "<span class='warning'>You feel a throbbing pain in your head!</span>"
			if(27 to INFINITY)
				M << "<span class='warning'>You feel an excrutiating pain in your head!</span>"

/datum/reagent/hyronalin/overdose(var/mob/living/carbon/M, var/alien/A, var/removed)
	M.adjustToxLoss(2*REM)
	if(ishuman(M))
		var/mob/living/carbon/human/H = M
		var/obj/item/organ/kidneys/K = H.internal_organs_by_name["kidneys"]
		if(K && istype(K))
			K.damage = max(2*REM)

/datum/reagent/arithrazine //T2
	name = "Arithrazine"
	id = "arithrazine"
	description = "A drug used to treat radiation sickness. Fast acting, but may cause damage to the kidneys."
	reagent_state = LIQUID
	color = "#13dd3f"
	metabolism = 0.35
	overdose = 15

/datum/reagent/arithrazine/affect_blood(var/mob/living/carbon/M, var/alien, var/removed)
	if(prob(80))
		M.radiation--
	if(ishuman(M))
		var/mob/living/carbon/human/H = M
		var/obj/item/organ/kidneys/K = H.internal_organs_by_name["kidneys"]
		if(K && istype(K))
			K.damage = max(1*REM)
	if(world.time > data + RADMESSAGE_DELAY)
		data = world.time
		switch(dose)
			if(1 to 5)
				M << "<span class='warning'>You feel a light pain in your head!</span>"
			if(6 to 12)
				M << "<span class='warning'>You feel a throbbing pain in your head!</span>"
			if(13 to INFINITY)
				M << "<span class='warning'>You feel an excrutiating pain in your head!</span>"

/datum/reagent/arithrazine/overdose(var/mob/living/carbon/M, var/alien/A, var/removed)
	M.adjustToxLoss(2*REM)
	if(ishuman(M))
		var/mob/living/carbon/human/H = M
		var/obj/item/organ/kidneys/K = H.internal_organs_by_name["kidneys"]
		if(K && istype(K))
			K.damage = max(4*REM)

/datum/reagent/radaway //T3
	name = "RadAway"
	id = "radaway"
	description = "A drug used to treat radiation sickness. Fast acting and effective, but may cause major damage to the kidneys."
	reagent_state = LIQUID
	color = "#05e509"
	metabolism = 0.35
	overdose = 10

/datum/reagent/radaway/affect_blood(var/mob/living/carbon/M, var/alien, var/removed)
	M.radiation--
	if(ishuman(M))
		var/mob/living/carbon/human/H = M
		var/obj/item/organ/kidneys/K = H.internal_organs_by_name["kidneys"]
		if(K && istype(K))
			K.damage = max(2*REM)
	if(world.time > data + RADMESSAGE_DELAY)
		data = world.time
		switch(dose)
			if(1 to 3)
				M << "<span class='warning'>You feel a light pain in your head!</span>"
			if(4 to 8)
				M << "<span class='warning'>You feel a throbbing pain in your head!</span>"
			if(9 to INFINITY)
				M << "<span class='warning'>You feel an excrutiating pain in your head!</span>"
				M.adjustBruteLoss(1*REM)

/datum/reagent/radaway/overdose(var/mob/living/carbon/M, var/alien/A, var/removed)
	M.adjustToxLoss(3*REM)
	if(ishuman(M))
		var/mob/living/carbon/human/H = M
		var/obj/item/organ/kidneys/K = H.internal_organs_by_name["kidneys"]
		if(K && istype(K))
			K.damage = max(6*REM)

//Special Meds// These Are Different!! //

/datum/reagent/ethylredoxrazine
	name = "Ethylredoxrazine"
	id = "ethylredoxrazine"
	description = "A powerful oxidizer that reacts with ethanol."
	reagent_state = SOLID
	color = "#605048"
	overdose = 30

/datum/reagent/ethylredoxrazine/affect_blood(var/mob/living/carbon/M, var/removed)
	M.dizziness = 0
	M.drowsyness = 0
	M.slurring = 0
	M.confused = 0
	M.reagents.remove_reagent("ethanol", 8)
	M.reagents.add_reagent("water", 6)
	M.reagents.add_reagent("nutriment", 2)
	if(M.health > 25)
		M.adjustToxLoss(-0.25)
	if(M.health < 25)
		M.adjustToxLoss(-2.0)

/datum/reagent/ethylredoxrazine/overdose(var/mob/living/carbon/M, var/removed)
	M.adjustToxLoss(1*REM)

/datum/reagent/leporazine
	name = "Leporazine"
	id = "leporazine"
	description = "Leporazine can be use to stabilize an individuals body temperature."
	reagent_state = LIQUID
	color = "#C8A5DC"
	overdose = 60
	metabolism = 0.35
	scannable = 1

/datum/reagent/leporazine/affect_blood(var/mob/living/carbon/M, var/removed)
	if(M.bodytemperature > 310)
		M.bodytemperature = max(310, M.bodytemperature - (40 * TEMPERATURE_DAMAGE_COEFFICIENT))
	else if(M.bodytemperature < 311)
		M.bodytemperature = min(310, M.bodytemperature + (40 * TEMPERATURE_DAMAGE_COEFFICIENT))

/datum/reagent/leporazine/overdose(var/mob/living/carbon/M, var/removed)
	M.adjustToxLoss(1*REM)

/datum/reagent/sterilizine
	name = "Sterilizine"
	id = "sterilizine"
	description = "Sterilizes wounds in preparation for surgery."
	reagent_state = LIQUID
	color = "#C8A5DC"
	touch_met = 5

/datum/reagent/sterilizine/affect_touch(var/mob/living/carbon/M, var/removed)
	M.germ_level -= min(removed*20, M.germ_level)

/datum/reagent/sterilizine/touch_obj(var/obj/O)
	O.germ_level -= min(volume*20, O.germ_level)

/datum/reagent/sterilizine/touch_turf(var/turf/T)
	T.germ_level -= min(volume*20, T.germ_level)

/datum/reagent/sterilizine/affect_blood(var/mob/living/carbon/M, var/removed)
	M.adjustToxLoss(2*REM)

/datum/reagent/spaceacillin
	name = "Spaceacillin"
	id = "spaceacillin"
	description = "An all-purpose antiviral agent."
	reagent_state = LIQUID
	color = "#C1C1C1"
	metabolism = 0.05
	overdose = 60
	scannable = 1

/datum/reagent/spaceacillin/affect_blood(var/mob/living/carbon/M, var/removed)
	M.adjustToxLoss(1*REM)

/datum/reagent/ryetalyn
	name = "Ryetalyn"
	id = "ryetalyn"
	description = "Ryetalyn can cure all genetic abnomalities via a catalytic process."
	reagent_state = SOLID
	color = "#004000"
	overdose = 5

/datum/reagent/ryetalyn/affect_blood(var/mob/living/carbon/M, var/alien, var/removed)
	var/needs_update = M.mutations.len > 0

	M.mutations = list()
	M.disabilities = 0
	M.sdisabilities = 0

	// Might need to update appearance for hulk etc.
	if(needs_update && ishuman(M))
		var/mob/living/carbon/human/H = M
		H.update_mutations()

/datum/reagent/ryetalyn/affect_blood(var/mob/living/carbon/M, var/removed)
	M.adjustToxLoss(2*REM)
	M.bodytemperature = max(500, M.bodytemperature++)

/datum/reagent/peridaxon
	name = "Peridaxon"
	id = "peridaxon"
	description = "Used to encourage recovery of internal organs and nervous systems. Medicate cautiously."
	reagent_state = LIQUID
	color = "#561EC3"
	overdose = 10
	scannable = 1

/datum/reagent/peridaxon/affect_blood(var/mob/living/carbon/M, var/alien, var/removed)
	if(ishuman(M))
		var/mob/living/carbon/human/H = M
		for(var/obj/item/organ/I in H.internal_organs)
			if((I.damage > 0) && (I.robotic != 2)) //Peridaxon heals only non-robotic organs
				I.damage = max(I.damage - removed, 0)

/datum/reagent/ryetalyn/affect_blood(var/mob/living/carbon/M, var/removed)
	M.adjustToxLoss(2.5*REM)

/datum/reagent/imidazoline
	name = "Imidazoline"
	id = "imidazoline"
	description = "Heals eye damage"
	reagent_state = LIQUID
	color = "#C8A5DC"
	overdose = REAGENTS_OVERDOSE
	scannable = 1

/datum/reagent/imidazoline/affect_blood(var/mob/living/carbon/M, var/alien, var/removed)
	if(!M) M = holder.my_atom
	M.eye_blurry = max(M.eye_blurry-5 , 0)
	M.eye_blind = max(M.eye_blind-5 , 0)
	if(ishuman(M))
		var/mob/living/carbon/human/H = M
		var/obj/item/organ/eyes/E = H.internal_organs_by_name["eyes"]
		if(istype(E))
			if(E.damage > 0)
				E.damage -= 1

/datum/reagent/imidazoline/affect_blood(var/mob/living/carbon/M, var/removed)
	M.adjustToxLoss(1*REM)

//What Would Be Tricord. This shit will be expensive//

/datum/reagent/provolanaproxalidamine
	name = "Provolanaproxalidamine"
	id = "provolanaproxalidamine"
	description = "Provolanaproxalidamine is a highly potent stimulant. Can be used to treat a wide range of injuries."
	reagent_state = LIQUID
	color = "#8040FF"
	scannable = 1
	overdose = 30

/datum/reagent/provolanaproxalidamine/affect_blood(var/mob/living/carbon/M, var/removed)
	M.AdjustWeakened(-5*REM)
	M.adjustOxyLoss(-5*REM)
	M.adjustToxLoss(-2.5*REM)
	M.adjustFireLoss(-2.5*REM)
	M.adjustBruteLoss(-2.5*REM)

/datum/reagent/provolanaproxalidamine/affect_blood(var/mob/living/carbon/M, var/removed)
	M.AdjustWeakened(2.5*REM)
	M.adjustOxyLoss(1*REM)
	M.adjustToxLoss(1*REM)
	if(prob(40))
		M.AdjustWeakened(-15*REM)
		M.adjustOxyLoss(10*REM)
	if(prob(40))
		M.fakevomit()

// Cryo-Based Meds // Special Snowflakes Are Weird

/datum/reagent/cryoxadone
	name = "Cryoxadone"
	id = "cryoxadone"
	description = "A chemical mixture with almost magical healing powers. Its main limitation is that the targets body temperature must be under 170K for it to metabolise correctly."
	reagent_state = LIQUID
	color = "#8080FF"
	metabolism = REM * 0.5
	scannable = 1

/datum/reagent/cryoxadone/affect_blood(var/mob/living/carbon/M, var/alien, var/removed)
	if(M.bodytemperature < 170)
		M.adjustCloneLoss(-15 * removed)
		M.adjustOxyLoss(-15 * removed)
		M.heal_organ_damage(15 * removed, 15 * removed)
		M.adjustToxLoss(-15 * removed)

/datum/reagent/clonexadone
	name = "Clonexadone"
	id = "clonexadone"
	description = "A liquid compound similar to that used in the cloning process. Can be used to 'finish' the cloning process when used in conjunction with a cryo tube."
	reagent_state = LIQUID
	color = "#80BFFF"
	metabolism = REM * 0.5
	scannable = 1

/datum/reagent/clonexadone/affect_blood(var/mob/living/carbon/M, var/alien, var/removed)
	if(M.bodytemperature < 170)
		M.adjustCloneLoss(-40 * removed)
		M.adjustOxyLoss(-40 * removed)
		M.heal_organ_damage(40 * removed, 40 * removed)
		M.adjustToxLoss(-40 * removed)

// Anti-Dope Depressents //

#define ANTIDEPRESSANT_MESSAGE_DELAY 5*60*10

/datum/reagent/methylphenidate
	name = "Methylphenidate"
	id = "methylphenidate"
	description = "Improves the ability to concentrate."
	reagent_state = LIQUID
	color = "#BF80BF"
	metabolism = 0.01
	data = 0

/datum/reagent/methylphenidate/affect_blood(var/mob/living/carbon/M, var/alien, var/removed)
	if(alien == IS_DIONA)
		return
	if(volume <= 0.1 && data != -1)
		data = -1
		M << "<span class='warning'>You lose focus...</span>"
	else
		if(world.time > data + ANTIDEPRESSANT_MESSAGE_DELAY)
			data = world.time
			M << "<span class='notice'>Your mind feels focused and undivided.</span>"

/datum/reagent/citalopram
	name = "Citalopram"
	id = "citalopram"
	description = "Stabilizes the mind a little."
	reagent_state = LIQUID
	color = "#FF80FF"
	metabolism = 0.01
	data = 0

/datum/reagent/citalopram/affect_blood(var/mob/living/carbon/M, var/alien, var/removed)
	if(alien == IS_DIONA)
		return
	if(volume <= 0.1 && data != -1)
		data = -1
		M << "<span class='warning'>Your mind feels a little less stable...</span>"
	else
		if(world.time > data + ANTIDEPRESSANT_MESSAGE_DELAY)
			data = world.time
			M << "<span class='notice'>Your mind feels stable... a little stable.</span>"

/datum/reagent/paroxetine
	name = "Paroxetine"
	id = "paroxetine"
	description = "Stabilizes the mind greatly, but has a chance of adverse effects."
	reagent_state = LIQUID
	color = "#FF80BF"
	metabolism = 0.01
	data = 0

/datum/reagent/paroxetine/affect_blood(var/mob/living/carbon/M, var/alien, var/removed)
	if(alien == IS_DIONA)
		return
	if(volume <= 0.1 && data != -1)
		data = -1
		M << "<span class='warning'>Your mind feels much less stable...</span>"
	else
		if(world.time > data + ANTIDEPRESSANT_MESSAGE_DELAY)
			data = world.time
			if(prob(90))
				M << "<span class='notice'>Your mind feels much more stable.</span>"
			else
				M << "<span class='warning'>Your mind breaks apart...</span>"
				M.hallucination += 200
