extends TextureRect

func set_profile(profile:Profile):
	var img = $Image
	img.texture = profile.pictures[0]
