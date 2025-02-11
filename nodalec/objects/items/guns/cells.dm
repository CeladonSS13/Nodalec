// gun power cell //
/obj/item/stock_parts/power_store/cell/gun
	name = "weapon power cell"
	icon = 'nodalec/icons/obj/guns/cells.dmi'
	icon_state = "cell-gun"
	maxcharge = 10000
	custom_materials = list(/datum/material/glass=60)
	chargerate = 1500
	rating = 0 //Makes it incompatible with RPED
	charge_light_type = "gun"

/obj/item/stock_parts/power_store/cell/gun/update_overlays()
	. = ..()
	if((charge < 0.01) || !charge_light_type)
		return
	var/guncell_path = 'nodalec/icons/obj/guns/cells.dmi'
	switch(percent())
		if(75 to 100)
			. += mutable_appearance(guncell_path, "[cell_size_prefix]-[charge_light_type]-o4")
		if(45 to 74)
			. += mutable_appearance(guncell_path, "[cell_size_prefix]-[charge_light_type]-o3")
		if(21 to 44)
			. += mutable_appearance(guncell_path, "[cell_size_prefix]-[charge_light_type]-o2")
		if(1 to 20)
			. += mutable_appearance(guncell_path, "[cell_size_prefix]-[charge_light_type]-o1")

/obj/item/stock_parts/power_store/cell/gun/empty

/obj/item/stock_parts/power_store/cell/gun/empty/Initialize()
	. = ..()
	charge = 0
	update_appearance()

/obj/item/stock_parts/power_store/cell/gun/upgraded
	name = "upgraded weapon power cell"
	icon_state = "cell-ugun"
	maxcharge = 20000
	custom_materials = list(/datum/material/glass=300)
	chargerate = 2000

/obj/item/stock_parts/power_store/cell/gun/upgraded/empty/Initialize()
	. = ..()
	charge = 0
	update_appearance()

/obj/item/stock_parts/power_store/cell/gun/mini
	name = "miniature weapon power cell"
	icon_state = "cell-mgun"
	maxcharge = 5000
	custom_materials = list(/datum/material/glass=300)
	chargerate = 1000
	charge_light_type = "mgun"

/obj/item/stock_parts/power_store/cell/gun/mini/empty/Initialize()
	. = ..()
	charge = 0
	update_appearance()

/obj/item/stock_parts/power_store/cell/gun/solgov
	name = "SolGov power cell"
	icon_state = "g-sg-cell"
	charge_light_type = null

/obj/item/stock_parts/power_store/cell/gun/large
	name = "extra-large weapon power cell"
	icon_state = "bg-cell"
	maxcharge = 50000
	custom_materials = list(/datum/material/glass=1000)
	chargerate = 5000
	w_class = WEIGHT_CLASS_NORMAL
	charge_light_type = "bggun"

/obj/item/stock_parts/power_store/cell/gun/large/empty/Initialize()
	. = ..()
	charge = 0
	update_appearance()

/obj/item/stock_parts/power_store/cell/gun/kalix
	name = "Etherbor EWC-5"
	desc = "Brought to you by Etherbor Industries, proudly based within the PGF, is the EWC-5, an energy cell compatible with any Etherbor Industries energy weapons."
	icon_state = "kalix-cell"
	maxcharge = 12750 // 15 shots at 850 energy per
	chargerate = 1750
	charge_light_type = "kalix"

/obj/item/stock_parts/power_store/cell/gun/pgf
	name = "Etherbor EWC-6m"
	desc = "Exclusive only to the PGF military, the EWC-6m is an Etherbor energy weapon cell designed for military-grade use, including expanded capacity and output."
	icon_state = "pgf-cell"
	maxcharge = 20000 // 20 shots at 1000 energy per
	chargerate = 2000
	charge_light_type = "pgf"
