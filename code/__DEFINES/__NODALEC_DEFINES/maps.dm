// [NODALEC-ADD]
#define ALLOCATION_FREE 1
#define ALLOCATION_QUADRANT 2

#define DEFAULT_ALLOC_JUMP 5

#define ZTRAIT_SUN_TYPE "Sun Cycle Type"
	// default & original SSsun behaviour - orbit the 'station' horizontially.
	// solar panels will cast a line (default 20 steps) and if it is occluded they lose sunlight
	#define AZIMUTH null
	// static, exposed
	// the solar panel must be within 1 tile of space, or another "groundless" turf, to be exposed to sunlight
	#define STATIC_EXPOSED "Static Exposed"
	// static, obscured
	// solar panels are never exposed to sunlight
