/datum/bodypart_overlay/simple/body_marking/modular
	dna_feature_key = "lizard_markings"
	layers = EXTERNAL_ADJACENT | EXTERNAL_ADJACENT_2 | EXTERNAL_ADJACENT_3

/datum/bodypart_overlay/simple/body_marking/modular/get_accessory(name)
	return SSaccessories.lizard_markings_list[name]

/datum/bodypart_overlay/simple/body_marking/modular/get_image(layer, obj/item/bodypart/limb)
	if(limb == null)
		return ..()
	if(limb.owner == null)
		return ..()
	var/gender_string = (use_gender && limb.is_dimorphic) ? (limb.gender == MALE ? MALE : FEMALE + "_") : "" //we only got male and female sprites
	if(layer == bitflag_to_layer(EXTERNAL_ADJACENT_2))
		return image(icon, gender_string + icon_state + "_" + limb.body_zone + "_2", layer = layer)
	if(layer == bitflag_to_layer(EXTERNAL_ADJACENT_3))
		return image(icon, gender_string + icon_state + "_" + limb.body_zone + "_3", layer = layer)
	return image(icon, gender_string + icon_state + "_" + limb.body_zone, layer = layer)

/datum/bodypart_overlay/simple/body_marking/modular/color_image(image/overlay, draw_layer, obj/item/bodypart/limb)
	if(limb == null)
		return ..()
	if(limb.owner == null)
		return ..()
	if(draw_layer == bitflag_to_layer(EXTERNAL_ADJACENT))
		overlay.color = limb.owner.dna.features["body_markings_color_1"]
		return overlay
	else if(draw_layer == bitflag_to_layer(EXTERNAL_ADJACENT_2))
		overlay.color = limb.owner.dna.features["body_markings_color_2"]
		return overlay
	else if(draw_layer == bitflag_to_layer(EXTERNAL_ADJACENT_3))
		overlay.color = limb.owner.dna.features["body_markings_color_3"]
		return overlay
	return ..()

//toggle prefs
/datum/preference/toggle/markings
	savefile_key = "has_markings"
	savefile_identifier = PREFERENCE_CHARACTER
	category = PREFERENCE_CATEGORY_SECONDARY_FEATURES
	priority = PREFERENCE_PRIORITY_DEFAULT

/datum/preference/toggle/markings/apply_to_human(mob/living/carbon/human/target, value)
	if(value == FALSE)
		target.dna.features["lizard_markings"] = /datum/sprite_accessory/blank::name

/datum/preference/toggle/markings/create_default_value()
	return FALSE

//toggle pref integration
/datum/preference/choiced/body_markings
	category = PREFERENCE_CATEGORY_CLOTHING
	savefile_key = "feature_body_markings"
	savefile_identifier = PREFERENCE_CHARACTER
	main_feature_name = "Body markings"
	should_generate_icons = TRUE

/datum/preference/choiced/body_markings/is_accessible(datum/preferences/preferences)
	. = ..()
	var/has_markings = preferences.read_preference(/datum/preference/toggle/markings)
	if(has_markings == TRUE)
		return TRUE
	return FALSE

/datum/preference/choiced/body_markings/init_possible_values()
	return assoc_to_keys_features(SSaccessories.lizard_markings_list)

/datum/preference/choiced/body_markings/create_default_value()
	return /datum/sprite_accessory/blank::name

/datum/preference/choiced/body_markings/apply_to_human(mob/living/carbon/human/target, value)
	target.dna.features["lizard_markings"] = value

/datum/preference/choiced/body_markings/icon_for(value)
	var/datum/sprite_accessory/sprite_accessory = value ? SSaccessories.lizard_markings_list[value] : /datum/sprite_accessory/blank

	var/icon/final_icon = icon('icons/mob/human/species/lizard/bodyparts.dmi', "lizard_chest_m")

	if (sprite_accessory.icon_state != "none")
		var/icon/markings_icon_1 = icon(sprite_accessory.icon, "male_[sprite_accessory.icon_state]_chest")
		markings_icon_1.Blend(COLOR_RED, ICON_MULTIPLY)
		var/icon/markings_icon_2 = icon(sprite_accessory.icon, "male_[sprite_accessory.icon_state]_chest_2")
		markings_icon_2.Blend(COLOR_VIBRANT_LIME, ICON_MULTIPLY)
		var/icon/markings_icon_3 = icon(sprite_accessory.icon, "male_[sprite_accessory.icon_state]_chest_3")
		markings_icon_3.Blend(COLOR_BLUE, ICON_MULTIPLY)
		final_icon.Blend(markings_icon_1, ICON_OVERLAY)
		final_icon.Blend(markings_icon_2, ICON_OVERLAY)
		final_icon.Blend(markings_icon_3, ICON_OVERLAY)

	final_icon.Crop(10, 8, 22, 23)
	final_icon.Scale(26, 32)
	final_icon.Crop(-2, 1, 29, 32)

	return final_icon

//manually adding them now
/datum/species/add_body_markings(mob/living/carbon/human/hooman)
	. = ..()
	if(hooman.dna.features["lizard_markings"] && hooman.dna.features["lizard_markings"] != /datum/sprite_accessory/blank::name) //loop through possible species markings
		var/datum/bodypart_overlay/simple/body_marking/markings = new /datum/bodypart_overlay/simple/body_marking/modular() // made to die... mostly because we cant use initial on lists but its convenient and organized
		var/accessory_name = hooman.dna.features[markings.dna_feature_key] //get the accessory name from dna
		var/datum/sprite_accessory/moth_markings/accessory = markings.get_accessory(accessory_name) //get the actual datum

		if(isnull(accessory))
			CRASH("Value: [accessory_name] did not have a corresponding sprite accessory!")

		for(var/obj/item/bodypart/part as anything in markings.applies_to) //check through our limbs
			var/obj/item/bodypart/people_part = hooman.get_bodypart(initial(part.body_zone)) // and see if we have a compatible marking for that limb

			if(!people_part)
				continue

			var/datum/bodypart_overlay/simple/body_marking/overlay = new /datum/bodypart_overlay/simple/body_marking/modular()

			// Tell the overlay what it should look like
			overlay.icon = accessory.icon
			overlay.icon_state = accessory.icon_state
			overlay.use_gender = accessory.gender_specific
			overlay.draw_color = accessory.color_src ? hooman.dna.features["mcolor"] : null

			people_part.add_bodypart_overlay(overlay)
