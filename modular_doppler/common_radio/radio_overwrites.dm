// Some maps have pre-defined their intercom names to being 'common', this changes it to Announcements, albeit sloppily.
/obj/item/radio/intercom/Initialize(mapload, ndir, building)
	. = ..()
	if(name == "Common Channel")
		name = "Announcements Channel"
