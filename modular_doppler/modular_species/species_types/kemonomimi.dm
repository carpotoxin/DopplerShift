//// Kemonomimi - Overwrites and continuiations of
// code/modules/mob/living/carbon/human/species_types/felinid.dm
/datum/species/human/kemonomimi
	name = "Kemonomimi"
	id = SPECIES_KEMONOMIMI
	examine_limb_id = SPECIES_HUMAN
	mutant_organs = list(
		/obj/item/organ/external/tail/dog = "Dog",
	)
	inherent_traits = list(
		TRAIT_ANIMALISTIC,
		TRAIT_USES_SKINTONES,
	)
	changesource_flags = MIRROR_BADMIN | WABBAJACK | MIRROR_PRIDE | MIRROR_MAGIC | RACE_SWAP | ERT_SPAWN | SLIME_EXTRACT

/datum/species/human/kemonomimi/get_physical_attributes()
	return "N/a."

/datum/species/human/kemonomimi/get_species_description()
	return "N/a."

/datum/species/human/kemonomimi/get_species_lore()
	return list(
		"N/a.",
	)

/datum/species/human/kemonomimi/on_species_gain(mob/living/carbon/human/target, datum/species/old_species, pref_load)
	apply_animal_trait(target, find_animal_trait(target, pref_load))
	return ..()

/datum/species/human/kemonomimi/on_species_loss(mob/living/carbon/human/target, datum/species/new_species, pref_load)
	. = .. ()
	REMOVE_TRAITS_IN(target, TRAIT_ANIMALISTIC)

/datum/species/human/kemonomimi/prepare_human_for_preview(mob/living/carbon/human/human_for_preview)
	// remember to make a puppygirl
	human_for_preview.set_haircolor("#3a2d22", update = FALSE)
	human_for_preview.set_hairstyle("Short twintails", update = TRUE)
	human_for_preview.update_body()
