
/obj/item/gun/energy/e_gun
	name = "energy rifle"
	desc = "A basic hybrid energy gun with two settings: disable and kill."
	icon = 'nodalec/icons/obj/guns/manufacturer/nanotrasen_sharplite/48x32.dmi'
	lefthand_file = 'nodalec/icons/obj/guns/manufacturer/nanotrasen_sharplite/lefthand.dmi'
	righthand_file = 'nodalec/icons/obj/guns/manufacturer/nanotrasen_sharplite/righthand.dmi'
	icon_state = "energy"
	inhand_icon_state = null	//so the human update icon uses the icon_state instead.
	ammo_type = list(/obj/item/ammo_casing/energy/disabler, /obj/item/ammo_casing/energy/laser)
	modifystate = TRUE
	ammo_x_offset = 2
	dual_wield_spread = 60
	manufacturer = MANUFACTURER_SHARPLITE_NEW
	w_class = WEIGHT_CLASS_NORMAL

/obj/item/gun/energy/e_gun/mini
	name = "miniature energy gun"
	desc = "A small, pistol-sized energy gun with a built-in flashlight. It has two settings: disable and kill."
	icon_state = "mini"
	inhand_icon_state = "gun"
	w_class = WEIGHT_CLASS_SMALL
	cell_type = /obj/item/stock_parts/power_store/cell/gun/mini
	throwforce = 11 //This is funny, trust me.
	ammo_x_offset = 2
	charge_sections = 3

	spread = 2

/obj/item/gun/energy/e_gun/hades
	name = "SL AL-655 'Hades' energy rifle"
	desc = "The standard issue rifle of Nanotrasen's Security Forces. Most have been put in long term storage following the ICW, and usually aren't issued to low ranking security divisions."
	icon_state = "energytac"
	inhand_icon_state = "energytac50"
	lefthand_file = 'nodalec/icons/obj/guns/manufacturer/nanotrasen_sharplite/lefthand.dmi'
	righthand_file = 'nodalec/icons/obj/guns/manufacturer/nanotrasen_sharplite/righthand.dmi'
	ammo_x_offset = 2
	charge_sections = 5
	fire_delay = 0.2
	burst_size = 3
	ammo_type = list(/obj/item/ammo_casing/energy/disabler, /obj/item/ammo_casing/energy/laser/assault)
	cell_type = /obj/item/stock_parts/power_store/cell/gun/upgraded

	gun_firemodes = list(FIREMODE_SEMIAUTO, FIREMODE_FULLAUTO)
	default_firemode = FIREMODE_SEMIAUTO

	weapon_weight = WEAPON_MEDIUM
	w_class = WEIGHT_CLASS_BULKY
	slot_flags = ITEM_SLOT_BACK

/obj/item/gun/energy/e_gun/hades/Initialize(mapload)
	. = ..()
	AddComponent(/datum/component/automatic_fire, fire_delay)

/obj/item/gun/energy/e_gun/old
	name = "prototype energy gun"
	desc = "NT-P:01 Prototype Energy Gun. Early stage development of a unique laser rifle that has a multifaceted energy lens, allowing the gun to alter the form of projectile it fires on command. The project was a dud, and Nanotrasen later acquired Sharplite to suit its laser weapon needs."
	icon_state = "protolaser"
	ammo_x_offset = 2
	ammo_type = list(/obj/item/ammo_casing/energy/laser, /obj/item/ammo_casing/energy/electrode/old)
	manufacturer = MANUFACTURER_NANOTRASEN_OLD

/obj/item/gun/energy/e_gun/hos
	name = "\improper X-01 MultiPhase Energy Gun"
	desc = "This is an expensive, modern recreation of an antique laser gun. This gun has several unique firemodes, but lacks the ability to recharge over time."
	cell_type = /obj/item/stock_parts/power_store/cell/gun/upgraded
	icon_state = "hoslaser"
	force = 10
	ammo_type = list(/obj/item/ammo_casing/energy/disabler/hos, /obj/item/ammo_casing/energy/laser/hos, /obj/item/ammo_casing/energy/ion/hos)
	shaded_charge = TRUE
	resistance_flags = INDESTRUCTIBLE | LAVA_PROOF | FIRE_PROOF | ACID_PROOF
	manufacturer = MANUFACTURER_SHARPLITE_NEW

/obj/item/gun/energy/e_gun/hos/brazil
	name = "modified antique laser gun"
	desc = "It's somehow modified to have more firemodes."
	icon_state = "capgun_brazil_hos"
	inhand_icon_state = "hoslaserkill0"
	manufacturer = MANUFACTURER_SHARPLITE

/obj/item/gun/energy/e_gun/hos/brazil/true
	desc = "This genuine antique laser gun, modified with an experimental suite of alternative firing modes based on the X-01 MultiPhase Energy Gun, is now truly one of the finest weapons in the frontier."
	icon_state = "capgun_hos"
	inhand_icon_state = "hoslaserkill0"
	selfcharge = 1
	manufacturer = MANUFACTURER_SHARPLITE

/obj/item/gun/energy/e_gun/dragnet
	name = "\improper DRAGnet"
	desc = "The \"Dynamic Rapid-Apprehension of the Guilty\" net is a revolution in law enforcement technology."
	icon_state = "dragnet"
	inhand_icon_state = "dragnet"
	lefthand_file = 'nodalec/icons/obj/guns/manufacturer/nanotrasen_sharplite/lefthand.dmi'
	righthand_file = 'nodalec/icons/obj/guns/manufacturer/nanotrasen_sharplite/righthand.dmi'
	ammo_type = list(/obj/item/ammo_casing/energy/net, /obj/item/ammo_casing/energy/trap)
	ammo_x_offset = 1

/obj/item/gun/energy/e_gun/dragnet/snare
	name = "Energy Snare Launcher"
	desc = "Fires an energy snare that slows the target down."
	ammo_type = list(/obj/item/ammo_casing/energy/trap)

/obj/item/gun/energy/e_gun/turret
	name = "hybrid turret gun"
	desc = "A heavy hybrid energy cannon with two settings: Stun and kill. ...It doesn't seem have a trigger, seems it can only be used as a turret."
	lefthand_file = 'nodalec/icons/obj/guns/manufacturer/nanotrasen_sharplite/lefthand.dmi'
	righthand_file = 'nodalec/icons/obj/guns/manufacturer/nanotrasen_sharplite/righthand.dmi'
	icon_state = "turretlaser"
	inhand_icon_state = "turretlaser"
	slot_flags = null
	w_class = WEIGHT_CLASS_HUGE
	cell_type = null
	ammo_type = list(/obj/item/ammo_casing/energy/electrode, /obj/item/ammo_casing/energy/laser)
	weapon_weight = WEAPON_HEAVY
	trigger_guard = TRIGGER_GUARD_NONE
	ammo_x_offset = 2

/obj/item/gun/energy/e_gun/rdgun
	name = "research director's PDW"
	desc = "A energy revolver made from the power of science, but more importantly booze. Only has 6 shots."
	icon_state = "rdpdw"
	inhand_icon_state = "gun"
	ammo_x_offset = 2
	charge_sections = 6

	spread = 2

	ammo_type = list(/obj/item/ammo_casing/energy/disabler, /obj/item/ammo_casing/energy/ion)
	cell_type = /obj/item/stock_parts/power_store/cell/gun/mini

/obj/item/gun/energy/e_gun/adv_stopping
	name = "advanced stopping revolver"
	desc = "An advanced energy revolver with the capacity to shoot both disabler and lethal lasers, as well as futuristic safari nets."
	icon_state = "bsgun"
	inhand_icon_state = "gun"
	force = 7
	ammo_type = list(/obj/item/ammo_casing/energy/disabler/hos, /obj/item/ammo_casing/energy/laser/hos, /obj/item/ammo_casing/energy/trap)
	ammo_x_offset = 1
	shaded_charge = TRUE

/obj/item/gun/energy/e_gun/smg
	name = "\improper E-TAR SMG"
	desc = "A dual-mode energy gun capable of discharging weaker shots at a much faster rate than the standard energy gun."
	icon_state = "esmg"
	ammo_type = list(/obj/item/ammo_casing/energy/disabler/smg, /obj/item/ammo_casing/energy/laser/smg)
	fire_delay = 2
	actions_types = list(/datum/action/item_action/toggle_firemode)
	ammo_x_offset = 2
	charge_sections = 3
	weapon_weight = WEAPON_LIGHT

	fire_delay = 0.13 SECONDS

/obj/item/gun/energy/e_gun/smg/Initialize(mapload)
	. = ..()
	AddComponent(/datum/component/automatic_fire, fire_delay)

/obj/item/gun/energy/e_gun/iot
	name = "\improper E-SG 500 Second Edition"
	desc = "A improved version of the E-SG 255. It now includes two firing modes, disable and kill, while still keeping that sweet integrated computer. Please note that the screen is right next to the switch mode button."
	lefthand_file = 'icons/mob/inhands/weapons/64x_guns_left.dmi'
	righthand_file = 'icons/mob/inhands/weapons/64x_guns_right.dmi'
	inhand_x_dimension = 64
	inhand_y_dimension = 64
	icon_state = "iotshotgun"
	inhand_icon_state = "shotgun_combat"
	shaded_charge = TRUE
	ammo_type = list(/obj/item/ammo_casing/energy/disabler/scatter/iot, /obj/item/ammo_casing/energy/laser/iot)
	w_class = WEIGHT_CLASS_BULKY
