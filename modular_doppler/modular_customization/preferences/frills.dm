/obj/item/organ/external/frills/modular
	name = "frills"
	preference = "feature_frills"
	bodypart_overlay = /datum/bodypart_overlay/mutant/frills/modular

/datum/bodypart_overlay/mutant/frills/modular
	layers = EXTERNAL_ADJACENT | EXTERNAL_ADJACENT_2 | EXTERNAL_ADJACENT_3

/datum/bodypart_overlay/mutant/frills/modular/color_image(image/overlay, draw_layer, obj/item/bodypart/limb)
	if(limb == null)
		return ..()
	if(limb.owner == null)
		return ..()
	if(draw_layer == bitflag_to_layer(EXTERNAL_ADJACENT))
		overlay.color = limb.owner.dna.features["frills_color_1"]
		return overlay
	else if(draw_layer == bitflag_to_layer(EXTERNAL_ADJACENT_2))
		overlay.color = limb.owner.dna.features["frills_color_2"]
		return overlay
	else if(draw_layer == bitflag_to_layer(EXTERNAL_ADJACENT_3))
		overlay.color = limb.owner.dna.features["frills_color_3"]
		return overlay
	return ..()

//core toggle
/datum/preference/toggle/frills
	savefile_key = "has_frills"
	savefile_identifier = PREFERENCE_CHARACTER
	category = PREFERENCE_CATEGORY_SECONDARY_FEATURES
	priority = PREFERENCE_PRIORITY_DEFAULT

/datum/preference/toggle/frills/apply_to_human(mob/living/carbon/human/target, value)
	if(value == FALSE)
		target.dna.features["frills"] = /datum/sprite_accessory/blank::name

/datum/preference/toggle/frills/create_default_value()
	return FALSE

/datum/species/regenerate_organs(mob/living/carbon/target, datum/species/old_species, replace_current = TRUE, list/excluded_zones, visual_only = FALSE)
	. = ..()
	if(target.dna.features["frills"])
		if(target.dna.features["frills"] != /datum/sprite_accessory/blank::name)
			var/obj/item/organ/replacement = SSwardrobe.provide_type(/obj/item/organ/external/frills/modular)
			replacement.Insert(target, special = TRUE, movement_flags = DELETE_IF_REPLACED)
			return .
	var/obj/item/organ/old_part = target.get_organ_slot(ORGAN_SLOT_EXTERNAL_FRILLS)
	if(old_part)
		old_part.Remove(target, special = TRUE, movement_flags = DELETE_IF_REPLACED)
		old_part.moveToNullspace()

//sprite selection
/datum/preference/choiced/frills
	category = PREFERENCE_CATEGORY_CLOTHING
	savefile_key = "feature_frills"
	savefile_identifier = PREFERENCE_CHARACTER
	main_feature_name = "Frills"
	should_generate_icons = TRUE

/datum/preference/choiced/frills/is_accessible(datum/preferences/preferences)
	. = ..()
	var/has_frills = preferences.read_preference(/datum/preference/toggle/frills)
	if(has_frills == TRUE)
		return TRUE
	return FALSE

/datum/preference/choiced/frills/init_possible_values()
	return assoc_to_keys_features(SSaccessories.frills_list)

/datum/preference/choiced/frills/icon_for(value)
	return generate_lizard_side_shot(SSaccessories.frills_list[value], "frills")

/datum/preference/choiced/frills/apply_to_human(mob/living/carbon/human/target, value)
	target.dna.features["frills"] = value

/datum/preference/choiced/frills/create_default_value()
	return /datum/sprite_accessory/blank::name
