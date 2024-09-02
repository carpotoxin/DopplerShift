//// Pref logic for kemonimimi species traits
GLOBAL_LIST_INIT(kemonomimi_traits, init_kemonomimi_traits())

/proc/init_kemonomimi_traits()
	var/list/instances = list()
	for(var/datum/brain_trauma/trait as anything in subtypesof(/datum/brain_trauma))
		trait = new trait()
		instances[trait.name] = trait
	return instances

/datum/preference/choiced/kemonomimi_traits
	savefile_key = "kemonomimi_traits"
	category = PREFERENCE_CATEGORY_FEATURES
	savefile_identifier = PREFERENCE_CHARACTER
	main_feature_name = "Animal Trait"
	priority = PREFERENCE_PRORITY_LATE_BODY_TYPE
	relevant_inherent_trait = TRAIT_ANIMAL_HYBRID
/*	should_generate_icons = TRUE

/datum/preference/choiced/kemonomimi_traits/icon_for(value)
	switch(value)
		if( )
			return
*/

/datum/preference/choiced/kemonomimi_traits/init_possible_values()
	return assoc_to_keys(GLOB.kemonomimi_traits) + "Random"

/datum/preference/choiced/kemonomimi_traits/create_default_value()
	return "Random"

/datum/preference/choiced/kemonomimi_traits/apply_to_human(mob/living/carbon/human/target, value)
	return
