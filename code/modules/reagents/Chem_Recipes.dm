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


/datum/chemical_reaction/charcoal
	name = "Charcoal"
	id = "charcoal"
	result = "charcoal"
	required_reagents = list("ash" = 1, "sodiumchloride" = 1)
	result_amount = 2
	mix_message = "The mixture yields a fine black powder."
	min_temp = 380

/datum/chemical_reaction/peridaxon
	name = "Peridaxon"
	id = "peridaxon"
	result = "peridaxon"
	required_reagents = list("bicaridine" = 2, "clonexadone" = 2)
	catalysts = list("phoron" = 1)
	result_amount = 2

/datum/chemical_reaction/carbolic_acid
	name = "Carbolic Acid"
	id = "carbolic_acid"
	result = "carbolic_acid"
	required_reagents = list("water" = 1, "chlorine" = 1)
	result_amount = 2

//////////

/datum/reagent/ibuprofen //T1
	name = "Ibuprofen"
	id = "ibuprofen"
	result = "ibuprofen"
	required_reagents = list("carbon" = 1, "oxygen" = 1, "methanol" = 1)
	result_amount = 3

/datum/reagent/ketoprofen //T2
	name = "Ketoprofen"
	id = "ketoprofen"
	result = "ibuprofen"
	required_reagents = list("ibuprofen" = 1, "carbolic_acid" = 1)
	result_amount = 2

/datum/reagent/oxycodone //T3
	name = "Oxycodone"
	id = "oxycodone"
	result = "oxycodone"
	required_reagents = list("alkysine" = 2, "cedilanid" = 1 "methanol" = 1)
	result_amount = 2
	min_temp = 371

/datum/reagent/norsodine //T4
	name = "Norsodine"
	id = "norsodine"
	result = "ibuprofen"
	required_reagents = list("ketoprofen" = 1, "oxycodone" = 1)
	mix_message = "The mixture yields a pink liquid."
	result_amount = 2

/datum/reagent/oxymorphone //T5 Special (Hidden Recipe)
	name = "Oxymorphone"
	id = "oxymorphone"
	result = "ibuprofen"
	required_reagents = list("sugar" = 5 "modafinil" = 1, "norsodine" = 1, "hqem" = 1)
	mix_message = "The mixture yields a strong pink liquid."
	result_amount = 3
	max_temp = 250