extends Control

@export var profileListItem:PackedScene

func _ready():
	_on_back_button_down()

func load_list():
	for child in %MatchList.get_children():
		child.queue_free()
	
	$NoMatches.visible = Globals.matched.is_empty()
	
	for profile in Globals.matched:
		var item = profileListItem.instantiate()
		item.custom_minimum_size.y = 128
		item.load_profile(profile)
		%MatchList.add_child(item)
		item.button_down.connect(load_profile.bind(profile))
		
func load_profile(profile:UserProfile):
	$ProfileView.load_user(profile)
	$ProfileView.visible = true
	$ProfileView.mouse_filter = MOUSE_FILTER_STOP


func _on_back_button_down() -> void:
	$ProfileView.visible = false
	$ProfileView.mouse_filter = MOUSE_FILTER_IGNORE
