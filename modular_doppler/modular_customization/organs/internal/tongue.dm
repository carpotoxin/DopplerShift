/// Cat tongue
//
/obj/item/organ/internal/tongue/cat
	say_mod = "meows-"

/// Dog tongue
//
/obj/item/organ/internal/tongue/dog
	name = "canine tongue"
	desc = "A fleshy muscle mostly used for barking."
	say_mod = "barks"

/// Lizard tongue
//
/obj/item/organ/internal/tongue/lizard

/// Bunny tongue
/obj/item/organ/internal/tongue/bunny
	name = "leporid tongue"
	desc = "A fleshy muscle mostly used for... hopping?"
	say_mod = "hops"

/// Bird tongue
//
/obj/item/organ/internal/tongue/bird
	name = "avian tongue"
	desc = "A fleshy muscle mostly used for chirping."
	say_mod = "chirps"

/obj/item/organ/internal/tongue/bird/Insert(mob/living/carbon/signer, special = FALSE, movement_flags = DELETE_IF_REPLACED)
	. = ..()
	signer.verb_ask = "peeps"
	signer.verb_exclaim = "squawks"
	signer.verb_whisper = "murmurs"
	signer.verb_yell = "shrieks"

/obj/item/organ/internal/tongue/bird/Remove(mob/living/carbon/speaker, special = FALSE)
	. = ..()
	speaker.verb_ask = initial(verb_ask)
	speaker.verb_exclaim = initial(verb_exclaim)
	speaker.verb_whisper = initial(verb_whisper)
	speaker.verb_yell = initial(verb_yell)

/// Mouse tongue
//
/obj/item/organ/internal/tongue/mouse
	name = "muridae tongue"
	desc = "A fleshy muscle mostly used for squeaking."
	say_mod = "squeaks"

/// Fish tongue
//
/obj/item/organ/internal/tongue/fish
	name = "piscine tongue"
	desc = "A fleshy muscle mostly used for gnashing."
	say_mod = "gnashes"
