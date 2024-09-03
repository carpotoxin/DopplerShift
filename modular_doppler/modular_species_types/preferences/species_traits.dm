//// Pref logic for kemonimimi species traits
// defines in `code/__DEFINES/~doppler_defines/traits/declarations.dm`
/datum/preference/choiced/animalistic
	savefile_key = "feature_animalistic"
	savefile_identifier = PREFERENCE_CHARACTER
	category = PREFERENCE_CATEGORY_FEATURES
	main_feature_name = "Animalistic trait"
	priority = PREFERENCE_PRIORITY_DEFAULT //important flag
	relevant_inherent_trait = TRAIT_ANIMALISTIC
	should_generate_icons = TRUE

/datum/preference/choiced/animalistic/init_possible_values()
	return list(
		TRAIT_FELINE,
		TRAIT_CANINE,
		TRAIT_REPTILE,
		TRAIT_AVIAN,
		TRAIT_MURIDAE,
		TRAIT_PISCINE,
	)

/datum/preference/choiced/animalistic/icon_for(value)
	switch(value)
		if(TRAIT_FELINE)
			return icon('icons/mob/simple/pets.dmi', "cat2", EAST)
		if(TRAIT_CANINE)
			return icon('icons/mob/simple/pets.dmi', "corgi", EAST)
		if(TRAIT_REPTILE)
			return icon('icons/mob/simple/animal.dmi', "snake", EAST)
		if(TRAIT_AVIAN)
			return icon('icons/mob/simple/animal.dmi', "chicken_white", EAST)
		if(TRAIT_MURIDAE)
			return icon('icons/mob/simple/animal.dmi', "mouse_white", EAST)
		if(TRAIT_PISCINE)
			return icon('icons/obj/toys/plushes.dmi', "blahaj")


/datum/preference/choiced/animalistic/apply_to_human(mob/living/carbon/human/target, value)
	ADD_TRAIT(target, value, TRAIT_ANIMALISTIC)

/datum/preference/choiced/animalistic/create_default_value()
	return TRAIT_CANINE
