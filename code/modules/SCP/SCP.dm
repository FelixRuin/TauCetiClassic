/obj/item/weapon/card/id/civ/scpjanitor
	name = "Janitor"
	access = list(access_maint_tunnels)
/obj/item/weapon/card/id/civ/scp105
	name = "SCP-105"
	access = list(access_maint_tunnels)
/obj/item/weapon/card/id/civ/scp073
	name = "SCP-073"
	access = list(access_maint_tunnels)

/obj/machinery/telecomms/relay/preset/scp
	icon_state = "hub"
	network = "tcommsatscp"
	id = "Station Relay"
	listening_level = 1
	autolinkers = list("s_relay")

/obj/machinery/telecomms/hub/preset/scp
	network = "tcommsatscp"

/obj/machinery/telecomms/receiver/preset_left/scp
	icon_state = "hub"
	network = "tcommsatscp"

/obj/machinery/telecomms/receiver/preset_right/scp
	icon_state = "hub"
	network = "tcommsatscp"

/obj/machinery/telecomms/receiver/preset_right/scp/atom_init()
	for(var/i = 1441, i < 1489, i += 2)
		freq_listening |= i
	. = ..()

/obj/machinery/telecomms/bus/preset_one/scp
	icon_state = "hub"
	network = "tcommsatscp"

/obj/machinery/telecomms/bus/preset_two/scp
	icon_state = "hub"
	network = "tcommsatscp"

/obj/machinery/telecomms/bus/preset_three/scp
	icon_state = "hub"
	network = "tcommsatscp"

/obj/machinery/telecomms/bus/preset_four/scp
	icon_state = "hub"
	network = "tcommsatscp"

/obj/machinery/telecomms/bus/preset_four/scp/atom_init()
	for(var/i = 1441, i < 1489, i += 2)
		freq_listening |= i
	. = ..()

/obj/machinery/telecomms/processor/preset_one/scp
	icon_state = "hub"
	network = "tcommsatscp"

/obj/machinery/telecomms/processor/preset_two/scp
	icon_state = "hub"

/obj/machinery/telecomms/processor/preset_three/scp
	icon_state = "hub"
	network = "tcommsatscp"

/obj/machinery/telecomms/processor/preset_four/scp
	icon_state = "hub"
	network = "tcommsatscp"

/obj/machinery/telecomms/broadcaster/preset_left/scp
	icon_state = "hub"
	network = "tcommsatscp"

/obj/machinery/telecomms/broadcaster/preset_right/scp
	icon_state = "hub"
	network = "tcommsatscp"

/obj/machinery/telecomms/server/presets/scp
	icon_state = "hub"
	network = "tcommsatscp"

/obj/machinery/telecomms/server/presets/scp/science
	id = "Science Server"
	freq_listening = list(1351)
	autolinkers = list("science")

/obj/machinery/telecomms/server/presets/scp/medical
	id = "Medical Server"
	freq_listening = list(1355)
	autolinkers = list("medical")

/obj/machinery/telecomms/server/presets/scp/supply
	id = "Supply Server"
	freq_listening = list(1347)
	autolinkers = list("supply")

/obj/machinery/telecomms/server/presets/scp/common
	id = "Common Server"
	freq_listening = list()
	autolinkers = list("common")

/obj/machinery/telecomms/server/presets/scp/common/atom_init()
	for(var/i = 1441, i < 1489, i += 2)
		freq_listening |= i
	. = ..()

/obj/machinery/telecomms/server/presets/scp/command
	id = "Command Server"
	freq_listening = list(1353)
	autolinkers = list("command")

/obj/machinery/telecomms/server/presets/scp/security
	id = "Security Server"
	freq_listening = list(1359)
	autolinkers = list("security")

/area/centcom/scp
	name = "SCP Facility"
	icon = 'code/modules/SCP/turf/SCP_areas.dmi'
	icon_state = "SCP"
//	music = 'code/modules/SCP/zone_sound.wav'
/area/beach/road
	name = "Road"
	icon = 'code/modules/SCP/turf/SCP_areas.dmi'
	icon_state = "Road"
/mob/living/simple_animal/hostile/asteroid/goliath/SCP_058
	name = "SCP-058"
	icon = 'code/modules/SCP/scp-058.dmi'
	icon_state = "scp-058"
	icon_living = "scp-058"
	icon_aggro = "scp-058"
	icon_dead = "scp-058"
	speed = -5

/obj/structure/reagent_dispensers/water_cooler/fountain
	icon = 'code/modules/SCP/fountain.dmi'
	icon_state = "fountain"

/obj/structure/sign/plaques/SCP
	name = "a poster with the scp object"
	icon = 'code/modules/SCP/scp_poster.dmi'
	icon_state = "poster"

/turf/simulated/floor/scpfloor
	icon_state = "asteroid"

/turf/simulated/floor/roads //Take Me Home, Country Roads
	name = "road"
	icon = 'code/modules/SCP/turf/road.dmi'
	icon_state = "1"
	basetype = /turf/simulated/floor/plating/ironsand

/turf/simulated/floor/scp_logo
	name = "floor"
	icon = 'code/modules/SCP/turf/scp_logo.dmi'
	icon_state = "1-7"
	basetype = /turf/simulated/floor/plating/ironsand

/turf/unsimulated/wall/ural
	name = "ural"
	icon = 'code/modules/SCP/turf/ural.dmi'
	icon_state = "ural1"

/obj/item/device/scp113
	name = "SCP-113"
	desc = "Jasper Rock. The red piece of quartz that gleams with unnatural smoothness."
	icon_state = "scp113"
	force = 5.0
	w_class = ITEM_SIZE_HUGE //temporary workaround until I can fix the nodrop code to include noplace in bags/tables
	throwforce = 5.0
	throw_range = 15
	throw_speed = 3
	var/candrop = 1
	flags = 0
	icon = 'code/modules/SCP/SCP.dmi'
	var/list/victims = list()

/obj/item/device/scp113/dropped(mob/user)
	if(!candrop && user)
		user.put_in_hands(src)

/obj/item/device/scp113/pickup(mob/living/user)
	if(!isliving(user))
		return 1

	if(!candrop)
		return 1

	candrop = 0 //reset candrop for new pickup
	flags = ABSTRACT

	var/which_hand = pick(BP_L_ARM, BP_R_ARM) //determine hand to burn

	to_chat(user, "<span class='warning'>[src] begins to sear your hand, burning the skin on contact, and you feel yourself unable to drop it.</span>")
	var/damage_coeff = 1
//	if(user in victims)
//		damage_coeff = Clamp((2000-(world.time - victims[user]))/1000,1,2)
	if(damage_coeff > 1.5)
		user.emote("scream",,, 1)

	user.apply_damage(10*damage_coeff, BURN, which_hand, 0) //administer damage
	user.apply_damage(30*damage_coeff, TOX, which_hand, 0)

	spawn(200)
		to_chat(user, "<span class='warning'>Bones begin to shift and grind inside of you, and every single one of your nerves seems like it's on fire.</span>")
	spawn(210)
		user.visible_message("<span class='notice'>\The [user] starts to scream and writhe in pain as their bone structure reforms.</span>")
	spawn(300)
		if(user.gender == FEMALE) //swap genders
			user.gender = MALE
		else
			user.gender = FEMALE
		if(ishuman(user))
			var/mob/living/carbon/human/H = user

			H.h_style = random_hair_style(H.gender, H.species.name)
			H.f_style = random_facial_hair_style(H.gender, H.species.name)
			H.update_hair()

			//H.reset_hair()
			H.check_dna()
			H.dna.ready_dna(H)
			H.update_body()
	spawn(350)
		to_chat(user, "<span class='warning'>The burning begins to fade, and you feel your hand relax it's grip on the [src].</span>")
	spawn(360)
		candrop = 1 //transformation finished, you can let go now
		flags = 0
		victims[user] = world.time


/obj/machinery/scp294
	name = "SCP-294"
	desc = "A standard coffee vending machine. This one seems to have a QWERTY keyboard."
	icon = 'code/modules/SCP/SCP.dmi'
	icon_state = "scp294"
	layer = 2.9
	anchored = 1
	density = 1
	var/uses_left = 12
	var/last_use = 0
	var/restocking_timer = 0
	var/cooldown_delay = 2000
	var/black_list = list("adminordrazine", "xenomicrobes", "nanites", "mutationtoxin", "amutationtoxin")

/obj/machinery/scp294/attack_hand(mob/user)
	if((last_use + 3 SECONDS) > world.time)
		visible_message("<span class='notice'>[src] displays NOT READY message.</span>")
		return
	last_use = world.time
	if(uses_left < 1)
		visible_message("<span class='notice'>[src] displays RESTOCKING, PLEASE WAIT message.</span>")
		return
	var/product = null
	var/mob/living/carbon/victim = null
	var/input_reagent = lowertext(input("Enter the name of any liquid", "What would you like to drink?") as text)
	for(var/mob/living/carbon/M in world)
		if (lowertext(M.real_name) == input_reagent)
			if (istype(M, /mob/living/carbon/))
				victim = M
				if(victim)
					M.emote("scream",,, 1)
					to_chat(M, "<span class='danger'>You feel a sharp stabbing pain in your insides!</span>")
					var/i
					var/pain = rand(1, 6)
					for(i=1; i<=pain; i++)
						M.adjustBruteLoss(5)
	if(!victim)
		product = find_reagent(input_reagent)
		if(product in black_list)
			product = null
	sleep(10)
	if(product)
		playsound(src, 'sound/items/vending.ogg', 50, 1, 1)
		var/obj/item/weapon/reagent_containers/food/drinks/drinkingglass/D = new /obj/item/weapon/reagent_containers/food/drinks/drinkingglass(loc)
		D.reagents.add_reagent(product, 25)
		visible_message("<span class='notice'>[src] dispenses a drinking glass that's full of liquid.</span>")
		uses_left--
		if (uses_left < 1)
			spawn(cooldown_delay)
				uses_left = 12
	else if (victim)
		playsound(src, 'sound/items/vending.ogg', 50, 1, 1)
		var/obj/item/weapon/reagent_containers/food/drinks/drinkingglass/D = new /obj/item/weapon/reagent_containers/food/drinks/drinkingglass(loc)
		product = victim.take_blood(D,25)
		if(product != null)
			D.reagents.reagent_list += product
			D.reagents.update_total()
			D.on_reagent_change()
		else
			D.reagents.add_reagent("blood", 25)
		visible_message("<span class='notice'>[src] dispenses a drinking glass that's full of liquid.</span>")
		uses_left--
		if (uses_left < 1)
			spawn(cooldown_delay)
				uses_left = 12
	else
		visible_message("<span class='notice'>[src]'s OUT OF RANGE light flashes rapidly.</span>")



/obj/machinery/scp294/proc/find_reagent(input)
	. = FALSE
	if(chemical_reagents_list[input])
		var/datum/reagent/R = chemical_reagents_list[input]
		if(R)
			return R.id
	else
		input = replacetext(lowertext(input), " ", "")
		input = replacetext(input, "-", "")
		input = replacetext(input, "_", "")
		for(var/X in chemical_reagents_list)
			var/datum/reagent/R = chemical_reagents_list[X]
			if(R && input == replacetext(replacetext(replacetext(lowertext(R.name), " ", ""), "-", ""), "_", ""))
				return R.id
			else if(R && input == replacetext(replacetext(replacetext(lowertext(R.id), " ", ""), "-", ""), "_", ""))
				return R.id

#define STAGE_WAIT		0
#define STAGE_MESSAGE	1
#define STAGE_SLEEP		2
#define STAGE_DAMAGE	3

/obj/item/scp513
	name = "SCP-513"
	desc = "An old cowbell, covered in immense amounts of rust."
	icon = 'code/modules/SCP/SCP.dmi'
	icon_state = "scp513"
	var/global/mob/living/carbon/list/victims = list()
	var/global/mob/living/carbon/list/next_braindamage_stage = list()
	var/global/mob/living/carbon/list/braindamage_stage = list()
	var/global/mob/living/carbon/list/wake_up_timing = list()
	var/static/list/paranoia_messages = list("You feel as if something is watching you...", "It feels as if something is stalking you")
	var/static/list/assault_messages = list("A horrifying monster attacks you, before running off!", "You are bolted awake by a horrifying entity attacking you!")
	var/static/list/spook_messages = list("You see a disturbing entity lingering in your peripheral vision", "You swear you can see an abomination lurking...", "A strange entity stares at you, and sends chiils to your very core.")
	var/static/list/insomnia_messages = list("You feel so tired... but you can't sleep.", "You feel like... like.... sleep is.... can't.... sleep....")

/obj/item/scp513/atom_init()
	. = ..()
	START_PROCESSING(SSobj, src)

/obj/item/scp513/Destroy()
	STOP_PROCESSING(SSobj, src)
	return ..()

/obj/item/scp513/proc/ring(mob/living/user)
	for(var/mob/living/carbon/M in hear(7, get_turf(src)))
		to_chat(M, "<span class='danger'><i>\The [src] rings, sending chills to your very bone.</i></span>")
		M << pick('code/modules/SCP/Bell2.ogg', 'code/modules/SCP/Bell3.ogg')
		if(!(M in victims))
			victims += M
			braindamage_stage[M] = STAGE_WAIT
			next_braindamage_stage[M] = world.time + rand(300, 420) //Funnily enough, 420 seconds is 7 minutes. Which makes for good weed jokes.

/obj/item/scp513/pickup(mob/living/user)
	. = ..()
	if(user.a_intent == I_HURT)
		to_chat(user, "<span class='danger'><b><i>You accidentally ring \the [src]!</i></b></span>")
		ring(user)

/obj/item/scp513/attack_self(mob/living/user)
	if(user in victims)
		to_chat(user, "<span class='notice'>I rang it once, and I felt terrible. Why the hell would I do that again?!</span>")
		return
	ring(user)

/obj/item/scp513/process()
	for(var/mob/living/carbon/M in victims)
		if(!M.client)
			continue
		if(prob(2.5))
			to_chat(M, "<span class='warning'><i>[pick(paranoia_messages)]</i></span>")
		var/next_scare = victims[M]
//		if (M.sleeping >= 10 && !(M in wake_up_timing))
//			wake_up_timing[M] = world.time + rand(100, 150)
		if(wake_up_timing[M] && world.time >= wake_up_timing[M])
			to_chat(M, "<span class='danger'>[pick(assault_messages)]</span>")
//			M.sleeping = 0
			wake_up_timing -= M
			M.adjustBruteLoss(rand(1,7))
			display_513_1(get_step(get_turf(src), pick(cardinal)), M, 17)
		else if (world.time >= next_scare)
			victims[M] = world.time + rand(100,1200)
			display_513_1(find_safe_spot(get_turf(M), M.client.view), M, 17)
			to_chat(M, "<span class='warning'><i>[pick(spook_messages)]</i></span>")
		else if (next_braindamage_stage[M] && world.time >= next_braindamage_stage[M])
			switch(braindamage_stage[M])
				if(STAGE_WAIT)
					braindamage_stage[M] = STAGE_MESSAGE
				if(STAGE_MESSAGE)
					next_braindamage_stage[M] = world.time + rand(120, 300)
					braindamage_stage[M] = STAGE_SLEEP
				if(STAGE_SLEEP)
					next_braindamage_stage[M] = world.time + rand(600, 720)
					braindamage_stage[M] = STAGE_DAMAGE
		else
			switch(braindamage_stage[M])
				if(STAGE_MESSAGE)
					if(prob(3.5))
						to_chat(M, "<span class='warning'>[pick(insomnia_messages)]</span>")
//				if(STAGE_SLEEP)
//					if(prob(4))
//						M.sleeping = 50
				if(STAGE_DAMAGE)
					M.adjustBrainLoss(rand(4,6))

/obj/item/scp513/proc/display_513_1(turf/spot, mob/living/target, length = 20, fade=TRUE)
	var/image/img = image('code/modules/SCP/SCP-513.dmi', spot, "scp513_1")
	img.layer = 4 + 0.1
	img.plane = 3
	target.client.images |= img
	spawn(length)
		target.client.images -= img
		qdel(img)

/obj/item/scp513/proc/find_safe_spot(turf/spot, range=7, min_dist = 3)
	var/list/valid_turfs = list()
	for(var/turf/T in view(spot, range))
		if((istype(T, /turf/simulated/floor) || istype(T, /turf/unsimulated/floor)) && get_dist(spot, T) >= min_dist)
			valid_turfs += T
	return pick(valid_turfs)

#undef STAGE_DAMAGE
#undef STAGE_SLEEP
#undef STAGE_MESSAGE
#undef STAGE_WAIT


/obj/structure/scp151
	name = "SCP-151"
	desc = "A painting depicting a rising wave."
	icon = 'code/modules/SCP/SCP.dmi'
	icon_state = "scp151"
	anchored = TRUE
	density = TRUE
	var/last_regen = 0
	var/gen_time = 100 //how long we wait between hurting victims
	var/list/victims = list()
	var/list/activevictims = list()

/obj/structure/scp151/proc/hurt_victims() //simulate drowning
	for(var/mob/living/user in activevictims)
		user.apply_damage(30, OXY)
		user.emote("gasp")

/obj/structure/scp151/atom_init()
	. = ..()
	START_PROCESSING(SSobj, src)
	last_regen = world.time

/obj/structure/scp151/Destroy()
	STOP_PROCESSING(SSobj, src)
	return ..()

/obj/structure/scp151/process()
	if(world.time > last_regen + gen_time) //hurt victims after time
		hurt_victims()
		last_regen = world.time

	for(var/mob/living/user in activevictims)
		if(user.stat == DEAD)
			victims -= user
			activevictims -= user

/obj/structure/scp151/examine(mob/living/user)
	. = ..()
	if(ishuman(user))
		user.visible_message("<span class='notice'>[user] looks at a picture.</span>")
		if(!(user in victims) && istype(user))
			victims += user //on examine, adds user into victims list
			spawn(20 SECONDS)
				activevictims += user
				to_chat(user, "<span class='warning'>Your lungs begin to feel tight, and the briny taste of seawater permeates your mouth.</span>")

#define isscp049(A) istype(A, /mob/living/carbon/human/scp049)

/datum/unarmed_attack/scp049_claws
	attack_verb = list("scratch", "claw", "slash")
	attack_sound = 'sound/weapons/slice.ogg'
	miss_sound = 'sound/weapons/slashmiss.ogg'
	damage = 40
	sharp = 0
	edge = 0

/datum/species/scp049
	name = "SCP-049"
	icobase = 'code/modules/SCP/SCP-049.dmi'
	deform = 'code/modules/SCP/SCP-049.dmi'
	dietflags = DIET_OMNI
	unarmed_type = /datum/unarmed_attack/scp049_claws
	eyes = "blank_eyes"

	flags = list(
	 NO_BREATHE = TRUE
	,NO_BLOOD = TRUE
	,NO_EMBED = TRUE
	,NO_SCAN = TRUE
	,NO_PAIN = TRUE
	,RAD_IMMUNE = TRUE
	,VIRUS_IMMUNE = TRUE
	)

	brute_mod = 0.2
	burn_mod = 0.2
	oxy_mod = 0
	tox_mod = 0
	brain_mod = 0
	speed_mod = -0.7

	has_gendered_icons = FALSE

/datum/species/scp049/on_gain(mob/living/carbon/human/H)
	H.status_flags &= ~(CANSTUN | CANWEAKEN | CANPARALYSE)
	return ..()

/mob/living/carbon/human/scp049
	real_name = "SCP-049"
	desc = "A mysterious plague doctor."

/mob/living/carbon/human/scp049/atom_init(mapload)
	. = ..(mapload, "SCP-049")
	universal_speak = TRUE
	universal_understand = TRUE
	AddSpell(new /obj/effect/proc_holder/spell/targeted/scp049_surgery)

/mob/living/carbon/human/scp049/examine(mob/user)
	to_chat(user, "<b><span class = 'info'><big>SCP-049</big></span></b> - [desc]")
	return ..(user)

/mob/living/carbon/human/scp049/movement_delay()
	..()
	var/tally = species.speed_mod
	if(crawling)
		tally += 7
	if(buckled) // so, if we buckled we have large debuff
		tally += 5.5
	if(pull_debuff)
		tally += pull_debuff
	return (tally + config.human_delay)

/mob/living/carbon/human/scp049/eyecheck()
	return 2

/mob/living/carbon/human/scp049/IsAdvancedToolUser()
	return FALSE

/obj/effect/proc_holder/spell/targeted/scp049_surgery
	name = "Perform Surgery"
	desc = "Performs surgery on a dead person, making him into a zombie."
	panel = "SCP"
	charge_max = 1
	clothes_req = 0
	range = -1
	include_user = 1
	var/zombies = 0

/obj/effect/proc_holder/spell/targeted/scp049_surgery/cast(list/targets)
	var/mob/living/carbon/human/H = usr
	var/mob/living/carbon/human/user = usr
	var/obj/item/weapon/grab/G = H.get_active_hand()
	if(!istype(G))
		to_chat(user, "<span class='warning'>You must be grabbing a creature in our active hand to do a surgery.</span>")
		return
	if(G.state <= GRAB_NECK)
		to_chat(user, "<span class='warning'>You must have a tighter grip to perform a surgery.</span>")
		return
	if(!ishuman(G.affecting))
		to_chat(usr, "<span class='warning'>You can only do surgery on humans.</span>")
		return
	if(user.is_busy(G.affecting))
		return

	var/mob/living/carbon/human/target = G.affecting
	if(G.affecting.stat != DEAD)
		for(var/stage = 1, stage<=3, stage++)
			switch(stage)
				if(1)
					user.visible_message("<span class='warning'>[user] puts his hand on [target]'s forehead!</span>")
				if(2)
					user.visible_message("<span class='warning'>[target] starts to convulse violently!</span>")
					target.make_jittery(5)

					addtimer(CALLBACK(target, /mob/.proc/emote, "scream",,,1), 10)
					addtimer(CALLBACK(target, /mob/.proc/emote, "scream",,,1), 80)
					addtimer(CALLBACK(target, /mob/.proc/emote, "scream",,,1), 140)
				if(3)
					target.death(0)
					continue

			if(!do_mob(user, target, 150))
				to_chat(user, "<span class='warning'>I was interrupted!</span>")
				return

	for(var/stage = 1, stage<=3, stage++)
		switch(stage)
			if(1)
				user.visible_message("<span class='warning'>[user] takes out his surgery bag from nowhere!</span>")
			if(2)
				user.visible_message("<span class='warning'>[user] starts to perform some kind of surgery on a dead body!</span>")
			if(3)
				user.visible_message("<span class='danger'>[user] finishes his surgery!</span>")
				continue

		if(!do_mob(user, target, 150))
			to_chat(user, "<span class='warning'>I was interrupted!</span>")
			return

	if(G)
		qdel(G)

	if(!target.key && target.mind)
		for(var/mob/dead/observer/ghost in player_list)
			if(ghost.mind == target.mind && ghost.can_reenter_corpse)
				var/answer = alert(ghost,"You are about to turn into a zombie. Do you want to return to body?","I'm a zombie!","Yes","No")
				if(answer == "Yes")
					ghost.reenter_corpse()

	spawn (50)
		target.rejuvenate()
		target.losebreath = 0
		target.visible_message("<span class = 'danger'><big>[target] rises up again.</big></span>")
		target.mutations.Add(HUSK)
		target.update_body()
		target.update_mutantrace()
		target.real_name = "SCP-049-[++zombies]"

	return

/datum/dirt_cover/water_blood
	name = "water"
	color = "#68C5FF"

/datum/unarmed_attack/watergirl_attack
	attack_verb = list("wash", "splash")
	attack_sound = 'sound/effects/waterstep.ogg'
	miss_sound = 'sound/effects/waterstep.ogg'
	damage = 2

/datum/species/watergirl
	name = "Watergirl"
	icobase = 'code/modules/SCP/SCP-054.dmi'
	deform = 'code/modules/SCP/SCP-054.dmi'
	dietflags = DIET_OMNI
	unarmed_type = /datum/unarmed_attack/watergirl_attack
	eyes = "blank_eyes"
//	blood_color = /datum/dirt_cover/water_blood

	flags = list(
	 NO_BREATHE = TRUE
	,NO_BLOOD = TRUE
	,NO_EMBED = TRUE
	,NO_SCAN = TRUE
	,NO_PAIN = TRUE
	,RAD_IMMUNE = TRUE
	,VIRUS_IMMUNE = TRUE
	)

	brute_mod = 0
	burn_mod = 2
	oxy_mod = 0
	tox_mod = 0
	brain_mod = 0
	speed_mod = 0

	has_gendered_icons = FALSE

/mob/living/carbon/human/scp054
	real_name = "SCP-054"
	desc = "A cute girl made out of alive water."

/mob/living/carbon/human/scp054/atom_init(mapload)
	. = ..(mapload, "Watergirl")
	universal_speak = TRUE
	universal_understand = TRUE
	ventcrawler = 1

/mob/living/carbon/human/scp054/examine(mob/user)
	to_chat(user, "<b><span class = 'info'><big>SCP-054</big></span></b> - [desc]")
	return ..(user)

/mob/living/carbon/human/scp054/IsAdvancedToolUser()
	return FALSE

/obj/item/weapon/card/id/SCP_005
//	icon = 'code/modules/SCP/SCP/SCP-005/stuff.dmi'
	name = "SCP-005"
	desc = "Rusty key... nothing suspicious. "
	icon_state = "key"
	item_state = "key"
	lefthand_file = 'code/modules/SCP/SCP/SCP-005/left.dmi'
	righthand_file = 'code/modules/SCP/SCP/SCP-005/right.dmi'
	access = list(access_security, access_brig, access_armory, access_forensics_lockers, access_medical, access_morgue, access_tox, access_tox_storage, access_genetics, access_engine, access_engine_equip, access_maint_tunnels, access_external_airlocks, access_emergency_storage, access_change_ids, access_ai_upload, access_teleporter, access_eva, access_heads, access_captain, access_all_personal_lockers, access_chapel_office, access_tech_storage, access_atmospherics, access_bar, access_janitor, access_crematorium, access_kitchen, access_robotics, access_rd, access_cargo, access_construction, access_chemistry, access_cargo_bot, access_hydroponics, access_manufacturing, access_library, access_lawyer, access_virology, access_cmo, access_qm, access_clown, access_mime, access_surgery, access_theatre, access_research, access_mining, access_mining_office, access_mailsorting, access_mint, access_mint_vault, access_heads_vault, access_mining_station, access_xenobiology, access_ce, access_hop, access_hos, access_RC_announce, access_keycard_auth, access_tcomsat, access_gateway , access_sec_doors, access_psychiatrist, access_xenoarch, access_minisat, access_recycler, access_detective, access_barber, access_paramedic, access_cent_general, access_cent_thunder, access_cent_specops, access_cent_medical, access_cent_living, access_cent_storage, access_cent_teleporter, access_cent_creed, access_cent_captain, access_syndicate, access_syndicate_commander)
	w_class = ITEM_SIZE_HUGE
	slot_flags = 0 // Can't wear as ID

/obj/item/weapon/card/id/SCP_005/pickup(mob/living/carbon/human/user)
	assignment = name
	registered_name = user.real_name

/obj/item/weapon/card/id/SCP_005/afterattack(atom/target, mob/user, proximity)
	if(!proximity)
		return

	if(istype(target, /obj/machinery/door))
		var/obj/machinery/door/door = target

		if(istype(door, /obj/machinery/door/airlock))
			var/obj/machinery/door/airlock/A = door
			INVOKE_ASYNC(A, /obj/machinery/door/airlock/proc/unbolt)
		//INVOKE_ASYNC(door, /obj/machinery/door/proc/open)
	else
		. = ..()

/obj/item/weapon/card/id/SCP_005/attack_self(mob/H)
	H.visible_message("<span class='warning'>The key strangely glows in [H]'s hands!</span>")
	var/list/mytargets = list(H.loc, get_step(H.loc, EAST), get_step(H.loc, WEST), get_step(H.loc, NORTH), get_step(H.loc, SOUTH))
	for(var/turf/T in mytargets)
		for(var/obj/machinery/door/door in T.contents)
			if(door.density)
				if(istype(door, /obj/machinery/door/airlock))
					var/obj/machinery/door/airlock/A = door
					INVOKE_ASYNC(A, /obj/machinery/door/airlock/proc/unbolt)
				INVOKE_ASYNC(door, /obj/machinery/door/proc/open)
		for(var/obj/structure/closet/C in T.contents)
			if(C.density)
				C.locked = 0
				INVOKE_ASYNC(C, /obj/structure/closet/proc/open)
				return

/obj/item/weapon/card/id/sec/scp
	access = list(access_security, access_sec_doors, access_medical, access_research)

/obj/item/weapon/card/id/sec/scp/pickup(mob/living/carbon/human/user)
	if(user.real_name && user.real_name != "unknown" && registered_name == "Unknown")
		assignment = "Security Officer"
		registered_name = user.real_name
		name = "[user.real_name]'s ID Card ([assignment])"

/obj/item/weapon/card/id/secGold/scp
	access = list(access_security, access_sec_doors, access_medical, access_research, access_hos)

/obj/item/weapon/card/id/secGold/scp/pickup(mob/living/carbon/human/user)
	if(user.real_name && user.real_name != "unknown" && registered_name == "Unknown")
		assignment = "Head of Security"
		registered_name = user.real_name
		name = "[user.real_name]'s ID Card ([assignment])"

/obj/item/weapon/card/id/med/scp
	access = list(access_medical)

/obj/item/weapon/card/id/med/scp/pickup(mob/living/carbon/human/user)
	if(user.real_name && user.real_name != "unknown" && registered_name == "Unknown")
		assignment = "Doctor"
		registered_name = user.real_name
		name = "[user.real_name]'s ID Card ([assignment])"

/obj/item/weapon/card/id/sci/scp
	access = list(access_research)

/obj/item/weapon/card/id/sci/scp/pickup(mob/living/carbon/human/user)
	if(user.real_name && user.real_name != "unknown" && registered_name == "Unknown")
		assignment = "Scientist"
		registered_name = user.real_name
		name = "[user.real_name]'s ID Card ([assignment])"

/obj/item/weapon/card/id/sciGold/scp
	access = list(access_sec_doors, access_medical, access_research, access_rd)

/obj/item/weapon/card/id/sciGold/scp/pickup(mob/living/carbon/human/user)
	if(user.real_name && user.real_name != "unknown" && registered_name == "Unknown")
		assignment = "Research Director"
		registered_name = user.real_name
		name = "[user.real_name]'s ID Card ([assignment])"

/obj/item/weapon/card/id/gold/scp
	access = list(access_sec_doors, access_medical, access_research, access_rd, access_hos, access_captain)

/obj/item/weapon/card/id/gold/scp/pickup(mob/living/carbon/human/user)
	if(user.real_name && user.real_name != "unknown" && registered_name == "Unknown")
		assignment = "Director"
		registered_name = user.real_name
		name = "[user.real_name]'s ID Card ([assignment])"

/mob/living/simple_animal/SCP_131_A
	name = "SCP-131-A"
	desc = "Ochreous raindrop with eye."
	icon = 'code/modules/SCP/SCP/SCP-131.dmi'
	icon_state = "eye"
	icon_living = "eye"
	icon_dead = "eye_dead"
	turns_per_move = 5
	see_in_dark = 7

/mob/living/simple_animal/SCP_131_A/SCP_131_B
	name = "SCP-131-B"
	desc = "Mustard yellow raindrop with eye."
	icon_state = "eye2"
	icon_living = "eye2"
	icon_dead = "eye2_dead"
	speed = -2

/obj/machinery/power/supermatter/SCP_037
	name = "SCP-037"
	desc = "Wow, a star from the sky a few meters away. <span class='warning'>You get headaches just from looking at it.</span>"
	icon = 'code/modules/SCP/SCP/SCP-037.dmi'
	icon_state = "star"
	base_icon_state = "star"
	density = 1
	anchored = 0
	light_range = 10
	safe_alert = "Crystaline hyperstructure returning to safe operating levels."
	warning_point = 300
	warning_alert = "Danger! SCP-037 hyperstructure instability!"
	emergency_point = 2100
	emergency_alert = "SCP-037 DELAMINATION IMMINENT."
	explosion_point = 3000
	light_color = "#F39F18"


/obj/effect/proc_holder/spell/aoe_turf/scp939_voice
	name = "Mimic voice"
	desc = ""
	panel = "SCP"
	charge_max = 50
	clothes_req = 0
	range = 1

/obj/effect/proc_holder/spell/aoe_turf/scp939_voice/cast(list/targets)
	var/newvoice = sanitize_safe(input("Enter the name of your new voice", "What voice would you like to mimic?") as text)
	if(!newvoice)
		newvoice = "SCP-939"

	var/mob/living/simple_animal/scp939/owner = usr
	if(owner)
		owner.fake_voice = newvoice
		owner.voice_name = newvoice
		to_chat(owner, "<span class='notice'>You mimic the voice of [newvoice].</span>")

/obj/effect/proc_holder/spell/aoe_turf/scp939_eat
	name = "Eat"
	desc = ""
	panel = "SCP"
	charge_max = 10
	clothes_req = 0
	range = 1
	var/mob/living/simple_animal/scp939/owner = null
	var/mob/living/carbon/human/eating = null
	var/eat_time = 30
	var/health_regen = 10
	var/timer_active = FALSE

/obj/effect/proc_holder/spell/aoe_turf/scp939_eat/cast(list/targets)
	//aaaaaaaaaaaaaaaaaaaaaaaaaaaaa
	var/mob/living/simple_animal/scp939/SCP = usr

	if(!istype(SCP) || SCP.is_busy(SCP))
		return

	owner = SCP
	eating = null
	var/list/mytargets = list(SCP.loc, get_step(SCP.loc, SCP.dir),get_step(SCP.loc, EAST), get_step(SCP.loc, WEST), get_step(SCP.loc, NORTH), get_step(SCP.loc, SOUTH))
	for(var/turf/T in mytargets)
		for(var/obj/item/weapon/reagent_containers/food/snacks/Food in T.contents)
			SCP.visible_message("<span class='warning'>[SCP] eats [Food] in one bite!</span>")
			SCP.health = min(SCP.health + Food.bitesize*5, SCP.maxHealth)
			qdel(Food)
			playsound(SCP, pick('sound/weapons/zilla_eat.ogg','sound/weapons/bite.ogg'), 50, 2)
			return
		for(var/mob/living/carbon/human/H in T.contents)
			if(H.stat != CONSCIOUS)
				eating = H
				break

	if(!eating)
		to_chat(SCP, "<span class='warning'>There is nothing to eat!</span>")
		return

	if(!timer_active)
		timer_active = TRUE
		addtimer(CALLBACK(src, .proc/eatsound), 1)

	while(eating)
		if(SCP.health >= SCP.maxHealth)
			to_chat(SCP, "<span class='warning'>You are full!</span>")
			eating = null
			return
		if(eating.getBruteLoss() >= 300)
			to_chat(SCP, "<span class='warning'>There is nothing left to eat from [eating]!</span>")
			eating = null
			return

		SCP.visible_message("<span class='warning'>[SCP] tears off pieces of flesh from [eating] and eats them!</span>")
		if(eating.stat == CONSCIOUS || SCP.health<=0 || !do_mob(SCP, eating, eat_time))
			to_chat(SCP, "<span class='warning'>You are no longer eating!</span>")
			eating = null
			return
		eating.take_overall_damage(rand(5,10), used_weapon = "teeth marks")
		SCP.health = min(SCP.health + health_regen, SCP.maxHealth)

/obj/effect/proc_holder/spell/aoe_turf/scp939_eat/proc/eatsound()
	if(!eating)
		timer_active = FALSE
		return

	playsound(owner, pick('sound/weapons/zilla_eat.ogg','sound/weapons/bite.ogg'), 50, 2)

	addtimer(CALLBACK(src, .proc/eatsound), rand(6,15))

/obj/effect/proc_holder/spell/aoe_turf/scp939_breath
	name = "Ammonia breath"
	desc = ""
	panel = "SCP"
	charge_max = 450
	clothes_req = 0
	range = 1
	var/ammount = 12

/obj/effect/proc_holder/spell/aoe_turf/scp939_breath/cast(list/targets)
	var/datum/reagents/evaporate = new /datum/reagents
	evaporate.my_atom = usr
	evaporate.add_reagent("psilocybin", ammount/3)
	evaporate.add_reagent("space_drugs", ammount/3)
	evaporate.add_reagent("cryptobiolin", ammount/3)
	var/location = get_turf(usr)
	var/datum/effect/effect/system/smoke_spread/chem/S = new /datum/effect/effect/system/smoke_spread/chem
	S.attach(location)
	S.set_up(evaporate, ammount, 0, location)
	S.start()

	usr.visible_message("<span class='warning'>[usr] exhales some kind of gas!</span>")
	playsound(usr, 'sound/effects/bamf.ogg', 50, 1)

/obj/effect/proc_holder/spell/aoe_turf/scp939_stealth
	name = "Hide"
	desc = ""
	panel = "SCP"
	charge_max = 30
	clothes_req = 0
	range = 1
	var/active = FALSE
	var/mob/living/owner
	var/turf/last_loc
	var/minalpha = 10
	var/hidespeed = 55

/obj/effect/proc_holder/spell/aoe_turf/scp939_stealth/process()
	if(owner.stat == DEAD)
		turn_off()

	owner.alpha = max(minalpha, owner.alpha - hidespeed)
	if(!owner.alpha)
		owner.invisibility = SEE_INVISIBLE_LIVING + 1 // formal invis to prevent AI TRACKING and alt-clicking, cmon, He merged with surroundings
	else
		owner.invisibility = 0

	if(last_loc && owner.loc != last_loc)
		turn_off()
	last_loc = owner.loc

/obj/effect/proc_holder/spell/aoe_turf/scp939_stealth/cast(list/targets)
	if(!active)
		owner = usr
		turn_on()
	else
		turn_off()

/obj/effect/proc_holder/spell/aoe_turf/scp939_stealth/proc/turn_on()
	to_chat(owner, "<span class='notice'>You start hiding.</span>")
	owner.alpha = 255
	START_PROCESSING(SSobj, src)
	active = TRUE
	last_loc = null

/obj/effect/proc_holder/spell/aoe_turf/scp939_stealth/proc/turn_off()
	to_chat(owner, "<span class='notice'>You stop hiding.</span>")
	owner.alpha = 255
	owner.invisibility = 0
	STOP_PROCESSING(SSobj, src)
	active = FALSE

/mob/living/simple_animal/scp939
	name = "SCP-939"
	real_name = "SCP-939"
	desc = "SCP-939 - endothermic predator with no eyes"
	icon = 'code/modules/SCP/scp64x32.dmi'
	icon_state = "scp939"
	icon_living = "scp939"
	icon_dead = "scp939_dead"
	maxHealth = 300
	health = 300
	response_help  = "pets"
	response_disarm = "flails at"
	response_harm = "punches"
	speak_emote = list("says")
	emote_hear = list("says")

	harm_intent_damage = 0
	melee_damage_lower = 15
	melee_damage_upper = 20
	attacktext = " brutally bites"
	environment_smash = 0

	speed = -1
	a_intent = "harm"
	stop_automated_movement = 1

	universal_speak = 1
	universal_understand = 1

	attack_sound = 'sound/weapons/polkan_atk.ogg'

	sight = SEE_MOBS

	var/health_regen = 2
	var/fake_voice = "SCP-939"

#define FULLSCREEN_LAYER 18
#define DAMAGE_LAYER FULLSCREEN_LAYER + 0.1
#define BLIND_LAYER DAMAGE_LAYER + 0.1
#define CRIT_LAYER BLIND_LAYER + 0.1

/obj/screen/fullscreen/scp_blind
	icon = 'code/modules/SCP/scp_full.dmi'
	icon_state = "scp_blind"
	layer = FULLSCREEN_LAYER
	plane = FULLSCREEN_PLANE

#undef FULLSCREEN_LAYER
#undef BLIND_LAYER
#undef DAMAGE_LAYER
#undef CRIT_LAYER

/mob/living/simple_animal/scp939/atom_init()
	..()
	//name = text("[initial(name)] ([rand(1, 1000)])")
	//real_name = name
	//status_flags ^= CANPUSH
	//for(var/spell in hulk_powers)
	//	spell_list += new spell(src)

	spell_list += new /obj/effect/proc_holder/spell/aoe_turf/scp939_breath(src)
	spell_list += new /obj/effect/proc_holder/spell/aoe_turf/scp939_stealth(src)
	spell_list += new /obj/effect/proc_holder/spell/aoe_turf/scp939_voice(src)
	spell_list += new /obj/effect/proc_holder/spell/aoe_turf/scp939_eat(src)
	var/matrix/Mx = matrix()
	Mx.Scale(1)
	Mx.Translate(-16,0)
	transform = Mx

/mob/living/simple_animal/scp939/Life()
	//if(health < 1)
	//	death()
	//	return
	if(client)
		overlay_fullscreen("scp_blind", /obj/screen/fullscreen/scp_blind)

		var/hurted = health / maxHealth
		damageoverlaytemp = 0 // We do this so we can detect if someone hits us or not.
		if(hurted < 0.5)
			var/severity = 0
			switch(hurted)
				if(0.7 to 0.9)		severity = 1
				if(0.5 to 0.7)		severity = 2
				if(0.4 to 0.5)		severity = 3
				if(0.3 to 0.4)		severity = 4
				if(0.2 to 0.3)		severity = 5
				if(0 to 0.2)		severity = 6
			overlay_fullscreen("brute", /obj/screen/fullscreen/brute, severity)
		else
			clear_fullscreen("brute")

		if(health > 0)
			health = min(health + health_regen, maxHealth)

		hud_used.reload_fullscreen()
	..()

/mob/living/simple_animal/scp939/Stat()
	..()

	//if(statpanel("Status"))
	//	stat(null, "Health: [round((health / maxHealth) * 100)]%")

/mob/living/simple_animal/scp939/say(var/message)
	var/save_name = name
	var/save_realname = real_name
	if(fake_voice)
		name = fake_voice
		real_name = fake_voice
	..(message)
	spawn(3)
		name = save_name
		real_name = save_realname

/datum/species/scp347
	name = "Invisible girl"
	icobase = 'code/modules/SCP/r_scp347.dmi'
	deform = 'code/modules/SCP/r_scp347.dmi'
	dietflags = DIET_OMNI
	eyes = "blank_eyes"
	damage_mask = FALSE //No blood on body

	flags = list(
	HAS_LIPS = TRUE
	,NO_BLOOD = TRUE
	,VIRUS_IMMUNE = TRUE
	)

	brute_mod = 1
	burn_mod = 1
	oxy_mod = 1
	tox_mod = 1
	brain_mod = 1
	speed_mod = 0

	has_gendered_icons = FALSE

/mob/living/carbon/human/scp347
	real_name = "SCP-347"
	desc = "Invisible girl, probably looks very cute."

/mob/living/carbon/human/scp347/atom_init(mapload)
	. = ..(mapload, "Invisible girl")
	universal_speak = TRUE
	universal_understand = TRUE
	gender = FEMALE
	equip_to_slot_or_del(new /obj/item/clothing/under/sundress(src)) //slot_w_uniform
	equip_to_slot_or_del(new /obj/item/clothing/shoes/heels/alternate(src)) //slot_shoes
	AddSpell(new /obj/effect/proc_holder/spell/aoe_turf/scp347_swallowitem(src))
	AddSpell(new /obj/effect/proc_holder/spell/aoe_turf/scp347_picklock(src))

/mob/living/carbon/human/scp347/examine(mob/user)
	to_chat(user, "<b><span class = 'info'><big>SCP-347</big></span></b> - [desc]")
	return ..(user)

/mob/living/carbon/human/proc/is_completely_naked()
	if(!w_uniform && !wear_suit && !wear_mask && !gloves && !head && !glasses && !back && !l_hand && !r_hand && !shoes)
		return TRUE
	return FALSE

/obj/effect/proc_holder/spell/aoe_turf/scp347_swallowitem
	name = "Swallow item"
	desc = ""
	panel = "SCP"
	charge_max = 10
	clothes_req = 0
	range = 1
	var/list/blacklist = list(/obj/item/weapon/grab)
	var/maxwclass = ITEM_SIZE_NORMAL //ITEM_SIZE_TINY ITEM_SIZE_SMALL ITEM_SIZE_NORMAL ITEM_SIZE_LARGE ITEM_SIZE_HUGE
	var/obj/item/holding = null

/obj/effect/proc_holder/spell/aoe_turf/scp347_swallowitem/cast(list/targets)
	var/mob/living/carbon/human/H = usr

	if(H.is_busy(H))
		return

	if(holding)
		H.visible_message("<span class='notice'>[H] starts to regurgitate something</span>", \
							 "<span class='notice'>You start to regurgitate [holding]</span>")
		if(!do_mob(H, H, 50))
			to_chat(H, "<span class='warning'>I was interrupted!</span>")
			return
		holding.forceMove(H.loc)
		H.visible_message("<span class='notice'>[H] regurgitates an item</span>", \
							 "<span class='notice'>You regurgitate [holding]</span>")
		holding = null
		name = "Swallow item"
	else
		var/obj/item/Item = H.get_active_hand()
		if(!istype(Item))
			to_chat(H, "<span class='warning'>I must be holding an item.</span>")
			return
		for(var/X in blacklist)
			if(istype(Item,X))
				to_chat(H, "<span class='warning'>I can't swallow this item.</span>")
				return
		if(Item.w_class > maxwclass)
			to_chat(H, "<span class='warning'>This item is too big to swallow.</span>")
			return

		H.visible_message("<span class='notice'>[H] attempts to swallow [Item]</span>", \
							 "<span class='notice'>You attempt to swallow [Item]</span>")
		if(!do_mob(H, H, 100))
			to_chat(H, "<span class='warning'>I was interrupted!</span>")
			return

		H.remove_from_mob(Item)
		if(!Item)
			return
		holding = Item
		Item.forceMove(H)
		name = "Regurgitate item"

		H.visible_message("<span class='notice'>[H] swallowed an item</span>", \
							 "<span class='notice'>You swallowed [Item]</span>")

/obj/effect/proc_holder/spell/aoe_turf/scp347_picklock
	name = "Pick a lock"
	desc = ""
	panel = "SCP"
	charge_max = 10
	clothes_req = 0
	range = 1
	var/picklock_time = 450
	var/bark_delay_min = 100
	var/bark_delay_max = 200
	var/timer_active = FALSE
	var/active = FALSE
	var/pickTarget = null

/obj/effect/proc_holder/spell/aoe_turf/scp347_picklock/cast(list/targets)
	var/mob/living/carbon/human/H = usr

	if(H.is_busy(H) || H.restrained())
		return

	var/list/mytargets = list(H.loc, get_step(H.loc, H.dir), get_step(H.loc, EAST), get_step(H.loc, WEST), get_step(H.loc, NORTH), get_step(H.loc, SOUTH))
	for(var/turf/T in mytargets)
		for(var/obj/machinery/door/door in T.contents)
			if(door.density)
				if(H.is_completely_naked())
					H.visible_message("<span class='notice'>You hear some metal noise</span>", \
										 "<span class='notice'>You silently start to picklock [door]</span>")
				else
					H.visible_message("<span class='warning'>[H] starts to do something with [door]'s access panel</span>", \
										 "<span class='warning'>You visible start to picklock [door]</span>")
				active = TRUE
				pickTarget = door
				if(!timer_active)
					timer_active = TRUE
					addtimer(CALLBACK(src, .proc/bark, H), rand(bark_delay_min,bark_delay_max))
				if(!do_mob(H, door, picklock_time))
					to_chat(H, "<span class='warning'>I was interrupted!</span>")
					active = FALSE
					return
				active = FALSE
				if(istype(door, /obj/machinery/door/airlock))
					var/obj/machinery/door/airlock/A = door
					INVOKE_ASYNC(A, /obj/machinery/door/airlock/proc/unbolt)
				INVOKE_ASYNC(door, /obj/machinery/door/proc/open)
				return

		for(var/obj/structure/closet/C in T.contents)
			if(C.density)
				if(H.is_completely_naked())
					H.visible_message("<span class='notice'>You hear some metal noise</span>", \
										 "<span class='notice'>You silently start to picklock [C]</span>")
				else
					H.visible_message("<span class='warning'>[H] starts to do something with [C]'s access panel</span>", \
										 "<span class='warning'>You visible start to picklock [C]</span>")
				active = TRUE
				pickTarget = C
				if(!timer_active)
					timer_active = TRUE
					addtimer(CALLBACK(src, .proc/bark, H), rand(bark_delay_min,bark_delay_max))
				if(!do_mob(H, C, picklock_time))
					to_chat(H, "<span class='warning'>I was interrupted!</span>")
					active = FALSE
					return
				active = FALSE
				C.locked = 0
				INVOKE_ASYNC(C, /obj/structure/closet/proc/open)
				return
	return

/obj/effect/proc_holder/spell/aoe_turf/scp347_picklock/proc/bark(mob/living/carbon/human/H)
	if(!active)
		timer_active = FALSE
		return

	if(H.is_completely_naked())
		if(prob(25))
			H.visible_message("<span class='notice'>You hear some metal noise</span>", \
						      "<span class='notice'>You make some noise while picklocking [pickTarget]</span>")
	else
		H.visible_message("<span class='warning'>[H] continues to do something with [pickTarget]'s access panel</span>", \
						  "<span class='warning'>You make a noise while visible picklocking [pickTarget]</span>")

	addtimer(CALLBACK(src, .proc/bark, H), rand(bark_delay_min,bark_delay_max))


/obj/machinery/vending/boozeomat/scp
//	req_access_txt = "0"

/obj/machinery/vending/coffee/scp
	prices = list()

/obj/machinery/vending/cola/scp
	prices = list()

/obj/machinery/vending/snack/scp
	prices = list()

/obj/machinery/vending/chinese/scp
	prices = list()

/obj/machinery/vending/cigarette/scp
	prices = list()

/obj/machinery/vending/security/scp_smgammo
	name = "SecTech-ammo.38"
	product_ads = null
	products = list(/obj/item/ammo_box/magazine/l13_38 = 20, /obj/item/ammo_box/magazine/l13_38/lethal = 20)

/obj/machinery/vending/security/scp_pistolammo
	name = "SecTech-ammo.45"
	product_ads = null
	products = list(/obj/item/ammo_box/magazine/sm45 = 20, /obj/item/ammo_box/magazine/sm45/nonlethal = 20)

/obj/machinery/scp914
	name = "SCP-914"
	desc = "Looks like a very complicated clockwork machine."
	icon = 'code/modules/SCP/scp-914.dmi'
	icon_state = "center"
	layer = 2.9
	anchored = 1
	density = 1
	var/process_time = 160
	var/list/items_to_process = list()
	var/list/humans_to_process = list()
	var/list/to_output = list()
	var/obj/machinery/scp914_input/input_obj = null
	var/obj/machinery/scp914_output/output_obj = null
	var/list/item_tree = null
	var/obj/machinery/scp914_left/left_obj = null
	var/obj/machinery/scp914_right/right_obj = null
	var/active = FALSE


/obj/machinery/scp914_input
	name = "SCP-914 INPUT"
	desc = "Looks like a very complicated clockwork machine."
	icon = 'code/modules/SCP/scp-914.dmi'
	icon_state = "in"
	layer = 2.9
	anchored = 1
	density = 0

/obj/machinery/scp914_output
	name = "SCP-914 OUTPUT"
	desc = "Looks like a very complicated clockwork machine."
	icon = 'code/modules/SCP/scp-914.dmi'
	icon_state = "out"
	layer = 2.9
	anchored = 1
	density = 0

/obj/machinery/scp914_left
	name = "SCP-914"
	desc = "Looks like a very complicated clockwork machine."
	icon = 'code/modules/SCP/scp-914.dmi'
	icon_state = "left"
	layer = 2.9
	anchored = 1
	density = 1

/obj/machinery/scp914_right
	name = "SCP-914"
	desc = "Looks like a very complicated clockwork machine."
	icon = 'code/modules/SCP/scp-914.dmi'
	icon_state = "right"
	layer = 2.9
	anchored = 1
	density = 1

/obj/machinery/scp914/atom_init()
	. = ..()
	left_obj = new /obj/machinery/scp914_left(get_step(loc, WEST))
	right_obj = new /obj/machinery/scp914_right(get_step(loc, EAST))
	input_obj = new /obj/machinery/scp914_input(get_step(get_step(loc, WEST), WEST))
	output_obj = new /obj/machinery/scp914_output(get_step(get_step(loc, EAST), EAST))

	item_tree = list(
		"teir1glasses" = list(
				"types" = subtypesof(/obj/item/clothing/glasses) - list(/obj/item/clothing/glasses/chameleon, /obj/item/clothing/glasses/material, /obj/item/clothing/glasses, /obj/item/clothing/glasses/fluff) - subtypesof(/obj/item/clothing/glasses/hud) - subtypesof(/obj/item/clothing/glasses/meson) - subtypesof(/obj/item/clothing/glasses/night) - subtypesof(/obj/item/clothing/glasses/sunglasses) - subtypesof(/obj/item/clothing/glasses/thermal),
				"upgrade" = list("teir2glasses"),
				"degrade" = list("trash")
			),
		"teir2glasses" = list(
				"types" = subtypesof(/obj/item/clothing/glasses/hud) + subtypesof(/obj/item/clothing/glasses/night) + subtypesof(/obj/item/clothing/glasses/sunglasses) - list(/obj/item/clothing/glasses/hud, /obj/item/clothing/glasses/hud/broken, /obj/item/clothing/glasses/hud/health/night, /obj/item/clothing/glasses/night/shadowling) - subtypesof(/obj/item/clothing/glasses/sunglasses/hud) - subtypesof(/obj/item/clothing/glasses/sunglasses/sechud),
				"upgrade" = list("teir3glasses"),
				"degrade" = list("teir1glasses")
			),

		"teir3glasses" = list(
				"types" = list(/obj/item/clothing/glasses/hud/health/night, /obj/item/clothing/glasses/chameleon, /obj/item/clothing/glasses/material) + subtypesof(/obj/item/clothing/glasses/sunglasses/hud) + typesof(/obj/item/clothing/glasses/sunglasses/sechud) + typesof(/obj/item/clothing/glasses/meson) + typesof(/obj/item/clothing/glasses/thermal),
				"upgrade" = list("clothes", "trash"),
				"degrade" = list("teir2glasses")
			),
		"teir1gloves" = list(
				"types" = subtypesof(/obj/item/clothing/gloves) - list(/obj/item/clothing/gloves/golem, /obj/item/clothing/gloves/shadowling),
				"upgrade" = list("clothes"),
				"degrade" = list("trash")
			),
		"teir1hat" = list(
				"types" = subtypesof(/obj/item/clothing/head) + subtypesof(/obj/item/clothing/head/helmet) - list(/obj/item/clothing/head/shadowling, /obj/item/clothing/head/helmet/space/golem, /obj/item/clothing/head/chameleon),
				"upgrade" = list("teir2hat"),
				"degrade" = list("trash")
			),
		"teir2hat" = list(
				"types" = list (/obj/item/clothing/head/chameleon) + subtypesof(/obj/item/clothing/head/helmet),
				"upgrade" = list("clothes", "trash"),
				"degrade" = list("teir1hat")
			),
		"teir1mask" = list(
				"types" = subtypesof(/obj/item/clothing/mask) - list(/obj/item/clothing/mask/facehugger, /obj/item/clothing/mask/gas/shadowling, /obj/item/clothing/mask/gas/golem),
				"upgrade" = list("clothes", "trash"),
				"degrade" = list("trash")
			),
		"teir1shoes" = list(
				"types" = subtypesof(/obj/item/clothing/shoes) - list(/obj/item/clothing/shoes, /obj/item/clothing/shoes/golem, /obj/item/clothing/shoes/shadowling),
				"upgrade" = list("clothes", "trash"),
				"degrade" = list("trash")
			),
		"teir1suit" = list(
				"types" = subtypesof(/obj/item/clothing/suit) - typesof(/obj/item/clothing/suit/armor) + typesof(/obj/item/clothing/suit/bio_suit) + list(/obj/item/clothing/suit/chameleon),
				"upgrade" = list("teir2suit"),
				"degrade" = list("trash")
			),
		"teir2suit" = list(
				"types" = subtypesof(/obj/item/clothing/suit/armor) + subtypesof(/obj/item/clothing/suit/bio_suit) + list(/obj/item/clothing/suit/chameleon) - list(/obj/item/clothing/shoes, /obj/item/clothing/shoes/golem, /obj/item/clothing/shoes/shadowling),
				"upgrade" = list("clothes", "trash"),
				"degrade" = list("teir1suit")
			),
		"labcoats" = list(
				"types" = typesof(/obj/item/clothing/suit/storage/labcoat),
				"upgrade" = list("clothes", "trash"),
				"degrade" = list("clothes")
			),
		"clothes" = list(
				"types" = typesof(/obj/item/clothing/under) - list(/obj/item/clothing/under/chameleon, /obj/item/clothing/under/golem, /obj/item/clothing/under/gimmick),
				"upgrade" = list("labcoats", "teir1glasses", "teir1gloves", "teir1hat", "teir1mask", "teir1shoes", "teir1suit"),
				"degrade" = list("trash")
			),
		"goodtools" = list(
				"types" = list(
					/obj/item/weapon/wirecutters/power,
					/obj/item/weapon/crowbar/power,
					/obj/item/weapon/screwdriver/power,
					/obj/item/weapon/wrench/power,
					/obj/item/weapon/weldingtool/largetank,
					/obj/item/weapon/weldingtool/hugetank,
					/obj/item/weapon/weldingtool/experimental
					),
				"upgrade" = list(),
				"degrade" = list("tools")
			),
		"toolbelts" = list(
				"types" = typesof(/obj/item/weapon/storage/belt) + subtypesof(/obj/item/weapon/storage/toolbox),
				"upgrade" = list(),
				"degrade" = list("tools")
			),
		"tools" = list(
				"types" = list(
					/obj/item/weapon/screwdriver,
					/obj/item/weapon/wrench,
					/obj/item/weapon/weldingtool,
					/obj/item/device/analyzer,
					/obj/item/weapon/wirecutters,
					/obj/item/device/multitool,
					/obj/item/weapon/crowbar,
					/obj/item/device/t_scanner
					),
				"upgrade" = list("goodtools", "toolbelts", "devices"),
				"degrade" = list("trash")
			),
		"devices" = list(
				"types" = subtypesof(/obj/item/device) - typesof(/obj/item/device/drop_caller) - list(/obj/item/device/radio/uplink, /obj/item/device/scp113, /obj/item/device/uplink, /obj/item/device/wormhole_jaunter),
				"upgrade" = list("goodtools", "trash"),
				"degrade" = list("tools")
			),
		"trash" = list(
				"types" = list(
					/obj/item/stack/sheet/metal,
					/obj/item/stack/sheet/glass,
					/obj/item/stack/rods,
					/obj/item/weapon/shard
					) + subtypesof(/obj/item/trash),
				"upgrade" = list("tools", "clothes"),
				"degrade" = list()
			),
		"tier1card" = list(
				"types" = list(
					/obj/item/weapon/card/id/civ
				),
				"upgrade" = list("tier2card"),
				"degrade" = list("trash")
			),
		"tier2card" = list(
				"types" = list(
					/obj/item/weapon/card/id/sci/scp,
					/obj/item/weapon/card/id/med/scp
				),
				"upgrade" = list("tier3card"),
				"degrade" = list("tier1card")
			),
		"tier3card" = list(
				"types" = list(
					/obj/item/weapon/card/id/sec/scp
				),
				"upgrade" = list("tier4card"),
				"degrade" = list("tier2card")
			),
		"tier4card" = list(
				"types" = list(
					/obj/item/weapon/card/id/secGold/scp,
					/obj/item/weapon/card/id/sciGold/scp
				),
				"upgrade" = list("tier5card"),
				"degrade" = list("tier3card")
			),
		"tier5card" = list(
				"types" = list(
					/obj/item/weapon/card/id/gold/scp
				),
				"upgrade" = list("trash"), //lul
				"degrade" = list("tier4card")
			),
		"teir1guns" = list(
				"types" = subtypesof(/obj/item/weapon/gun/projectile) + list(/obj/item/weapon/gun/syringe, /obj/item/weapon/gun/energy/taser) - typesof(/obj/item/weapon/gun/projectile/shotgun) - typesof(/obj/item/weapon/gun/projectile/automatic) - list(/obj/item/weapon/gun/projectile/revolver/rocketlauncher, /obj/item/weapon/gun/projectile/heavyrifle, /obj/item/weapon/gun/projectile/revolver/mateba),
				"upgrade" = list("teir2guns"),
				"degrade" = list("trash")
			),
		"teir2guns" = list(
				"types" = typesof(/obj/item/weapon/gun/projectile/shotgun) + typesof(/obj/item/weapon/gun/projectile/automatic) + typesof(/obj/item/weapon/gun/energy) +subtypesof(/obj/item/weapon/gun/syringe) - typesof(/obj/item/weapon/gun/energy/meteorgun) - list(/obj/item/weapon/gun/energy/gun/nuclear, /obj/item/weapon/gun/energy/taser, /obj/item/weapon/gun/projectile/revolver/rocketlauncher, /obj/item/weapon/gun/projectile/heavyrifle),
				"upgrade" = list("teir3guns"),
				"degrade" = list("teir1guns")
			),
		"teir3guns" = list(
				"types" = list(/obj/item/weapon/gun/energy/gun/nuclear, /obj/item/weapon/gun/projectile/revolver/rocketlauncher, /obj/item/weapon/gun/projectile/heavyrifle, /obj/item/weapon/gun/grenadelauncher),
				"upgrade" = list("trash"),
				"degrade" = list("teir2guns")
			),
	)

	//START_PROCESSING(SSobj, src)

/obj/machinery/scp914/Destroy()
	QDEL_NULL(input_obj)
	QDEL_NULL(output_obj)
	QDEL_NULL(left_obj)
	QDEL_NULL(right_obj)
	//STOP_PROCESSING(SSobj, src)
	return ..()

/obj/machinery/scp914/proc/get_category(obj/item/I)
	for(var/category in item_tree)
		var/list/category_obj = item_tree[category]
		for(var/e in category_obj["types"])
			if((I.type == e))
				return category
	return null

/obj/machinery/scp914/proc/process_human(mob/living/carbon/human/H, mode)
	if(mode == "1:1")
		H.gender = pick(MALE, FEMALE)
		if(H.gender == MALE)
			H.name = pick(first_names_male)
		else
			H.name = pick(first_names_female)
		H.name += " [pick(last_names)]"
		H.real_name = H.name
		var/datum/preferences/A = new()	//Randomize appearance for the human
		A.randomize_appearance_for(H)
		H.h_style = random_hair_style(H.gender, H.species.name)
		H.f_style = random_facial_hair_style(H.gender, H.species.name)
		H.update_hair()
		to_chat(H, "<span class='notice'>You feel like a completely different person</span>")
		H.forceMove(output_obj)
		to_output += H
		return
	if(mode == "Coarse")
		to_chat(H, "<span class='warning'>OUCH</span>")
		H.forceMove(src)
		for (var/i in 1 to rand(1,3))
			if(prob(50))
				H.adjustBruteLoss(20)
			else
				H.adjustFireLoss(20)
		H.forceMove(output_obj)
		to_output += H
		return
	if(mode == "Rough")
		to_chat(H, "<span class='warning'>OUCH</span>")
		H.forceMove(src)
		for (var/i in 1 to rand(7,8))
			if(prob(50))
				H.adjustBruteLoss(20)
			else
				H.adjustFireLoss(20)
		H.forceMove(output_obj)
		to_output += H
		return
	if(mode == "Fine")
		to_chat(H, "<span class='notice'>I feel better</span>")
		H.heal_overall_damage(H.getBruteLoss(), H.getFireLoss())
		H.restore_blood()
		H.restore_all_bodyparts()
		H.forceMove(output_obj)
		H.blinded = 0
		H.eye_blind = 0
		H.eye_blurry = 0
		H.ear_deaf = 0
		H.ear_damage = 0
		if(H.stat == DEAD)
			H.tod = worldtime2text()
			H.timeofdeath = world.time
		to_output += H
		return
	if(mode == "Very fine")
		var/list/variants = list("revive", "species","mutations")
		var/variant = pick(variants)
		if(variant == "revive")
			H.revive()
			H.remove_any_mutations()
			domutcheck(H, null)
			to_chat(H, "<span class='notice'>I feel alive</span>")
			H.forceMove(output_obj)
			to_output += H
			return
		if(variant == "species" && (H.species.name in list(HUMAN,UNATHI,TAJARAN,SKRELL)))
			to_chat(H, "<span class='notice'>What Am I??</span>")
			H.set_species(pick(list(HUMAN,UNATHI,TAJARAN,SKRELL) - H.species.name), FALSE, TRUE)
			H.h_style = random_hair_style(H.gender, H.species.name)
			H.f_style = random_facial_hair_style(H.gender, H.species.name)
			H.update_hair()
			H.forceMove(output_obj)
			to_output += H
			return
		if(variant == "mutations")
			to_chat(H, "<span class='notice'>Something is changing inside me</span>")
			for (var/i in 1 to rand(1,4))
				if(prob(10))
					randmutb(H)
				else
					randmutg(H)
			domutcheck(H, null)
			H.forceMove(output_obj)
			to_output += H
			return


	H.forceMove(output_obj)
	to_output += H

/obj/machinery/scp914/proc/process_item(obj/item/I, mode)
	if(mode == "1:1")
		var/category = get_category(I)
		if(category)
			var/newtype = pick(item_tree[category]["types"])
			var/newitem = new newtype(output_obj)
			qdel(I)
			to_output += newitem
			return
	if(mode == "Fine")
		to_output += upgrade_item(I)
		return
	if(mode == "Coarse")
		to_output += degrade_item(I)
		return
	if(mode == "Rough")
		for (var/i in 1 to rand(1,3))
			if(prob(80))
				I = degrade_item(I)
			else
				I = upgrade_item(I)
		to_output += I
		return
	if(mode == "Very fine")
		for (var/i in 1 to rand(1,3))
			if(prob(80))
				I = upgrade_item(I)
			else
				I = degrade_item(I)
		to_output += I
		return

	I.forceMove(output_obj)
	to_output += I

/obj/machinery/scp914/proc/upgrade_item(obj/item/I)
	var/category = get_category(I)
	if(category)
		var/category_obj = item_tree[category]
		if(category_obj["upgrade"] && category_obj["upgrade"].len > 0)
			var/newcategory = pick(category_obj["upgrade"])

			var/newtype = pick(item_tree[newcategory]["types"])
			var/newitem = new newtype(output_obj)
			qdel(I)
			return newitem
	I.forceMove(output_obj)
	return I

/obj/machinery/scp914/proc/degrade_item(obj/item/I)
	var/category = get_category(I)
	if(category)
		var/category_obj = item_tree[category]
		if(category_obj["degrade"] && category_obj["degrade"].len > 0)
			var/newcategory = pick(category_obj["degrade"])

			var/newtype = pick(item_tree[newcategory]["types"])
			var/newitem = new newtype(output_obj)
			qdel(I)
			return newitem
	I.forceMove(output_obj)
	return I

/obj/machinery/scp914/attack_hand(mob/user)
	if(active)
		to_chat(user, "<span class='notice'>The machine seems to be busy</span>")
		return

	var/picked = input("Select mode", "Select mode")as null|anything in list("Rough", "Coarse", "1:1", "Fine", "Very fine")
	if(active)
		to_chat(user, "<span class='notice'>The machine seems to be busy</span>")
		return
	if(!picked || !in_range(user, src))
		return
	active = TRUE
	input_obj.icon_state = "in_closed"
	output_obj.icon_state = "out_closed"
	input_obj.density = 1
	output_obj.density = 1
	var/process_mode = picked
	playsound(loc, 'sound/effects/gibber.ogg', 100, 1)
	visible_message("<span class='warning'>Machine's gears start to move</span>")

	items_to_process = list()
	to_output = list()
	for(var/obj/item/I in input_obj.loc.contents)
		I.forceMove(input_obj)
		items_to_process += I
	for(var/mob/living/carbon/human/H in input_obj.loc.contents)
		H.forceMove(input_obj)
		humans_to_process += H

	spawn(process_time/2)
		playsound(loc, 'sound/effects/gibber.ogg', 100, 1)
		for(var/obj/item/I in items_to_process)
			process_item(I, process_mode)
		items_to_process = list()
		for(var/mob/living/carbon/human/H in humans_to_process)
			process_human(H, process_mode)
		humans_to_process = list()

		spawn(process_time/2)
			for(var/obj/A in to_output)
				A.forceMove(output_obj.loc)
			for(var/mob/A in to_output)
				A.forceMove(output_obj.loc)
			to_output = list()
			input_obj.icon_state = "in"
			output_obj.icon_state = "out"
			active = FALSE
			input_obj.density = 0
			output_obj.density = 0
			playsound(loc, 'sound/machines/ding.ogg', 60, 1)



/datum/unarmed_attack/punch/scp073_attack
	damage = 10

/datum/species/scp073
	name = "SCP-073"
	icobase = 'code/modules/SCP/scp-073.dmi'
	deform = 'code/modules/SCP/scp-073.dmi'
	dietflags = DIET_OMNI
	unarmed_type = /datum/unarmed_attack/punch/scp073_attack
	eyes = "blank_eyes"

	flags = list(
	HAS_LIPS = TRUE
	,HAS_UNDERWEAR = TRUE
	,HAS_HAIR = TRUE
	)

	brute_mod = 0.5
	burn_mod = 0.5
	brain_mod = 0
	speed_mod = -0.7

	has_gendered_icons = FALSE

/mob/living/carbon/human/scp073
	real_name = "SCP-073"
	desc = "Arabic man with a lot of prosthetic body parts and a strange symbol on his head. You feel uneasy with him nearby"

/mob/living/carbon/human/scp073/atom_init(mapload)
	. = ..(mapload, "SCP-073")
	universal_speak = TRUE
	universal_understand = TRUE

	underwear = 5
	equip_to_slot_or_del(new /obj/item/clothing/under/shorts/black(src)) //slot_w_uniform
	equip_to_slot_or_del(new /obj/item/clothing/shoes/sandal(src))// slot_shoes)
	update_body()


/mob/living/carbon/human/scp073/examine(mob/user)
	to_chat(user, "<b><span class = 'info'><big>SCP-073</big></span></b> - [desc]")
	return ..(user)

/mob/living/carbon/human/scp073/bullet_act(obj/item/projectile/P, def_zone)
	if(ishuman(P.firer) && P.firer != src)
		var/mob/living/carbon/human/H = P.firer
		if(H != src)
			apply_effect(P.damage / 3 + P.agony / 3,AGONY,0)
		return H.bullet_act(P, def_zone)
	else
		. = ..(P, def_zone)

/mob/living/carbon/human/scp073/attacked_by(obj/item/I, mob/living/user, def_zone)
	if(ishuman(user) && user != src)
		var/mob/living/carbon/human/H = user
		H.do_attack_animation(src)
		if(H != src)
			apply_effect(I.force,AGONY,0)
		return H.attacked_by(I, user, def_zone)
	else
		. = ..(I, user, def_zone)

/mob/living/carbon/human/scp073/attack_hand(mob/living/carbon/human/M)
	if(M.a_intent == "hurt" && M != src)
		M.attack_hand(M)
		M.do_attack_animation(src)
		if(M != src)
			apply_effect(5,AGONY,0)
	else
		. = ..(M)

/mob/living/carbon/human/scp073/attack_animal(mob/living/simple_animal/M)
	if(M)
		if(M.melee_damage_upper == 0)
			M.emote("[M.friendly] [src]")
			return TRUE
		else
			if(M.attack_sound)
				playsound(loc, M.attack_sound, 50, 1, 1)
			visible_message("<span class='userdanger'><B>[M]</B>[M.attacktext] [src]!</span>")
			M.attack_log += text("\[[time_stamp()]\] <font color='red'>attacked [src.name] ([src.ckey])</font>")
			src.attack_log += text("\[[time_stamp()]\] <font color='orange'>was attacked by [M.name] ([M.ckey])</font>")
			var/damage = rand(M.melee_damage_lower, M.melee_damage_upper)
			M.adjustBruteLoss(damage)
			M.do_attack_animation(src)
			apply_effect(damage,AGONY,0)
			return TRUE
		return FALSE
	else
		. = ..(M)

/mob/living/carbon/human/scp073/Life()
	. = ..()

	for(var/obj/item/I in list(l_hand,r_hand))
		if(istype(I, /obj/item/weapon/paper) || istype(I, /obj/item/weapon/reagent_containers/food/snacks/grown))
			visible_message("<span class='rose'>[I] burns when it touches [src]'s hand, turning into ash. It flutters through the air before settling on the floor in a heap.</span>")
			drop_from_inventory(I)
			new /obj/effect/decal/cleanable/ash(I.loc)
			qdel(I)

	var/list/mytargets = list(loc, get_step(loc, EAST), get_step(loc, WEST), get_step(loc, NORTH), get_step(loc, SOUTH))
	var/foundgrass = FALSE
	for(var/turf/T in mytargets)

		if(T.icon_state in list("grass1", "grass2", "grass3", "grass4"))
			T.icon_state = "asteroid"
			foundgrass = TRUE
		for(var/obj/structure/flora/F in T.contents)
			F.color = next_in_list(F.color, list("#ffffd1", "#cccca7", "#898970", "#555570", "#000000"))

			if(F.color == "#000000")
				qdel(F)

	if(foundgrass)
		visible_message("<span class='warning'>The grass around [src] quickly dies and turns yellow.</span>")

	if(machine)
		machine.interact(src)

/mob/living/carbon/human/scp073/movement_delay()
	..()
	var/tally = species.speed_mod
	if(crawling)
		tally += 7
	if(buckled) // so, if we buckled we have large debuff
		tally += 5.5
	if(pull_debuff)
		tally += pull_debuff
	if(health-halloss <= 50)
		tally += 0.5
	if(health-halloss <= 0)
		tally += 1
	if(health-halloss <= -50)
		tally += 1

	var/chem_nullify_debuff = FALSE
	if(!species.flags[NO_BLOOD] && ( reagents.has_reagent("hyperzine") || reagents.has_reagent("nuka_cola") )) // hyperzine removes equipment slowdowns (no blood = no chemical effects).
		chem_nullify_debuff = TRUE

	if(wear_suit && wear_suit.slowdown && !(wear_suit.slowdown > 0 && chem_nullify_debuff))
		tally += wear_suit.slowdown

	if(back && back.slowdown && !(back.slowdown > 0 && chem_nullify_debuff))
		tally += back.slowdown

	if(shoes && shoes.slowdown && !(shoes.slowdown > 0 && chem_nullify_debuff))
		tally += shoes.slowdown

	return (tally + config.human_delay)


/*/mob/living/carbon/human/scp073/ClickOn( atom/A, params )
	var/oldloc = loc
	if(isturf(A))
		loc = A
	else if(istype(A, /obj))
		var/obj/O = A
		loc = O.loc

	spawn(0)
		spawn(0)
			loc = oldloc
		ClickOn2(A, params)

	//INVOKE_ASYNC(src, /mob.proc/ClickOn, A, params)

	//..(A, params)
	spawn(0)
		loc = oldloc

/mob/living/carbon/human/scp073/can_use_topic()
	if(stat == 0)
		return STATUS_INTERACTIVE
	else
		. = ..()


/mob/living/carbon/human/scp073/proc/ClickOn2( atom/A, params )
	if(world.time <= next_click)
		return
	next_click = world.time + 1

	if(client.buildmode)
		build_click(src, client.buildmode, params, A)
		return

	var/list/modifiers = params2list(params)

	if(client.cob && client.cob.in_building_mode)
		cob_click(client, modifiers)
		return

	if(modifiers["shift"] && modifiers["ctrl"])
		CtrlShiftClickOn(A)
		return
	if(modifiers["middle"])
		MiddleClickOn(A)
		return
	if(modifiers["shift"])
		ShiftClickOn(A)
		return
	if(modifiers["alt"]) // alt and alt-gr (rightalt)
		AltClickOn(A)
		return
	if(modifiers["ctrl"])
		CtrlClickOn(A)
		return

	if(stat || paralysis || stunned || weakened)
		return

	face_atom(A) // change direction to face what you clicked on

	if(next_move > world.time) // in the year 2000...
		return

	if(istype(loc,/obj/mecha))
		if(!locate(/turf) in list(A, A.loc)) // Prevents inventory from being drilled
			return
		var/obj/mecha/M = loc
		return M.click_action(A, src)

	if(restrained())
		RestrainedClickOn(A)
		return

	if(in_throw_mode)
		throw_item(A)
		return

	if(!istype(A,/obj/item/weapon/gun) && !isturf(A) && !istype(A,/obj/screen))
		last_target_click = world.time

	var/obj/item/W = get_active_hand()

	if(W == A)
		W.attack_self(src)
		if(hand)
			update_inv_l_hand()
		else
			update_inv_r_hand()
		return

	// operate two STORAGE levels deep here (item in backpack in src; NOT item in box in backpack in src)
	var/sdepth = A.storage_depth(src)
	if(A == loc || (A in loc) || (sdepth != -1 && sdepth <= 1))

		// No adjacency needed
		if(W)

			var/resolved = A.attackby(W,src,params)
			if(!resolved && A && W)
				W.afterattack(A, src, 1, params) // 1 indicates adjacency
		else
			UnarmedAttack(A)
		return

	if(!isturf(loc)) // This is going to stop you from telekinesing from inside a closet, but I don't shed many tears for that
		return

	// Allows you to click on a box's contents, if that box is on the ground, but no deeper than that
	sdepth = A.storage_depth_turf()
	if(isturf(A) || isturf(A.loc) || (sdepth != -1 && sdepth <= 1))

		if(A.Adjacent(src)) // see adjacent.dm
			if(W)
				// Return 1 in attackby() to prevent afterattack() effects (when safely moving items for example)
				var/resolved = A.attackby(W, src, params)
				if(!resolved && A && W)
					W.afterattack(A, src, 1, params) // 1: clicking something Adjacent
			else
				UnarmedAttack(A)
		else // non-adjacent click
			if(W)
				W.afterattack(A, src, 0, params) // 0: not Adjacent
			else
				RangedAttack(A, params)*/

/obj/item/device/camera/scp105
	name = "Iris' camera"
	icon = 'code/modules/SCP/SCP.dmi'
	desc = "A polaroid camera. 10 photos left."
	icon_state = "scp105b"
	pictures_max = 10
	pictures_left = 10
	icon_on = "scp105b"
	icon_off = "scp105b_off"

/obj/item/device/camera/scp105/captureimage(atom/target, mob/user, flag)  //Proc for both regular and AI-based camera to take the image
	var/mobs = ""
	var/list/mob_names = list()
	var/isAi = istype(user, /mob/living/silicon/ai)
	var/list/seen
	if(!isAi) //crappy check, but without it AI photos would be subject to line of sight from the AI Eye object. Made the best of it by moving the sec camera check inside
		if(user.client)		//To make shooting through security cameras possible
			seen = hear(world.view, user.client.eye) //To make shooting through security cameras possible
		else
			seen = hear(world.view, user)
	else
		seen = hear(world.view, target)

	var/list/turfs = list()
	for(var/turf/T in range(round(photo_size * 0.5), target))
		if(T in seen)
			if(isAi && !cameranet.checkTurfVis(T))
				continue
			else
				var/detail_list = camera_get_mobs(T)
				turfs += T
				mobs += detail_list["mob_detail"]
				mob_names += detail_list["names_detail"]

	var/icon/temp = get_base_photo_icon()
	temp.Blend("#000", ICON_OVERLAY)
	temp.Blend(camera_get_icon(turfs, target), ICON_OVERLAY)

	var/datum/picture/P = createpicture(user, temp, mobs, mob_names, flag)
	var/turf/phototurf
	if(!isturf(target))
		phototurf = target.loc
	else
		phototurf = target
	printpicture(user, P, phototurf)

/obj/item/device/camera/scp105/printpicture(mob/user, datum/picture/P, turf/target)
	var/obj/item/weapon/photo/scp105/Photo = new/obj/item/weapon/photo/scp105()
	Photo.loc = user.loc
	Photo.photoloc = target
	if(!user.get_inactive_hand())
		user.put_in_inactive_hand(Photo)
	Photo.construct(P)

/obj/effect/scp105hand
	name = "A hand"
	desc = "That's a human hand coming from an invisible portal, omg!"
	icon = 'code/modules/SCP/SCP.dmi'
	icon_state = "scp105hand"
	anchored = TRUE
	unacidable = TRUE

/obj/item/weapon/photo/scp105
	name = "photo"
	var/turf/photoloc
	var/mob/camera/Eye/eyeobj
	var/obj/effect/scp105hand/hand

/obj/item/weapon/photo/scp105/Destroy()
	if(eyeobj)
		QDEL_NULL(eyeobj)
	if(hand)
		QDEL_NULL(hand)
	return ..()

/obj/item/weapon/photo/scp105/attack_self(mob/user)
	if(istype(user, /mob/living/carbon/human/scp105))
		var/mob/living/carbon/human/scp105/H = user
		if(!H.lookingphoto)
			H.lookingphoto = src
			H.client.adminobs = TRUE
			hand = new(photoloc)
			hand.dir = user.dir
			eyeobj = new(photoloc)
			eyeobj.master = H
			eyeobj.name = "[H.name] (Eye)"
			H.client.eye = eyeobj
			H.reset_view(eyeobj)
		else
			H.lookingphoto.disable_cam(H)
	else
		..()

/obj/item/weapon/photo/scp105/proc/disable_cam(var/mob/living/carbon/human/scp105/H)
	if(eyeobj)
		QDEL_NULL(eyeobj)
	if(hand)
		QDEL_NULL(hand)
	H.client.adminobs = FALSE
	H.reset_view(null)
	H.lookingphoto = null

/mob/living/carbon/human/scp105
	real_name = "Iris Thompson"
	var/obj/item/weapon/photo/scp105/lookingphoto = null

/mob/living/carbon/human/scp105/atom_init(mapload)
	. = ..(mapload, HUMAN)
	gender = FEMALE
	r_hair = 211
	g_hair = 196
	b_hair = 141
	h_style = "Longer Fringe"

	equip_to_slot_or_del(new /obj/item/clothing/under/tourist(src)) //slot_w_uniform
	equip_to_slot_or_del(new /obj/item/clothing/shoes/black(src))// slot_shoes)
	equip_to_slot_or_del(new /obj/item/device/camera/scp105(src))// slot_belt)
	update_body()
	update_hair()

/mob/living/carbon/human/scp105/Life()
	. = ..()

	if(lookingphoto)
		if((l_hand != lookingphoto && r_hand != lookingphoto) || stat>0)
			lookingphoto.disable_cam(src)
			lookingphoto = null
		else if(lookingphoto.hand)
			lookingphoto.hand.dir = dir

	if(machine && lookingphoto)
		machine.interact(src)

	if(client && client.adminobs && !client.eye)
		client.adminobs = FALSE
		reset_view(null)
		lookingphoto = null

/mob/living/carbon/human/scp105/ClickOn( atom/A, params )
	if(!lookingphoto)
		return ..(A, params)

	var/oldloc = loc
	loc = lookingphoto.photoloc

	spawn(0)
		spawn(0)
			loc = oldloc
			if(lookingphoto.hand)
				lookingphoto.hand.dir = dir
		ClickOn2(A, params)

	//INVOKE_ASYNC(src, /mob.proc/ClickOn, A, params)

	//..(A, params)
	//spawn(0)
	//	loc = oldloc

/mob/living/carbon/human/scp105/can_use_topic()
	if(stat == 0)
		return STATUS_INTERACTIVE
	else
		. = ..()


/mob/living/carbon/human/scp105/proc/ClickOn2( atom/A, params )
	if(world.time <= next_click)
		return
	next_click = world.time + 1

	if(client.buildmode)
		build_click(src, client.buildmode, params, A)
		return

	var/list/modifiers = params2list(params)

	if(client.cob && client.cob.in_building_mode)
		cob_click(client, modifiers)
		return

	if(modifiers["shift"] && modifiers["ctrl"])
		CtrlShiftClickOn(A)
		return
	if(modifiers["middle"])
		MiddleClickOn(A)
		return
	if(modifiers["shift"])
		ShiftClickOn(A)
		return
	if(modifiers["alt"]) // alt and alt-gr (rightalt)
		AltClickOn(A)
		return
	if(modifiers["ctrl"])
		CtrlClickOn(A)
		return

	if(stat || paralysis || stunned || weakened)
		return

	face_atom(A) // change direction to face what you clicked on

	if(next_move > world.time) // in the year 2000...
		return

	if(istype(loc,/obj/mecha))
		if(!locate(/turf) in list(A, A.loc)) // Prevents inventory from being drilled
			return
		var/obj/mecha/M = loc
		return M.click_action(A, src)

	if(restrained())
		RestrainedClickOn(A)
		return

	if(in_throw_mode)
		throw_item(A)
		return

	if(!istype(A,/obj/item/weapon/gun) && !isturf(A) && !istype(A,/obj/screen))
		last_target_click = world.time

	var/obj/item/W = get_active_hand()

	if(W == A)
		W.attack_self(src)
		if(hand)
			update_inv_l_hand()
		else
			update_inv_r_hand()
		return

	// operate two STORAGE levels deep here (item in backpack in src; NOT item in box in backpack in src)
	var/sdepth = A.storage_depth(src)
	if(A == loc || (A in loc) || (sdepth != -1 && sdepth <= 1))

		// No adjacency needed
		if(W)

			var/resolved = A.attackby(W,src,params)
			if(!resolved && A && W)
				W.afterattack(A, src, 1, params) // 1 indicates adjacency
		else
			UnarmedAttack(A)
		return

	if(!isturf(loc)) // This is going to stop you from telekinesing from inside a closet, but I don't shed many tears for that
		return

	// Allows you to click on a box's contents, if that box is on the ground, but no deeper than that
	sdepth = A.storage_depth_turf()
	if(isturf(A) || isturf(A.loc) || (sdepth != -1 && sdepth <= 1))

		if(A.Adjacent(src)) // see adjacent.dm
			if(W)
				// Return 1 in attackby() to prevent afterattack() effects (when safely moving items for example)
				var/resolved = A.attackby(W, src, params)
				if(!resolved && A && W)
					W.afterattack(A, src, 1, params) // 1: clicking something Adjacent
			else
				UnarmedAttack(A)
		else // non-adjacent click
			if(W)
				W.afterattack(A, src, 0, params) // 0: not Adjacent
			else
				RangedAttack(A, params)


/datum/unarmed_attack/punch/scp076_attack
	damage = 14

/datum/species/scp076
	name = "SCP-076"
	icobase = 'code/modules/SCP/scp-076.dmi'
	deform = 'code/modules/SCP/scp-076.dmi'
	dietflags = DIET_OMNI
	unarmed_type = /datum/unarmed_attack/punch/scp076_attack
	eyes = "blank_eyes"

	flags = list(
	HAS_LIPS = TRUE
	,HAS_UNDERWEAR = FALSE
	,NO_PAIN = TRUE
	)

	brute_mod = 0.3
	burn_mod = 0.5
	oxy_mod = 0.2
	tox_mod = 0
	brain_mod = 0
	speed_mod = -1.0

	has_gendered_icons = FALSE

/datum/species/scp076/on_gain(mob/living/carbon/human/H)
	H.status_flags &= ~(CANSTUN | CANWEAKEN | CANPARALYSE)
	return ..()

/mob/living/carbon/human/scp076
	real_name = "SCP-076"
	desc = "Lean Semitic man with strange tattoos all over the body"

/mob/living/carbon/human/scp076/atom_init(mapload)
	. = ..(mapload, "SCP-076")
	universal_speak = TRUE
	universal_understand = TRUE

	equip_to_slot_or_del(new /obj/item/clothing/under/scp076_pants(src)) //slot_w_uniform
	equip_to_slot_or_del(new /obj/item/clothing/suit/scp076_mantle(src))// slot_wear_suit)
	equip_to_slot_or_del(new /obj/item/clothing/shoes/sandal(src))// slot_shoes)
	AddSpell(new /obj/effect/proc_holder/spell/aoe_turf/scp076_sword)


/mob/living/carbon/human/scp076/examine(mob/user)
	to_chat(user, "<b><span class = 'info'><big>SCP-076</big></span></b> - [desc]")
	return ..(user)

/mob/living/carbon/human/scp076/movement_delay()
	..()
	var/tally = species.speed_mod
	if(crawling)
		tally += 7
	if(buckled) // so, if we buckled we have large debuff
		tally += 5.5
	if(pull_debuff)
		tally += pull_debuff
	if(health-halloss <= 50)
		tally += 0.4
	if(health-halloss <= 0)
		tally += 0.4

	var/chem_nullify_debuff = FALSE
	if(!species.flags[NO_BLOOD] && ( reagents.has_reagent("hyperzine") || reagents.has_reagent("nuka_cola") )) // hyperzine removes equipment slowdowns (no blood = no chemical effects).
		chem_nullify_debuff = TRUE

	if(wear_suit && wear_suit.slowdown && !(wear_suit.slowdown > 0 && chem_nullify_debuff))
		tally += wear_suit.slowdown

	if(back && back.slowdown && !(back.slowdown > 0 && chem_nullify_debuff))
		tally += back.slowdown

	if(shoes && shoes.slowdown && !(shoes.slowdown > 0 && chem_nullify_debuff))
		tally += shoes.slowdown

	return (tally + config.human_delay)

/mob/living/carbon/human/scp076/eyecheck()
	return 2

/mob/living/carbon/human/scp076/IsAdvancedToolUser()
	return FALSE

/obj/item/clothing/under/scp076_pants
	name = "pants"

	icon = 'code/modules/SCP/scp076/clothing.dmi'
	icon_custom = 'code/modules/SCP/scp076/clothing.dmi'
	icon_state = "pants"
	item_state = "pants"
	item_color = "pants"

/obj/item/clothing/suit/scp076_mantle
	name = "mantle"

	icon = 'code/modules/SCP/scp076/clothing.dmi'
	icon_custom = 'code/modules/SCP/scp076/clothing.dmi'
	icon_state = "mantle"
	item_state = "mantle"
	item_color = "mantle"

/obj/item/weapon/melee/scp076_sword
	name = "blade"
	desc = "Completely black sword looking thing."
//	icon = 'code/modules/SCP/scp076/clothing.dmi'
//	icon_state = "sword"
//	item_state = "sword"
	lefthand_file = 'code/modules/SCP/scp076/left.dmi'
	righthand_file = 'code/modules/SCP/scp076/right.dmi'
	flags = DROPDEL
	w_class = 5.0
	force = 25
	throwforce = 0
	throw_range = 0
	throw_speed = 0

/obj/item/weapon/melee/scp076_sword/dropped(mob/user)
	if(!QDELETED(src))
		qdel(src)

/obj/effect/proc_holder/spell/aoe_turf/scp076_sword
	name = "Materialize blade"
	desc = ""
	panel = "SCP"
	charge_max = 10
	clothes_req = 0
	range = 1

/obj/effect/proc_holder/spell/aoe_turf/scp076_sword/cast(list/targets)
	var/mob/living/carbon/human/H = usr

	if(H.is_busy(H) || H.restrained() || H.incapacitated())
		to_chat(H,"<span class='userdanger'>You can't materialize a blade while restrained</span>")
		return

	if(!H.unEquip(H.get_active_hand()))
		return

	H.visible_message("<span class='warning'>[H] materializes a completely black blade!</span>")
	var/obj/item/weapon/melee/scp076_sword/W = new /obj/item/weapon/melee/scp076_sword(H)
	H.put_in_active_hand(W)

/obj/machinery/computer/scp_intercom
	name = "Intercom"
	desc = "Yell something stupid."
	icon_state = "computer_generic"
	light_color = "#009900"
	var/message_cooldown = 30
	var/current_cooldown = 0
	var/translation_time = 30
	var/translating = 0

/obj/machinery/computer/scp_intercom/atom_init()
	. = ..()
	START_PROCESSING(SSobj, src)

/obj/machinery/computer/scp_intercom/Destroy()
	STOP_PROCESSING(SSobj, src)
	return ..()

/obj/machinery/computer/scp_intercom/ui_interact(mob/user)
	var/dat
	if(current_cooldown > 0)
		dat += "<b style='color: #00AA00;'>RESTARTING<br>"
		dat += "[current_cooldown]</b>"
	else if(translating > 0)
		dat += "<b style='color: #00AA00;'>TRANSMITTING...<br>"
		dat += "TIME LEFT - [translating]</b><br>"
		dat += "<a href='byond://?src=\ref[src];stop_translation=1'>Stop translation</a><br>"
	else
		dat += "<b style='color: #00AA00;'>READY</b><br>"
		dat += "<a href='byond://?src=\ref[src];make_announce=1'>Make a single announcement</a><br>"
		dat += "<a href='byond://?src=\ref[src];start_translation=1'>Start translation</a><br>"
	var/datum/browser/popup = new(user, "window=scpintercom", "[name]", 400, 350)
	popup.set_content(dat)
	popup.open()

/obj/machinery/computer/scp_intercom/process()
	if(current_cooldown > 0)
		current_cooldown -= 1

	if(translating > 0)
		translating -= 1

		if(translating == 10)
			visible_message("<span class='notice'>[src]: 10 seconds left before translation ends</span>")

		if(translating <= 0)
			world << sound('code/modules/SCP/intercom_stop.wav')
			current_cooldown = message_cooldown

/obj/machinery/computer/scp_intercom/Topic(href, href_list)
	. = ..()
	if(!.)
		return

	if (href_list["make_announce"] && current_cooldown <= 0 && translating <= 0)
		var/input = sanitize(input(usr, "Please choose a message to announce to the facility.", "What?"), extra = FALSE)
		if(!input || !(usr in view(1,src)) || current_cooldown > 0 || translating > 0)
			return
		captain_announce(input, title = "Facility Announcement", announcer = usr.real_name)
		current_cooldown = message_cooldown

		world << sound('code/modules/SCP/intercom_start.wav')
		spawn(40)
			world << sound('code/modules/SCP/intercom_stop.wav')

	if (href_list["start_translation"] && current_cooldown <= 0 && translating <= 0)

		translating = translation_time
		visible_message("<span class='notice'>[src]: transmiting, [translating] seconds left</span>")

		world << sound('code/modules/SCP/intercom_start.wav')

	if (href_list["stop_translation"] && current_cooldown <= 0 && translating > 0)
		world << sound('code/modules/SCP/intercom_stop.wav')
		current_cooldown = message_cooldown
		translating = 0

	src.updateUsrDialog()

/obj/machinery/computer/scp_intercom/hear_talk(mob/M, text, verb, datum/language/speaking)
	if(translating > 0)
		captain_announce(text, title = "Facility Announcement", announcer = M.real_name)

var/list/scp_teleportmarks = list()
/obj/effect/scp_teleport
	name = "TELEPORT MARK"
	icon = 'icons/mob/screen1.dmi'
	icon_state = "x2"
	anchored = TRUE
	unacidable = TRUE
	invisibility = INVISIBILITY_ABSTRACT
	var/AA_MYID = ""
	var/AA_TELEPORTTO = ""

/obj/effect/scp_teleport/New()
	..()
	scp_teleportmarks += src

/obj/effect/scp_teleport/Destroy()
	scp_teleportmarks -= src
	return ..()

/obj/effect/scp_teleport/Crossed(atom/movable/user)
	//if(!ismob(user))
		//user.loc = src.loc	//Stop at teleporter location
		//return

	if(!AA_TELEPORTTO)
		//user.loc = src.loc	//Stop at teleporter location, there is nowhere to teleport to.
		return

	var/list/viable = list()
	for(var/obj/effect/scp_teleport/BT in scp_teleportmarks)
		if(BT.AA_MYID == AA_TELEPORTTO)
			viable += BT.loc
	if(viable.len)
		user.loc = pick(viable)	//Teleport to location with correct id.

/obj/item/clothing/under/rank/scp_guard
	name = "security uniform"
	desc = "white clothing made of thick armored fabric"
	armor = list(melee = 15, bullet = 5, laser = 5, energy = 5, bomb = 0, bio = 0, rad = 0)
	siemens_coefficient = 0.9
	flags = ONESIZEFITSALL

	icon = 'code/modules/SCP/SCP.dmi'
	icon_custom = 'code/modules/SCP/SCP.dmi'
	icon_state = "guard_uniform"
	item_state = "guard_uniform"
	item_color = "guard_uniform"

/obj/item/clothing/suit/storage/flak/scp_guard
	armor = list(melee = 50, bullet = 45, laser = 40, energy = 25, bomb = 35, bio = 0, rad = 0)
	body_parts_covered = UPPER_TORSO|LOWER_TORSO|LEGS|ARMS

	icon = 'code/modules/SCP/SCP.dmi'
	icon_custom = 'code/modules/SCP/SCP.dmi'
	icon_state = "guard_armor"
	item_state = "guard_armor"
	item_color = "guard_armor"

/obj/item/clothing/head/helmet/swat/scp_guard
	name = "helmet"
	desc = "Standard Security gear. Protects the head from impacts."
	armor = list(melee = 50, bullet = 45, laser = 40, energy = 25, bomb = 35, bio = 0, rad = 0)

	icon = 'code/modules/SCP/SCP.dmi'
	icon_custom = 'code/modules/SCP/SCP.dmi'
	icon_state = "guard_helmet"
	item_state = "guard_helmet"
	item_color = "guard_helmet"