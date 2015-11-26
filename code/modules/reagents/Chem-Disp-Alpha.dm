#define CHEM_DISPENSER_ENERGY_COST	0.1	//How many energy points do we use per unit of chemical?

/obj/machinery/chem_dispenseralpha
	name = "Chem Dispenser Alpha"
	density = 1
	anchored = 1
	icon = 'icons/obj/chemical.dmi'
	icon_state = "alphadisp"
	use_power = 0
	idle_power_usage = 40
	var/ui_title = "Chem Dispenser Alpha"
	var/energy = 100
	var/max_energy = 100
	var/amount = 30
	var/beaker = null
	var/recharged = 0
	var/hackedcheck = 0
	var/list/dispensable_reagents = list("iodine", "methanol", "xenon", "carbolic_acid", "acetic_acid", "citric_acid", "oxalic_acid", "phosphoric_acid", "calcium_hydroxide", "lithium_hydroxide", "zinc_hydroxide")
	var/list/hacked_reagents = list("toxin")
	var/hack_message = "You disable the safety safeguards, enabling the \"Mad Scientist\" mode."
	var/unhack_message = "You re-enable the safety safeguards, enabling the \"NT Standard\" mode."
	var/list/broken_requirements = list()
	var/broken_on_spawn = 0
	var/accept_drinking = 0
	var/recharge_delay = 5
	var/image/icon_beaker = null //cached overlay


/obj/machinery/chem_dispenseralpha/proc/recharge()
	if(stat & (BROKEN|NOPOWER)) return
	var/addenergy = 1
	var/oldenergy = energy
	energy = min(energy + addenergy, max_energy)
	if(energy != oldenergy)
		use_power(1500) // This thing uses up alot of power (this is still low as shit for creating reagents from thin air)
		nanomanager.update_uis(src) // update all UIs attached to src

	..()
	nanomanager.update_uis(src) // update all UIs attached to src

/obj/machinery/chem_dispenseralpha/process()
	if(recharged <= 0)
		recharge()
		recharged = 15
	else
		recharged -= 1

/obj/machinery/chem_dispenseralpha/New()
	..()
	recharge()
	dispensable_reagents = sortList(dispensable_reagents)


/obj/machinery/chem_dispenseralpha/ex_act(severity)
	switch(severity)
		if(1.0)
			del(src)
			return
		if(2.0)
			if (prob(50))
				del(src)
				return

/obj/machinery/chem_dispenseralpha/blob_act()
	if (prob(50))
		del(src)

/obj/machinery/chem_dispenseralpha/meteorhit()
	del(src)
	return

 /**
  * The ui_interact proc is used to open and update Nano UIs
  * If ui_interact is not used then the UI will not update correctly
  * ui_interact is currently defined for /atom/movable
  *
  * @param user /mob The mob who is interacting with this ui
  * @param ui_key string A string key to use for this ui. Allows for multiple unique uis on one obj/mob (defaut value "main")
  *
  * @return nothing
  */
/obj/machinery/chem_dispenseralpha/ui_interact(mob/user, ui_key = "main",var/datum/nanoui/ui = null, var/force_open = 1)
	if(stat & (BROKEN|NOPOWER)) return
	if(user.stat || user.restrained()) return

	// this is the data which will be sent to the ui
	var/data[0]
	data["amount"] = amount
	data["energy"] = round(energy)
	data["maxEnergy"] = round(max_energy)
	data["isBeakerLoaded"] = beaker ? 1 : 0
	data["glass"] = accept_drinking
	var beakerContents[0]
	var beakerCurrentVolume = 0
	if(beaker && beaker:reagents && beaker:reagents.reagent_list.len)
		for(var/datum/reagent/R in beaker:reagents.reagent_list)
			beakerContents.Add(list(list("name" = R.name, "volume" = R.volume))) // list in a list because Byond merges the first list...
			beakerCurrentVolume += R.volume
	data["beakerContents"] = beakerContents

	if (beaker)
		data["beakerCurrentVolume"] = beakerCurrentVolume
		data["beakerMaxVolume"] = beaker:volume
	else
		data["beakerCurrentVolume"] = null
		data["beakerMaxVolume"] = null

	var chemicals[0]
	for (var/re in dispensable_reagents)
		var/datum/reagent/temp = chemical_reagents_list[re]
		if(temp)
			chemicals.Add(list(list("title" = temp.name, "id" = temp.id, "commands" = list("dispense" = temp.id)))) // list in a list because Byond merges the first list...
	data["chemicals"] = chemicals

	// update the ui if it exists, returns null if no ui is passed/found
	ui = nanomanager.try_update_ui(user, src, ui_key, ui, data, force_open)
	if (!ui)
		// the ui does not exist, so we'll create a new() one
        // for a list of parameters and their descriptions see the code docs in \code\modules\nano\nanoui.dm
		ui = new(user, src, ui_key, "chem_dispenser.tmpl", ui_title, 390, 655)
		// when the ui is first opened this is the data it will use
		ui.set_initial_data(data)
		// open the new ui window
		ui.open()

/obj/machinery/chem_dispenseralpha/Topic(href, href_list)
	if(stat & (NOPOWER|BROKEN))
		return 0 // don't update UIs attached to this object

	if(href_list["amount"])
		amount = round(text2num(href_list["amount"]), 5) // round to nearest 5
		if (amount < 0) // Since the user can actually type the commands himself, some sanity checking
			amount = 0
		if (amount > 120)
			amount = 120

	if(href_list["dispense"])
		if (dispensable_reagents.Find(href_list["dispense"]) && beaker != null)
			var/obj/item/weapon/reagent_containers/glass/B = src.beaker
			var/datum/reagents/R = B.reagents
			var/space = R.maximum_volume - R.total_volume

			R.add_reagent(href_list["dispense"], min(amount, energy * 10, space))
			energy = max(energy - min(amount, energy * 10, space) / 10, 0)

	if(href_list["ejectBeaker"])
		if(beaker)
			var/obj/item/weapon/reagent_containers/B = beaker
			B.loc = loc
			beaker = null

	add_fingerprint(usr)
	return 1 // update UIs attached to this object

/obj/machinery/chem_dispenseralpha/attackby(var/obj/item/weapon/reagent_containers/B as obj, var/mob/user as mob)
	if(isrobot(user))
		return 1
	if(src.beaker)
		user << "Something is already loaded into the machine."
		return
	if(istype(B, /obj/item/weapon/reagent_containers/glass) || istype(B, /obj/item/weapon/reagent_containers/food))
		if(!accept_drinking && istype(B,/obj/item/weapon/reagent_containers/food))
			user << "<span class='notice'>This machine only accepts beakers</span>"
			return
		src.beaker =  B
		user.drop_item()
		B.loc = src
		user << "You set [B] on the machine."
		nanomanager.update_uis(src) // update all UIs attached to src
		return

/obj/machinery/chem_dispenseralpha/attackby(var/obj/item/weapon/B as obj, var/mob/user as mob, params)
	..()
	if(istype(B, /obj/item/device/multitool))
		if(hackedcheck == 0)
			user << hack_message
			dispensable_reagents += hacked_reagents
			hackedcheck = 1
			return

		else
			user << unhack_message
			dispensable_reagents -= hacked_reagents
			hackedcheck = 0
			return

/obj/machinery/chem_dispenseralpha/attack_ai(mob/user as mob)
	return src.attack_hand(user)

/obj/machinery/chem_dispenseralpha/attack_hand(mob/user as mob)
	if(stat & BROKEN)
		return
	ui_interact(user)
