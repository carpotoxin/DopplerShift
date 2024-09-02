//// Kemonomimi - Overwrites and continuiations of
// code/modules/mob/living/carbon/human/species_types/felinid.dm
/datum/species/human/kemonomimi
	name = "Kemonomimi"
	id = SPECIES_KEMONOMIMI
	examine_limb_id = SPECIES_HUMAN
	inherent_traits = list(
		TRAIT_USES_SKINTONES,
		KEMONOMIMI_TRAIT,
	)
	mutant_organs = list(
	//	/obj/item/organ/external/tail/kemonomimi = "Cat",
	//	/obj/item/organ/internal/ears/kemonomimi = "Cat",
	//	/obj/item/organ/external/horns/kemonomimi = "None",
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

/datum/species/human/kemonomimi/on_species_loss(mob/living/carbon/target, datum/species/new_species, pref_load)
	REMOVE_TRAITS_IN(target, KEMONOMIMI_TRAIT)
	return ..()

/datum/species/human/kemonomimi/check_roundstart_eligible()
	return TRUE
