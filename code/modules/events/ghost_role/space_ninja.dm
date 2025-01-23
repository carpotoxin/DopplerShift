/datum/round_event_control/space_ninja
	name = "Spawn Space Ninja"
	typepath = /datum/round_event/ghost_role/space_ninja
	max_occurrences = 1
	weight = 10
	earliest_start = 20 MINUTES
	min_players = 35
	dynamic_should_hijack = TRUE
	category = EVENT_CATEGORY_INVASION
	description = "A space ninja infiltrates the station."

/datum/round_event/ghost_role/space_ninja
	minimum_required = 1
	role_name = "Space Ninja"

/datum/round_event/ghost_role/space_ninja/spawn_role()
	var/spawn_location = find_space_spawn()
	if(isnull(spawn_location))
		return MAP_ERROR

	//selecting a candidate player
	var/mob/chosen_one = SSpolling.poll_ghost_candidates(check_jobban = ROLE_NINJA, role = ROLE_NINJA, alert_pic = /obj/item/energy_katana, jump_target = spawn_location, role_name_text = "space ninja", amount_to_pick = 1)
	if(isnull(chosen_one))
		return NOT_ENOUGH_PLAYERS
	//spawn the ninja and assign the candidate
	// DOPPLER ADDITION START - Preference Ninjas
	var/loadme = tgui_alert(chosen_one, "Do you wish to load your character slot?", "Load Character?", list("Yes!", "No, I want to be random!"), timeout = 60 SECONDS)
	// DOPPLER ADDITION END
	var/mob/living/carbon/human/ninja = create_space_ninja(spawn_location)
	ninja.key = chosen_one.key
	ninja.mind.add_antag_datum(/datum/antagonist/ninja)
	spawned_mobs += ninja
	// DOPPLER ADDITION START - Preference Ninjas
	if(loadme == "Yes!")
		ninja.client?.prefs?.safe_transfer_prefs_to(ninja)
		ninja.dna.update_dna_identity()

		SSquirks.AssignQuirks(ninja, ninja.client)
	// DOPPLER ADDITION END
	message_admins("[ADMIN_LOOKUPFLW(ninja)] has been made into a space ninja by an event.")
	ninja.log_message("was spawned as a ninja by an event.", LOG_GAME)

	return SUCCESSFUL_SPAWN


//=======//NINJA CREATION PROCS//=======//

/proc/create_space_ninja(spawn_loc)
	var/mob/living/carbon/human/new_ninja = new(spawn_loc)
	new_ninja.randomize_human_appearance(~(RANDOMIZE_NAME|RANDOMIZE_SPECIES))
	var/new_name = "[pick(GLOB.ninja_titles)] [pick(GLOB.ninja_names)]"
	new_ninja.name = new_name
	new_ninja.real_name = new_name
	new_ninja.dna.update_dna_identity()
	return new_ninja
