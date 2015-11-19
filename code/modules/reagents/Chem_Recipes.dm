/datum/chemical_reaction
	var/name = null
	var/id = null
	var/result = null
	var/list/required_reagents = list()
	var/list/catalysts = list()
	var/list/inhibitors = list()
	var/min_temp = 0		//Minimum temperature required for the reaction to occur (heat to/above this). min_temp = 0 means no requirement
	var/max_temp = 9999		//Maximum temperature allowed for the reaction to occur (cool to/below this).
	var/result_amount = 0
	var/mix_message = "The solution begins to bubble."
	var/log_is_important = 0 // If this reaction should be considered important for logging. Important recipes message admins when mixed, non-important ones just log to file.

/datum/chemical_reaction/proc/can_happen(var/datum/reagents/holder)
	return 1

/datum/chemical_reaction/proc/on_reaction(var/datum/reagents/holder, var/created_volume)
	return

/datum/chemical_reaction/proc/send_data(var/datum/reagents/T)
	return null

//////////

/datum/chemical_reaction/ibuprofen //T1
	name = "Ibuprofen"
	id = "ibuprofen"
	result = "ibuprofen"
	required_reagents = list("carbon" = 1, "oxygen" = 1, "chlorine" = 1)
	result_amount = 3

/datum/chemical_reaction/ketoprofen //T2
	name = "Ketoprofen"
	id = "ketoprofen"
	result = "ketoprofen"
	required_reagents = list("ibuprofen" = 1, "carbolic_acid" = 1)
	result_amount = 2

/datum/chemical_reaction/oxycodone //T3
	name = "Oxycodone"
	id = "oxycodone"
	result = "oxycodone"
	required_reagents = list("ketoprofen" = 2, "ethanol" = 1, "acetic_acid" = 1)
	result_amount = 2
	min_temp = 371

/datum/chemical_reaction/norsodine //T4
	name = "Norsodine"
	id = "norsodine"
	result = "norsodine"
	required_reagents = list("ketoprofen" = 1, "oxycodone" = 1)
	mix_message = "The mixture yields a pink liquid."
	result_amount = 2
	catalysts = list("react_a" = 1)

/datum/chemical_reaction/oxymorphone //T5 Special (Hidden Recipe)
	name = "Oxymorphone"
	id = "oxymorphone"
	result = "oxymorphone"
	required_reagents = list("sugar" = 5, "modafinil" = 1, "norsodine" = 1, "oxycodone" = 1)
	mix_message = "The mixture yields a strong bubbling pink liquid."
	result_amount = 3
	max_temp = 211
	catalysts = list("react_c" = 1)

/////////

/datum/chemical_reaction/dylovene   //T1
	name = "Dylovene"
	id = "dylovene"
	result = "dylovene"
	required_reagents = list("water" = 1, "nitrogen" = 1, "oxalic_acid" = 1)
	result_amount = 3

/datum/chemical_reaction/cedilanid   //T2
	name = "Cedilanid"
	id = "cedilanid"
	result = "cedilanid"
	required_reagents = list("dylovene" = 1, "lithium_hydroxide" = 1, "silicon" = 1)
	result_amount = 2

/datum/chemical_reaction/neodextraminesolution //T3
	name = "Neodextramine Solution"
	id = "neodextraminesolution"
	result = "neodextraminesolution"
	required_reagents = list("cedilanid" = 2, "lithium_hydroxide" = 1, "oxalic_acid" = 1, "sugar" = 1)
	catalysts = list("react_c" = 1)
	result_amount = 3

/datum/chemical_reaction/dermalopein //T4
	name = "Dermalopein"
	id = "dermalopein"
	result = "dermalopein"
	required_reagents = list("neodextraminesolution" = 3, "dylovene" = 1, "acetic_acid" = 1)
	result_amount = 2
	max_temp = 120

////////////

/datum/chemical_reaction/demerol //T1
	name = "Demerol"
	id = "demerol"
	result = "demerol"
	required_reagents = list("ibuprofen" = 1, "phosphoric_acid" = 1)
	result_amount = 2

/datum/chemical_reaction/pamelor //T2
	name = "Pamelor"
	id = "pamelor"
	result = "pamelor"
	required_reagents = list("ibuprofen" = 1, "demerol" = 1, "calcium_hydroxide" = 1)
	result_amount = 2

/datum/chemical_reaction/amytal //T3
	name = "Amytal"
	id = "amytal"
	result = "amytal"
	required_reagents = list("pamelor" = 2, "citric_acid" = 1,  "xenon" = 2, "citric_acid" = 1)
	result_amount = 1
	min_temp = 550

/datum/chemical_reaction/hqem //T4
	name = "Hyvroxilated Quint-Ethyl Metacetamin"
	id = "hqem"
	result = "hqem"
	required_reagents = list("amytal" = 1, "pamelor" = 1, "zinc_hydroxide" = 1)
	result_amount = 1
	catalysts = list("react_b" = 1)

///////

/datum/chemical_reaction/hyperzine   //L-T1
	name = "Hyperzine"
	id = "hyperzine"
	result = "hyperzine"
	required_reagents = list("xenon" = 1, "sugar" = 1, "phosphorus" = 1, "carbolic_acid" = 1)
	result_amount = 4

/datum/chemical_reaction/inaprovaline  //T1
	name = "Inaprovaline"
	id = "inaprovaline"
	result = "inaprovaline"
	required_reagents = list("hyperzine" = 1, "sugar" = 1, "water" = 1)
	result_amount = 2

/datum/chemical_reaction/modafinil  //T2
	name = "Modafinil"
	id = "modafinil"
	result = "modafinil"
	required_reagents = list("inaprovaline" = 1, "phosphorus" = 1, "lithium_hydroxide" = 1)
	result_amount = 4

/datum/chemical_reaction/epinephrine  //T3
	name = "Epinephrine"
	id = "epinephrine"
	result = "epinephrine"
	required_reagents = list("modafinil" = 1, "hyperzine" = 1)
	result_amount = 2
	min_temp = 401

/datum/chemical_reaction/dextroamphetamine  //T4
	name = "Dextroamphetamine"
	id = "dextroamphetamine"
	result = "dextroamphetamine"
	required_reagents = list("epinephrine" = 3, "ketoprofen" = 1, "phosphoric_acid" = 1)
	result_amount = 2
	min_temp = 600
	catalysts = list("react_a" = 1)

/datum/chemical_reaction/stimpak  //T5 Special
	name = "FastActing StimPak"
	id = "stimpak"
	result = "stimpak"
	required_reagents = list("dextroamphetamine" = 1, "epinephrine" = 1, "phosphoric_acid" = 1, "ketoprofen" = 1)
	result_amount = 1
	min_temp = 570
	catalysts = list("react_b" = 1)

/datum/chemical_reaction/stimpakultra  //T5 Special Long Lasting.
	name = "StimPakUltra"
	id = "stimpakultra"
	result = "stimpakultra"
	required_reagents = list("dextroamphetamine" = 1, "epinephrine" = 1, "hyperzine" = 1, "phosphoric_acid" = 1)
	result_amount = 1
	min_temp = 750
	catalysts = list("react_b" = 1)

//////////////

/datum/chemical_reaction/alkysine
	name = "Alkysine"
	id = "alkysine"
	result = "alkysine"
	required_reagents = list("dylovene" = 1, "carbolic_acid" = 1, "silicon" = 1, "oxygen" = 1)
	result_amount = 4

/datum/chemical_reaction/hydromel
	name = "Hydromel"
	id = "hydromel"
	result = "hydromel"
	required_reagents = list("alkysine" = 1, "dylovene" = 1, "oxygen" = 1)
	result_amount = 3
	max_temp = 199

/datum/chemical_reaction/crystodigin
	name = "Crystodigin"
	id = "crystodigin"
	result = "crystodigin"
	required_reagents = list("hydromel" = 1, "alkysine" = 1, "phosphoric_acid" = 1)
	result_amount = 1
	max_temp = 105

//////////////

/datum/chemical_reaction/osmotrol //T1
	name = "Osmotrol"
	id = "osmotrol"
	result = "osmotrol"
	required_reagents = list("oxygen" = 1, "hyperzine" = 1)
	result_amount = 2

/datum/chemical_reaction/isoprovalyn //T2
	name = "Isoprovalyn"
	id = "isoprovalyn"
	result = "isoprovalyn"
	required_reagents = list("osmotrol" = 1, "hyperzine" = 1, "silicon" = 1, "oxygen" = 1)
	result_amount = 4

/datum/chemical_reaction/hexadrol //T3
	name = "Hexadrol"
	id = "hexadrol"
	result = "hexadrol"
	required_reagents = list("isoprovalyn" = 1, "ibuprofen" = 1, "oxalic_acid" = 1)
	result_amount = 3

/datum/chemical_reaction/oxycocet_osmo //T4
	name = "Oxycocet Osmo"
	id = "oxycocet_osmo"
	result = "oxycocet_osmo"
	required_reagents = list("hexadrol" = 1, "osmotrol" = 1, "oxygen" = 1, "hyperzine" = 1)
	result_amount = 1

/datum/chemical_reaction/oxycodan_hexadro //T5 Special
	name = "Oxycodan Hexadro"
	id = "oxycodan_hexadro"
	result = "oxycodan_hexadro"
	required_reagents = list("hexadrol" = 3, "isoprovalyn" = 1, "oxygen" = 1, "hyperzine" = 1)
	result_amount = 1

//////////////

/datum/chemical_reaction/kelotane //T1
	name = "Kelotane"
	id = "kelotane"
	result = "kelotane"
	required_reagents = list("silicon" = 1, "acetic_acid" = 1, "oxygen" = 1)
	result_amount = 2

/datum/chemical_reaction/asinolyathin //T2
	name = "Asinolyathin"
	id = "asinolyathin"
	result = "asinolyathin"
	required_reagents = list("kelotane" = 1, "xenon" = 1, "acetic_acid" = 1)
	result_amount = 2

 /datum/chemical_reaction/dramacline //T3
	name = "Dramacline"
	id = "dramacline"
	result = "dramacline"
	required_reagents = list("asinolyathin" = 1, "kelotane" = 1)
	result_amount = 2


/////////////

/datum/chemical_reaction/hyronalin //T1
	name = "Hyronalin"
	id = "hyronalin"
	result = "hyronalin"
	required_reagents = list("cedilanid" = 1, "iodine" = 1)
	result_amount = 2

/datum/chemical_reaction/arithrazine //T2
	name = "Arithrazine"
	id = "arithrazine"
	result = "arithrazine"
	required_reagents = list("hyronalin" = 3, "iodine" = 1, "cedilanid" = 1)
	result_amount = 3

/datum/chemical_reaction/radaway //T3
	name = "RadAway"
	id = "radaway"
	result = "radaway"
	required_reagents = list("arithrazine" = 1, "neodextraminesolution" = 1)
	result_amount = 1

////////////

/datum/chemical_reaction/ethylredoxrazine
	name = "Ethylredoxrazine"
	id = "ethylredoxrazine"
	result = "ethylredoxrazine"
	required_reagents = list("oxygen" = 1, "anti_toxin" = 1, "carbon" = 1)
	result_amount = 3

/datum/chemical_reaction/leporazine
	name = "Leporazine"
	id = "leporazine"
	result = "leporazine"
	required_reagents = list("silicon" = 1, "copper" = 1)
	catalysts = list("phoron" = 1)
	result_amount = 2

/datum/chemical_reaction/sterilizine
	name = "Sterilizine"
	id = "sterilizine"
	result = "sterilizine"
	required_reagents = list("ethanol" = 1, "anti_toxin" = 1, "chlorine" = 1)
	result_amount = 3

/datum/chemical_reaction/spaceacillin
	name = "Spaceacillin"
	id = "spaceacillin"
	result = "spaceacillin"
	required_reagents = list("cryptobiolin" = 1, "inaprovaline" = 1)
	result_amount = 2

/datum/chemical_reaction/ryetalyn
	name = "Ryetalyn"
	id = "ryetalyn"
	result = "ryetalyn"
	required_reagents = list("arithrazine" = 1, "carbon" = 1)
	result_amount = 2

/datum/chemical_reaction/peridaxon
	name = "Peridaxon"
	id = "peridaxon"
	result = "peridaxon"
	required_reagents = list("bicaridine" = 2, "clonexadone" = 2)
	catalysts = list("phoron" = 1)
	result_amount = 2

/datum/chemical_reaction/imidazoline
	name = "imidazoline"
	id = "imidazoline"
	result = "imidazoline"
	required_reagents = list("carbon" = 1, "hydrogen" = 1, "anti_toxin" = 1)
	result_amount = 2

/datum/chemical_reaction/provolanaproxalidamine
	name = "Provolanaproxalidamine"
	id = "provolanaproxalidamine"
	result = "provolanaproxalidamine"
	required_reagents = list("carbon" = 1, "hydrogen" = 1, "anti_toxin" = 1)
	result_amount = 2

/datum/chemical_reaction/cryoxadone
	name = "Cryoxadone"
	id = "cryoxadone"
	result = "cryoxadone"
	required_reagents = list("dexalin" = 1, "water" = 1, "oxygen" = 1)
	result_amount = 3

/datum/chemical_reaction/clonexadone
	name = "Clonexadone"
	id = "clonexadone"
	result = "clonexadone"
	required_reagents = list("cryoxadone" = 1, "sodium" = 1, "phoron" = 0.1)
	catalysts = list("phoron" = 1)
	result_amount = 2

/datum/chemical_reaction/methylphenidate
	name = "Methylphenidate"
	id = "methylphenidate"
	result = "methylphenidate"
	required_reagents = list("lsd" = 1, "hydrogen" = 1)
	result_amount = 3

/datum/chemical_reaction/citalopram
	name = "Citalopram"
	id = "citalopram"
	result = "citalopram"
	required_reagents = list("lsd" = 1, "carbon" = 1)
	result_amount = 3


/datum/chemical_reaction/paroxetine
	name = "Paroxetine"
	id = "paroxetine"
	result = "paroxetine"
	required_reagents = list("lsd" = 1, "oxygen" = 1, "inaprovaline" = 1)
	result_amount = 3

///////////////

/datum/chemical_reaction/phoronsolidification
	name = "Solid Phoron"
	id = "solidphoron"
	result = null
	required_reagents = list("iron" = 5, "frostoil" = 5, "phoron" = 20)
	result_amount = 1

/datum/chemical_reaction/phoronsolidification/on_reaction(var/datum/reagents/holder, var/created_volume)
	new /obj/item/stack/material/phoron(get_turf(holder.my_atom), created_volume)
	return

/datum/chemical_reaction/plastication
	name = "Plastic"
	id = "solidplastic"
	result = null
	required_reagents = list("pacid" = 1, "plasticide" = 2)
	result_amount = 1

/datum/chemical_reaction/plastication/on_reaction(var/datum/reagents/holder, var/created_volume)
	new /obj/item/stack/material/plastic(get_turf(holder.my_atom), created_volume)
	return

/* Grenade reactions */

/datum/chemical_reaction/explosion_potassium
	name = "Explosion"
	id = "explosion_potassium"
	result = null
	required_reagents = list("water" = 1, "potassium" = 1)
	result_amount = 2
	mix_message = null

/datum/chemical_reaction/explosion_potassium/on_reaction(var/datum/reagents/holder, var/created_volume)
	var/datum/effect/effect/system/reagents_explosion/e = new()
	e.set_up(round (created_volume/10, 1), holder.my_atom, 0, 0)
	e.holder_damage(holder.my_atom)
	if(isliving(holder.my_atom))
		e.amount *= 0.5
		var/mob/living/L = holder.my_atom
		if(L.stat != DEAD)
			e.amount *= 0.5
	e.start()
	holder.clear_reagents()
	return

/datum/chemical_reaction/flash_powder
	name = "Flash powder"
	id = "flash_powder"
	result = null
	required_reagents = list("aluminum" = 1, "potassium" = 1, "sulfur" = 1 )
	result_amount = null

/datum/chemical_reaction/flash_powder/on_reaction(var/datum/reagents/holder, var/created_volume)
	var/location = get_turf(holder.my_atom)
	var/datum/effect/effect/system/spark_spread/s = new /datum/effect/effect/system/spark_spread
	s.set_up(2, 1, location)
	s.start()
	for(var/mob/living/carbon/M in viewers(world.view, location))
		switch(get_dist(M, location))
			if(0 to 3)
				if(hasvar(M, "glasses"))
					if(istype(M:glasses, /obj/item/clothing/glasses/sunglasses))
						continue

				flick("e_flash", M.flash)
				M.Weaken(15)

			if(4 to 5)
				if(hasvar(M, "glasses"))
					if(istype(M:glasses, /obj/item/clothing/glasses/sunglasses))
						continue

				flick("e_flash", M.flash)
				M.Stun(5)

/datum/chemical_reaction/emp_pulse
	name = "EMP Pulse"
	id = "emp_pulse"
	result = null
	required_reagents = list("uranium" = 1, "iron" = 1) // Yes, laugh, it's the best recipe I could think of that makes a little bit of sense
	result_amount = 2

/datum/chemical_reaction/emp_pulse/on_reaction(var/datum/reagents/holder, var/created_volume)
	var/location = get_turf(holder.my_atom)
	// 100 created volume = 4 heavy range & 7 light range. A few tiles smaller than traitor EMP grandes.
	// 200 created volume = 8 heavy range & 14 light range. 4 tiles larger than traitor EMP grenades.
	empulse(location, round(created_volume / 24), round(created_volume / 14), 1)
	holder.clear_reagents()
	return

/datum/chemical_reaction/nitroglycerin
	name = "Nitroglycerin"
	id = "nitroglycerin"
	result = "nitroglycerin"
	required_reagents = list("glycerol" = 1, "pacid" = 1, "sacid" = 1)
	result_amount = 2
	log_is_important = 1

/datum/chemical_reaction/nitroglycerin/on_reaction(var/datum/reagents/holder, var/created_volume)
	var/datum/effect/effect/system/reagents_explosion/e = new()
	e.set_up(round (created_volume/2, 1), holder.my_atom, 0, 0)
	e.holder_damage(holder.my_atom)
	if(isliving(holder.my_atom))
		e.amount *= 0.5
		var/mob/living/L = holder.my_atom
		if(L.stat!=DEAD)
			e.amount *= 0.5
	e.start()

	holder.clear_reagents()
	return

/datum/chemical_reaction/napalm
	name = "Napalm"
	id = "napalm"
	result = null
	required_reagents = list("aluminum" = 1, "phoron" = 1, "sacid" = 1 )
	result_amount = 1

/datum/chemical_reaction/napalm/on_reaction(var/datum/reagents/holder, var/created_volume)
	var/turf/location = get_turf(holder.my_atom.loc)
	for(var/turf/simulated/floor/target_tile in range(0,location))
		target_tile.assume_gas("volatile_fuel", created_volume, 400+T0C)
		spawn (0) target_tile.hotspot_expose(700, 400)
	holder.del_reagent("napalm")
	return

/datum/chemical_reaction/chemsmoke
	name = "Chemsmoke"
	id = "chemsmoke"
	result = null
	required_reagents = list("potassium" = 1, "sugar" = 1, "phosphorus" = 1)
	result_amount = 0.4

/datum/chemical_reaction/chemsmoke/on_reaction(var/datum/reagents/holder, var/created_volume)
	var/location = get_turf(holder.my_atom)
	var/datum/effect/effect/system/smoke_spread/chem/S = new /datum/effect/effect/system/smoke_spread/chem
	S.attach(location)
	S.set_up(holder, created_volume, 0, location)
	playsound(location, 'sound/effects/smoke.ogg', 50, 1, -3)
	spawn(0)
		S.start()
	holder.clear_reagents()
	return

/datum/chemical_reaction/foam
	name = "Foam"
	id = "foam"
	result = null
	required_reagents = list("fluorosurfactant" = 1, "water" = 1)
	result_amount = 2
	mix_message = "The solution violently bubbles!"

/datum/chemical_reaction/foam/on_reaction(var/datum/reagents/holder, var/created_volume)
	var/location = get_turf(holder.my_atom)

	for(var/mob/M in viewers(5, location))
		M << "<span class='warning'>The solution spews out foam!</span>"

	var/datum/effect/effect/system/foam_spread/s = new()
	s.set_up(created_volume, location, holder, 0)
	s.start()
	holder.clear_reagents()
	return

/datum/chemical_reaction/metalfoam
	name = "Metal Foam"
	id = "metalfoam"
	result = null
	required_reagents = list("aluminum" = 3, "foaming_agent" = 1, "pacid" = 1)
	result_amount = 5

/datum/chemical_reaction/metalfoam/on_reaction(var/datum/reagents/holder, var/created_volume)
	var/location = get_turf(holder.my_atom)

	for(var/mob/M in viewers(5, location))
		M << "<span class='warning'>The solution spews out a metalic foam!</span>"

	var/datum/effect/effect/system/foam_spread/s = new()
	s.set_up(created_volume, location, holder, 1)
	s.start()
	return

/datum/chemical_reaction/ironfoam
	name = "Iron Foam"
	id = "ironlfoam"
	result = null
	required_reagents = list("iron" = 3, "foaming_agent" = 1, "pacid" = 1)
	result_amount = 5

/datum/chemical_reaction/ironfoam/on_reaction(var/datum/reagents/holder, var/created_volume)
	var/location = get_turf(holder.my_atom)

	for(var/mob/M in viewers(5, location))
		M << "<span class='warning'>The solution spews out a metalic foam!</span>"

	var/datum/effect/effect/system/foam_spread/s = new()
	s.set_up(created_volume, location, holder, 2)
	s.start()
	return

///////////////
//Chem Toxin Recipes:

/datum/chemical_reaction/soporific
	name = "Soporific"
	id = "soporific"
	result = "soporific"
	required_reagents = list("chloralhydrate" = 1, "nitrogen" = 1, "water" = 4)
	result_amount = 3

/datum/chemical_reaction/chloralhydrate
	name = "Chloral Hydrate"
	id = "chloralhydrate"
	result = "chloralhydrate"
	required_reagents = list("chlorine" = 1, "alkysine" = 1, "carbolic_acid" = 4)
	result_amount = 3
