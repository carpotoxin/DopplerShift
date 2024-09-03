//// Pref logic for kemonimimi species traits
// defines in `code/__DEFINES/~doppler_defines/traits/declarations.dm`
/datum/preference/choiced/kemonomimi_traits
	savefile_key = "kemonomimi_traits"
	savefile_identifier = PREFERENCE_CHARACTER
	category = PREFERENCE_CATEGORY_FEATURES
	main_feature_name = "Animal Trait"
	priority = PREFERENCE_PRIORITY_DEFAULT //important flag
	relevant_inherent_trait = TRAIT_ANIMALISTIC
	should_generate_icons = TRUE

/datum/preference/choiced/kemonomimi_traits/init_possible_values()
	return list(
		TRAIT_FELINE,
		TRAIT_CANINE,
		TRAIT_REPTILE,
		TRAIT_AVIAN,
		TRAIT_MURIDAE,
		TRAIT_PISCINE,
	)

/datum/preference/choiced/kemonomimi_traits/icon_for(value)
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


/datum/preference/choiced/kemonomimi_traits/apply_to_human(mob/living/carbon/human/target, value)
	ADD_TRAIT(target, value, TRAIT_ANIMALISTIC)

/datum/preference/choiced/kemonomimi_traits/create_default_value()
	return TRAIT_CANINE
