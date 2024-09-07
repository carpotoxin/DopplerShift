/// Standard bodymark fixing
/datum/bodypart_overlay/simple/body_marking/lizard
	layers = EXTERNAL_ADJACENT | EXTERNAL_ADJACENT_2 | EXTERNAL_ADJACENT_3

/datum/bodypart_overlay/simple/body_marking/lizard/get_image(layer, obj/item/bodypart/limb)
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

/datum/bodypart_overlay/simple/body_marking/lizard/color_image(image/overlay, draw_layer, obj/item/bodypart/limb)
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

/datum/preference/choiced/lizard_body_markings/icon_for(value)
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
