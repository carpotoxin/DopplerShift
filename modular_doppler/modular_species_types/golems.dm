//// Doppler Golems - Overwrites and continuiations of
// code/modules/mob/living/carbon/human/species_types/golems.dm
/datum/species/golem

/datum/species/golem/get_species_lore()
	return list(
		"@Lobster",
	)

/datum/species/golem/check_roundstart_eligible()
	return TRUE
