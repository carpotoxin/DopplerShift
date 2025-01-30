/proc/generate_breasts_shot(datum/sprite_accessory/sprite_accessory, key)
	var/icon/final_icon = icon('icons/mob/human/bodyparts_greyscale.dmi', "human_chest_f", SOUTH)

	if (!isnull(sprite_accessory))
		var/icon/accessory_icon = icon(sprite_accessory.icon, "m_[key]_[sprite_accessory.icon_state]_ADJ", SOUTH)
		var/icon/accessory_icon_2 = icon(sprite_accessory.icon, "m_[key]_[sprite_accessory.icon_state]_ADJ_2", SOUTH)
		accessory_icon_2.Blend(COLOR_RED, ICON_MULTIPLY)
		var/icon/accessory_icon_3 = icon(sprite_accessory.icon, "m_[key]_[sprite_accessory.icon_state]_ADJ_3", SOUTH)
		accessory_icon_3.Blend(COLOR_VIBRANT_LIME, ICON_MULTIPLY)
		final_icon.Blend(accessory_icon, ICON_OVERLAY)
		final_icon.Blend(accessory_icon_2, ICON_OVERLAY)
		final_icon.Blend(accessory_icon_3, ICON_OVERLAY)

	final_icon.Crop(10, 8, 22, 23)
	final_icon.Scale(26, 32)
	final_icon.Crop(-2, 1, 29, 32)

	return final_icon

/datum/species/get_features()
	var/list/features = ..()

	features += /datum/preference/choiced/breasts

	GLOB.features_by_species[type] = features

	return features


/// SSAccessories setup
/datum/controller/subsystem/accessories
	var/list/breasts_list

/datum/controller/subsystem/accessories/setup_lists()
	. = ..()
	breasts_list = init_sprite_accessory_subtypes(/datum/sprite_accessory/breasts)["default_sprites"] // FLAKY DEFINE: this should be using DEFAULT_SPRITE_LIST
	//damnit SSAccessories

/// The boobage in question
/obj/item/organ/breasts
	name = "breasts"
	desc = "Super-effective at deterring ice dragons."
	icon_state = "breasts"

	slot = ORGAN_SLOT_EXTERNAL_BREASTS
	zone = BODY_ZONE_CHEST

	preference = "feature_breasts"

	dna_block = DNA_BREASTS_BLOCK
	restyle_flags = EXTERNAL_RESTYLE_FLESH

	bodypart_overlay = /datum/bodypart_overlay/mutant/breasts

	var/baselayer_name = "Below Uniform"
	var/list/valid_layers = list("Below Uniform" = UNIFORM_LAYER, "Above Uniform" = BANDAGE_LAYER, "Above All Clothes" = HANDS_LAYER, "Above Everything" = WOUND_LAYER)

/datum/bodypart_overlay/mutant/breasts/can_draw_on_bodypart(mob/living/carbon/human/human)
	if(visibility == ORGAN_VISIBILITY_MODE_NORMAL)
		if((human.undershirt != "Nude" && !(human.underwear_visibility & UNDERWEAR_HIDE_SHIRT)) || (human.bra != "Nude" && !(human.underwear_visibility & UNDERWEAR_HIDE_BRA)))
			return FALSE
		if((human.w_uniform && human.w_uniform.body_parts_covered & CHEST) || (human.wear_suit && human.wear_suit.body_parts_covered & CHEST))
			return FALSE
		if(human.underwear != "Nude" && !(human.underwear_visibility & UNDERWEAR_HIDE_UNDIES))
			var/datum/sprite_accessory/underwear/worn_underwear = SSaccessories.underwear_list[human.underwear]
			if(worn_underwear.hides_breasts)
				return FALSE
		return TRUE
	else
		var/vis = visibility == ORGAN_VISIBILITY_MODE_ALWAYS_SHOW ? TRUE : FALSE
		return vis

/datum/bodypart_overlay/mutant/breasts
	feature_key = "breasts"
	layers = EXTERNAL_ADJACENT | EXTERNAL_ADJACENT_2 | EXTERNAL_ADJACENT_3 | EXTERNAL_BEHIND | EXTERNAL_BEHIND_2 | EXTERNAL_BEHIND_3

	var/visibility = ORGAN_VISIBILITY_MODE_NORMAL

	var/organ_slot = ORGAN_SLOT_EXTERNAL_BREASTS

	var/baselayer = UNIFORM_LAYER
	var/offset1 = 0.09
	var/offset2 = 0.08
	var/offset3 = 0.07

/datum/bodypart_overlay/mutant/breasts/get_global_feature_list()
	return SSaccessories.breasts_list

/datum/bodypart_overlay/mutant/breasts/color_image(image/overlay, draw_layer, obj/item/bodypart/limb)
	if(limb.owner == null)
		return ..()
	if(draw_layer == bitflag_to_layer(EXTERNAL_ADJACENT))
		overlay.color = limb.owner.dna.features["breasts_color_1"]
		return overlay
	else if(draw_layer == bitflag_to_layer(EXTERNAL_BEHIND))
		overlay.color = limb.owner.dna.features["breasts_color_1"]
		return overlay
	else if(draw_layer == bitflag_to_layer(EXTERNAL_ADJACENT_2))
		overlay.color = limb.owner.dna.features["breasts_color_2"]
		return overlay
	else if(draw_layer == bitflag_to_layer(EXTERNAL_BEHIND_2))
		overlay.color = limb.owner.dna.features["breasts_color_2"]
		return overlay
	else if(draw_layer == bitflag_to_layer(EXTERNAL_ADJACENT_3))
		overlay.color = limb.owner.dna.features["breasts_color_3"]
		return overlay
	else if(draw_layer == bitflag_to_layer(EXTERNAL_BEHIND_3))
		overlay.color = limb.owner.dna.features["breasts_color_3"]
		return overlay
	return ..()

/datum/bodypart_overlay/mutant/breasts/mutant_bodyparts_layertext(layer)
	if(layer == -(baselayer + offset1))
		return "ADJ"
	if(layer == -(baselayer + offset2))
		return "ADJ_2"
	if(layer == -(baselayer + offset3))
		return "ADJ_3"
	return ..()

/datum/bodypart_overlay/mutant/breasts/bitflag_to_layer(layer)
	switch(layer)
		if(EXTERNAL_ADJACENT)
			return -(baselayer + offset1)
		if(EXTERNAL_ADJACENT_2)
			return -(baselayer + offset2)
		if(EXTERNAL_ADJACENT_3)
			return -(baselayer + offset3)
	return ..()
