// TRAIT_ANIMALISTIC choices
#define TRAIT_FELINE "cat" // confirms the isfelinid is_helper
#define TRAIT_CANINE "dog"
#define TRAIT_REPTILE "lizard" // confirms the islizard is_helper
#define TRAIT_LEPORID "bunny"
#define TRAIT_AVIAN "bird"
#define TRAIT_MURIDAE "mouse"
#define TRAIT_PISCINE "fish"
#define TRAIT_SIMIAN "monkey"  // confirms the ismonkey is_helper

/// Every animal trait available for picking roundstart on appropriate species
GLOBAL_LIST_INIT(animalistic_traits, list(
	TRAIT_FELINE,
	TRAIT_CANINE,
	TRAIT_REPTILE,
	TRAIT_LEPORID,
	TRAIT_AVIAN,
	TRAIT_MURIDAE,
	TRAIT_PISCINE,
	TRAIT_SIMIAN,
))
