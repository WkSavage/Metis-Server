
//These use to be under toxins, but i moved it//
//Drugs are fun!//
#define DRUGLREM 0.075 //Last a long while
#define DRUGSREM 0.35  //Faster!
#define DRUGRREM 0.75  //Very Fast

/datum/reagent/nicotine
	name = "Nicotine"
	id = "nicotine"
	description = "Slightly reduces stun times. If overdosed it will deal toxin and oxygen damage."
	reagent_state = LIQUID
	color = "#60A584" // rgb: 96, 165, 132
	metabolism = DRUGLREM
	overdose = 35

/datum/reagent/nicotine/affect_blood(var/mob/living/M as mob)
	if(!M) M = holder.my_atom
	var/smoke_message = pick("You can just feel your lungs dying!", "You feel relaxed.", "You feel calmed.", "You feel the lung cancer forming.", "You feel the money you wasted.", "You feel like a space cowboy.", "You feel rugged.")
	if(prob(20))
		M << "<span class='notice'>[smoke_message]</span>"
	if(prob(50))
		M.AdjustWeakened(-1)
		M.make_jittery(-5*REM)
	if(dose > 30)
		if(prob(5))
			M << "<span class='warning'>You feel the urge to smoke more.</span>"
	if(dose > 40)
		if(prob(5))
			M << "<span class='warning'>You feel like you need more nicotine.</span>"

/datum/reagent/nicotine/overdose(var/mob/living/M as mob)
	if(prob(20))
		M << "You feel like you smoked too much."
	M.adjustToxLoss(1*REM)
	M.adjustOxyLoss(1*REM)

/datum/reagent/dimethyltryptamine
	name = "Dimethyltryptamine"
	id = "dimethyltryptamine"
	description = "Slightly reduces stun times. If overdosed it will deal toxin and oxygen damage."
	reagent_state = SOLID
	color = "#60A584" // rgb: 96, 165, 132
	metabolism = DRUGSREM
	overdose = 15

/datum/reagent/dimethyltryptamine/affect_blood(var/mob/living/M as mob)
	switch(dose)
		if(0 to 3)
			M.hallucination += 7
			M.sleeping = max(M.sleeping, 3)
			M.druggy = max(M.druggy, 3)
		if(4 to 7)
			M.hallucination += 20
			M.sleeping = max(M.sleeping, 6)
			M.druggy = max(M.druggy, 10)
		if(8 to 12)
			M.hallucination += 50
			M.sleeping = max(M.sleeping, 9)
			M.druggy = max(M.druggy, 20)
		if(13 to 15)
			M.hallucination += 100
			M.sleeping = max(M.sleeping, 12)
			M.druggy = max(M.druggy, 30)
		if(16 to INFINITY)
			M.hallucination += 200
			M.sleeping = max(M.sleeping, 15)
			M.druggy = max(M.druggy, 40)

/datum/reagent/dimethyltryptamine/overdose(var/mob/living/M as mob)
	M.sleeping = max(M.sleeping, 30)
	M.druggy = max(M.druggy, 50)

/datum/reagent/cocaine
	name = "Cocaine"
	id = "cocaine"
	description = "Slightly reduces stun times. If overdosed it will deal toxin and oxygen damage."
	reagent_state = SOLID
	color = "#60A584" // rgb: 96, 165, 132
	metabolism = DRUGLREM
	overdose = 20

/datum/reagent/cocaine/affect_blood(var/mob/living/M as mob)
	M.AdjustParalysis(-10)
	M.AdjustStunned(-30)
	M.AdjustWeakened(-30)
	var/high_message = pick("You feel as if you cannot be stopped!")
	if(prob(5))
		M << "<span class='notice'>[high_message]</span>"

/datum/reagent/cocaine/overdose(var/mob/living/M as mob)
	if(prob(20))
		M.emote("laugh")
	if(prob(33))
		M.visible_message("<span class = 'danger'>[M]'s hands flip out and flail everywhere!</span>")
		var/obj/item/I = M.get_active_hand()
		if(I)
			M.drop_item()
	if(prob(50))
		M.adjustToxLoss(10)
	M.adjustBrainLoss(pick(0.5, 0.6, 0.7, 0.8, 0.9, 1))

/datum/reagent/ecstasy
	name = "Ecstasy"
	id = "ecstasy"
	description = "Slightly reduces stun times. If overdosed it will deal toxin and oxygen damage."
	reagent_state = SOLID
	color = "#60A584" // rgb: 96, 165, 132
	metabolism = DRUGSREM
	overdose = 30

/datum/reagent/ecstasy/affect_blood(var/mob/living/M as mob)
	var/ecstasymsg = pick("You feel as if you are one with the party!")
	if(prob(5))
		M << "<span class='notice'>[ecstasymsg]</span>"
	M.AdjustWeakened(-20)
	M.AdjustStunned(-10)
	M.make_dizzy(10)
	if(prob(15))
		M.emote(pick("twitch", "giggle"))
	if(prob(15))
		M.emote("laugh")

/datum/reagent/ecstasy/overdose(var/mob/living/M as mob)
	M.AdjustStunned(-30)
	if(prob(33))
		M.visible_message("<span class = 'danger'>[M]'s whole body spazzes out onto the floor in dance!</span>")
		var/obj/item/I = M.get_active_hand()
		if(I)
			M.drop_item()
	if(prob(50))
		M.adjustToxLoss(2.5)

/datum/reagent/space_drugs
	name = "Space drugs"
	id = "space_drugs"
	description = "An illegal chemical compound used as drug."
	reagent_state = LIQUID
	color = "#60A584"
	metabolism = REM * 0.5
	overdose = REAGENTS_OVERDOSE

/datum/reagent/space_drugs/affect_blood(var/mob/living/carbon/M, var/alien, var/removed)
	if(alien == IS_DIONA)
		return
	M.druggy = max(M.druggy, 20)
	if(prob(10) && isturf(M.loc) && !istype(M.loc, /turf/space) && M.canmove && !M.restrained())
		step(M, pick(cardinal))
	if(prob(7))
		M.emote(pick("twitch", "drool", "moan", "giggle"))

/datum/reagent/lsd
	name = "Lysergic acid diethylamide"
	id = "lsd"
	description = "Slightly reduces stun times. If overdosed it will deal toxin and oxygen damage."
	reagent_state = SOLID
	color = "#60A584" // rgb: 96, 165, 132
	metabolism = DRUGLREM
	overdose = 20

/datum/reagent/lsd/affect_blood(var/mob/living/M as mob)
	M.make_dizzy(5)
	M.druggy = max(M.druggy, 30)
	M.hallucination += 140
	if(prob(50))
		M.adjustToxLoss(0.2)
	if(prob(15))
		M.emote(pick("twitch", "giggle"))
	if(prob(15))
		M.emote("laugh")

/datum/reagent/lsd/overdose(var/mob/living/M as mob)
	M.hallucination += 200
	M.druggy = max(M.druggy, 50)
	M.drowsyness = max(M.drowsyness, 1)

/datum/reagent/lsd
	name = "Lysergic acid diethylamide"
	id = "lsd"
	description = "Slightly reduces stun times. If overdosed it will deal toxin and oxygen damage."
	reagent_state = SOLID
	color = "#60A584" // rgb: 96, 165, 132
	metabolism = DRUGSREM
	overdose = 20

/datum/reagent/lsd/affect_blood(var/mob/living/M as mob)
	M.make_dizzy(5)
	M.druggy = max(M.druggy, 30)
	M.hallucination += 140
	if(prob(50))
		M.adjustToxLoss(0.2)
		M.stuttering += 1
	if(prob(15))
		M.emote(pick("twitch", "giggle"))
	if(prob(15))
		M.emote("laugh")

/datum/reagent/lsd/overdose(var/mob/living/M as mob)
	M.hallucination += 200
	M.druggy = max(M.druggy, 50)
	M.drowsyness = max(M.drowsyness, 1)

/datum/reagent/psilocybin
	name = "Psilocybin"
	id = "psilocybin"
	description = "A strong psycotropic derived from certain species of mushroom."
	color = "#E700E7"
	overdose = 30
	metabolism = DRUGSREM

/datum/reagent/psilocybin/affect_blood(var/mob/living/carbon/M, var/alien, var/removed)
	M.druggy = max(M.druggy, 30)
	if(dose < 1)
		M.stuttering = max(M.stuttering, 3)
		M.make_dizzy(5)
		if(prob(5))
			M.emote(pick("twitch", "giggle"))
	else if(dose < 2)
		M.stuttering = max(M.stuttering, 3)
		M.make_jittery(5)
		M.make_dizzy(5)
		M.druggy = max(M.druggy, 35)
		if(prob(10))
			M.emote(pick("twitch", "giggle"))
	else
		M.hallucination += 30
		M.stuttering = max(M.stuttering, 3)
		M.make_jittery(10)
		M.make_dizzy(10)
		M.druggy = max(M.druggy, 40)
		if(prob(15))
			M.emote(pick("twitch", "giggle"))

/datum/reagent/psilocybin/overdose(var/mob/living/M as mob)
	M.druggy = max(M.druggy, 50)
	M.adjustToxLoss(0.5)
	M.drowsyness = max(M.drowsyness, 3)

/datum/reagent/cryptobiolin
	name = "Cryptobiolin"
	id = "cryptobiolin"
	description = "Cryptobiolin causes confusion and dizzyness."
	reagent_state = LIQUID
	color = "#000055"
	metabolism = DRUGSREM
	overdose = 45

/datum/reagent/cryptobiolin/affect_blood(var/mob/living/carbon/M, var/alien, var/removed)
	M.make_dizzy(4)
	M.confused = max(M.confused, 20)

/datum/reagent/cryptobiolin/overdose(var/mob/living/M as mob)
	M.adjustToxLoss(0.25)
	M.confused = max(M.confused, 25)
	M.make_dizzy(8)

/datum/reagent/salvia
	name = "Divinorum"
	id = "salvia"
	description = "Cryptobiolin causes confusion and dizzyness."
	reagent_state = LIQUID
	color = "#000055"
	metabolism = DRUGRREM
	overdose = 20

/datum/reagent/salvia/affect_blood(var/mob/living/carbon/M, var/alien, var/removed)
	M.hallucination += 250
	M.druggy = max(M.druggy, 15)


/datum/reagent/salvia/overdose(var/mob/living/M as mob)
	M.drowsyness = max(M.drowsyness, 30)
	M.Paralyse(5)
