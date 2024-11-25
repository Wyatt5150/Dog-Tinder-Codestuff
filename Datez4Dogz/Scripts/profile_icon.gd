extends TextureRect

func set_profile(profile:Profile):
	var sprite:Node2D = $Image
	var image:Texture2D = profile.pictures[0]
	var imageSize:Vector2 = image.get_size()
	var smaller = min(imageSize.x, imageSize.y)
	var resize = 100.0/smaller
	
	sprite.texture = image
	sprite.scale = Vector2(resize,resize)
