GLOBAL_DATUM_INIT(mob_panel, /datum/mob_panel, new)



/datum/mob_panel
	var/name
	var/things


/datum/mob_panel/ui_interact(mob/user, datum/tgui/ui)
	ui = SStgui.try_update_ui(user, src, ui)
	if(!ui)
		ui = new(user, src, "MobCreator")
		ui.open()

/datum/mob_panel/ui_state(mob/user)
	return GLOB.admin_holder_state
