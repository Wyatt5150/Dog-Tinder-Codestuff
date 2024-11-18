extends Node2D
@export var profileButton:PackedScene
var profile: UserProfile

var images:Array
var imageIndex:int

var buttons

var holdingAbout:bool
var aboutContainer:Control
var prevY:float
var aboutVel:float
var aboutMaxY:float
var aboutMinY:float

const aboutAcc:float = 2500
const verPadding:float = 10
const horPadding:float = 10

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	holdingAbout = false
	aboutContainer = $About
	aboutVel = 0
	aboutMaxY = 584
	aboutMinY = 0
	
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
	
	load_profile(Globals.undecided[0])
	pass
	
func _process(delta: float) -> void:
	if holdingAbout:
		aboutVel = (get_global_mouse_position().y-prevY)*(1/delta)
		aboutContainer.position.y += aboutVel*delta
		prevY = get_global_mouse_position().y
	else:
		if aboutContainer.position.y > aboutMaxY:
			aboutVel = 0
			aboutContainer.position.y = move_toward(aboutContainer.position.y, aboutMaxY, 1000*delta)
		elif aboutContainer.position.y < aboutMinY:
			aboutVel = 0
			aboutContainer.position.y = move_toward(aboutContainer.position.y, aboutMinY, 1000*delta)
		# glide
		elif aboutVel != 0:
			aboutContainer.position.y += aboutVel*delta
		
			aboutVel = move_toward(aboutVel, 0, aboutAcc*delta)
	
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
	var info = $About
	var container = $About/Container 	
		
	var username = container.get_node("Name")
	username.text = profile.username
	
	load_profiles()
	
	var about = container.get_node("About")
	about.text = profile.about
	about.position.y = username.position.y + get_label_height(username) + verPadding
	
	# determine about container size
	var viewportHeight = get_viewport().get_visible_rect().size.y
	info.size.y = max(about.position.y + get_label_height(about) + verPadding*2 + 100, viewportHeight - verPadding*2)
	info.position.y = aboutMaxY
	aboutMinY = -(info.size.y - viewportHeight) - verPadding
	
	# set margins
	container.size = info.size - Vector2(horPadding*2, verPadding*2)
	container.position = Vector2(horPadding, verPadding)
	
	# position text
	about.position.y = username.position.y + get_label_height(username) + verPadding
	
# Profile Image Display things
func set_profile_image(index):
	index += profile.pictures.size()
	index = index%profile.pictures.size()
	imageIndex = index
	$UserImageDisplay/UserImage.texture = images[index]

func get_label_height(label:Label):
	return label.get_line_count()*(label.get_line_height()+label.get_theme_constant("line_spacing"))

func change_image(incr: int) -> void:
	set_profile_image(imageIndex+incr)
	pass

func load_profiles():
	pass
	

func pressed_about() -> void:
	prevY = get_global_mouse_position().y
	holdingAbout = true
	pass


func released_about() -> void:
	holdingAbout = false
	print(aboutVel)
	if abs(aboutVel) < 1000:
		aboutVel = 0
	pass
