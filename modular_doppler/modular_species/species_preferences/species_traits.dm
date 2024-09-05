//// Pref logic for kemonimimi species traits
// defines in `code/__DEFINES/~doppler_defines/traits/declarations.dm`
/datum/preference/choiced/animalistic
	main_feature_name = "Animalistic trait"
	savefile_key = "feature_animalistic"
	savefile_identifier = PREFERENCE_CHARACTER
	category = PREFERENCE_CATEGORY_FEATURES
	priority = PREFERENCE_PRIORITY_DEFAULT //important flag
	relevant_inherent_trait = TRAIT_ANIMALISTIC
	should_generate_icons = TRUE

/datum/preference/choiced/animalistic/init_possible_values()
	return GLOB.animalistic_traits

/datum/preference/choiced/animalistic/icon_for(value)
	switch(value)
		if(TRAIT_FELINE)
			return icon('icons/mob/simple/pets.dmi', "cat2", EAST)
		if(TRAIT_CANINE)
			return icon('icons/mob/simple/pets.dmi', "corgi", WEST)
		if(TRAIT_REPTILE)
			return icon('icons/mob/simple/animal.dmi', "snake", EAST)
		if(TRAIT_LEPORID)
			return icon('icons/mob/simple/rabbit.dmi', "rabbit_white", WEST)
		if(TRAIT_AVIAN)
			return icon('icons/mob/simple/animal.dmi', "chicken_brown", EAST)
		if(TRAIT_MURIDAE)
			return icon('icons/mob/simple/animal.dmi', "mouse_white", WEST)
		if(TRAIT_PISCINE)
			return icon('icons/mob/simple/carp.dmi', "carp", EAST)
		if(TRAIT_SIMIAN)
			return icon('icons/mob/human/human.dmi', "monkey", WEST)


/datum/preference/choiced/animalistic/apply_to_human(mob/living/carbon/human/target, value)
	ADD_TRAIT(target, value, TRAIT_ANIMALISTIC)

/datum/preference/choiced/animalistic/create_default_value()
	return TRAIT_CANINE
