/*
 * Contents:
 *		Welding mask
 *		Cakehat
 *		Ushanka
 *		Pumpkin head
 *		Kitty ears
 *
 */

/*
 * Welding mask
 */
/obj/item/clothing/head/welding
	name = "welding helmet"
	desc = "A head-mounted face cover designed to protect the wearer completely from space-arc eye."
	icon_state = "welding"
	flags = HEADCOVERSEYES | HEADCOVERSMOUTH
	item_state = "welding"
	matter = list(DEFAULT_WALL_MATERIAL = 3000, "glass" = 1000)
	var/up = 0
	armor = list(melee = 10, bullet = 0, laser = 0,energy = 0, bomb = 0, bio = 0, rad = 0)
	flags_inv = (HIDEMASK|HIDEEARS|HIDEEYES|HIDEFACE)
	body_parts_covered = HEAD|FACE|EYES
	icon_action_button = "action_welding"
	siemens_coefficient = 0.9
	w_class = 3
	var/base_state

/obj/item/clothing/head/welding/attack_self()
	if(!base_state)
		base_state = icon_state
	toggle()


/obj/item/clothing/head/welding/verb/toggle()
	set category = "Object"
	set name = "Adjust welding mask"
	set src in usr

	if(usr.canmove && !usr.stat && !usr.restrained())
		if(src.up)
			src.up = !src.up
			src.flags |= (HEADCOVERSEYES | HEADCOVERSMOUTH)
			flags_inv |= (HIDEMASK|HIDEEARS|HIDEEYES|HIDEFACE)
			icon_state = "welding"
			usr << "You flip the [src] down to protect your eyes."
		else
			src.up = !src.up
			src.flags &= ~(HEADCOVERSEYES | HEADCOVERSMOUTH)
			flags_inv &= ~(HIDEMASK|HIDEEARS|HIDEEYES|HIDEFACE)
			icon_state = "weldingup"
			usr << "You push the [src] up out of your face."
		update_clothing_icon()	//so our mob-overlays update


/obj/item/clothing/head/welding/blue
	name = "custom welding helmet"
	desc = "A head-mounted face cover designed to protect the wearer completely from space-arc eye, This one has some custom paint work."
	icon_state = "bluewelding"
	flags = HEADCOVERSEYES | HEADCOVERSMOUTH
	item_state = "bluewelding"
	matter = list(DEFAULT_WALL_MATERIAL = 3000, "glass" = 1000)
	up = 0
	armor = list(melee = 10, bullet = 0, laser = 0,energy = 0, bomb = 0, bio = 0, rad = 0)
	flags_inv = (HIDEMASK|HIDEEARS|HIDEEYES|HIDEFACE)
	body_parts_covered = HEAD|FACE|EYES
	icon_action_button = "action_welding"
	siemens_coefficient = 0.9
	w_class = 3

/obj/item/clothing/head/welding/blue/toggle()
	set category = "Object"
	set name = "Adjust welding mask"
	set src in usr

	if(usr.canmove && !usr.stat && !usr.restrained())
		if(src.up)
			src.up = !src.up
			src.flags |= (HEADCOVERSEYES | HEADCOVERSMOUTH)
			flags_inv |= (HIDEMASK|HIDEEARS|HIDEEYES|HIDEFACE)
			icon_state = "bluewelding"
			usr << "You flip the [src] down to protect your eyes."
		else
			src.up = !src.up
			src.flags &= ~(HEADCOVERSEYES | HEADCOVERSMOUTH)
			flags_inv &= ~(HIDEMASK|HIDEEARS|HIDEEYES|HIDEFACE)
			icon_state = "blueweldingup"
			usr << "You push the [src] up out of your face."
		update_clothing_icon()	//so our mob-overlays update


/obj/item/clothing/head/welding/japan
	name = "stylish welding helmet"
	desc = "A head-mounted face cover designed to protect the wearer completely from space-arc eye, This one has a stylish design."
	icon_state = "japanwelding"
	flags = HEADCOVERSEYES | HEADCOVERSMOUTH
	item_state = "japanwelding"
	matter = list(DEFAULT_WALL_MATERIAL = 3000, "glass" = 1000)
	up = 0
	armor = list(melee = 10, bullet = 0, laser = 0,energy = 0, bomb = 0, bio = 0, rad = 0)
	flags_inv = (HIDEMASK|HIDEEARS|HIDEEYES|HIDEFACE)
	body_parts_covered = HEAD|FACE|EYES
	icon_action_button = "action_welding"
	siemens_coefficient = 0.9
	w_class = 3

/obj/item/clothing/head/welding/japan/toggle()
	set category = "Object"
	set name = "Adjust welding mask"
	set src in usr

	if(usr.canmove && !usr.stat && !usr.restrained())
		if(src.up)
			src.up = !src.up
			src.flags |= (HEADCOVERSEYES | HEADCOVERSMOUTH)
			flags_inv |= (HIDEMASK|HIDEEARS|HIDEEYES|HIDEFACE)
			icon_state = "japanwelding"
			usr << "You flip the [src] down to protect your eyes."
		else
			src.up = !src.up
			src.flags &= ~(HEADCOVERSEYES | HEADCOVERSMOUTH)
			flags_inv &= ~(HIDEMASK|HIDEEARS|HIDEEYES|HIDEFACE)
			icon_state = "japanweldingup"
			usr << "You push the [src] up out of your face."
		update_clothing_icon()	//so our mob-overlays update



/obj/item/clothing/head/welding/flame
	name = "firey welding helmet"
	desc = "A head-mounted face cover designed to protect the wearer completely from space-arc eye, This one has a flame design."
	icon_state = "flamewelding"
	flags = HEADCOVERSEYES | HEADCOVERSMOUTH
	item_state = "flamewelding"
	matter = list(DEFAULT_WALL_MATERIAL = 3000, "glass" = 1000)
	up = 0
	armor = list(melee = 10, bullet = 0, laser = 0,energy = 0, bomb = 0, bio = 0, rad = 0)
	flags_inv = (HIDEMASK|HIDEEARS|HIDEEYES|HIDEFACE)
	body_parts_covered = HEAD|FACE|EYES
	icon_action_button = "action_welding"
	siemens_coefficient = 0.9
	w_class = 3

/obj/item/clothing/head/welding/flame/toggle()
	set category = "Object"
	set name = "Adjust welding mask"
	set src in usr

	if(usr.canmove && !usr.stat && !usr.restrained())
		if(src.up)
			src.up = !src.up
			src.flags |= (HEADCOVERSEYES | HEADCOVERSMOUTH)
			flags_inv |= (HIDEMASK|HIDEEARS|HIDEEYES|HIDEFACE)
			icon_state = "flamewelding"
			usr << "You flip the [src] down to protect your eyes."
		else
			src.up = !src.up
			src.flags &= ~(HEADCOVERSEYES | HEADCOVERSMOUTH)
			flags_inv &= ~(HIDEMASK|HIDEEARS|HIDEEYES|HIDEFACE)
			icon_state = "flameweldingup"
			usr << "You push the [src] up out of your face."
		update_clothing_icon()	//so our mob-overlays update

/obj/item/clothing/head/welding/knight
	name = "noble welding helmet"
	desc = "A head-mounted face cover designed to protect the wearer completely from space-arc eye, This ones designed is based on a knights helmet."
	icon_state = "knightwelding"
	flags = HEADCOVERSEYES | HEADCOVERSMOUTH
	item_state = "knightwelding"
	matter = list(DEFAULT_WALL_MATERIAL = 3000, "glass" = 1000)
	up = 0
	armor = list(melee = 10, bullet = 0, laser = 0,energy = 0, bomb = 0, bio = 0, rad = 0)
	flags_inv = (HIDEMASK|HIDEEARS|HIDEEYES|HIDEFACE)
	body_parts_covered = HEAD|FACE|EYES
	icon_action_button = "action_welding"
	siemens_coefficient = 0.9
	w_class = 3

/obj/item/clothing/head/welding/knight/toggle()
	set category = "Object"
	set name = "Adjust welding mask"
	set src in usr

	if(usr.canmove && !usr.stat && !usr.restrained())
		if(src.up)
			src.up = !src.up
			src.flags |= (HEADCOVERSEYES | HEADCOVERSMOUTH)
			flags_inv |= (HIDEMASK|HIDEEARS|HIDEEYES|HIDEFACE)
			icon_state = "knightwelding"
			usr << "You flip the [src] down to protect your eyes."
		else
			src.up = !src.up
			src.flags &= ~(HEADCOVERSEYES | HEADCOVERSMOUTH)
			flags_inv &= ~(HIDEMASK|HIDEEARS|HIDEEYES|HIDEFACE)
			icon_state = "knightweldingup"
			usr << "You push the [src] up out of your face."
		update_clothing_icon()	//so our mob-overlays update

/obj/item/clothing/head/welding/engie
	name = "engineering welding helmet"
	desc = "A head-mounted face cover designed to protect the wearer completely from space-arc eye, This is based on the colour of engineering."
	icon_state = "engiewelding"
	flags = HEADCOVERSEYES | HEADCOVERSMOUTH
	item_state = "engiewelding"
	matter = list(DEFAULT_WALL_MATERIAL = 3000, "glass" = 1000)
	up = 0
	armor = list(melee = 10, bullet = 0, laser = 0,energy = 0, bomb = 0, bio = 0, rad = 0)
	flags_inv = (HIDEMASK|HIDEEARS|HIDEEYES|HIDEFACE)
	body_parts_covered = HEAD|FACE|EYES
	icon_action_button = "action_welding"
	siemens_coefficient = 0.9
	w_class = 3

/obj/item/clothing/head/welding/engie/toggle()
	set category = "Object"
	set name = "Adjust welding mask"
	set src in usr

	if(usr.canmove && !usr.stat && !usr.restrained())
		if(src.up)
			src.up = !src.up
			src.flags |= (HEADCOVERSEYES | HEADCOVERSMOUTH)
			flags_inv |= (HIDEMASK|HIDEEARS|HIDEEYES|HIDEFACE)
			icon_state = "engiewelding"
			usr << "You flip the [src] down to protect your eyes."
		else
			src.up = !src.up
			src.flags &= ~(HEADCOVERSEYES | HEADCOVERSMOUTH)
			flags_inv &= ~(HIDEMASK|HIDEEARS|HIDEEYES|HIDEFACE)
			icon_state = "engieweldingup"
			usr << "You push the [src] up out of your face."
		update_clothing_icon()	//so our mob-overlays update

/obj/item/clothing/head/welding/demon
	name = "scary welding helmet"
	desc = "A head-mounted face cover designed to protect the wearer completely from space-arc eye, This has a demons face."
	icon_state = "demonwelding"
	flags = HEADCOVERSEYES | HEADCOVERSMOUTH
	item_state = "demonwelding"
	matter = list(DEFAULT_WALL_MATERIAL = 3000, "glass" = 1000)
	up = 0
	armor = list(melee = 10, bullet = 0, laser = 0,energy = 0, bomb = 0, bio = 0, rad = 0)
	flags_inv = (HIDEMASK|HIDEEARS|HIDEEYES|HIDEFACE)
	body_parts_covered = HEAD|FACE|EYES
	icon_action_button = "action_welding"
	siemens_coefficient = 0.9
	w_class = 3

/obj/item/clothing/head/welding/demon/toggle()
	set category = "Object"
	set name = "Adjust welding mask"
	set src in usr

	if(usr.canmove && !usr.stat && !usr.restrained())
		if(src.up)
			src.up = !src.up
			src.flags |= (HEADCOVERSEYES | HEADCOVERSMOUTH)
			flags_inv |= (HIDEMASK|HIDEEARS|HIDEEYES|HIDEFACE)
			icon_state = "demonwelding"
			usr << "You flip the [src] down to protect your eyes."
		else
			src.up = !src.up
			src.flags &= ~(HEADCOVERSEYES | HEADCOVERSMOUTH)
			flags_inv &= ~(HIDEMASK|HIDEEARS|HIDEEYES|HIDEFACE)
			icon_state = "demonweldingup"
			usr << "You push the [src] up out of your face."
		update_clothing_icon()	//so our mob-overlays update

/obj/item/clothing/head/welding/fancy
	name = "fancy welding helmet"
	desc = "A head-mounted face cover designed to protect the wearer completely from space-arc eye, this one has a nice black and gold design."
	icon_state = "fancywelding"
	flags = HEADCOVERSEYES | HEADCOVERSMOUTH
	item_state = "fancywelding"
	matter = list(DEFAULT_WALL_MATERIAL = 3000, "glass" = 1000)
	up = 0
	armor = list(melee = 10, bullet = 0, laser = 0,energy = 0, bomb = 0, bio = 0, rad = 0)
	flags_inv = (HIDEMASK|HIDEEARS|HIDEEYES|HIDEFACE)
	body_parts_covered = HEAD|FACE|EYES
	icon_action_button = "action_welding"
	siemens_coefficient = 0.9
	w_class = 3

/obj/item/clothing/head/welding/fancy/toggle()
	set category = "Object"
	set name = "Adjust welding mask"
	set src in usr

	if(usr.canmove && !usr.stat && !usr.restrained())
		if(src.up)
			src.up = !src.up
			src.flags |= (HEADCOVERSEYES | HEADCOVERSMOUTH)
			flags_inv |= (HIDEMASK|HIDEEARS|HIDEEYES|HIDEFACE)
			icon_state = "fancywelding"
			usr << "You flip the [src] down to protect your eyes."
		else
			src.up = !src.up
			src.flags &= ~(HEADCOVERSEYES | HEADCOVERSMOUTH)
			flags_inv &= ~(HIDEMASK|HIDEEARS|HIDEEYES|HIDEFACE)
			icon_state = "fancyweldingup"
			usr << "You push the [src] up out of your face."
		update_clothing_icon()	//so our mob-overlays update


/*
 * Cakehat
 */
/obj/item/clothing/head/cakehat
	name = "cake-hat"
	desc = "It's tasty looking!"
	icon_state = "cake0"
	flags = HEADCOVERSEYES
	var/onfire = 0.0
	var/status = 0
	var/fire_resist = T0C+1300	//this is the max temp it can stand before you start to cook. although it might not burn away, you take damage
	var/processing = 0 //I dont think this is used anywhere.
	body_parts_covered = EYES

/obj/item/clothing/head/cakehat/process()
	if(!onfire)
		processing_objects.Remove(src)
		return

	var/turf/location = src.loc
	if(istype(location, /mob/))
		var/mob/living/carbon/human/M = location
		if(M.l_hand == src || M.r_hand == src || M.head == src)
			location = M.loc

	if (istype(location, /turf))
		location.hotspot_expose(700, 1)

/obj/item/clothing/head/cakehat/attack_self(mob/user as mob)
	if(status > 1)	return
	src.onfire = !( src.onfire )
	if (src.onfire)
		src.force = 3
		src.damtype = "fire"
		src.icon_state = "cake1"
		processing_objects.Add(src)
	else
		src.force = null
		src.damtype = "brute"
		src.icon_state = "cake0"
	return


/*
 * Ushanka
 */
/obj/item/clothing/head/ushanka
	name = "ushanka"
	desc = "Perfect for winter in Siberia, da?"
	icon_state = "ushankadown"
	item_state = "ushankadown"
	flags_inv = HIDEEARS

/obj/item/clothing/head/ushanka/attack_self(mob/user as mob)
	if(src.icon_state == "ushankadown")
		src.icon_state = "ushankaup"
		src.item_state = "ushankaup"
		user << "You raise the ear flaps on the ushanka."
	else
		src.icon_state = "ushankadown"
		src.item_state = "ushankadown"
		user << "You lower the ear flaps on the ushanka."

/*
 * Pumpkin head
 */
/obj/item/clothing/head/pumpkinhead
	name = "carved pumpkin"
	desc = "A jack o' lantern! Believed to ward off evil spirits."
	icon_state = "hardhat0_pumpkin"//Could stand to be renamed
	item_state = "hardhat0_pumpkin"
	flags = HEADCOVERSEYES | HEADCOVERSMOUTH | BLOCKHAIR
	flags_inv = HIDEMASK|HIDEEARS|HIDEEYES|HIDEFACE
	body_parts_covered = HEAD|EYES
	brightness_on = 2
	light_overlay = "helmet_light"
	w_class = 3

/*
 * Kitty ears
 */
/obj/item/clothing/head/kitty
	name = "kitty ears"
	desc = "A pair of kitty ears. Meow!"
	icon_state = "kitty"
	body_parts_covered = 0
	siemens_coefficient = 1.5
	item_icons = list()

	update_icon(var/mob/living/carbon/human/user)
		if(!istype(user)) return
		var/icon/ears = new/icon("icon" = 'icons/mob/head.dmi', "icon_state" = "kitty")
		ears.Blend(rgb(user.r_hair, user.g_hair, user.b_hair), ICON_ADD)

		var/icon/earbit = new/icon("icon" = 'icons/mob/head.dmi', "icon_state" = "kittyinner")
		ears.Blend(earbit, ICON_OVERLAY)

		item_icons[icon_head] = ears

/obj/item/clothing/head/richard
	name = "chicken mask"
	desc = "You can hear the distant sounds of rhythmic electronica."
	icon_state = "richard"
	body_parts_covered = HEAD|FACE
	flags = HEADCOVERSEYES|HEADCOVERSMOUTH|BLOCKHAIR

/obj/item/clothing/head/weaaahead
	name = "pink hood"
	desc = "You can hear the distant sounds of moms spaghetti."
	icon_state = "pinkhood"
	item_state = "pinkhood"
	body_parts_covered = HEAD|FACE
	flags = HEADCOVERSEYES|HEADCOVERSMOUTH|BLOCKHAIR
