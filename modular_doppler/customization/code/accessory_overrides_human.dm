/datum/species/get_features()
	var/list/features = ..()

	features += /datum/preference/choiced/tail_human

	GLOB.features_by_species[type] = features

	return features

//core toggle
/datum/preference/toggle/tail_human
	savefile_key = "has_human_tail"
	savefile_identifier = PREFERENCE_CHARACTER
	category = PREFERENCE_CATEGORY_SECONDARY_FEATURES
	priority = PREFERENCE_PRIORITY_DEFAULT

/datum/preference/toggle/tail_human/is_accessible(datum/preferences/preferences)
	. = ..()
	var/has_tail_already = preferences.read_preference(/datum/preference/toggle/lizard_tail)
	if(has_tail_already == FALSE)
		return TRUE
	return FALSE

/datum/preference/toggle/tail_human/apply_to_human(mob/living/carbon/human/target, value)
	if(value == FALSE)
		target.dna.features["tail_cat"] = "None"

/datum/preference/toggle/tail_human/create_default_value()
	return FALSE

//sprite selection
/datum/preference/choiced/tail_human
	category = PREFERENCE_CATEGORY_CLOTHING
	relevant_external_organ = null
	should_generate_icons = TRUE
	main_feature_name = "Tail"

/datum/preference/choiced/tail_human/is_accessible(datum/preferences/preferences)
	. = ..()
	var/has_human_tail = preferences.read_preference(/datum/preference/toggle/tail_human)
	if(has_human_tail == TRUE)
		return TRUE
	return FALSE

/datum/preference/choiced/tail_human/create_default_value()
	return /datum/sprite_accessory/tails/none::name

/datum/preference/choiced/tail_human/icon_for(value)
	var/datum/sprite_accessory/sprite_accessory = SSaccessories.tails_list_human[value]

	var/icon/final_icon = icon('icons/mob/human/bodyparts_greyscale.dmi', "human_chest_m", NORTH)

	if (sprite_accessory.icon_state != "none")
		var/icon/markings_icon_1 = icon(sprite_accessory.icon, "m_tail_[sprite_accessory.icon_state]_BEHIND", NORTH)
		markings_icon_1.Blend(COLOR_RED, ICON_MULTIPLY)
		var/icon/markings_icon_2 = icon(sprite_accessory.icon, "m_tail_[sprite_accessory.icon_state]_BEHIND_2", NORTH)
		markings_icon_2.Blend(COLOR_VIBRANT_LIME, ICON_MULTIPLY)
		var/icon/markings_icon_3 = icon(sprite_accessory.icon, "m_tail_[sprite_accessory.icon_state]_BEHIND_3", NORTH)
		markings_icon_3.Blend(COLOR_BLUE, ICON_MULTIPLY)
		final_icon.Blend(markings_icon_1, ICON_OVERLAY)
		final_icon.Blend(markings_icon_2, ICON_OVERLAY)
		final_icon.Blend(markings_icon_3, ICON_OVERLAY)
		// front breaker
		var/icon/markings_icon_1_f = icon(sprite_accessory.icon, "m_tail_[sprite_accessory.icon_state]_FRONT", NORTH)
		markings_icon_1_f.Blend(COLOR_RED, ICON_MULTIPLY)
		var/icon/markings_icon_2_f = icon(sprite_accessory.icon, "m_tail_[sprite_accessory.icon_state]_FRONT_2", NORTH)
		markings_icon_2_f.Blend(COLOR_VIBRANT_LIME, ICON_MULTIPLY)
		var/icon/markings_icon_3_f = icon(sprite_accessory.icon, "m_tail_[sprite_accessory.icon_state]_FRONT_3", NORTH)
		markings_icon_3_f.Blend(COLOR_BLUE, ICON_MULTIPLY)
		final_icon.Blend(markings_icon_1_f, ICON_OVERLAY)
		final_icon.Blend(markings_icon_2_f, ICON_OVERLAY)
		final_icon.Blend(markings_icon_3_f, ICON_OVERLAY)

	//final_icon.Crop(4, 12, 28, 32)
	//final_icon.Scale(32, 26)
	//final_icon.Crop(-2, 1, 29, 32)

	return final_icon

/datum/preference/choiced/tail_human/init_possible_values()
	return assoc_to_keys_features(SSaccessories.tails_list_human)
