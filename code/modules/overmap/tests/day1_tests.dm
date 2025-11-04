// ⚙️ OVERMAP MVP DAY 1: Tests
// Operation: OVERMAP RESURRECTION

/**
 * # Smoke Test
 * Basic check that subsystem exists
 */
/proc/overmap_smoke_test()
	if(!SSovermap)
		return "❌ FAIL: SSovermap doesn't exist"

	if(SSovermap.state != SS_RUNNING)
		return "❌ FAIL: SSovermap state = [SSovermap.state], expected SS_RUNNING"

	return "✅ SUCCESS: Server starts"

/**
 * # Init Test
 * Check that subsystem initialized correctly
 */
/proc/overmap_init_test()
	if(!SSovermap)
		return "❌ FAIL: No SSovermap"

	if(!SSovermap.default_system)
		return "❌ FAIL: No default_system"

	if(!SSovermap.default_system.overmap_vlevel)
		return "❌ FAIL: No overmap_vlevel"

	if(!SSovermap.default_system.overmap_vlevel.z_value)
		return "❌ FAIL: overmap_vlevel.z_value is null"

	if(!SSovermap.default_system.overmap_container)
		return "❌ FAIL: No overmap_container"

	return "✅ SUCCESS: SSovermap + virtual level initialized"

/**
 * # Spawn Token Test
 * Check that star was spawned and has a token
 */
/proc/overmap_spawn_token_test()
	if(length(SSovermap.overmap_objects) < 1)
		return "❌ FAIL: No objects on overmap (expected at least a star)"

	var/datum/overmap/test_obj = SSovermap.overmap_objects[1]

	if(!test_obj.token)
		return "❌ FAIL: Object has no token"

	if(!test_obj.x || !test_obj.y)
		return "❌ FAIL: Object has no coordinates"

	var/turf/T = get_turf(test_obj.token)
	if(!T)
		return "❌ FAIL: Token not on valid turf"

	if(!istype(T, /turf/open/overmap))
		return "❌ FAIL: Token not on overmap turf (type: [T.type])"

	return "✅ SUCCESS: Star visible on overmap ([length(SSovermap.overmap_objects)] objects total)"

/**
 * # Admin Command: Run All Tests
 */
/client/proc/test_overmap_day1()
	set name = "🧪 Test Overmap Day 1"
	set category = "Debug.Overmap"

	if(!check_rights(R_DEBUG))
		return

	to_chat(src, span_boldnotice("=== OVERMAP DAY 1 TESTS ==="))

	var/list/tests = list(
		"Smoke Test" = /proc/overmap_smoke_test,
		"Init Test" = /proc/overmap_init_test,
		"Spawn Token Test" = /proc/overmap_spawn_token_test
	)

	var/passed = 0
	var/failed = 0

	for(var/test_name in tests)
		var/test_proc = tests[test_name]
		var/result = call(test_proc)()

		to_chat(src, "<b>[test_name]:</b> [result]")

		if(findtext(result, "SUCCESS"))
			passed++
		else
			failed++

	to_chat(src, span_boldnotice("=== RESULTS ==="))
	to_chat(src, span_notice("Passed: [passed]"))
	to_chat(src, span_warning("Failed: [failed]"))

	if(failed == 0)
		to_chat(src, span_boldnotice("✅ ALL DAY 1 TESTS PASSED!"))
		to_chat(src, span_notice("Gloria ad BYONDum. Omnissiah vult."))
	else
		to_chat(src, span_danger("❌ SOME TESTS FAILED!"))

/**
 * # Admin Command: Teleport to Overmap
 */
/client/proc/teleport_to_overmap()
	set name = "🚀 Teleport to Overmap"
	set category = "Debug.Overmap"

	if(!check_rights(R_ADMIN))
		return

	if(!SSovermap || !SSovermap.default_system || !SSovermap.default_system.overmap_vlevel)
		to_chat(src, span_warning("Overmap not initialized!"))
		return

	// Teleport to center
	var/center_x = round(SSovermap.default_system.size / 2)
	var/center_y = round(SSovermap.default_system.size / 2)

	var/physical_x = SSovermap.default_system.overmap_vlevel.low_x + center_x + MAP_EDGE_PAD - 1
	var/physical_y = SSovermap.default_system.overmap_vlevel.low_y + center_y + MAP_EDGE_PAD - 1
	var/physical_z = SSovermap.default_system.overmap_vlevel.z_value

	var/turf/T = locate(physical_x, physical_y, physical_z)
	if(!T)
		to_chat(src, span_warning("Failed to locate overmap turf!"))
		return

	mob.forceMove(T)
	to_chat(src, span_notice("Teleported to overmap center ([center_x], [center_y])"))

/**
 * # Admin Command: Overmap Info
 */
/client/proc/overmap_info()
	set name = "📊 Overmap Info"
	set category = "Debug.Overmap"

	if(!check_rights(R_DEBUG))
		return

	to_chat(src, span_boldnotice("=== OVERMAP INFO ==="))

	if(!SSovermap)
		to_chat(src, span_danger("SSovermap doesn't exist!"))
		return

	to_chat(src, span_notice("Subsystem State: [SSovermap.state]"))

	if(SSovermap.default_system)
		to_chat(src, span_notice("System: [SSovermap.default_system.name]"))
		to_chat(src, span_notice("Size: [SSovermap.default_system.size]x[SSovermap.default_system.size]"))
		to_chat(src, span_notice("VLevel Z: [SSovermap.default_system.overmap_vlevel?.z_value || "NULL"]"))

	to_chat(src, span_notice("Total Objects: [length(SSovermap.overmap_objects)]"))
	to_chat(src, span_notice("Ships: [length(SSovermap.controlled_ships)]"))
	to_chat(src, span_notice("Outposts: [length(SSovermap.outposts)]"))

	to_chat(src, span_boldnotice("=== OBJECT LIST ==="))
	for(var/datum/overmap/obj in SSovermap.overmap_objects)
		to_chat(src, "- [obj.type] '[obj.name]' at ([obj.x],[obj.y])")

