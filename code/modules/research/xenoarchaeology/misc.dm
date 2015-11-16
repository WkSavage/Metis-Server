
//---- Noticeboard

/obj/structure/noticeboard/anomaly
	notices = 5
	icon_state = "nboard05"

/obj/structure/noticeboard/anomaly/New()
	//add some memos
	var/obj/item/weapon/paper/P = new()
	P.name = "Memo RE: proper analysis procedure"
	P.info = "<br>We keep test dummies in pens here for a reason, so standard procedure should be to activate newfound alien artifacts and place the two in close proximity. Promising items I might even approve monkey testing on."
	P.stamped = list(/obj/item/weapon/stamp/rd)
	P.overlays = list("paper_stamped_rd")
	src.contents += P

	P = new()
	P.name = "Memo RE: materials gathering"
	P.info = "Corasang,<br>the hands-on approach to gathering our samples may very well be slow at times, but it's safer than allowing the blundering miners to roll willy-nilly over our dig sites in their mechs, destroying everything in the process. And don't forget the escavation tools on your way out there!<br>- R.W"
	P.stamped = list(/obj/item/weapon/stamp/rd)
	P.overlays = list("paper_stamped_rd")
	src.contents += P

	P = new()
	P.name = "Memo RE: ethical quandaries"
	P.info = "Darion-<br><br>I don't care what his rank is, our business is that of science and knowledge - questions of moral application do not come into this. Sure, so there are those who would employ the energy-wave particles my modified device has managed to abscond for their own personal gain, but I can hardly see the practical benefits of some of these artifacts our benefactors left behind. Ward--"
	P.stamped = list(/obj/item/weapon/stamp/rd)
	P.overlays = list("paper_stamped_rd")
	src.contents += P

	P = new()
	P.name = "READ ME! Before you people destroy any more samples"
	P.info = "how many times do i have to tell you people, these xeno-arch samples are del-i-cate, and should be handled so! careful application of a focussed, concentrated heat or some corrosive liquids should clear away the extraneous carbon matter, while application of an energy beam will most decidedly destroy it entirely - like someone did to the chemical dispenser! W, <b>the one who signs your paychecks</b>"
	P.stamped = list(/obj/item/weapon/stamp/rd)
	P.overlays = list("paper_stamped_rd")
	src.contents += P

	P = new()
	P.name = "Reminder regarding the anomalous material suits"
	P.info = "Do you people think the anomaly suits are cheap to come by? I'm about a hair trigger away from instituting a log book for the damn things. Only wear them if you're going out for a dig, and for god's sake don't go tramping around in them unless you're field testing something, R"
	P.stamped = list(/obj/item/weapon/stamp/rd)
	P.overlays = list("paper_stamped_rd")
	src.contents += P



/obj/structure/noticeboard/shifts
	name = "employee notice board"
	desc = "A board for pinning important notices upon this one has some notices from the people on the other shifts."
	icon = 'icons/obj/stationobjs.dmi'
	icon_state = "nboard05"
	notices = 6

/obj/structure/noticeboard/shifts/New()

	var/obj/item/weapon/paper/P = new()
	P.name = "Cover my shift"
	P.info = "Hello, I'm Sam Tarsend and I'm looking for someone to cover my shift on Thursday, I'd like to spend some more time with my family<br> Thank you in advance, Sam."
	P.stamped = list(/obj/item/weapon/stamp/rd)
	P.overlays = list("paper_stamped_rd")
	src.contents += P

	P = new()
	P.name = "Leave of absense"
	P.info = "He He He<br> Sadly some big old meanie geneticist made me allergic to banana's and the rubber in my bike horn so I can't get to work intill the genetic treatment is done, I know you'll all be sad especially that red head in security, the one with the big honkers, aidos space cowboys <br>- Giggles"
	src.contents += P

	P = new()
	P.name = "Deodorant"
	P.info = "Just use it, I'm sick and tired of the mens locker room having such a strong funk NT want to bottle it and use it as a weapon!"
	P.stamped = list(/obj/item/weapon/stamp/captain)
	P.overlays = list("paper_stamped_captain")
	src.contents += P

	P = new()
	P.name = "READ ME!"
	P.info = "Only you can prevent work place acicdents<br> Last year our workplace accidents where up by 450% this is unacceptable, if you are working on a gas giant station please don't do what the NSS Zeus did and see if the fumes will give you a Buzz, they won't and they won't make the captain any less of a 'Hardass' "
	src.contents += P

	P = new()
	P.name = "Coupons"
	P.info = "Lynn from the requisition department has managed to get a coupon book for 'Big Al's Spess Pizza Pies' if you want some Hit her up, I think she's covering for Sam on Thursday"
	src.contents += P

	P = new()
	P.name = "Birthday"
	P.info = "We'll be throwing Frank from IA a suprise birthday party, if everyone could put in 10 credits so we can get him a gift that would be great"
	src.contents += P


//---- Bookcase

/obj/structure/bookcase/manuals/xenoarchaeology
	name = "Xenoarchaeology Manuals bookcase"

	New()
		..()
		new /obj/item/weapon/book/manual/excavation(src)
		new /obj/item/weapon/book/manual/mass_spectrometry(src)
		new /obj/item/weapon/book/manual/materials_chemistry_analysis(src)
		new /obj/item/weapon/book/manual/anomaly_testing(src)
		new /obj/item/weapon/book/manual/anomaly_spectroscopy(src)
		new /obj/item/weapon/book/manual/stasis(src)
		update_icon()

//---- Lockers and closets

/obj/structure/closet/secure_closet/xenoarchaeologist
	name = "Xenoarchaeologist Locker"
	req_access = list(access_tox_storage)
	icon_state = "secureres1"
	icon_closed = "secureres"
	icon_locked = "secureres1"
	icon_opened = "secureresopen"
	icon_broken = "secureresbroken"
	icon_off = "secureresoff"

	New()
		..()
		sleep(2)
		new /obj/item/clothing/under/rank/scientist(src)
		new /obj/item/clothing/suit/storage/toggle/labcoat(src)
		new /obj/item/clothing/shoes/white(src)
		new /obj/item/clothing/glasses/science(src)
		new /obj/item/device/radio/headset/headset_sci(src)
		new /obj/item/weapon/storage/belt/archaeology(src)
		new /obj/item/weapon/storage/box/excavation(src)
		return

/obj/structure/closet/excavation
	name = "Excavation tools"
	icon_state = "toolcloset"
	icon_closed = "toolcloset"
	icon_opened = "toolclosetopen"

	New()
		..()
		sleep(2)
		new /obj/item/weapon/storage/belt/archaeology(src)
		new /obj/item/weapon/storage/box/excavation(src)
		new /obj/item/device/flashlight/lantern(src)
		new /obj/item/device/ano_scanner(src)
		new /obj/item/device/depth_scanner(src)
		new /obj/item/device/core_sampler(src)
		new /obj/item/device/gps(src)
		new /obj/item/device/beacon_locator(src)
		new /obj/item/device/radio/beacon(src)
		new /obj/item/clothing/glasses/meson(src)
		new /obj/item/weapon/pickaxe(src)
		new /obj/item/device/measuring_tape(src)
		new /obj/item/weapon/pickaxe/hand(src)
		new /obj/item/weapon/storage/bag/fossils(src)
		new /obj/item/weapon/hand_labeler(src)
		return

//---- Isolation room air alarms

/obj/machinery/alarm/isolation
	req_one_access = list(access_research, access_atmospherics, access_engine_equip)

/obj/machinery/alarm/monitor/isolation
	req_one_access = list(access_research, access_atmospherics, access_engine_equip)
