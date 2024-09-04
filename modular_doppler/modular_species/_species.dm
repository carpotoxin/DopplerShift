/// Animal trait logic goes here!
//	Used for the kemonomimi and anthro species

/// This proc is used to find or build a user's preferred animal trait
/datum/species/proc/find_animal_trait(mob/living/carbon/human/target, pref_load)
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

/// This proc applies the chosen trait, updating the species data according to the desired organ's data
/datum/species/proc/apply_animal_trait(mob/living/carbon/human/target, animal_trait)
	if(!ishuman(target) || !animal_trait)
		return

	/// Find and set our new informed tongue!
	var/obj/item/organ/tongue = text2path("/obj/item/organ/internal/tongue/[animal_trait]")
	mutanttongue = tongue.type
	/// Find and set our new informed tail!
	var/obj/item/organ/tail = text2path("/obj/item/organ/external/tail/[animal_trait]")
	LAZYREMOVE(mutant_organs, typecacheof(/obj/item/organ/external/tail)) // Remove the previous tail, you served us well!
	LAZYADDASSOC(mutant_organs, tail.type, capitalize(animal_trait))

	// Update the body accordingly
	target.update_body()
