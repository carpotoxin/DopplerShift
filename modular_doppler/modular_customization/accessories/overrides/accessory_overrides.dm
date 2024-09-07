/datum/species/get_features()
	var/list/features = ..()

	features += /datum/preference/choiced/snout
	features += /datum/preference/choiced/frills
	features += /datum/preference/choiced/horns
	features += /datum/preference/choiced/tail
	features += /datum/preference/choiced/body_markings

	GLOB.features_by_species[type] = features

	return features

/datum/bodypart_overlay/mutant
	/// Annoying annoying annoyed annoyance - this is to avoid a massive headache trying to work around tails
	var/feature_key_sprite = null
