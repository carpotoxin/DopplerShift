/datum/round_event_control
	/// Do we override the votable component? (For events that just end the round)
	var/votable = TRUE
	var/chaos_level = EVENT_CHAOS_DISABLED

/datum/round_event_control/anomaly
	votable = FALSE

/datum/round_event_control/bitrunning_glitch
	votable = FALSE

/datum/round_event_control/fake_virus
	votable = FALSE

/datum/round_event_control/brain_trauma
	votable = FALSE

/datum/round_event_control/heart_attack
	votable = FALSE

/datum/round_event_control/tram_malfunction
	votable = FALSE

/**
 * EVENT CHAOS DECLARES
 */

// LOW CHAOS EVENTS
/datum/round_event_control/scrubber_overflow
	chaos_level = EVENT_CHAOS_LOW

/datum/round_event_control/stray_cargo
	chaos_level = EVENT_CHAOS_LOW

/datum/round_event_control/stray_cargo/syndicate
	chaos_level = EVENT_CHAOS_LOW

/datum/round_event_control/wisdomcow
	chaos_level = EVENT_CHAOS_LOW

/datum/round_event_control/wormholes
	chaos_level = EVENT_CHAOS_LOW

/datum/round_event_control/sentience
	chaos_level = EVENT_CHAOS_LOW

/datum/round_event_control/shuttle_catastrophe
	chaos_level = EVENT_CHAOS_LOW

/datum/round_event_control/shuttle_insurance
	chaos_level = EVENT_CHAOS_LOW

/datum/round_event_control/shuttle_loan
	chaos_level = EVENT_CHAOS_LOW

/datum/round_event_control/grey_tide
	chaos_level = EVENT_CHAOS_LOW

/datum/round_event_control/processor_overload
	chaos_level = EVENT_CHAOS_LOW

/datum/round_event_control/grid_check
	chaos_level = EVENT_CHAOS_LOW

/datum/round_event_control/ion_storm
	chaos_level = EVENT_CHAOS_LOW

/datum/round_event_control/meteor_wave/major_dust
	chaos_level = EVENT_CHAOS_LOW

/datum/round_event_control/market_crash
	chaos_level = EVENT_CHAOS_LOW

/datum/round_event_control/mass_hallucination
	chaos_level = EVENT_CHAOS_LOW

/datum/round_event_control/mice_migration
	chaos_level = EVENT_CHAOS_LOW

/datum/round_event_control/electrical_storm
	chaos_level = EVENT_CHAOS_LOW

/datum/round_event_control/bureaucratic_error
	chaos_level = EVENT_CHAOS_LOW

/datum/round_event_control/camera_failure
	chaos_level = EVENT_CHAOS_LOW

/datum/round_event_control/carp_migration
	chaos_level = EVENT_CHAOS_LOW

/datum/round_event_control/communications_blackout
	chaos_level = EVENT_CHAOS_LOW

/datum/round_event_control/obsessed
	chaos_level = EVENT_CHAOS_LOW

/datum/round_event_control/disease_outbreak
	chaos_level = EVENT_CHAOS_LOW

/datum/round_event_control/morph
	chaos_level = EVENT_CHAOS_LOW

/datum/round_event_control/spacevine
	chaos_level = EVENT_CHAOS_LOW

/datum/round_event_control/vent_clog
	chaos_level = EVENT_CHAOS_LOW

// MODERATE CHAOS PRESETS

/datum/round_event_control/radiation_storm
	chaos_level = EVENT_CHAOS_MED

/datum/round_event_control/space_ninja
	chaos_level = EVENT_CHAOS_MED

/datum/round_event_control/portal_storm_syndicate
	chaos_level = EVENT_CHAOS_MED

/datum/round_event_control/nightmare
	chaos_level = EVENT_CHAOS_MED

/datum/round_event_control/meteor_wave/meaty
	chaos_level = EVENT_CHAOS_MED

/datum/round_event_control/meteor_wave/threatening
	chaos_level = EVENT_CHAOS_MED

/datum/round_event_control/meteor_wave
	chaos_level = EVENT_CHAOS_MED

/datum/round_event_control/immovable_rod
	chaos_level = EVENT_CHAOS_MED

/datum/round_event_control/fugitives
	chaos_level = EVENT_CHAOS_MED

/datum/round_event_control/sandstorm
	chaos_level = EVENT_CHAOS_MED

/datum/round_event_control/brand_intelligence
	chaos_level = EVENT_CHAOS_MED

/datum/round_event_control/abductor
	chaos_level = EVENT_CHAOS_MED

/datum/round_event_control/revenant
	chaos_level = EVENT_CHAOS_MED

/datum/round_event_control/supermatter_surge
	chaos_level = EVENT_CHAOS_MED

///////////////////////
// HIGH CHAOS EVENTS //
///////////////////////

/datum/round_event_control/slaughter
	chaos_level = EVENT_CHAOS_HIGH

/datum/round_event_control/alien_infestation
	chaos_level = EVENT_CHAOS_HIGH

/datum/round_event_control/blob
	chaos_level = EVENT_CHAOS_HIGH

/datum/round_event_control/pirates
	chaos_level = EVENT_CHAOS_HIGH

/datum/round_event_control/space_dragon
	chaos_level = EVENT_CHAOS_HIGH

/datum/round_event_control/earthquake
	chaos_level = EVENT_CHAOS_HIGH

/datum/round_event_control/spider_infestation
	chaos_level = EVENT_CHAOS_HIGH

/datum/round_event_control/operative
	chaos_level = EVENT_CHAOS_HIGH

/datum/round_event_control/wizard
	chaos_level = EVENT_CHAOS_HIGH

// RANDOM EVENTS
/datum/round_event_control/anomaly/anomaly_flux
	chaos_level = EVENT_CHAOS_LOW

/datum/round_event_control/anomaly/anomaly_bluespace
	chaos_level = EVENT_CHAOS_LOW

/datum/round_event_control/anomaly/anomaly_grav
	chaos_level = EVENT_CHAOS_LOW

/datum/round_event_control/anomaly/anomaly_grav/high
	chaos_level = EVENT_CHAOS_LOW

/datum/round_event_control/anomaly/anomaly_pyro
	chaos_level = EVENT_CHAOS_LOW

/datum/round_event_control/anomaly/anomaly_vortex
	chaos_level = EVENT_CHAOS_LOW

// wizard area
/datum/round_event_control/wizard/robelesscasting
	votable = FALSE

/datum/round_event_control/wizard/improvedcasting
	votable = FALSE

/datum/round_event_control/wizard/blobies
	votable = FALSE

/datum/round_event_control/wizard/cursed_items
	votable = FALSE

/datum/round_event_control/wizard/deprevolt
	votable = FALSE

/datum/round_event_control/wizard/embedpocalypse
	votable = FALSE

/datum/round_event_control/wizard/fake_explosion
	votable = FALSE

/datum/round_event_control/wizard/ghost
	votable = FALSE

/datum/round_event_control/wizard/possession
	votable = FALSE

/datum/round_event_control/wizard/greentext
	votable = FALSE

/datum/round_event_control/wizard/identity_spoof
	votable = FALSE

/datum/round_event_control/wizard/imposter
	votable = FALSE

/datum/round_event_control/wizard/invincible
	votable = FALSE

/datum/round_event_control/wizard/lava
	votable = FALSE

/datum/round_event_control/wizard/madness
	votable = FALSE

/datum/round_event_control/wizard/magicarp
	votable = FALSE

/datum/round_event_control/wizard/petsplosion
	votable = FALSE

/datum/round_event_control/wizard/rpgloot
	votable = FALSE

/datum/round_event_control/wizard/rpgtitles
	votable = FALSE

/datum/round_event_control/wizard/shuffleloc
	votable = FALSE

/datum/round_event_control/wizard/shuffleminds
	votable = FALSE

/datum/round_event_control/wizard/shufflenames
	votable = FALSE

/datum/round_event_control/wizard/summonguns
	votable = FALSE

/datum/round_event_control/wizard/summonmagic
	votable = FALSE

/datum/round_event_control/wizard/tower_of_babel
	votable = FALSE
