// ⚙️ OVERMAP SUBSYSTEM
// Operation: OVERMAP RESURRECTION - Day 1
// Port from: Shiptest (minimal version for MVP)

SUBSYSTEM_DEF(overmap)
	name = "Overmap"
	wait = 10
	init_order = INIT_ORDER_OVERMAP
	flags = SS_KEEP_TIMING
	runlevels = RUNLEVEL_SETUP | RUNLEVEL_GAME

	/// Default star system
	var/datum/overmap_star_system/default_system

	/// List of ALL overmap objects (global registry)
	var/list/overmap_objects

	/// List of all controlled ships
	var/list/controlled_ships

	/// List of all outposts
	var/list/outposts

/datum/controller/subsystem/overmap/Initialize()
	log_world("SSovermap: Initializing...")

	overmap_objects = list()
	controlled_ships = list()
	outposts = list()

	// Create default star system
	default_system = new /datum/overmap_star_system/basic()

	log_world("SSovermap: Initialization complete - default system '[default_system.name]' created")

	return SS_INIT_SUCCESS

// NOTE: fire() will be added when needed for ship movement
// NOTE: Other methods will be added in later stages

/**
 * # Star System Datum
 *
 * Represents a star system with its own overmap
 */
/datum/overmap_star_system
	/// Name of this star system
	var/name = "Unknown System"

	/// Size of the overmap (NxN grid)
	var/size = OVERMAP_SIZE

	/// 2D list containing all objects at each position [x][y]
	var/list/list/overmap_container

	/// Virtual level that contains the visual overmap
	var/datum/virtual_level/overmap_vlevel

	/// List of all overmap objects in this system
	var/list/overmap_objects

/**
 * ## New
 *
 * Creates a new star system with its overmap
 */
/datum/overmap_star_system/New()
	log_world("Creating star system '[name]' with size [size]x[size]")

	// Initialize container
	overmap_container = new/list(size, size)
	overmap_objects = list()

	// Setup overmap visual level
	setup_overmap_level()

	// Spawn initial star
	spawn_initial_star()

	log_world("Star system '[name]' created successfully")

/**
 * ## setup_overmap_level
 *
 * Creates the virtual level for this overmap
 */
/datum/overmap_star_system/proc/setup_overmap_level()
	log_world("[name]: Creating overmap virtual level...")

	// Create map zone
	var/datum/map_zone/mapzone = SSmapping.create_map_zone("Overmap - [name]")
	if(!mapzone)
		CRASH("[name]: Failed to create map zone!")

	// Create virtual level
	// Size + padding for borders
	var/vlevel_size = size + (MAP_EDGE_PAD * 2)

	overmap_vlevel = SSmapping.create_virtual_level(
		"Overmap - [name]",
		list(), // No special traits
		mapzone,
		vlevel_size,
		vlevel_size,
		ALLOCATION_FREE
	)

	if(!overmap_vlevel)
		CRASH("[name]: Failed to create overmap virtual level!")

	log_world("[name]: Virtual level created - Z=[overmap_vlevel.z_value], coords=([overmap_vlevel.low_x],[overmap_vlevel.low_y]) to ([overmap_vlevel.high_x],[overmap_vlevel.high_y])")

	// Link back to this system
	overmap_vlevel.current_systen = src // Опечатка сохранена как в TG!

	// Reserve margin
	overmap_vlevel.reserve_margin(MAP_EDGE_PAD)

	// Fill with overmap turfs
	overmap_vlevel.fill_in(/turf/open/overmap, /area/overmap)

	log_world("[name]: Virtual level filled with overmap turfs")

/**
 * ## spawn_initial_star
 *
 * Spawns a star in the center of the system
 */
/datum/overmap_star_system/proc/spawn_initial_star()
	var/center_x = round(size / 2)
	var/center_y = round(size / 2)

	log_world("[name]: Spawning star at center ([center_x],[center_y])")

	new /datum/overmap/star(list("x" = center_x, "y" = center_y), src)

/**
 * ## get_unused_overmap_square
 *
 * Finds a random unoccupied position on the overmap
 *
 * Returns: list("x" = X, "y" = Y)
 */
/datum/overmap_star_system/proc/get_unused_overmap_square()
	// Try 100 times to find empty square
	for(var/i in 1 to 100)
		var/test_x = rand(1, size)
		var/test_y = rand(1, size)
		if(!length(overmap_container[test_x][test_y]))
			return list("x" = test_x, "y" = test_y)

	// If all occupied (unlikely), return random anyway
	stack_trace("[name]: Could not find empty overmap square after 100 attempts!")
	return list("x" = rand(1, size), "y" = rand(1, size))

/**
 * # Basic Star System
 *
 * Simple test system for MVP
 */
/datum/overmap_star_system/basic
	name = "Test System Alpha"
