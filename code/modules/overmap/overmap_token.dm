// ⚙️ OVERMAP SYSTEM: Visual Token
// Operation: OVERMAP RESURRECTION - Day 1
// Port from: Shiptest

/**
 * # Overmap Token
 *
 * Visual representation of overmap objects on the map
 */
/obj/overmap
	name = "overmap object"
	desc = "An object in space."
	icon = 'icons/effects/overmap.dmi'
	icon_state = "object"
	layer = FLY_LAYER
	plane = ABOVE_LIGHTING_PLANE
	anchored = TRUE

	/// Reference to the overmap datum this token represents
	var/datum/overmap/parent

	/// Skip alarm звук при взаимодействии
	var/skip_alarm = 0

/obj/overmap/Initialize(mapload)
	. = ..()
	if(!mapload)
		GLOB.poi_list |= src

/obj/overmap/Destroy()
	GLOB.poi_list -= src
	parent = null
	return ..()

/obj/overmap/examine(mob/user)
	. = ..()
	if(parent)
		. += parent.desc
