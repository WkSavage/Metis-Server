////////////////////////////////////////////////////////////////////////////////
/// Pills.
////////////////////////////////////////////////////////////////////////////////
/obj/item/weapon/reagent_containers/pill
	name = "pill"
	desc = "a pill."
	icon = 'icons/obj/chemical.dmi'
	icon_state = null
	item_state = "pill"
	possible_transfer_amounts = null
	w_class = 1
	slot_flags = SLOT_EARS
	volume = 60

	New()
		..()
		if(!icon_state)
			icon_state = "pill[rand(1, 20)]"

	attack(mob/M as mob, mob/user as mob, def_zone)
		if(M == user)

			if(istype(M, /mob/living/carbon/human))
				var/mob/living/carbon/human/H = M
				if(H.species.flags & IS_SYNTHETIC)
					H << "<span class='notice'>You have a monitor for a head, where do you think you're going to put that?</span>"
					return

				var/obj/item/blocked = H.check_mouth_coverage()
				if(blocked)
					user << "<span class='warning'>\The [blocked] is in the way!</span>"
					return

			M << "<span class='notice'>You swallow \the [src].</span>"
			M.drop_from_inventory(src) //icon update
			if(reagents.total_volume)
				reagents.trans_to_mob(M, reagents.total_volume, CHEM_INGEST)
			qdel(src)
			return 1

		else if(istype(M, /mob/living/carbon/human))

			var/mob/living/carbon/human/H = M
			if(H.species.flags & IS_SYNTHETIC)
				H << "<span class='notice'>They have a monitor for a head, where do you think you're going to put that?</span>"
				return

			var/obj/item/blocked = H.check_mouth_coverage()

			if(blocked)
				user << "<span class='warning'>\The [blocked] is in the way!</span>"
				return

			user.visible_message("<span class='warning'>[user] attempts to force [M] to swallow \the [src].</span>")

			if(!do_mob(user, M))
				return

			user.drop_from_inventory(src) //icon update
			user.visible_message("<span class='warning'>[user] forces [M] to swallow \the [src].</span>")

			var/contained = reagentlist()
			M.attack_log += text("\[[time_stamp()]\] <font color='orange'>Has been fed [name] by [key_name(user)] Reagents: [contained]</font>")
			user.attack_log += text("\[[time_stamp()]\] <font color='red'>Fed [name] to [key_name(M)] Reagents: [contained]</font>")
			msg_admin_attack("[key_name_admin(user)] fed [key_name_admin(M)] with [name] Reagents: [contained] (INTENT: [uppertext(user.a_intent)]) (<A HREF='?_src_=holder;adminplayerobservecoodjump=1;X=[user.x];Y=[user.y];Z=[user.z]'>JMP</a>)")

			if(reagents.total_volume)
				reagents.trans_to_mob(M, reagents.total_volume, CHEM_INGEST)
			qdel(src)

			return 1

		return 0

	afterattack(obj/target, mob/user, proximity)
		if(!proximity) return

		if(target.is_open_container() && target.reagents)
			if(!target.reagents.total_volume)
				user << "<span class='notice'>[target] is empty. Can't dissolve \the [src].</span>"
				return
			user << "<span class='notice'>You dissolve \the [src] in [target].</span>"

			user.attack_log += text("\[[time_stamp()]\] <font color='red'>Spiked \a [target] with a pill. Reagents: [reagentlist()]</font>")
			msg_admin_attack("[user.name] ([user.ckey]) spiked \a [target] with a pill. Reagents: [reagentlist()] (INTENT: [uppertext(user.a_intent)]) (<A HREF='?_src_=holder;adminplayerobservecoodjump=1;X=[user.x];Y=[user.y];Z=[user.z]'>JMP</a>)")

			reagents.trans_to(target, reagents.total_volume)
			for(var/mob/O in viewers(2, user))
				O.show_message("<span class='warning'>[user] puts something in \the [target].</span>", 1)

			qdel(src)

		return

////////////////////////////////////////////////////////////////////////////////
/// Pills. END
////////////////////////////////////////////////////////////////////////////////

//Pills
/obj/item/weapon/reagent_containers/pill/antitox
	name = "Anti-toxins pill"
	desc = "Neutralizes many common toxins."
	icon_state = "pill17"
	New()
		..()
		reagents.add_reagent("cedilanid", 25)

/obj/item/weapon/reagent_containers/pill/tox
	name = "Toxins pill"
	desc = "Highly toxic."
	icon_state = "pill5"
	New()
		..()
		reagents.add_reagent("toxin", 60)

/obj/item/weapon/reagent_containers/pill/cyanide
	name = "Cyanide pill"
	desc = "Don't swallow this."
	icon_state = "pill5"
	New()
		..()
		reagents.add_reagent("cyanide", 60)

/obj/item/weapon/reagent_containers/pill/adminordrazine
	name = "Adminordrazine pill"
	desc = "It's magic. We don't have to explain it."
	icon_state = "pill16"
	New()
		..()
		reagents.add_reagent("adminordrazine", 50)

/obj/item/weapon/reagent_containers/pill/stox
	name = "Sleeping pill"
	desc = "Commonly used to treat insomnia."
	icon_state = "pill8"
	New()
		..()
		reagents.add_reagent("soporific", 15)

/obj/item/weapon/reagent_containers/pill/kelotane
	name = "Kelotane pill"
	desc = "Used to treat burns."
	icon_state = "pill11"
	New()
		..()
		reagents.add_reagent("kelotane", 15)

/obj/item/weapon/reagent_containers/pill/paracetamol
	name = "Ibuprofen pill"
	desc = "Ibuprofen! A painkiller for the ages. Chewables!"
	icon_state = "pill8"
	New()
		..()
		reagents.add_reagent("ibuprofen", 25)

/obj/item/weapon/reagent_containers/pill/tramadol
	name = "Ketoprofen pill"
	desc = "A simple painkiller."
	icon_state = "pill8"
	New()
		..()
		reagents.add_reagent("ketoprofen", 20)


/obj/item/weapon/reagent_containers/pill/methylphenidate
	name = "Methylphenidate pill"
	desc = "Improves the ability to concentrate."
	icon_state = "pill8"
	New()
		..()
		reagents.add_reagent("methylphenidate", 15)

/obj/item/weapon/reagent_containers/pill/citalopram
	name = "Citalopram pill"
	desc = "Mild anti-depressant."
	icon_state = "pill8"
	New()
		..()
		reagents.add_reagent("citalopram", 15)


/obj/item/weapon/reagent_containers/pill/inaprovaline
	name = "Inaprovaline pill"
	desc = "Used to stabilize patients."
	icon_state = "pill20"
	New()
		..()
		reagents.add_reagent("inaprovaline", 30)

/obj/item/weapon/reagent_containers/pill/dexalin
	name = "Osmotrol pill"
	desc = "Used to treat oxygen deprivation."
	icon_state = "pill16"
	New()
		..()
		reagents.add_reagent("osmotrol", 15)

/obj/item/weapon/reagent_containers/pill/dexalin_plus
	name = "Hexadrol pill"
	desc = "Used to treat extreme oxygen deprivation."
	icon_state = "pill8"
	New()
		..()
		reagents.add_reagent("hexadrol", 15)

/obj/item/weapon/reagent_containers/pill/dylovene
	name = "Cedilanid pill"
	desc = "A broad-spectrum anti-toxin."
	icon_state = "pill13"
	New()
		..()
		reagents.add_reagent("cedilanid", 15)

/obj/item/weapon/reagent_containers/pill/inaprovaline
	name = "Inaprovaline pill"
	desc = "Used to stabilize patients."
	icon_state = "pill20"
	New()
		..()
		reagents.add_reagent("inaprovaline", 30)

/obj/item/weapon/reagent_containers/pill/epinephrine
	name = "Epinephrine pill"
	desc = "Used to stabilize patients."
	icon_state = "pill20"
	New()
		..()
		reagents.add_reagent("epinephrine", 25)

/obj/item/weapon/reagent_containers/pill/pamelor
	name = "Pamelor pill"
	desc = "Used to treat physical injuries."
	icon_state = "pill18"
	New()
		..()
		reagents.add_reagent("pamelor", 20)

/obj/item/weapon/reagent_containers/pill/happy
	name = "Happy pill"
	desc = "Happy happy joy joy!"
	icon_state = "pill18"
	New()
		..()
		reagents.add_reagent("space_drugs", 15)
		reagents.add_reagent("sugar", 15)

/obj/item/weapon/reagent_containers/pill/zoom
	name = "Zoom pill"
	desc = "Zoooom!"
	icon_state = "pill18"
	New()
		..()
		reagents.add_reagent("lsd", 10)
		reagents.add_reagent("hyperzine", 5)

/obj/item/weapon/reagent_containers/pill/spaceacillin
	name = "Spaceacillin pill"
	desc = "Contains antiviral agents."
	icon_state = "pill19"
	New()
		..()
		reagents.add_reagent("spaceacillin", 15)
