/obj/item/organ/cyberimp/eyes/emp_act(severity)
	if(prob(30/severity)) //They same effect as having cybernetic eyes
		to_chat(owner, span_warning("Static obfuscates your vision!"))
		owner.flash_act(visual = 1)

/obj/item/organ/cyberimp/eyes/hud
	name = "cybernetic hud"
	desc = "artificial photoreceptors with specialized functionality"
	icon_state = "eye_implant"
	implant_overlay = "eye_implant_overlay"
	slot = ORGAN_SLOT_EYES
	zone = BODY_ZONE_PRECISE_EYES
	w_class = WEIGHT_CLASS_TINY

// HUD implants
/obj/item/organ/cyberimp/eyes/hud
	name = "HUD implant"
	desc = "These cybernetic eyes will display a HUD over everything you see. Maybe."
	slot = ORGAN_SLOT_HUD
	var/HUD_type
	var/HUD_trait

/obj/item/organ/cyberimp/eyes/hud/Insert(mob/living/carbon/eye_owner, special = FALSE, drop_if_replaced = FALSE, pref_load = FALSE)
	. = ..()
	if(!.)
		return
	if(HUD_type)
		var/datum/atom_hud/H = GLOB.huds[HUD_type]
		H.add_hud_to(eye_owner)
	if(HUD_trait)
		ADD_TRAIT(eye_owner, HUD_trait, ORGAN_TRAIT)
	return ..()

/obj/item/organ/cyberimp/eyes/hud/Remove(mob/living/carbon/eye_owner, special = FALSE, pref_load = FALSE)
	. = ..()
	if(HUD_type)
		var/datum/atom_hud/H = GLOB.huds[HUD_type]
		H.remove_hud_from(eye_owner)
	if(HUD_trait)
		REMOVE_TRAIT(eye_owner, HUD_trait, ORGAN_TRAIT)

/obj/item/organ/cyberimp/eyes/hud/medical
	name = "Medical HUD implant"
	desc = "These cybernetic eye implants will display a medical HUD over everything you see."
	HUD_type = DATA_HUD_MEDICAL_ADVANCED
	HUD_trait = TRAIT_MEDICAL_HUD

/obj/item/organ/cyberimp/eyes/hud/security
	name = "Security HUD implant"
	desc = "These cybernetic eye implants will display a security HUD over everything you see."
	HUD_type = DATA_HUD_SECURITY_ADVANCED
	HUD_trait = TRAIT_SECURITY_HUD

/obj/item/organ/cyberimp/eyes/hud/diagnostic
	name = "Diagnostic HUD implant"
	desc = "These cybernetic eye implants will display a diagnostic HUD over everything you see."
	HUD_type = DATA_HUD_DIAGNOSTIC_ADVANCED

/obj/item/organ/cyberimp/eyes/hud/security/syndicate
	name = "Contraband Security HUD Implant"
	desc = "A Cybersun Industries brand Security HUD Implant. These illicit cybernetic eye implants will display a security HUD over everything you see."
	syndicate_implant = TRUE
