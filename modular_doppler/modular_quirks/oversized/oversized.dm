#define OVERSIZED_SPEED_SLOWDOWN 0.5
#define OVERSIZED_HUNGER_MOD 1.5
#define OVERSIZED_HARM_DAMAGE_BONUS 5
#define OVERSIZED_KICK_EFFECTIVENESS_BONUS 5

/datum/quirk/oversized
	name = "Oversized"
	desc = "You have a far larger than average body, with all the benefits and consequences that result."
	gain_text = span_notice("That airlock looks small...")
	lose_text = span_notice("Was the ceiling always that high?")
	medical_record_text = "Patient is abnormally tall."
	value = 0
	mob_trait = TRAIT_OVERSIZED
	icon = FA_ICON_EXPAND_ARROWS_ALT
	quirk_flags = QUIRK_HUMAN_ONLY|QUIRK_CHANGES_APPEARANCE
	/// Saves refs to the original (normal size) organs, which are on ice in nullspace in case this quirk gets removed somehow.
	var/list/obj/item/organ/old_organs

/datum/quirk/oversized/add(client/client_source)
	var/mob/living/carbon/human/human_holder = quirk_holder
	human_holder.mob_size = MOB_SIZE_LARGE

	RegisterSignal(human_holder, COMSIG_CARBON_POST_ATTACH_LIMB, PROC_REF(on_gain_limb))

	for(var/obj/item/bodypart/bodypart as anything in human_holder.bodyparts)
		on_gain_limb(src, bodypart, special = FALSE)

	human_holder.physiology.hunger_mod *= OVERSIZED_HUNGER_MOD //50% hungrier
	human_holder.add_movespeed_modifier(/datum/movespeed_modifier/oversized)

	var/translate = 16
	human_holder.transform = human_holder.transform.Scale(2)
	var/translate_x = translate * ( human_holder.transform.b / 2)
	var/translate_y = translate * ( human_holder.transform.e / 2)
	human_holder.transform = human_holder.transform.Translate(translate_x, translate_y)
	human_holder.maptext_height = 64

	human_holder.AddComponent(/datum/component/seethrough_mob)

/datum/quirk/oversized/remove()
	var/mob/living/carbon/human/human_holder = quirk_holder
	human_holder.mob_size = MOB_SIZE_HUMAN

	var/translate = -16
	human_holder.transform = human_holder.transform.Scale(0.5)
	var/translate_x = translate * ( human_holder.transform.b / 2)
	var/translate_y = translate * ( human_holder.transform.e / 2)
	human_holder.transform = human_holder.transform.Translate(translate_x, translate_y)
	human_holder.maptext_height = 32

	var/obj/item/bodypart/arm/left/left_arm = human_holder.get_bodypart(BODY_ZONE_L_ARM)
	if(left_arm)
		left_arm.unarmed_damage_high = initial(left_arm.unarmed_damage_high)

	var/obj/item/bodypart/arm/right/right_arm = human_holder.get_bodypart(BODY_ZONE_R_ARM)
	if(right_arm)
		right_arm.unarmed_damage_high = initial(right_arm.unarmed_damage_high)

	var/obj/item/bodypart/leg/left_leg = human_holder.get_bodypart(BODY_ZONE_L_LEG)
	if (left_leg)
		left_leg.unarmed_effectiveness = initial(left_leg.unarmed_effectiveness)

	var/obj/item/bodypart/leg/right_leg = human_holder.get_bodypart(BODY_ZONE_R_LEG)
	if (right_leg)
		right_leg.unarmed_effectiveness = initial(right_leg.unarmed_effectiveness)

	for(var/obj/item/bodypart/bodypart as anything in human_holder.bodyparts)
		bodypart.name = replacetext(bodypart.name, "oversized ", "")

	UnregisterSignal(human_holder, COMSIG_CARBON_POST_ATTACH_LIMB)

	human_holder.physiology.hunger_mod /= OVERSIZED_HUNGER_MOD
	human_holder.remove_movespeed_modifier(/datum/movespeed_modifier/oversized)

	for(var/obj/item/organ/organ_to_restore in old_organs)
		old_organs -= organ_to_restore

		if(QDELETED(organ_to_restore))
			continue

		var/obj/item/organ/brain/possibly_a_brain = organ_to_restore
		if(istype(possibly_a_brain))
			var/obj/item/organ/brain/current_brain = human_holder.get_organ_slot(ORGAN_SLOT_BRAIN)
			possibly_a_brain.brainmob = current_brain.brainmob

		organ_to_restore.replace_into(quirk_holder)

	var/datum/component/seethrough_mob/component = human_holder.GetComponent(/datum/component/seethrough_mob)
	qdel(component)

/datum/quirk/oversized/proc/on_gain_limb(datum/source, obj/item/bodypart/gained, special)
	SIGNAL_HANDLER

	if(findtext(gained.name, "oversized"))
		return

	if(istype(gained, /obj/item/bodypart/arm))
		var/obj/item/bodypart/arm/new_arm = gained
		new_arm.unarmed_damage_high = initial(new_arm.unarmed_damage_high) + OVERSIZED_HARM_DAMAGE_BONUS

	else if(istype(gained, /obj/item/bodypart/leg))
		var/obj/item/bodypart/leg/new_leg = gained
		new_leg.unarmed_effectiveness = initial(new_leg.unarmed_effectiveness) + OVERSIZED_KICK_EFFECTIVENESS_BONUS

	gained.name = "oversized " + gained.name

/datum/movespeed_modifier/oversized
	multiplicative_slowdown = OVERSIZED_SPEED_SLOWDOWN

#undef OVERSIZED_HUNGER_MOD
#undef OVERSIZED_SPEED_SLOWDOWN
#undef OVERSIZED_HARM_DAMAGE_BONUS
#undef OVERSIZED_KICK_EFFECTIVENESS_BONUS
