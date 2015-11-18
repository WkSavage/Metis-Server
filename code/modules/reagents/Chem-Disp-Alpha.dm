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
	var/list/dispensable_reagents = list("carbolic_acid","acetic_acid","citric_acid","oxalic_acid","phosphoric_acid","calcium_hydroxide",
	"lithium_hydroxide","zinc_hydroxide","xenon","methanol","iodine")
	var/hack_message = "You disable the safety safeguards, enabling the \"Mad Scientist\" mode."
	var/unhack_message = "You re-enable the safety safeguards, enabling the \"NT Standard\" mode."
	var/list/broken_requirements = list()
	var/broken_on_spawn = 0
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

/obj/machinery/chem_dispenseralpha/power_change()
	if(powered())
		stat &= ~NOPOWER
	else
		spawn(rand(0, 15))
			stat |= NOPOWER
	nanomanager.update_uis(src) // update all UIs attached to src

/obj/machinery/chem_dispenseralpha/process()

	if(recharged < 0)
		recharge()
		recharged = recharge_delay
	else
		recharged -= 1

/obj/machinery/chem_dispenseralpha/New()
	..()
	recharge()
	dispensable_reagents = sortList(dispensable_reagents)

	if(broken_on_spawn)
		overlays.Cut()
		var/amount = pick(3,3,4)
		var/list/options = list()
		options[/obj/item/weapon/stock_parts/capacitor/adv] = "Add an advanced capacitor to fix it."
		options[/obj/item/weapon/stock_parts/console_screen] = "Replace the console screen to fix it."
		options[/obj/item/weapon/stock_parts/manipulator/pico] = "Upgrade to a pico manipulator to fix it."
		options[/obj/item/weapon/stock_parts/matter_bin/super] = "Give it a super matter bin to fix it."
//		options[/obj/item/weapon/stock_parts/cell/super] = "Replace the reagent synthesizer with a super capacity cell to fix it."
		options[/obj/item/device/mass_spectrometer/adv] = "Replace the reagent scanner with an advanced mass spectrometer to fix it"
		options[/obj/item/weapon/stock_parts/micro_laser/high] = "Repair the reagent synthesizer with an high-power micro-laser to fix it"
		options[/obj/item/device/reagent_scanner/adv] = "Replace the reagent scanner with an advanced reagent scanner to fix it"
		options[/obj/item/stack/nanopaste] = "Apply some nanopaste to the broken nozzles to fix it."
//		options[/obj/item/stack/sheet/plasteel] = "Surround the outside with a plasteel cover to fix it."
//		options[/obj/item/stack/sheet/rglass] = "Insert a pane of reinforced glass to fix it."

		while(amount > 0)
			amount -= 1

			var/index = pick(options)
			broken_requirements[index] = options[index]
			options -= index


/obj/machinery/chem_dispenseralpha/ex_act(severity)
	switch(severity)
		if(1.0)
			qdel(src)
			return
		if(2.0)
			if (prob(50))
				qdel(src)
				return

/obj/machinery/chem_dispenseralpha/blob_act()
	if (prob(50))
		qdel(src)

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
	if(broken_requirements.len)
		user << "<span class='warning'>[src] is broken. [broken_requirements[broken_requirements[1]]]</span>"
		return


	// this is the data which will be sent to the ui
	var/data[0]
	data["amount"] = amount
	data["energy"] = round(energy)
	data["maxEnergy"] = round(max_energy)
	data["isBeakerLoaded"] = beaker ? 1 : 0

	var beakerContents[0]
	var beakerCurrentVolume = 0
	if(beaker && beaker:reagents && beaker:reagents.reagent_list.len)
		for(var/datum/reagent/R in beaker:reagents.reagent_list)
			beakerContents.Add(list(list("name" = R.name, "id"=R.id, "volume" = R.volume))) // list in a list because Byond merges the first list...
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
	if(..())
		return 1

	if(href_list["amount"])
		amount = round(text2num(href_list["amount"]), 5) // round to nearest 5
		if (amount < 0) // Since the user can actually type the commands himself, some sanity checking
			amount = 0
		if (amount > 100)
			amount = 100

	if(href_list["dispense"])
		if (dispensable_reagents.Find(href_list["dispense"]) && beaker != null)
			var/obj/item/weapon/reagent_containers/glass/B = src.beaker
			var/datum/reagents/R = B.reagents
			var/space = R.maximum_volume - R.total_volume

			R.add_reagent(href_list["dispense"], min(amount, energy * 10, space))
			energy = max(energy - min(amount, energy * 10, space) / 10, 0)
			overlays.Cut()
			icon_beaker = image('icons/obj/chemical.dmi', src, "disp_beaker") //randomize beaker overlay position.
			icon_beaker.pixel_x = rand(-10,5)
			overlays += icon_beaker

	if(href_list["remove"])
		if(beaker)
			if(href_list["removeamount"])
				var/amount = text2num(href_list["removeamount"])
				if(isnum(amount) && (amount > 0))
					var/obj/item/weapon/reagent_containers/glass/B = beaker
					var/datum/reagents/R = B.reagents
					var/id = href_list["remove"]
					R.remove_reagent(id, amount)

	if(href_list["ejectBeaker"])
		if(beaker)
			var/obj/item/weapon/reagent_containers/glass/B = beaker
			B.forceMove(loc)
			beaker = null
			overlays.Cut()
	add_fingerprint(usr)
	return 1 // update UIs attached to this object

/obj/machinery/chem_dispenseralpha/attackby(var/obj/item/weapon/reagent_containers/B as obj, var/mob/user as mob, params)
	if(isrobot(user))
		return

	if(broken_requirements.len && B.type == broken_requirements[1])
		if(istype(B,/obj/item/stack))
			var/obj/item/stack/S = B
			S.use(1)
		else
			if(!user.drop_item())
				user << "<span class='warning'>\The [B] is stuck to you!</span>"
				return
			qdel(B)
		broken_requirements -= broken_requirements[1]
		user << "<span class='notice'>You fix [src].</span>"
		return

	if(src.beaker)
		user << "<span class='warning'>Something is already loaded into the machine.</span>"
		return

	if(istype(B, /obj/item/weapon/reagent_containers/glass) || istype(B, /obj/item/weapon/reagent_containers/food/drinks))
		src.beaker =  B
		if(!user.drop_item())
			user << "<span class='warning'>\The [B] is stuck to you!</span>"
			return
		B.forceMove(src)
		user << "<span class='notice'>You set [B] on the machine.</span>"
		nanomanager.update_uis(src) // update all UIs attached to src
		if(!icon_beaker)
			icon_beaker = image('icons/obj/chemical.dmi', src, "disp_beaker") //randomize beaker overlay position.
		icon_beaker.pixel_x = rand(-10,5)
		overlays += icon_beaker
		return

/obj/machinery/chem_dispenseralpha/attack_ai(mob/user as mob)
	return src.attack_hand(user)

/obj/machinery/chem_dispenseralpha/attack_ghost(mob/user as mob)
	return src.attack_hand(user)

/obj/machinery/chem_dispenseralpha/attack_hand(mob/user as mob)
	if(stat & BROKEN)
		return

	ui_interact(user)