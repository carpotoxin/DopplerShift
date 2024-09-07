/// Cat tail
//
/obj/item/organ/external/tail/modular/cat


/// Dog tail
//	Buffs people if they're closeby while you're wagging it!
#define DOG_WAG_MOOD "dog_wag"

/obj/item/organ/external/tail/modular/dog
	var/datum/proximity_monitor/advanced/dog_wag/mood_buff
	var/timer

/obj/item/organ/external/tail/modular/dog/start_wag(mob/living/carbon/organ_owner, stop_after = INFINITY)
	. = ..()
	if(!timer)
		mood_buff = new(_host = src, range = 4)
		timer = addtimer(CALLBACK(src, PROC_REF(reset_timer), organ_owner), 1 MINUTES, TIMER_UNIQUE|TIMER_DELETE_ME)

/obj/item/organ/external/tail/modular/dog/proc/reset_timer()
	deltimer(timer)

/obj/item/organ/external/tail/modular/dog/stop_wag(mob/living/carbon/organ_owner)
	. = ..()
	if(mood_buff)
		QDEL_NULL(mood_buff)

/obj/item/organ/external/tail/modular/dog/on_mob_remove(mob/living/carbon/organ_owner, special = FALSE, movement_flags)
	. = ..()
	if(mood_buff)
		QDEL_NULL(mood_buff)

/datum/proximity_monitor/advanced/dog_wag/field_turf_crossed(atom/movable/crossed, turf/old_location, turf/new_location)
	if (!isliving(crossed) || !can_see(crossed, host, current_range))
		return
	on_enter(crossed)

/datum/proximity_monitor/advanced/dog_wag/field_turf_uncrossed(atom/movable/crossed, turf/old_location, turf/new_location)
	if (!isliving(crossed) || !can_see(crossed, host, current_range))
		return
	on_exit(crossed)

/datum/proximity_monitor/advanced/dog_wag/proc/on_enter(mob/living/viewer)
	if (!viewer.mind || !viewer.mob_mood || (viewer.stat != CONSCIOUS) || viewer.is_blind())
		return
	viewer.add_mood_event(DOG_WAG_MOOD, /datum/mood_event/dog_wag)

/datum/proximity_monitor/advanced/dog_wag/proc/on_exit(mob/living/viewer)
	if (!viewer.mind || !viewer.mob_mood || (viewer.stat != CONSCIOUS) || viewer.is_blind())
		return
	viewer.clear_mood_event(DOG_WAG_MOOD)

/datum/mood_event/dog_wag
	description = "The excitement is infectious!"
	mood_change = 0.5
	category = DOG_WAG_MOOD

#undef DOG_WAG_MOOD

/// Lizard tail
//
/obj/item/organ/external/tail/modular/lizard


/// Bunny tail
//
/obj/item/organ/external/tail/modular/bunny


/// Bird tail
//
/obj/item/organ/external/tail/modular/bird


/// Mouse tail
//
/obj/item/organ/external/tail/modular/mouse


/// Fish tail
//
/obj/item/organ/external/tail/modular/fish


/// Monkey tail
//
/obj/item/organ/external/tail/modular/monkey
