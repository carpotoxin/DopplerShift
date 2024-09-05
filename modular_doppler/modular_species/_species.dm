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
