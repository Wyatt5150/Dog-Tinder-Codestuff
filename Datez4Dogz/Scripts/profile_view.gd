extends Node2D
var profile: UserProfile

var images:Array
var imageIndex:int

var buttons

var fireOnce

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	fireOnce = true
	
	imageIndex = 0
	
	# set up image display stuff
	var next = $UserImageDisplay/Next
	var prev = $UserImageDisplay/Prev
	var backdrop = $UserImageDisplay
	
	# set up image area
	backdrop.position.x = get_viewport().size.x/2 - backdrop.size.x/2
	backdrop.get_node("UserImage").size = backdrop.size
	
	# set buttons to change image
	prev.position.x = 0
	prev.position.y = backdrop.size.y/2-prev.size.y/2
	
	next.size = prev.size
	next.position.y = prev.position.y
	next.position.x = backdrop.size.x-prev.size.x
	
	buttons = [prev,next]
	for but in buttons:
		but.disabled = true
	
	load_profile(Globals.undecided[0])
	pass # Replace with function body.
	

func load_profile(userProfile:UserProfile):
	profile = userProfile
	load_info()
	
func load_info(isUserProfile:bool = true):
	# load image display stuff
	images = profile.pictures
	for but in buttons:
		but.disabled = false
	set_profile_image(0)
	
	# load information
	var info = $About/VBoxContainer
	info.get_node("Name").text = profile.username
	info.get_node("About").text = profile.about

# Profile Image Display things
func set_profile_image(index):
	index += profile.pictures.size()
	index = index%profile.pictures.size()
	imageIndex = index
	$UserImageDisplay/UserImage.texture = images[imageIndex]

func change_image(incr: int) -> void:
	set_profile_image(imageIndex+incr)
	pass # Replace with function body.
