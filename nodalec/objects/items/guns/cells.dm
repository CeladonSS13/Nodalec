// gun power cell //
/obj/item/stock_parts/power_store/cell/gun
	name = "weapon power cell"
	icon = 'nodalec/icons/obj/guns/cells.dmi'
	icon_state = "g_cell"
	maxcharge = 10000
	custom_materials = list(/datum/material/glass=60)
	chargerate = 1500
	rating = 0 //Makes it incompatible with RPED

/obj/item/stock_parts/power_store/cell/gun/empty

/obj/item/stock_parts/power_store/cell/gun/empty/Initialize()
	. = ..()
	charge = 0
	update_appearance()

/obj/item/stock_parts/power_store/cell/gun/update_appearance()
	cut_overlays()
	if(grown_battery)
		. += mutable_appearance('nodalec/icons/obj/guns/cells.dmi', "g_cell")
	if(charge < 0.1)
		return
	else if(charge/maxcharge >=0.995)
		add_overlay("[initial(icon_state)]_o4")
	else if(charge/maxcharge >=0.745)
		add_overlay("[initial(icon_state)]_o3")
	else if(charge/maxcharge >=0.495)
		add_overlay("[initial(icon_state)]_o2")
	else
		add_overlay("[initial(icon_state)]_o1")
	return ..()

/obj/item/stock_parts/power_store/cell/gun/upgraded
	name = "upgraded weapon power cell"
	icon_state = "ug_cell"
	maxcharge = 20000
	custom_materials = list(/datum/material/glass=300)
	chargerate = 2000

/obj/item/stock_parts/power_store/cell/gun/upgraded/empty/Initialize()
	. = ..()
	charge = 0
	update_appearance()

/obj/item/stock_parts/power_store/cell/gun/mini
	name = "miniature weapon power cell"
	icon_state = "mg_cell"
	maxcharge = 5000
	custom_materials = list(/datum/material/glass=300)
	chargerate = 1000

/obj/item/stock_parts/power_store/cell/gun/mini/empty/Initialize()
	. = ..()
	charge = 0
	update_appearance()

/obj/item/stock_parts/power_store/cell/gun/solgov
	name = "SolGov power cell"
	icon_state = "g_sg_cell"

/obj/item/stock_parts/power_store/cell/gun/large
	name = "extra-large weapon power cell"
	icon_state = "bg_cell"
	maxcharge = 50000
	custom_materials = list(/datum/material/glass=1000)
	chargerate = 5000
	w_class = WEIGHT_CLASS_NORMAL

/obj/item/stock_parts/power_store/cell/gun/large/empty/Initialize()
	. = ..()
	charge = 0
	update_appearance()

/obj/item/stock_parts/power_store/cell/gun/kalix
	name = "Etherbor EWC-5"
	desc = "Brought to you by Etherbor Industries, proudly based within the PGF, is the EWC-5, an energy cell compatible with any Etherbor Industries energy weapons."
	icon_state = "kalix_cell"
	maxcharge = 12750 // 15 shots at 850 energy per
	chargerate = 1750

/obj/item/stock_parts/power_store/cell/gun/pgf
	name = "Etherbor EWC-6m"
	desc = "Exclusive only to the PGF military, the EWC-6m is an Etherbor energy weapon cell designed for military-grade use, including expanded capacity and output."
	icon_state = "pgf_cell"
	maxcharge = 20000 // 20 shots at 1000 energy per
	chargerate = 2000
