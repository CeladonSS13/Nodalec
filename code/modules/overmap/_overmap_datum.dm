// ⚙️ OVERMAP SYSTEM: Base Datum
// Operation: OVERMAP RESURRECTION - Day 1
// Port from: Shiptest (minimal version for MVP)

/**
 * # Base Overmap Datum
 *
 * Represents any object on the overmap (ships, stations, planets, stars, etc)
 */
/datum/overmap
	///Name of the object
	var/name = "Unknown Object"
	///Description
	var/desc = "An object on the overmap."
	///Icon state for the token
	var/token_icon_state = "object"
	///Color of the token
	var/color = COLOR_WHITE

	/// The x position of this datum on the overmap. Use [/datum/overmap/proc/overmap_move] to change this.
	VAR_FINAL/x
	/// The y position of this datum on the overmap. Use [/datum/overmap/proc/overmap_move] to change this.
	VAR_FINAL/y

	/// Current star system this object is in
	var/datum/overmap_star_system/current_overmap

	/// Visual token on the overmap
	var/obj/overmap/token

	/// Docked objects list (ships/shuttles docked to this object)
	var/list/contents

	/// Object we're currently docked to
	var/datum/overmap/docked_to

	/// Are we currently in the process of docking?
	var/docking = FALSE

	/// Time it takes to dock/undock (deciseconds)
	var/dock_time = 0

/**
 * ## New
 *
 * Creates a new overmap object
 *
 * Arguments:
 * * position - Either list("x" = X, "y" = Y) for specific coords, or /datum/overmap to dock to, or null for random
 * * system - The star system to place this in (defaults to SSovermap.default_system)
 */
/datum/overmap/New(position, datum/overmap_star_system/system)
	current_overmap = system || SSovermap.default_system
	if(!current_overmap)
		CRASH("[src] created without valid overmap system!")

	contents = list()

	// Determine position
	if(islist(position))
		x = position["x"]
		y = position["y"]
	else if(istype(position, /datum/overmap))
		// Docking to another object
		var/datum/overmap/dock_target = position
		x = dock_target.x
		y = dock_target.y
		docked_to = dock_target
		dock_target.contents += src
	else
		// Random position
		var/list/pos = current_overmap.get_unused_overmap_square()
		x = pos["x"]
		y = pos["y"]

	// Validate coordinates
	if(x < 1 || x > current_overmap.size || y < 1 || y > current_overmap.size)
		CRASH("[src] created with invalid coordinates ([x],[y]) - system size is [current_overmap.size]")

	// Register in system
	if(!docked_to)
		current_overmap.overmap_container[x][y] += src
	current_overmap.overmap_objects += src
	SSovermap.overmap_objects += src

	// Create visual token
	create_token()

/**
 * ## Destroy
 *
 * Cleanup when overmap object is deleted
 */
/datum/overmap/Destroy()
	// Remove token
	if(token)
		QDEL_NULL(token)

	// Unregister from docked parent
	if(docked_to)
		docked_to.contents -= src
		docked_to = null

	// Undock all docked objects
	for(var/datum/overmap/docked_obj in contents)
		docked_obj.docked_to = null
	contents.Cut()

	// Unregister from system
	if(x && y && current_overmap)
		current_overmap.overmap_container[x][y] -= src
		current_overmap.overmap_objects -= src

	// Unregister from subsystem
	SSovermap.overmap_objects -= src

	current_overmap = null

	return ..()

/**
 * ## create_token
 *
 * Creates the visual representation of this object on the overmap
 */
/datum/overmap/proc/create_token()
	if(token)
		return // Already have token

	if(!current_overmap || !current_overmap.overmap_vlevel)
		stack_trace("[src] cannot create token - no overmap_vlevel!")
		return

	// Calculate physical turf coordinates
	var/physical_x = current_overmap.overmap_vlevel.low_x + x + current_overmap.overmap_vlevel.reserved_margin - 1
	var/physical_y = current_overmap.overmap_vlevel.low_y + y + current_overmap.overmap_vlevel.reserved_margin - 1
	var/physical_z = current_overmap.overmap_vlevel.z_value

	var/turf/T = locate(physical_x, physical_y, physical_z)
	if(!T)
		CRASH("[src] failed to locate turf at ([physical_x],[physical_y],[physical_z]) for token!")

	// Create token
	token = new /obj/overmap(T)
	token.icon_state = token_icon_state
	token.name = name
	token.parent = src
	token.color = color

/**
 * ## overmap_move
 *
 * Moves this object to a new position on the overmap
 *
 * Arguments:
 * * new_x - New X coordinate (1 to system.size)
 * * new_y - New Y coordinate (1 to system.size)
 *
 * Returns: TRUE if moved successfully, FALSE otherwise
 */
/datum/overmap/proc/overmap_move(new_x, new_y)
	// Can't move if docking or docked
	if(docking || docked_to)
		return FALSE

	// Bounds check
	new_x = clamp(new_x, 1, current_overmap.size)
	new_y = clamp(new_y, 1, current_overmap.size)

	// Same position?
	if(new_x == x && new_y == y)
		return FALSE

	// Update container
	var/old_x = x
	var/old_y = y

	current_overmap.overmap_container[x][y] -= src
	current_overmap.overmap_container[new_x][new_y] += src

	x = new_x
	y = new_y

	// Move token visually
	if(token)
		var/physical_x = current_overmap.overmap_vlevel.low_x + x + current_overmap.overmap_vlevel.reserved_margin - 1
		var/physical_y = current_overmap.overmap_vlevel.low_y + y + current_overmap.overmap_vlevel.reserved_margin - 1
		var/physical_z = current_overmap.overmap_vlevel.z_value

		var/turf/new_T = locate(physical_x, physical_y, physical_z)
		if(new_T)
			token.forceMove(new_T)

	// TODO: Send signal COMSIG_OVERMAP_MOVED when signals added

	return TRUE

/**
 * ## Rename
 *
 * Renames this overmap object
 */
/datum/overmap/proc/Rename(new_name, force)
	new_name = sanitize_name(new_name)
	if(!new_name || new_name == name)
		return FALSE
	name = new_name
	if(token)
		token.name = new_name
	return TRUE

/**
 * ## get_jump_to_turf
 *
 * Gets a turf to teleport to when jumping to this object
 * Override in subtypes
 */
/datum/overmap/proc/get_jump_to_turf()
	RETURN_TYPE(/turf)
	return null

// NOTE: Docking methods (Dock, Undock, pre_docked, etc) will be added in Этап 5
// NOTE: adjust_dock_to_shuttle will be added when needed for docking
