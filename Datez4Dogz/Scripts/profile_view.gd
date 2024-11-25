extends Control
@export var profileButton:PackedScene
var profile: Profile

var images:Array
var imageIndex:int

var buttons
var currentSeleted

@onready var userImage : TextureRect = %UserImage

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$About/TouchScroll.maxScroll = 584
	$About/TouchScroll.minScroll = 0
	
	# set up image display stuff
	var next = %Next
	var prev = %Prev
	var backdrop = $UserImageDisplay
	
	# set up image 
	backdrop.position.x = get_viewport().get_visible_rect().size.x/2 - backdrop.size.x/2
	userImage.size = backdrop.size

	# set buttons to change image
	prev.position.x = 0
	prev.position.y = backdrop.size.y/2-prev.size.y/2
	
	next.size = prev.size
	next.position.y = prev.position.y
	next.position.x = backdrop.size.x-prev.size.x
	
	buttons = [prev,next]
	for but in buttons:
		but.disabled = true
	
	$About.size.x = get_viewport().get_visible_rect().size.x
	$About.position.x = 0

func load_user(p:UserProfile):
	# call upon starting this scene or to change user
	load_profile_buttons(p)

func load_profile(p:Profile, selected):
	profile = p
	load_info()
	
	if currentSeleted != null:
		currentSeleted.deselect()
	currentSeleted = selected
	selected.select()

func load_info():
	# load image display stuff
	images = profile.pictures
	for but in buttons:
		but.disabled = profile.pictures.size() <= 1
	set_profile_image(0)
	
	# load information
	var about = $About
	var container = $About/Container
	
	var username = container.get_node("Name")
	username.text = profile.name
	
	var info = container.get_node("Info")
	info.text = str(profile.age) + " - "
	if profile is UserProfile:
		info.text += profile.pronouns
	else:
		info.text += profile.gender_string()
	
	var bio = container.get_node("Bio")
	bio.text = profile.bio
	
	var misc = container.get_node("Misc")
	misc.text = ""
	if profile is DogProfile:
		if profile.vaccinated:
			misc.text += "Vaccinated"
		else:
			misc.text += "Not Vaccinated"
		
		misc.text += "\n"
		
		if !profile.neutered:
			misc.text += "Not "
		
		if profile.gender == Profile.GENDER.FEMALE:
			misc.text += "Spayed"
		else:
			misc.text += "Neutered"
	
	# set container stuff
	var viewportHeight = get_viewport().get_visible_rect().size.y
	about.size.y = max($About/Container.size.y, viewportHeight-125)
	$About/TouchScroll.minScroll = -(about.size.y - viewportHeight)
	$About.position.y = $About/TouchScroll.maxScroll

# Profile Image Display things
func set_profile_image(index):
	index += profile.pictures.size()
	index = index%profile.pictures.size()
	imageIndex = index
	userImage.texture = images[index]

func change_image(incr: int) -> void:
	set_profile_image(imageIndex+incr)
	pass

func load_profile_buttons(p:UserProfile):
	var once = true
	for child in $ProfileSelect/ScrollContainer/HBoxContainer.get_children():
		if once:
			once = false
			continue
		child.queue_free()
	
	# button for user
	load_profile(p, make_profile_button(p))
	
	# button for each dog
	for dog in p.dogs:
		make_profile_button(dog)

func make_profile_button(p:Profile):
	var but:Button = profileButton.instantiate()
	but.set_profile(p)
	but.custom_minimum_size = Vector2(110,110)
	but.position.y = 5
	$ProfileSelect/ScrollContainer/HBoxContainer.add_child(but)
	but.clicked.connect(load_profile.bind(but))
	return but

func get_label_height(label):
	return label.get_line_count()*(label.get_line_height()+label.get_theme_constant("line_spacing"))
