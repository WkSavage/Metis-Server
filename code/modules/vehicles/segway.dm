/obj/vehicle/segway
	name = "segway"
	desc = "Woop-woop 'dats the sound of 'da police."
	icon = 'icons/obj/vehicles.dmi'
	icon_state = "segway"
	on = 0
	powered = 1
	locked = 0
	atom/movable/load

	load_item_visible = 1
	load_offset_x = 0
	mob_offset_y = 7




/obj/vehicle/segway/New()
	..()
	cell = new /obj/item/weapon/cell/high

/obj/vehicle/segway/Move()
	if(on && cell.charge < charge_use)
		turn_off()
		update_stats()

		return 0

	return ..()


/obj/vehicle/segway/attackby(obj/item/weapon/W as obj, mob/user as mob)

/obj/vehicle/segway/update_icon()
	if(open)
		icon_state = initial(icon_state) + "_open"
	else
		icon_state = initial(icon_state)

/obj/vehicle/segway/insert_cell(var/obj/item/weapon/cell/C, var/mob/living/carbon/human/H)
	return

/obj/vehicle/segway/insert_cell(var/obj/item/weapon/cell/C, var/mob/living/carbon/human/H)
	..()
	update_stats()

/obj/vehicle/segway/remove_cell(var/mob/living/carbon/human/H)
	..()
	update_stats()

/obj/vehicle/segway/Bump(atom/Obstacle)
	var/obj/machinery/door/D = Obstacle
	var/mob/living/carbon/human/H = load
	if(istype(D) && istype(H))
		D.Bumped(H)		//a little hacky, but hey, it works, and respects access rights

	..()

/obj/vehicle/segway/Bump(atom/Obstacle)
		return //so people can't knock others over by pushing a trolley around

/obj/vehicle/segway/relaymove(mob/user, direction)
	if(user != load)
		return 0
	else
		return ..()

/obj/vehicle/segway/examine()
	..()

	if(!istype(usr, /mob/living/carbon/human))
		return

	if(get_dist(usr,src) <= 1)
		usr << "The charge meter reads [cell? round(cell.percent(), 0.01) : 0]%"

/obj/vehicle/segway/verb/start_engine()
	set name = "Start engine"
	set category = "Object"
	set src in view(1)

	if(!istype(usr, /mob/living/carbon/human))
		return

	if(on)
		usr << "The engine is already running."
		return

	turn_on()
	if (on)
		usr << "You start [src]'s engine."
	else
		if(cell.charge < charge_use)
			usr << "[src] is out of power."
		else
			usr << "[src]'s engine won't start."

/obj/vehicle/segway/verb/stop_engine()
	set name = "Stop engine"
	set category = "Object"
	set src in view(1)

	if(!istype(usr, /mob/living/carbon/human))
		return

	if(!on)
		usr << "The engine is already stopped."
		return

	turn_off()
	if (!on)
		usr << "You stop [src]'s engine."

/obj/vehicle/segway/load(var/atom/movable/C)
	if(!istype(C, /mob/living/carbon/human))
		return 0


	if(load)
		return 1

/obj/vehicle/segway/load(var/atom/movable/C)
	if(!istype(C, /mob/living/carbon/human))
		return 0

/obj/vehicle/segway/load(var/atom/movable/C)
	//This loads objects onto the vehicle so they can still be interacted with.
	//Define allowed items for loading in specific vehicle definitions.
	if(!isturf(C.loc)) //To prevent loading things from someone's inventory, which wouldn't get handled properly.
		return 0
	if(load || C.anchored)
		return 0

	// if a create/closet, close before loading
	var/obj/structure/closet/crate = C
	if(istype(crate))
		crate.close()

	C.forceMove(loc)
	C.set_dir(dir)
	C.anchored = 1

	load = C

	if(load_item_visible)
		C.pixel_x += load_offset_x
		if(ismob(C))
			C.pixel_y += mob_offset_y
		else
			C.pixel_y += load_offset_y
		C.layer = layer + 0.1		//so it sits above the vehicle

	if(ismob(C))
		buckle_mob(C)

	return 1


/obj/vehicle/segwat/unload(var/mob/user, var/direction)
	if(!load)
		return

	var/turf/dest = null

	//find a turf to unload to
	if(direction)	//if direction specified, unload in that direction
		dest = get_step(src, direction)
	else if(user)	//if a user has unloaded the vehicle, unload at their feet
		dest = get_turf(user)

	if(!dest)
		dest = get_step_to(src, get_step(src, turn(dir, 90))) //try unloading to the side of the vehicle first if neither of the above are present

	//if these all result in the same turf as the vehicle or nullspace, pick a new turf with open space
	if(!dest || dest == get_turf(src))
		var/list/options = new()
		for(var/test_dir in alldirs)
			var/new_dir = get_step_to(src, get_step(src, test_dir))
			if(new_dir && load.Adjacent(new_dir))
				options += new_dir
		if(options.len)
			dest = pick(options)
		else
			dest = get_turf(src)	//otherwise just dump it on the same turf as the vehicle

	if(!isturf(dest))	//if there still is nowhere to unload, cancel out since the vehicle is probably in nullspace
		return 0

	load.forceMove(dest)
	load.set_dir(get_dir(loc, dest))
	load.anchored = 0		//we can only load non-anchored items, so it makes sense to set this to false
	load.pixel_x = initial(load.pixel_x)
	load.pixel_y = initial(load.pixel_y)
	load.layer = initial(load.layer)

	if(ismob(load))
		unbuckle_mob(load)

	load = null

	return 1


//-------------------------------------------------------
// Stat update procs
//-------------------------------------------------------
/obj/vehicle/segwat/update_stats()
	return

/obj/vehicle/segway/attack_generic(var/mob/user, var/damage, var/attack_message)
	if(!damage)
		return
	visible_message("<span class='danger'>[user] [attack_message] the [src]!</span>")
	user.attack_log += text("\[[time_stamp()]\] <font color='red'>attacked [src.name]</font>")
	user.do_attack_animation(src)
	src.health -= damage
	if(prob(10))
		new /obj/effect/decal/cleanable/blood/oil(src.loc)
	spawn(1) healthcheck()
	return 1


	return ..()

