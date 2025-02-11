//assault
/obj/projectile/beam/laser/assault
	name = "assault laser"
	icon_state = "heavylaser"
	damage = 25
	armour_penetration = 20
	speed = 1.3
	tracer_type = /obj/effect/projectile/tracer/heavy_laser
	muzzle_type = /obj/effect/projectile/muzzle/heavy_laser
	impact_type = /obj/effect/projectile/impact/heavy_laser

/obj/item/ammo_casing/energy/laser/assault
	projectile_type = /obj/projectile/beam/laser/assault
	select_name = "kill"
	fire_sound = 'sound/items/weapons/gun/energy/e40_las.ogg'

//eshotgun
/obj/projectile/beam/laser/iot
	name = "laser pellet"
	icon_state = "scatterlaser"
	damage = 7.5
	wound_bonus = 5
	bare_wound_bonus = 5
	damage_falloff_tile = -0.45
	wound_falloff_tile = -2.5

/obj/item/ammo_casing/energy/laser/iot
	projectile_type = /obj/projectile/beam/laser/iot
	select_name = "scatter kill"
	fire_sound = 'sound/items/weapons/laser2.ogg'

/obj/projectile/beam/disabler/iot
	name = "disabler pellet"
	icon_state = "omnilaser"
	damage = 7.5
	wound_bonus = 5
	bare_wound_bonus = 5
	damage_falloff_tile = -0.45
	wound_falloff_tile = -2.5

/obj/item/ammo_casing/energy/disabler/scatter/iot
	projectile_type = /obj/projectile/beam/laser/iot
	select_name = "scatter disable"

//etar SMG
/obj/projectile/beam/laser/smg
	name = "speedy laser"
	damage = 15
	armour_penetration = -10
	speed = 1.5

/obj/item/ammo_casing/energy/laser/smg
	projectile_type = /obj/projectile/beam/laser/smg
	select_name = "kill"
	fire_sound = 'sound/items/weapons/gun/energy/nt-fire.ogg'

/obj/projectile/beam/disabler/smg
	name = "speedy disabler beam"
	icon_state = "omnilaser"
	damage = 15
	speed = 1.5

/obj/item/ammo_casing/energy/disabler/smg
	projectile_type = /obj/projectile/beam/disabler/smg
	fire_sound = 'sound/items/weapons/gun/energy/nt-fire.ogg'
