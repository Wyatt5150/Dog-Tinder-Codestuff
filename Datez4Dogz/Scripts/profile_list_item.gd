extends Button

func load_profile(profile:UserProfile):
	$Container/ProfileIcon.set_profile(profile)
	$Container/Name.text = profile.name
