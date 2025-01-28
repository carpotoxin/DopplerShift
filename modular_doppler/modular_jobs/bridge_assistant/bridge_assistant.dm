/datum/job/bridge_assistant
	title = JOB_BRIDGE_ASSISTANT
	description = "Watch over the Bridge, command its consoles, and spend your days brewing coffee for higher-ups."
	auto_deadmin_role_flags = DEADMIN_POSITION_HEAD //not really a head but close enough
	department_head = list(JOB_CAPTAIN)
	faction = FACTION_STATION
	total_positions = 1
	spawn_positions = 1
	supervisors = "the Captain, and in non-Bridge related situations the other heads"
	minimal_player_age = 7
	exp_requirements = 300
	exp_required_type = EXP_TYPE_CREW
	exp_granted_type = EXP_TYPE_CREW
	config_tag = "BRIDGE_ASSISTANT"

	outfit = /datum/outfit/job/bridge_assistant
	plasmaman_outfit = /datum/outfit/plasmaman/bridge_assistant

	paycheck = PAYCHECK_CREW
	paycheck_department = ACCOUNT_CIV

	liver_traits = list(TRAIT_PRETENDER_ROYAL_METABOLISM)

	display_order = JOB_DISPLAY_ORDER_BRIDGE_ASSISTANT
	departments_list = list(
		/datum/job_department/command,
		/datum/job_department/service,
	)

	family_heirlooms = list(/obj/item/soap/nanotrasen, /obj/item/pen/fountain)

	mail_goodies = list(
		 = 1,
	)
	rpg_title = "Royal Page"

/datum/job/bridge_assistant/after_spawn(mob/living/spawned, client/player_client)
	. = ..()
	var/mob/living/carbon/bridgie = spawned
	if(istype(bridgie))
		bridgie.gain_trauma(/datum/brain_trauma/special/axedoration)

/datum/outfit/job/bridge_assistant
	name = "Bridge Assistant"
	jobtype = /datum/job/bridge_assistant

	id = /obj/item/card/id/advanced/silver
	id_trim = /datum/id_trim/job/bridge_assistant
	backpack_contents = list(
		/obj/item/storage/toolbox/mechanical = 1,
		/obj/item/choice_beacon/coffee = 1,
	)

	uniform = /obj/item/clothing/under/misc/doppler_uniform/service
	belt = /obj/item/storage/bag/tray
	ears = /obj/item/radio/headset/headset_srv
	shoes = /obj/item/clothing/shoes/laceup
	head = /obj/item/clothing/head/beret/doppler_command
	belt = /obj/item/modular_computer/pda/bridge_assistant

/datum/id_trim/job/bridge_assistant
	department_color = COLOR_SERVICE_LIME
	subdepartment_color = COLOR_COMMAND_BLUE
