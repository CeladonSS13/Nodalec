/datum/overmap/ship/controlled

	// !!!

	//token_type = /obj/overmap/rendered
	//dock_time = 10 SECONDS

	// !!!

	// [CELADON-ADD] - OVERMAP SENSORS
	var/default_sensor_range = 4
	// [/CELADON-ADD]

	///Vessel estimated thrust per full burn
	var/est_thrust
	///Average fuel fullness percentage
	var/avg_fuel_amnt = 100
	///Cooldown until the ship can be renamed again
	COOLDOWN_DECLARE(rename_cooldown)

	///The docking port of the linked shuttle. To add a port after creating a controlled ship datum, use [/datum/overmap/ship/controlled/proc/connect_new_shuttle_port].
	VAR_FINAL/obj/docking_port/mobile/shuttle_port
	///The map template the shuttle was spawned from, if it was indeed created from a template.
	var/datum/map_template/shuttle/source_template
	///Whether objects on the ship require an ID with ship access granted
	var/unique_ship_access = FALSE

	/// The shipkey for this ship
	var/obj/item/key/ship/shipkey
	/// All helms connected to this ship
	var/list/obj/machinery/computer/helm/helms = list()
	/// Is helm access for this ship locked
	var/helm_locked = FALSE
	///Shipwide bank account used for cargo consoles and bounty payouts.
	var/datum/bank_account/ship/ship_account
	///Crew Owned Bank Accounts.
	var/list/crew_bank_accounts = list()
	///magic number for telling us how much of a mission goes into each crew member's bank account
	var/crew_share = 0.02

	/// List of currently-accepted missions.
	var/list/datum/mission/missions
	/// The maximum number of currently active missions that a ship may take on.
	var/max_missions = 2

	/// Manifest list of people on the ship. Indexed by mob REAL NAME. value is JOB INSTANCE
	var/list/manifest = list()

	/// List of mob refs indexed by their job instance
	var/list/datum/weakref/job_holder_refs = list()

	var/list/datum/mind/owner_candidates

	/// The mob of the current ship owner. Tracking mostly uses this; that lets us pick up on logouts, which let us
	/// determine if a player is switching to control of a mob with a different mind, who thus shouldn't be the ship owner.
	var/mob/owner_mob
	/// The mind of the current ship owner. Mostly kept around so that we can scream in panic if this gets changed behind our back.
	var/datum/mind/owner_mind
	/// The action datum given to the current owner; will be null if we don't have one.
	var/datum/action/ship_owner/owner_act
	/// The ID of the timer that is used to check for a new owner, if the ship ends up with a null owner.
	var/owner_check_timer_id

	// !!!

	/// The ship's join mode. Controls whether players can join freely, have to apply, or can't join at all.
	//var/join_mode = SHIP_JOIN_MODE_CLOSED

	// !!!

	/// Lazylist of /datum/ship_applications for this ship. Only used if join_mode == SHIP_JOIN_MODE_APPLY
	var/list/datum/ship_application/applications

	/// Short memo of the ship shown to new joins
	var/memo = null
	///Assoc list of remaining open job slots (job = remaining slots)
	var/list/job_slots
	///Time that next job slot change can occur
	COOLDOWN_DECLARE(job_slot_adjustment_cooldown)

	///The ship's real name, without the prefix
	var/real_name

	///Stations the ship has been blacklisted from landing at, associative station = reason
	var/list/blacklisted = list()
