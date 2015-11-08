//Random hivebot spawner

/obj/effect/landmark/hivebot
	name = "Spawner-Hivebot"

/obj/effect/landmark/hivebot/initialize()
	createBots()

/obj/effect/landmark/hivebot/proc/createBots()
	new/mob/living/simple_animal/hostile/hivebot(src.loc)
	if(prob(25))
		new/mob/living/simple_animal/hostile/hivebot/range(src.loc)
	if(prob(25))
		new/mob/living/simple_animal/hostile/hivebot/rapid(src.loc)
	if(prob(25))
		new/mob/living/simple_animal/hostile/hivebot/strong(src.loc)