/obj/item/weapon/reagent_containers/food/snacks/grown/ambrosiavulgaris
	name = "ambrosia vulgaris branch"
	desc = "This is a plant containing various healing chemicals."
	icon_state = "ambrosiavulgaris"
	slot_flags = SLOT_HEAD
	potency = 10
	filling_color = "#125709"
	plantname = "ambrosia"

/obj/item/weapon/reagent_containers/food/snacks/grown/ambrosiavulgaris/attackby(var/obj/item/W as obj, var/mob/user as mob, params)
	if(istype(W, /obj/item/weapon/rollingpaper))
		user.unEquip(W)
		var/obj/item/clothing/mask/cigarette/joint/J = new /obj/item/clothing/mask/cigarette/joint(user.loc)
		J.chem_volume = src.reagents.total_volume
		src.reagents.trans_to(J, J.chem_volume)
		del(W)
		user.put_in_active_hand(J)
		user << "\blue You roll the ambrosia vulgaris into a rolling paper."
		del(src)
	else
		..()

/obj/item/weapon/reagent_containers/food/snacks/grown/ambrosiadeus
	name = "ambrosia deus branch"
	desc = "Eating this makes you feel immortal!"
	icon_state = "ambrosiadeus"
	slot_flags = SLOT_HEAD
	potency = 10
	filling_color = "#229E11"
	plantname = "ambrosiadeus"

/obj/item/weapon/reagent_containers/food/snacks/grown/ambrosiadeus/attackby(var/obj/item/W as obj, var/mob/user as mob, params)
	if(istype(W, /obj/item/weapon/rollingpaper))
		user.unEquip(W)
		var/obj/item/clothing/mask/cigarette/joint/deus/J = new /obj/item/clothing/mask/cigarette/joint/deus(user.loc)
		J.chem_volume = src.reagents.total_volume
		src.reagents.trans_to(J, J.chem_volume)
		del(W)
		user.put_in_active_hand(J)
		user << "\blue You roll the ambrosia deus into a rolling paper."
		del(src)
	else
		..()
