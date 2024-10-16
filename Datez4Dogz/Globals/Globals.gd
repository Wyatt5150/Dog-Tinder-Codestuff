extends Node
var currentUser:UserProfile = UserProfile.new()

# default users
# all default users start in undecided and will be moved to the appropriate list during discover mode
var undecided:Array = []
var accepted:Array = [] # current user has accepted, other user has not
var matched:Array = [] # current user and other user have accepted eachother
var declined:Array = []

# idk what settings we'll need but put them here

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	
	pass # Replace with function body.

func set_font_size(size):
	var t:Theme = load("res://Themes/Theme.tres")
	t.set_font_size("font_size","Label", size)

func accept_user(user):
	# moves specified user to matched list if both users accepted eachother, otherwise moves user to accepted
	# user can be the user profile or their index in undecided
	if type_string(typeof(user)) != "int":
		user = undecided.find(user)
	
	if undecided[user].acceptedCurrent:
		matched.append(undecided[user])
	else:
		accepted.append(undecided[user])
		
	undecided.remove_at(user)
	pass

func decline_user(user):
	# moves specified user to declined list
	# i can be the user profile or their index in undecided
	if type_string(typeof(user)) != "int":
		user = undecided.find(user)
	
	declined.append(undecided[user])
	undecided.remove_at(user)
	pass
