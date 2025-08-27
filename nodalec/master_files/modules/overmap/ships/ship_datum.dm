// тут много всяких штук. Это обязательно нужно всё будет перенести.

/datum/overmap/ship
	name = "overmap vessel"
	char_rep = ">"
	// [CELADON-EDIT] - CELADON_OVERMAP_STUFF - Это вагабонд насрал
	// token_icon_state = "ship"
	token_icon_state = "ship_point"
	// [/CELADON-EDIT]
	///Timer ID of the looping movement timer
	var/movement_callback_id
	///Max possible speed (1 tile per tick / 600 tiles per minute)
	var/static/max_speed = 1
	///Minimum speed. Any lower is rounded down. (0.01 tiles per minute)
	var/static/min_speed = 1/(100 MINUTES)

	///The current speed in x direction in grid squares per minute
	var/speed_x = 0
	///The current speed in y direction in grid squares per minute
	var/speed_y = 0

	// ЭТУ Я ЗАКОММЕНТИРОВАЛ ПОТОМУ ЧТО ТУТ ОШИБКА И ОН НЕ НУЖЕН ДЛЯ АВАНПОСТА.


	//	!!!

	///The direction being accelerated in

	//var/burn_direction = BURN_NONE


	//	!!!


	///Percentage of thruster power being used
	var/burn_percentage = 50

	///ONLY USED FOR NON-SIMULATED SHIPS. The amount per burn that this ship accelerates
	var/acceleration_speed = 0.02

// [CELADON-ADD] - CELADON_OVERMAP_STUFF - Это вагабонд насрал
	///For bay overmap
	var/x_pixels_moved = 0
	var/y_pixels_moved = 0

	var/list/position_to_move = list("x" = 0, "y" = 0)
	var/list/last_anim = list("x" = 0, "y" = 0)
	var/list/vector_to_add = list("x" = 0, "y" = 0)

	var/list/arpa = list()

	var/bow_heading = 0
	var/rotating = 0
	var/rotation_velocity = 0

	var/skiptickfortrail = 0
	// [CELADON-EDIT] - Убираем предупреждение валидатора
	var/list/obj/shiptrail/trails = list(1 = null,
							2 = null,
							3 = null)
	// [/CELADON-EDIT]
