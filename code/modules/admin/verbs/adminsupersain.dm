/client/proc/supersain(mob/M as mob in mob_list) //Freeze
	set category = "Admin"
	set name = "Super Saiyan Mob"
	if(!holder)
		src << "Only mentors and above may use this command."
		return
	if(!mob)
		alert("\red Cannot super saiyan nonmobs.")
		return
	if(!istype(M))
		alert("\red Cannot super saiyan a ghost")
		return
	if(ismob(M))
		var/supersaiyan = new/obj/effect/overlay/supersaiyan
		spawn(50)
			M.overlays += supersaiyan
		return

/client/proc/supersainremove(mob/M as mob in mob_list) //Freeze
	set category = "Admin"
	set name = "Super Saiyan Removal"
	if(!holder)
		src << "Only mentors and above may use this command."
		return
	if(!mob)
		alert("\red Cannot super saiyan nonmobs.")
		return
	if(!istype(M))
		alert("\red Cannot super saiyan a ghost")
		return
	if(ismob(M))
		var/supersaiyan = new/obj/effect/overlay/supersaiyan
		M.overlays -= supersaiyan
		return