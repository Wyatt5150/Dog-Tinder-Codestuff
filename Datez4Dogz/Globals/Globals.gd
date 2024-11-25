extends Node
var currentUser:UserProfile = UserProfile.new()

# default users
# all default users start in undecided and will be moved to the appropriate list during discover mode
var notPrefered:Array = []
var undecided:Array = []
var matched:Array = [] # current user and other user have accepted eachother
var declined:Array = []

var undecidedIndex = 0

# idk what settings we'll need but put them here

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	make_default_profiles()
	pass # Replace with function body.

func make_default_profiles():
	undecided.clear()

	var dog = DogProfile.new()
	dog.name = "Doug"
	dog.bio = "Good boi"
	dog.gender = "Male"
	dog.age = 3
	dog.pictures = [load("res://Sprites/DogPics/oakley.jpg"),load("res://Sprites/DogPics/oakley2.jpg"),load("res://Sprites/DogPics/oakleyAnnieRollo.jpg")]
	
	var profile = UserProfile.new()
	profile.name = "Norm El Man"
	profile.pronouns = "Hu/Man"
	profile.age = 28
	profile.location = "real place, tx"
	profile.bio = "I am a person that exist"
	profile.dogs.append(dog)

	profile.pictures = [load("res://Sprites/DogPics/husky2-1.jpg"),load("res://Sprites/DogPics/husky2-2.jpg")]
	
	undecided.append(profile)
	
	profile = UserProfile.new()
	profile.name = "Aper Son"
	profile.pronouns = "They/Them"
	profile.age = 28
	profile.location = "real place, tx"
	profile.bio = "I am real i swear"
	profile.dogs.append(dog)

	profile.pictures = [load("res://Sprites/DogPics/oakley.jpg"),load("res://Sprites/DogPics/oakley2.jpg")]
	
	undecided.append(profile)


func set_font_size(size):
	var t:Theme = load("res://Themes/Theme.tres")
	t.set_font_size("font_size","Label", size)


func accept_user(user):
	# moves specified user to matched list if both users accepted eachother, otherwise moves user to accepted
	# user can be the user profile or their index in undecided
	if type_string(typeof(user)) != "int":
		user = undecided.find(user)
	
	matched.append(undecided[user])
	
	undecided.remove_at(user)


func decline_user(user):
	# moves specified user to declined list
	# i can be the user profile or their index in undecided
	if type_string(typeof(user)) != "int":
		user = undecided.find(user)
	
	declined.append(undecided[user])
	undecided.remove_at(user)


func filter_compatible():
	undecided.append_array(notPrefered)
	
	notPrefered.clear()
	var toRemove:Array = []
	
	for i in range(undecided.size()):
		if !current_compatibile_with(undecided[i]):
			toRemove.push_front(i)
	
	for i in toRemove:
		notPrefered.push_front(undecided[i])
		undecided.pop_at(i)

func current_compatibile_with(otherUser:UserProfile):
	# Human Preferences
	if currentUser.gender_preference != "None" and currentUser.gender_preference != otherUser.gender_string():
		return false
		
	
	if currentUser.smoker_preference and otherUser.smoker_trait:
		return false
	
	# Dog Preferences
	var notNeutered = {} #pretend this is a set
	for dog:DogProfile in otherUser.dogs:
		if currentUser.vaccinated_preference and !dog.vaccinated:
			return false
		
		if currentUser.size_preference != "None" and currentUser.size_preference != dog.size:
			return false
		
		if currentUser.activity_preference != "None" and currentUser.activity_preference != dog.activity:
			return false
		
		if !dog.neutered:
			notNeutered.add(dog.gender)
	
	match currentUser.neutered_preference:
		"Yes":
			if !notNeutered.is_empty():
				return false
		"Maybe":
			for dog:DogProfile in currentUser.dogs:
				for gender in notNeutered:
					if dog.gender != gender:
						return false
	
	return true
