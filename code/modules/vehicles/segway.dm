//old style PIMP-CART
/obj/structure/stool/bed/chair/janicart
	name = "janicart"
	desc = "A brave janitor cyborg gave its life to produce such an amazing combination of speed and utility."
	icon = 'icons/obj/vehicles.dmi'
	icon_state = "pussywagon"
	anchored = 0
	density = 1
	var/obj/item/weapon/storage/bag/trash/mybag = null
	var/callme = "pimpin' ride"	//how do people refer to it?
	var/move_delay = 0
	var/floorbuffer = 0
	var/keytype = /obj/item/key/janitor

/obj/structure/stool/bed/chair/janicart/New()
	handle_rotation()

/obj/structure/stool/bed/chair/janicart/Move(a, b, flag)
	..()
	if(floorbuffer)
		var/turf/tile = loc
		if(isturf(tile))
			tile.clean_blood()

/obj/structure/stool/bed/chair/janicart/examine(mob/user)
	..()
	if(floorbuffer)
		user << "It has been upgraded with a floor buffer."


/obj/structure/stool/bed/chair/janicart/attackby(obj/item/I, mob/user, params)
	if(istype(I, keytype))
		user << "Hold [I] in one of your hands while you drive this [callme]."
	else if(istype(I, /obj/item/weapon/storage/bag/trash))
		if(keytype == /obj/item/key/janitor)
			if(!user.drop_item())
				return
			user << "<span class='notice'>You hook the trashbag onto the [callme].</span>"
			I.loc = src
			mybag = I
//	else if(istype(I, /obj/item/janiupgrade))
//		if(keytype == /obj/item/key/janitor)
//			floorbuffer = 1
//			qdel(I)
//			user << "<span class='notice'>You upgrade the [callme] with the floor buffer.</span>"
//	update_icon()

/obj/structure/stool/bed/chair/janicart/update_icon()
	overlays.Cut()
	if(mybag)
		overlays += "cart_garbage"
	if(floorbuffer)
		overlays += "cart_buffer"

/obj/structure/stool/bed/chair/janicart/attack_hand(mob/user)
	if(mybag)
		mybag.loc = get_turf(user)
		user.put_in_hands(mybag)
		mybag = null
		update_icon()
	else
		..()

/obj/structure/stool/bed/chair/janicart/relaymove(mob/user, direction)
	if(user.stat || user.stunned || user.weakened || user.paralysis)
		unbuckle_mob()
	if(istype(user.l_hand, keytype) || istype(user.r_hand, keytype))
		if(Move() || !has_gravity(src.loc) || move_delay || !isturf(loc))
			return
		step(src, direction)
		update_mob()
		handle_rotation()
		move_delay = 1
		spawn(2)
			move_delay = 0
	else
		user << "<span class='notice'>You'll need the keys in one of your hands to drive this [callme].</span>"

/obj/structure/stool/bed/chair/janicart/user_buckle_mob(var/atom/movable/C)
	if(!istype(C, /mob/living/carbon/human))
		buckled_mob = 1

	return ..()

/obj/structure/stool/bed/chair/janicart/unbuckle_mob()
	if(buckled_mob)
		user_unbuckle_mob()
	..()

/obj/structure/stool/bed/chair/janicart/handle_rotation()
	if((dir == SOUTH) || (dir == WEST) || (dir == EAST))
		layer = FLY_LAYER
	else
		layer = OBJ_LAYER

	if(buckled_mob)
		if(buckled_mob.loc != loc)
			buckled_mob.buckled = null //Temporary, so Move() succeeds.
			buckled_mob.buckled = src //Restoring

	update_mob()


/obj/structure/stool/bed/chair/janicart/proc/update_mob()
	if(buckled_mob)
		buckled_mob.dir = dir
		switch(dir)
			if(SOUTH)
				buckled_mob.pixel_x = 0
				buckled_mob.pixel_y = 7
			if(WEST)
				buckled_mob.pixel_x = 12
				buckled_mob.pixel_y = 7
			if(NORTH)
				buckled_mob.pixel_x = 0
				buckled_mob.pixel_y = 4
			if(EAST)
				buckled_mob.pixel_x = -12
				buckled_mob.pixel_y = 7

/obj/item/key
	name = "key"
	desc = "A small grey key."
	icon = 'icons/obj/vehicles.dmi'
	icon_state = "keys"
	w_class = 1

/obj/item/key/janitor
	desc = "A keyring with a small steel key, and a pink fob reading \"Pussy Wagon\"."
	icon_state = "keys"

/obj/item/key/security
	desc = "A keyring with a small steel key, and a rubber stun baton accessory."
	icon_state = "keys"

//obj/item/janiupgrade
//	name = "floor buffer upgrade"
//	desc = "An upgrade for mobile janicarts."
//	icon = 'icons/obj/vehicles.dmi'
//	icon_state = "upgrade"

/obj/structure/stool/bed/chair/janicart/secway
	name = "secway"
	desc = "A brave security cyborg gave its life to help you look like a complete tool."
	icon = 'icons/obj/vehicles.dmi'
	icon_state = "segway"
	callme = "segway"
	keytype = /obj/item/key/security

/obj/structure/stool/bed/chair/janicart/secway/update_mob()
	if(buckled_mob)
		buckled_mob.dir = dir
		buckled_mob.pixel_y = 4
