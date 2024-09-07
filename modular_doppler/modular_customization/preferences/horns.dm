/obj/item/organ/external/horns/modular
	name = "horns"
	preference = "feature_horns"
	bodypart_overlay = /datum/bodypart_overlay/mutant/horns/modular

/datum/bodypart_overlay/mutant/horns/modular
	layers = EXTERNAL_ADJACENT | EXTERNAL_ADJACENT_2 | EXTERNAL_ADJACENT_3

/datum/bodypart_overlay/mutant/horns/modular/color_image(image/overlay, draw_layer, obj/item/bodypart/limb)
	if(limb == null)
		return ..()
	if(limb.owner == null)
		return ..()
	if(draw_layer == bitflag_to_layer(EXTERNAL_ADJACENT))
		overlay.color = limb.owner.dna.features["horns_color_1"]
		return overlay
	else if(draw_layer == bitflag_to_layer(EXTERNAL_ADJACENT_2))
		overlay.color = limb.owner.dna.features["horns_color_2"]
		return overlay
	else if(draw_layer == bitflag_to_layer(EXTERNAL_ADJACENT_3))
		overlay.color = limb.owner.dna.features["horns_color_3"]
		return overlay
	return ..()

//core toggle
/datum/preference/toggle/horns
	savefile_key = "has_horns"
	savefile_identifier = PREFERENCE_CHARACTER
	category = PREFERENCE_CATEGORY_SECONDARY_FEATURES
	priority = PREFERENCE_PRIORITY_DEFAULT

/datum/preference/toggle/horns/apply_to_human(mob/living/carbon/human/target, value)
	if(value == FALSE)
		target.dna.features["horns"] = /datum/sprite_accessory/blank::name

/datum/preference/toggle/horns/create_default_value()
	return FALSE

/datum/species/regenerate_organs(mob/living/carbon/target, datum/species/old_species, replace_current = TRUE, list/excluded_zones, visual_only = FALSE)
	. = ..()
	if(target.dna.features["horns"])
		if(target.dna.features["horns"] != /datum/sprite_accessory/blank::name)
			var/obj/item/organ/replacement = SSwardrobe.provide_type(/obj/item/organ/external/horns/modular)
			replacement.Insert(target, special = TRUE, movement_flags = DELETE_IF_REPLACED)
			return .
	var/obj/item/organ/old_part = target.get_organ_slot(ORGAN_SLOT_EXTERNAL_HORNS)
	if(old_part)
		old_part.Remove(target, special = TRUE, movement_flags = DELETE_IF_REPLACED)
		old_part.moveToNullspace()

//sprite selection
/datum/preference/choiced/horns
	savefile_key = "feature_horns"
	savefile_identifier = PREFERENCE_CHARACTER
	main_feature_name = "Horns"
	should_generate_icons = TRUE
	category = PREFERENCE_CATEGORY_CLOTHING

/datum/preference/choiced/horns/is_accessible(datum/preferences/preferences)
	. = ..()
	var/has_horns = preferences.read_preference(/datum/preference/toggle/horns)
	if(has_horns == TRUE)
		return TRUE
	return FALSE

/datum/preference/choiced/horns/init_possible_values()
	return assoc_to_keys_features(SSaccessories.horns_list)

/datum/preference/choiced/horns/icon_for(value)
	return generate_lizard_side_shot(SSaccessories.horns_list[value], "horns")

/datum/preference/choiced/horns/apply_to_human(mob/living/carbon/human/target, value)
	target.dna.features["horns"] = value

/datum/preference/choiced/horns/create_default_value()
	return /datum/sprite_accessory/blank::name
