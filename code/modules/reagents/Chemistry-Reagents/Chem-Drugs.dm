
//These use to be under toxins, but i moved it//
//Drugs are fun!//
#define DRUGLREM 0.075 //Last a long while
#define DRUGSREM 0.35  //Faster!

//Non-Hall

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

/datum/reagent/cannabis_s
	name = "Synthetic Cannabis"
	id = "cannabis_s"
	description = "Slightly reduces stun times. If overdosed it will deal toxin and oxygen damage."
	reagent_state = LIQUID
	color = "#60A584" // rgb: 96, 165, 132
	metabolism = DRUGLREM
	overdose = 45

/datum/reagent/cannabis_s/affect_blood(var/mob/living/M as mob)
	if(!M) M = holder.my_atom
	var/cannabis_s_message = pick("The world around you brightens.", "You feel relaxed.", "You feel calmed.", "The walls spin in all directions.")
	if(prob(20))
		M << "<span class='notice'>[cannabis_s_message]</span>"
	M.drowsyness = max(M.drowsyness, 1)
	M.druggy = max(M.druggy, 5)
	if(dose > 40)
		if(prob(5))
			M << "<span class='warning'>You feel the urge to smoke more.</span>"
	if(prob(5))
		M.adjustBrainLoss(pick(1,2,3)

/datum/reagent/cannabis_s/overdose(var/mob/living/M as mob)
	if(prob(20))
		M << "You feel like you smoked too much."
	M.adjustToxLoss(1*REM)
	M.adjustOxyLoss(1*REM)
	if(prob(30))
		M.adjustBrainLoss(pick(1,2,3,4,5)

