// ⚙️ OVERMAP SYSTEM: Star Objects
// Operation: OVERMAP RESURRECTION - Day 1
// Port from: Shiptest (simplified for MVP)

/**
 * # Star Datum
 *
 * Represents a star on the overmap
 */
/datum/overmap/star
	name = "Star"
	desc = "A star. The center of the system."
	token_icon_state = "star1"
	color = "#ffff00" // Yellow star by default

	// Stars don't move
	// Stars can't be docked to (for MVP)

/datum/overmap/star/Initialize()
	. = ..()
	// Generate random star name
	name = "Star [rand(1000, 9999)]"

// NOTE: Medium/Big/Binary variants will be added after MVP
// For now - just basic star
