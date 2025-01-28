/datum/job/command_bodyguard
	title = JOB_COMMAND_BODYGUARD
	description = "Protect heads of staff, look great while doing so."
	auto_deadmin_role_flags = DEADMIN_POSITION_SECURITY
	department_head = list(JOB_HEAD_OF_SECURITY)
	faction = FACTION_STATION
	total_positions = 1
	spawn_positions = 1
	supervisors = "The head of security"
	config_tag = "COMMAND_BODYGUARD"

	paycheck = PAYCHECK_CREW
	paycheck_department = ACCOUNT_SEC

	outfit = /datum/outfit/job/command_bodyguard
	plasmaman_outfit = /datum/outfit/plasmaman/security
	display_order = JOB_DISPLAY_ORDER_COMMAND_BODYGUARD
	bounty_types = CIV_JOB_SEC

	department_for_prefs = /datum/job_department/security

	departments_list = list(
		/datum/job_department/command,
		/datum/job_department/security,
	)
	liver_traits = list(TRAIT_PRETENDER_ROYAL_METABOLISM)

	family_heirlooms = list(/obj/item/bedsheet/captain)

	mail_goodies = list(
		/obj/item/storage/fancy/cigarettes/cigars/havana = 10,
		/obj/item/stack/spacecash/c500 = 3,
		/obj/item/disk/nuclear/fake/obvious = 2,
		/obj/item/clothing/head/collectable/captain = 4,
	)

	job_flags = STATION_JOB_FLAGS | JOB_CANNOT_OPEN_SLOTS

/datum/outfit/job/command_bodyguard
	name = "Command Bodyguard"
	jobtype = /datum/job/command_bodyguard
	uniform = /obj/item/clothing/under/suit/black_really
	neck = /obj/item/clothing/neck/tie/red/tied
	shoes = /obj/item/clothing/shoes/laceup
	ears = /obj/item/radio/headset/headset_sec/alt
	implants = list(/obj/item/implant/mindshield)
	backpack_contents = list(
		/obj/item/sensor_device/command_bodyguard = 1,
		/obj/item/clipboard = 1,
	)
	backpack = /obj/item/storage/backpack/security
	satchel = /obj/item/storage/backpack/satchel/sec
	duffelbag = /obj/item/storage/backpack/duffelbag/sec
	messenger = /obj/item/storage/backpack/messenger/sec

	box = /obj/item/storage/box/survival/security
	belt = /obj/item/storage/belt/secsword/full
	l_pocket = /obj/item/clothing/glasses/sunglasses
	r_pocket = /obj/item/modular_computer/pda/security

	id = /obj/item/card/id/advanced/black
	id_trim = /datum/id_trim/job/command_bodyguard

/datum/id_trim/job/command_bodyguard
	assignment = "Command Bodyguard"
	trim_icon = 'modular_doppler/modular_jobs/command_bodyguard/icons/card.dmi'
	trim_state = "trim_bodyguard"
	department_color = COLOR_COMMAND_BLUE
	subdepartment_color = COLOR_SECURITY_RED // Not the other way around. I think.
	sechud_icon_state = SECHUD_BODYGUARD
	extra_access = list(
		ACCESS_BRIG,
	)
	minimal_access = list(
		ACCESS_BRIG_ENTRANCE,
		ACCESS_COMMAND,
		ACCESS_CONSTRUCTION,
		ACCESS_ENGINEERING,
		ACCESS_EVA,
		ACCESS_MAINT_TUNNELS,
		ACCESS_MEDICAL,
		ACCESS_SCIENCE,
		ACCESS_TELEPORTER,
		ACCESS_WEAPONS,
		ACCESS_SECURITY,
		ACCESS_CARGO,
		ACCESS_CAPTAIN,
	)
	template_access = list(
		ACCESS_CAPTAIN,
		ACCESS_CHANGE_IDS,
	)
	job = /datum/job/command_bodyguard
