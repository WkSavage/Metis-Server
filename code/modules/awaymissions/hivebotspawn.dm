//Random hivebot spawner

/obj/effect/landmark/hivebotrandom
	name = "Spawner-Hivebot"
	var/time_spent_spawning = 0
	var/time_per_spawn = 0
	var/last_process= 0
	var/spawn_type

/obj/effect/landmark/hivebotrandom/initialize()
	createBots()

/obj/effect/landmark/hivebotrandom/proc/createBots()
	if(prob(100))
		spawn_type = pick(\
		/mob/living/simple_animal/hostile/hivebot,\
		/mob/living/simple_animal/hostile/hivebot/range,\
		/mob/living/simple_animal/hostile/hivebot/rapid,\
		/mob/living/simple_animal/hostile/hivebot/strong\
		)

	if(prob(60))
		spawn_type = pick(\
		/mob/living/simple_animal/hostile/hivebot,\
		/mob/living/simple_animal/hostile/hivebot/range,\
		/mob/living/simple_animal/hostile/hivebot/rapid,\
		/mob/living/simple_animal/hostile/hivebot/strong\
		)
	if(prob(25))
		spawn_type = pick(\
		/mob/living/simple_animal/hostile/hivebot,\
		/mob/living/simple_animal/hostile/hivebot/range,\
		/mob/living/simple_animal/hostile/hivebot/rapid,\
		/mob/living/simple_animal/hostile/hivebot/strong\
		)
	if(prob(5))
		spawn_type = pick(\
		/mob/living/simple_animal/hostile/hivebot,\
		/mob/living/simple_animal/hostile/hivebot/range,\
		/mob/living/simple_animal/hostile/hivebot/rapid,\
		/mob/living/simple_animal/hostile/hivebot/strong\
		)

/obj/effect/landmark/hivebotrandom/process()
	if(spawn_type)
		new spawn_type(src.loc)