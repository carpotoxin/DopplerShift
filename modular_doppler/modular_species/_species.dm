///
//
/datum/species/regenerate_organs(mob/living/carbon/target, datum/species/old_species, replace_current = TRUE, list/excluded_zones, visual_only = FALSE)
	. = ..()
	if(target == null)
		return
	if(target.dna.features["tail_lizard"])
		if(target.dna.features["tail_lizard"] != /datum/sprite_accessory/tails/none::name && target.dna.features["tail_lizard"] != /datum/sprite_accessory/blank::name)
			var/obj/item/organ/replacement = SSwardrobe.provide_type(/obj/item/organ/external/tail/lizard)
			replacement.Insert(target, special = TRUE, movement_flags = DELETE_IF_REPLACED)
			return .
	if(target.dna.features["tail_cat"])
		if(target.dna.features["tail_cat"] != /datum/sprite_accessory/tails/none::name && target.dna.features["tail_lizard"] != /datum/sprite_accessory/blank::name)
			var/obj/item/organ/replacement = SSwardrobe.provide_type(text2path("/obj/item/organ/external/tail/[find_animal_trait(target)]"))
			replacement.Insert(target, special = TRUE, movement_flags = DELETE_IF_REPLACED)
			return .
	var/obj/item/organ/external/tail/old_part = target.get_organ_slot(ORGAN_SLOT_EXTERNAL_TAIL)
	if(istype(old_part))
		old_part.Remove(target, special = TRUE, movement_flags = DELETE_IF_REPLACED)
		old_part.moveToNullspace()

/// Animal trait logic goes here!
//	Used for the kemonomimi and anthro species

/// Find or build a user's preferred animal trait
/datum/species/proc/find_animal_trait(mob/living/carbon/human/target)
	/// Trait which is given to the target, canine by default
	var/animal_trait = TRAIT_CANINE
	// Lets find the chosen trait, exciting!
	for(var/trait as anything in GLOB.animalistic_traits)
		if(HAS_TRAIT_FROM(target, trait, TRAIT_ANIMALISTIC))
			animal_trait = trait
			break
	return animal_trait

/// Apply the chosen trait, updating the species data according to the desired organ's data
//	The proc runs before the mutant organs are read and loaded onto the target
/datum/species/proc/apply_animal_trait(mob/living/carbon/human/target, animal_trait)
	if(!ishuman(target) || !animal_trait)
		return

	/// Find and set our new informed tongue!
	var/obj/item/organ/tongue = text2path("/obj/item/organ/internal/tongue/[animal_trait]")
	if(tongue) // text2path nulls if it can't find a matching subtype, so don't worry adding an organ for every single trait value
		mutanttongue = tongue.type
	/// Find and set our new informed ears!
	var/obj/item/organ/ears = text2path("/obj/item/organ/internal/ears/[animal_trait]")
	if(ears)
		mutantears = ears.type
	/// Find and set our new informed tail!
	var/obj/item/organ/tail = text2path("/obj/item/organ/external/tail/[animal_trait]")
	if(tail)
		LAZYREMOVE(mutant_organs, typecacheof(/obj/item/organ/external/tail)) // Remove the previous tail, you served us well!
		LAZYADDASSOC(mutant_organs, tail.type, capitalize(animal_trait)) // This is a bit awkward due to the assoc list, luckily most organ data has their own var instead
