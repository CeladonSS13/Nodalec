// Outpost areas. Generally fairly similar to ship ones, but need to be kept separate due to their not having a corresponding docking port.

/area/outpost
	icon = 'nodalec/master_files/icons/areas.dmi'
	has_gravity = STANDARD_GRAVITY
	area_flags = VALID_TERRITORY | NOTELEPORT // not unique, in case multiple outposts get loaded. all derivatives should also be NOTELEPORT
	flags_1 = CAN_BE_DIRTY_1
	sound_environment = SOUND_AREA_STANDARD_STATION


/area/outpost/cargo
	name = "Cargo Bay"
	icon_state = "cargo_bay"
	sound_environment = SOUND_AREA_LARGE_ENCLOSED

/area/outpost/cargo/office
	name = "Cargo Office"
	icon_state = "quartoffice"
	sound_environment = SOUND_AREA_SMALL_SOFTFLOOR

/area/outpost/cargo/smeltery
	name = "Smeltery"
	icon_state = "mining_production"

/area/outpost/crew
	name = "Crew Quarters"
	icon_state = "crew_quarters"

/area/outpost/crew/bar
	name = "Bar"
	icon_state = "bar"
	sound_environment = SOUND_AREA_WOODFLOOR

/area/outpost/crew/canteen
	name = "Canteen"
	icon_state = "cafeteria"

/area/outpost/crew/cryo
	name = "Cryopod Room"
	icon_state = "cryo2"

/area/outpost/crew/dorm
	name = "Dormitory"
	icon_state = "Sleep"

/area/outpost/crew/garden
	name = "Garden"
	icon_state = "garden"

/area/outpost/crew/janitor
	name = "Custodial Closet"
	icon_state = "janitor"
	sound_environment = SOUND_AREA_SMALL_ENCLOSED

/area/outpost/crew/law_office
	name = "Law Office"
	icon_state = "law"
	sound_environment = SOUND_AREA_SMALL_SOFTFLOOR

/area/outpost/crew/library
	name = "Library"
	icon_state = "library"
	sound_environment = SOUND_AREA_LARGE_SOFTFLOOR

/area/outpost/crew/bathroom
	name = "Bathroom"
	icon_state = "restrooms"
	sound_environment = SOUND_ENVIRONMENT_BATHROOM

/area/outpost/crew/lounge
	name = "Lounge"
	icon_state = "lounge"


/area/outpost/engineering
	name = "Engineering"
	icon_state = "engine"
	ambientsounds = ENGINEERING
	sound_environment = SOUND_AREA_LARGE_ENCLOSED

/area/outpost/engineering/atmospherics
	name = "Atmospherics"
	icon_state = "atmos"


/area/outpost/hallway
	name = "Hallway"


/area/outpost/hallway/aft
	name = "Aft Hallway"
	icon_state = "hallA"

/area/outpost/hallway/fore
	name = "Fore Hallway"
	icon_state = "hallF"

/area/outpost/hallway/starboard
	name = "Starboard Hallway"
	icon_state = "hallS"

/area/outpost/hallway/port
	name = "Port Hallway"
	icon_state = "hallP"

/area/outpost/hallway/central
	name = "Central Hallway"
	icon_state = "hallC"


/area/outpost/maintenance
	name = "Maintenance"
	ambientsounds = MAINTENANCE
	sound_environment = SOUND_AREA_TUNNEL_ENCLOSED

/area/outpost/maintenance/aft
	name = "Aft Maintenance"
	icon_state = "amaint"

/area/outpost/maintenance/fore
	name = "Fore Maintenance"
	icon_state = "fmaint"

/area/outpost/maintenance/starboard
	name = "Starboard Maintenance"
	icon_state = "smaint"

/area/outpost/maintenance/port
	name = "Port Maintenance"
	icon_state = "pmaint"

/area/outpost/maintenance/central
	name = "Central Maintenance"
	icon_state = "maintcentral"


/area/outpost/medical
	name = "Infirmary"
	icon_state = "medbay3"
	ambientsounds = MEDICAL
	min_ambience_cooldown = 90 SECONDS
	max_ambience_cooldown = 180 SECONDS


/area/outpost/operations
	name = "Operations"
	icon_state = "bridge"
	sound_environment = SOUND_AREA_LARGE_ENCLOSED
	area_flags = NOTELEPORT
	// medbay values


/area/outpost/security
	name = "Security"
	icon_state = "security"
	ambientsounds = HIGHSEC

/area/outpost/security/armory
	name = "Armory"
	icon_state = "armory"

/area/outpost/security/checkpoint
	name = "Security Checkpoint"
	icon_state = "checkpoint1"

/area/outpost/storage
	name = "Storage"
	icon_state = "storage"

/area/outpost/vacant_rooms
	name = "Vacant Rooms"
	icon_state = "vacant_commissary"

/area/outpost/vacant_rooms/office
	name = "Vacant Office"
	icon_state = "vacant_office"

/area/outpost/vacant_rooms/shop
	name = "Shop"
	icon_state = "vacant_room"

//for powered outdoors non-space areas -- uses ice planet ambience

/area/outpost/exterior
	name = "Exterior"
	icon_state = "green"
	sound_environment = SOUND_ENVIRONMENT_CAVE
	ambientsounds = SPOOKY

// this might be redundant with /area/space/nearstation. unsure; use with caution?
/area/outpost/external
	name = "External"
	icon_state = "space_near"
	always_unpowered = TRUE
	sound_environment = SOUND_AREA_SPACE


/area/hangar
	name = "Hangar"
	icon_state = "hangar"

	area_flags = UNIQUE_AREA | NOTELEPORT | HIDDEN_AREA
	has_gravity = STANDARD_GRAVITY

	power_equip = TRUE // provided begrudgingly, mostly for mappers
	power_light = TRUE
	power_environ = TRUE

/// MEDICAL

/area/outpost/medical/reseption
	name = "Reseption"
	icon_state = "reseption"

/area/outpost/medical/morgue
	name = "Morg"
	icon_state = "morg"

/area/outpost/medical/hall_1
	name = "Hall 1"
	icon_state = "hall_1"

/area/outpost/medical/hall_2
	name = "Hall 2"
	icon_state = "hall_2"

/area/outpost/medical/storage
	name = "Storge"
	icon_state = "storge"

/area/outpost/medical/surgery_1
	name = "Surgery 1"
	icon_state = "surgery_1"

/area/outpost/medical/surgery_2
	name = "Surgery 2"
	icon_state = "surgery_2"

/area/outpost/medical/palata_1
	name = "Palata 1"
	icon_state = "palata_1"

/area/outpost/medical/palata_2
	name = "Palata 2"
	icon_state = "palata_2"

/area/outpost/medical/relax_room
	name = "Relax Room"
	icon_state = "relax"

/area/outpost/medical/genetic
	name = "Genetica"
	icon_state = "genetic"

/area/outpost/medical/chemestry
	name = "Chemestry"
	icon_state = "chemestry"

/area/outpost/medical/cmo
	name = "CMO"
	icon_state = "cmo"

/// LONGUE

/area/outpost/crew/lounge/cab_1
	name = "Cabinka 1"
	icon_state = "lounge_cab_1"
	sound_environment = SOUND_AREA_WOODFLOOR

/area/outpost/crew/lounge/cab_2
	name = "Cabinka 2"
	icon_state = "lounge_cab_2"
	sound_environment = SOUND_AREA_WOODFLOOR

/area/outpost/crew/lounge/cab_3
	name = "Cabinka 3"
	icon_state = "lounge_cab_3"
	sound_environment = SOUND_AREA_WOODFLOOR

/area/outpost/crew/lounge/cab_4
	name = "Cabinka 4"
	icon_state = "lounge_cab_4"
	sound_environment = SOUND_AREA_WOODFLOOR

/// CREW

/area/outpost/crew/dop_zone_1
	name = "Dop Zone 1"
	icon_state = "dop_zone_1"

/area/outpost/crew/dop_zone_2
	name = "Dop Zone 2"
	icon_state = "dop_zone_2"

/area/outpost/crew/dop_zone_3
	name = "Dop Zone 3"
	icon_state = "dop_zone_3"

/// BAR

/area/outpost/crew/bar/vip_elysium_zone
	name = "VIP Elysium Zone"
	icon_state = "vip_elysium"
	sound_environment = SOUND_AREA_SMALL_SOFTFLOOR

/area/outpost/crew/bar/vip_zone
	name = "VIP Zone"
	icon_state = "vip"
	sound_environment = SOUND_AREA_SMALL_SOFTFLOOR

/area/outpost/crew/bar/theatre
	name = "Theatre"
	icon_state = "theatre"

/area/outpost/crew/bar/central_bar
	name = "Central Bar"
	icon_state = "central_bar"

/area/outpost/crew/bar/bar_zone
	name = "Bar zone"
	icon_state = "zone_bar"

/// SECURITY

/area/outpost/security/bay
	name = "Bay"
	icon_state = "sec_bay"

/area/outpost/security/detective
	name = "Office detective"
	icon_state = "sec_detectiv"

/area/outpost/security/sb_armory
	name = "SB Armory"
	icon_state = "sec_armory"

/area/outpost/security/hall
	name = "Hall"
	icon_state = "sec_hall"

/area/outpost/security/reseption
	name = "Reseption"
	icon_state = "sec_reseption"

/area/outpost/operations/outpost_command
	name = "Outpost Command"
	icon_state = "outpost_command"

/// VACANT

/area/outpost/vacant_rooms/trash_factory
	name = "Trash Factory"
	icon_state = "trash_factory"

/// FRACTIONS

/area/outpost/faction
	name = "Faction"
	icon_state = "fraction"
	sound_environment = SOUND_AREA_MEDIUM_SOFTFLOOR

/area/outpost/faction/syndi
	name = "Faction Syndicate"
	icon_state = "faction_syndicate"
	sound_environment = SOUND_AREA_MEDIUM_SOFTFLOOR

/area/outpost/faction/syndi/room
	name = "Elite Syndicate Room"
	icon_state = "syndie_elite"

/area/outpost/faction/syndi/donkco_shop
	name = "Donk Co Shop"
	icon_state = "syndi_shop"
	sound_environment = SOUND_AREA_SMALL_SOFTFLOOR

/area/outpost/faction/nanotrasen
	name = "Faction Nanotrasen"
	icon_state = "faction_nanotrasen"
	sound_environment = SOUND_AREA_MEDIUM_SOFTFLOOR

/area/outpost/faction/solfed
	name = "Faction Solar Federation"
	icon_state = "faction_solfed"
	sound_environment = SOUND_AREA_MEDIUM_SOFTFLOOR

/area/outpost/faction/inteq
	name = "Faction InteQ"
	icon_state = "faction_inteq"
	sound_environment = SOUND_AREA_MEDIUM_SOFTFLOOR

/area/outpost/faction/separatist
	name = "Faction Separatists"
	icon_state = "faction_separatist"
	sound_environment = SOUND_AREA_MEDIUM_SOFTFLOOR

// CARGO FACTION

/area/outpost/cargo/faction/all
	name = "Cargo All"
	icon_state = "cargo_bay"

/area/outpost/cargo/faction/syndicate
	name = "Cargo Syndi"
	icon_state = "cargo_bay"

/area/outpost/cargo/faction/solfed
	name = "Cargo SolFed"
	icon_state = "cargo_bay"

/area/outpost/cargo/faction/inteq
	name = "Cargo InteQ"
	icon_state = "cargo_bay"

/area/outpost/cargo/faction/nanotrasen
	name = "Cargo Nanotrasen"
	icon_state = "cargo_bay"
