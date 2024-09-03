//// Kemonomimi - Overwrites and continuiations of
// code/modules/mob/living/carbon/human/species_types/felinid.dm
/datum/species/human/kemonomimi
	name = "Kemonomimi"
	id = SPECIES_KEMONOMIMI
	examine_limb_id = SPECIES_HUMAN
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
	/// Trait which is given to the target, canine by default
	var/animal_trait = TRAIT_CANINE
	// Lets find the chosen trait, exciting!
	for(var/trait as anything in target._status_traits)
		if(TRAIT_ANIMALISTIC in target._status_traits[trait])
			animal_trait = trait
			break

	apply_animal_trait(target, animal_trait)
	return ..()

/datum/species/human/kemonomimi/on_species_loss(mob/living/carbon/human/target, datum/species/new_species, pref_load)
	. = .. ()
	REMOVE_TRAITS_IN(target, TRAIT_ANIMALISTIC)

/proc/apply_animal_trait(mob/living/carbon/human/target, animal_trait)
	if(!ishuman(target) || !animal_trait)
		return
	/// Var for the target's species
	var/datum/species/species = target.dna.species
	// Steal their tongue so we can replace it
	qdel(target.get_organ_slot(ORGAN_SLOT_TONGUE))

	switch(animal_trait) // Lots of empty space for additional content
		if(TRAIT_FELINE)
			var/obj/item/organ/internal/tongue/cat/cat_tongue = new
			cat_tongue.Insert(target, special = TRUE)

		if(TRAIT_CANINE)
			var/obj/item/organ/internal/tongue/dog/dog_tongue = new
			dog_tongue.Insert(target, special = TRUE)

		if(TRAIT_REPTILE)
			var/obj/item/organ/internal/tongue/lizard/lizard_tongue = new
			lizard_tongue.Insert(target, special = TRUE)

		if(TRAIT_AVIAN)
			var/obj/item/organ/internal/tongue/bird/bird_tongue = new
			bird_tongue.Insert(target, special = TRUE)

		if(TRAIT_MURIDAE)
			var/obj/item/organ/internal/tongue/mouse/mouse_tongue = new
			mouse_tongue.Insert(target, special = TRUE)

		if(TRAIT_PISCINE)
			var/obj/item/organ/internal/tongue/fish/fish_tongue = new
			fish_tongue.Insert(target, special = TRUE)

	var/obj/new_tongue = target.get_organ_slot(ORGAN_SLOT_TONGUE)
	species.mutanttongue = new_tongue.type
	target.update_body()


/datum/species/human/kemonomimi/prepare_human_for_preview(mob/living/carbon/human/human_for_preview)
	// remember to make a puppygirl
	human_for_preview.set_haircolor("#3a2d22", update = FALSE)
	human_for_preview.set_hairstyle("Short twintails", update = TRUE)
	human_for_preview.update_body()

/datum/species/human/kemonomimi/check_roundstart_eligible()
	return TRUE
