/obj/item/weapon/reagent_containers/chem-carts
	name = "chemical dispenser cartridge"
	desc = "This goes in a chemical dispenser."
	icon_state = "cartridge"
	var/volume = null
	var/current_vol = null
	var/max_vol = null
	var/recharge_rate = null
	var/min_vol = 0
	var/transferamount = null
	var/spawn_reagent = null
	var/label = ""

	w_class = 3

	amount_per_transfer_from_this = 50
	// Large, but inaccurate. Use a chem dispenser or beaker for accuracy.
	possible_transfer_amounts = list(50, 100)
	unacidable = 1

/obj/item/weapon/reagent_containers/chem-carts/large
	name = "chemical dispenser cartridge"
	desc = "This goes in a chemical dispenser."
	icon_state = "cartridge"
	volume = 500
	max_vol = 500
	recharge_rate = 0.4
	min_vol = 0

	w_class = 3

	amount_per_transfer_from_this = 50
	// Large, but inaccurate. Use a chem dispenser or beaker for accuracy.
	possible_transfer_amounts = list(50, 100)
	unacidable = 1

/obj/item/weapon/reagent_containers/chem-carts/large/New()
	..()
	if(spawn_reagent)
		reagents.add_reagent(spawn_reagent, volume)
		var/datum/reagent/R = chemical_reagents_list[spawn_reagent]
		setLabel(R.name)

/obj/item/weapon/reagent_containers/chem-carts/proc/replenish()\
	var/current_vol =
	if(reagents.total_volume < max_volume)
		reagents.add_reagent(addreagent)
		nanomanager.update_uis(src)