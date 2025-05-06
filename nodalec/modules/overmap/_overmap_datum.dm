/datum/overmap
	///Name of the planet
	var/name = "Planet"
	///Description of the planet
	var/desc = "A generic planet, tell the Coders that you found this."
	///Icon of the planet
	var/icon_state = "globe"
	///Colour of the planet
	var/color = COLOR_WHITE

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
