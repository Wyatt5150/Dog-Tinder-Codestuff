extends Control
@export var profileButton:PackedScene
var profile: Profile

var images:Array
var imageIndex:int

var buttons

const verPadding:float = 10
const horPadding:float = 10

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var aboutMaxY
	$About/TouchScroll.max = 584
	$About/TouchScroll.min = 0
	
	# set up image display stuff
	var next = $UserImageDisplay/Next
	var prev = $UserImageDisplay/Prev
	var backdrop = $UserImageDisplay
	
	# set up image 
	backdrop.position.x = get_viewport().get_visible_rect().size.x/2 - backdrop.size.x/2
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
	
	$About.size.x = get_viewport().get_visible_rect().size.x - horPadding*2
	$About.position.x = verPadding
	
	load_user(Globals.undecided[0])
	pass
	
func load_user(p:UserProfile):
	# call upon starting this scene or to change user
	profile = p
	load_profile_buttons()

func load_profile(p:Profile, butPos:Vector2):
	if p == profile:
		return
	profile = p
	load_info()
	$ProfileSelect/SelectionIndicator.position = butPos
	
func load_info():
	# load image display stuff
	images = profile.pictures
	for but in buttons:
		but.disabled = false
	set_profile_image(0)
	
	# load information
	var about = $About
	var container = $About/Container
	
	var username = container.get_node("Name")
	username.text = profile.name
	
	var info = container.get_node("Info")
	if profile.profileType == "user":
		info.text = profile.pronouns
	else:
		info.text = profile.gender
	info.position.y = username.position.y + get_label_height(username) + verPadding
	
	var bio = container.get_node("Bio")
	bio.text = profile.bio
	bio.position.y = info.position.y + get_label_height(info) + verPadding
	
	# determine about container size
	var viewportHeight = get_viewport().get_visible_rect().size.y
	about.size.y = max(bio.position.y + get_label_height(bio) + verPadding*2 + 100,
		viewportHeight - verPadding*2 - $ProfileSelect/SelectionIndicator.scale.x*100)
	print(str($ProfileSelect/SelectionIndicator.scale.x*100) + " " + str(about.size.y))
	about.position.y = $About/TouchScroll.max
	$About/TouchScroll.min = -(about.size.y - viewportHeight) - verPadding
	
	# set margins
	container.size = about.size - Vector2(horPadding*2, verPadding*2)
	container.position = Vector2(horPadding, verPadding)
	
# Profile Image Display things
func set_profile_image(index):
	index += profile.pictures.size()
	index = index%profile.pictures.size()
	imageIndex = index
	$UserImageDisplay/UserImage.texture = images[index]

func change_image(incr: int) -> void:
	set_profile_image(imageIndex+incr)
	pass

func load_profile_buttons():
	var container = $ProfileSelect
	# button for user
	var but:Button = profileButton.instantiate()
	var half = but.size.x/2
	container.add_child(but)
	but.position = Vector2(5,5)
	var xPos = but.position.x
	but.set_profile(profile)
	but.clicked.connect(load_profile.bind(but.position+Vector2(half,half)))
	$ProfileSelect/SelectionIndicator.scale = Vector2((but.size.x + 10) / 100,(but.size.x + 10) / 100)
	# button for each dog
	for dog in profile.dogs:
		but = profileButton.instantiate()
		xPos += but.size.x+5
		container.add_child(but)
		but.position = Vector2(xPos,5)
		but.set_profile(dog)
		but.clicked.connect(load_profile.bind(but.position+Vector2(half,half)))
	
	load_profile(profile, but.position+Vector2(half,half))

func get_label_height(label):
	return label.get_line_count()*(label.get_line_height()+label.get_theme_constant("line_spacing"))
