//// Pref logic for kemonimimi species traits
// defines in `code/__DEFINES/~doppler_defines/traits/declarations.dm`
/datum/preference/choiced/kemonomimi_traits
	savefile_key = "kemonomimi_traits"
	savefile_identifier = PREFERENCE_CHARACTER
	category = PREFERENCE_CATEGORY_FEATURES
	main_feature_name = "Animal Trait"
	priority = PREFERENCE_PRIORITY_BODYPARTS
	relevant_inherent_trait = KEMONOMIMI_TRAIT
	should_generate_icons = TRUE

/datum/preference/choiced/kemonomimi_traits/init_possible_values()
	return list(
		TRAIT_FELINE
	)

/datum/preference/choiced/kemonomimi_traits/icon_for(value)
	switch(value)
		if(TRAIT_FELINE)
			return icon('icons/mob/simple/pets.dmi', "cat2_sit")

/datum/preference/choiced/kemonomimi_traits/apply_to_human(mob/living/carbon/human/target, value)
	ADD_TRAIT(target, value, KEMONOMIMI_TRAIT)

/datum/preference/choiced/kemonomimi_traits/create_default_value()
	return TRAIT_FELINE // felinids :3
