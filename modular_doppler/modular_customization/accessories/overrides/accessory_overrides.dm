/datum/species/get_features()
	var/list/features = ..()

	features += /datum/preference/choiced/snout::savefile_key
	features += /datum/preference/choiced/frills::savefile_key
	features += /datum/preference/choiced/horns::savefile_key
	features += /datum/preference/choiced/tail::savefile_key

	GLOB.features_by_species[type] = features

	return features

/datum/bodypart_overlay/mutant
	/// Annoying annoying annoyed annoyance - this is to avoid a massive headache trying to work around tails
	var/feature_key_sprite = null
