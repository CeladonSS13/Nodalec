/datum/overmap
	///Name of the planet
	var/name = "Planet"
	///Description of the planet
	var/desc = "A generic planet, tell the Coders that you found this."
	///Icon of the planet
	var/icon_state = "globe"
	///Colour of the planet
	var/color = COLOR_WHITE

	/// The x position of this datum on the overmap. Use [/datum/overmap/proc/move] to change this.
	VAR_FINAL/x
	/// The y position of this datum on the overmap. Use [/datum/overmap/proc/move] to change this.
	VAR_FINAL/y

	/* Planet Generation */
	///Planet spawn rate
	var/spawn_rate = 20
	///The list of ruins that can spawn here
	var/ruin_type
	///The map generator to use
	var/datum/map_generator/mapgen
	///The area type to use on the planet
	var/area/target_area
	///The surface turf
	var/turf/surface = /turf/open/space/basic
	///Weather controller for planet specific weather
	var/datum/weather/weather_controller_type
	///A planet template that contains a list of biomes to use
	var/datum/planet/planet_template

	var/char_rep = "T"

	var/token_icon_state = "globe"

	var/obj/overmap/token

	var/datum/docking_ticket/current_docking_ticket


//цитата из shiptest-beta-dev - "Это вагабонд насрал"
/obj/overmap
	var/skip_alarm = 0

/datum/overmap/proc/Rename(new_name, force)
	new_name = sanitize_name(new_name) //sets to a falsey value if it's not a valid name
	if(!new_name || new_name == name)
		return FALSE
	name = new_name
	token.name = new_name
	return TRUE

/datum/overmap/proc/get_jump_to_turf()
	RETURN_TYPE(/turf)
	return

/datum/overmap/proc/adjust_dock_to_shuttle(obj/docking_port/stationary/dock_to_adjust, obj/docking_port/mobile/shuttle)
	log_shuttle("[src] [REF(src)] DOCKING: ADJUST [dock_to_adjust] [REF(dock_to_adjust)] TO [shuttle][REF(shuttle)]")
	// the shuttle's dimensions where "true height" measures distance from the shuttle's fore to its aft
	var/shuttle_true_height = shuttle.height
	var/shuttle_true_width = shuttle.width
	// if the port's location is perpendicular to the shuttle's fore, the "true height" is the port's "width" and vice-versa
	if(EWCOMPONENT(shuttle.port_direction))
		shuttle_true_height = shuttle.width
		shuttle_true_width = shuttle.height

	// the dir the stationary port should be facing (note that it points inwards)
	var/final_facing_dir = angle2dir(dir2angle(shuttle_true_height > shuttle_true_width ? EAST : NORTH)+dir2angle(shuttle.port_direction)+180)

	var/list/old_corners = dock_to_adjust.return_coords() // coords for "bottom left" / "top right" of dock's covered area, rotated by dock's current dir
	var/list/new_dock_location // TBD coords of the new location
	if(final_facing_dir == dock_to_adjust.dir)
		new_dock_location = list(old_corners[1], old_corners[2]) // don't move the corner
	else if(final_facing_dir == angle2dir(dir2angle(dock_to_adjust.dir)+180))
		new_dock_location = list(old_corners[3], old_corners[4]) // flip corner to the opposite
	else
		var/combined_dirs = final_facing_dir | dock_to_adjust.dir
		if(combined_dirs == (NORTH|EAST) || combined_dirs == (SOUTH|WEST))
			new_dock_location = list(old_corners[1], old_corners[4]) // move the corner vertically
		else
			new_dock_location = list(old_corners[3], old_corners[2]) // move the corner horizontally
		// we need to flip the height and width
		var/dock_height_store = dock_to_adjust.height
		dock_to_adjust.height = dock_to_adjust.width
		dock_to_adjust.width = dock_height_store

	dock_to_adjust.dir = final_facing_dir
	if(shuttle.height > dock_to_adjust.height || shuttle.width > dock_to_adjust.width)
		CRASH("Shuttle cannot fit in dock!")

	// offset for the dock within its area
	var/new_dheight = round((dock_to_adjust.height-shuttle.height)/2) + shuttle.dheight
	var/new_dwidth = round((dock_to_adjust.width-shuttle.width)/2) + shuttle.dwidth

	// use the relative-to-dir offset above to find the absolute position offset for the dock
	switch(final_facing_dir)
		if(NORTH)
			new_dock_location[1] += new_dwidth
			new_dock_location[2] += new_dheight
		if(SOUTH)
			new_dock_location[1] -= new_dwidth
			new_dock_location[2] -= new_dheight
		if(EAST)
			new_dock_location[1] += new_dheight
			new_dock_location[2] -= new_dwidth
		if(WEST)
			new_dock_location[1] -= new_dheight
			new_dock_location[2] += new_dwidth

	dock_to_adjust.forceMove(locate(new_dock_location[1], new_dock_location[2], dock_to_adjust.z))
	dock_to_adjust.dheight = new_dheight
	dock_to_adjust.dwidth = new_dwidth

/**
 * Called at the very start of a [datum/overmap/proc/Dock] call, on the **TARGET of the docking attempt**. If it returns FALSE, the docking will be aborted.
 * Called before [datum/overmap/proc/pre_dock] is called on the dock requester.
 *
 * * dock_requester - The overmap datum trying to dock with this one. Cannot be null.
 *
 * Returns - A docking ticket that will be passed to [datum/overmap/proc/pre_dock] on the dock requester.
 */
/datum/overmap/proc/pre_docked(datum/overmap/dock_requester)
	RETURN_TYPE(/datum/docking_ticket)
	return new /datum/docking_ticket(_docking_error = "[src] cannot be docked to.")
