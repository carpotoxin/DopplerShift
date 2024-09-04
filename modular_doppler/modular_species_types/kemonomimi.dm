//// Kemonomimi - Overwrites and continuiations of
// code/modules/mob/living/carbon/human/species_types/felinid.dm
/datum/species/human/kemonomimi
	name = "Kemonomimi"
	id = SPECIES_KEMONOMIMI
	examine_limb_id = SPECIES_HUMAN
	mutant_organs = list(
		/obj/item/organ/external/tail = "Tail",
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


/proc/find_animal_trait(mob/living/carbon/human/target, pref_load)
	/// Trait which is given to the target, canine by default
	var/animal_trait = TRAIT_CANINE
	// Target became a kemonomimi without a pref, nya!!
	if(!pref_load)
		animal_trait = pick(GLOB.animalistic_traits)
		return animal_trait
	// Lets find the chosen trait, exciting!
	for(var/trait as anything in GLOB.animalistic_traits)
		if(HAS_TRAIT_FROM(target, trait, TRAIT_ANIMALISTIC))
			animal_trait = trait
			break
	return animal_trait

/proc/apply_animal_trait(mob/living/carbon/human/target, animal_trait)
	if(!ishuman(target) || !animal_trait)
		return

	/// Var for the target's species
	var/datum/species/species = target.dna.species
	/// Find and set our new informed tongue!
	var/obj/item/organ/tongue = text2path("/obj/item/organ/internal/tongue/[animal_trait]")
	species.mutanttongue = tongue.type
	/// Find and set our new informed tail!
	var/obj/item/organ/tail = text2path("/obj/item/organ/external/tail/[animal_trait]")
	LAZYREMOVE(species.mutant_organs, /obj/item/organ/external/tail)
	LAZYADDASSOC(species.mutant_organs, tail.type, capitalize(animal_trait))

	// Update the body accordingly
	target.update_body()


/datum/species/human/kemonomimi/prepare_human_for_preview(mob/living/carbon/human/human_for_preview)
	// remember to make a puppygirl
	human_for_preview.set_haircolor("#3a2d22", update = FALSE)
	human_for_preview.set_hairstyle("Short twintails", update = TRUE)
	human_for_preview.update_body()
