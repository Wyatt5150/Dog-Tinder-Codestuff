extends Control

@export var profileListItem:PackedScene

func _ready():
	_on_back_button_down()

func load_lists():
	var parent = $Matched
	var profiles = Globals.matched
	var header = "Matches"
	
	for child in parent.get_children():
		child.queue_free()
	
	var item = Label.new()
	item.text = header
	item.custom_minimum_size.y = 128
	item.theme = load("res://Themes/SmallHeaderTheme.tres")
	item.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	item.vertical_alignment = VERTICAL_ALIGNMENT_CENTER
	parent.add_child(item)
		
	for profile in profiles:
		item = profileListItem.instantiate()
		item.custom_minimum_size.y = 128
		item.load_profile(profile)
		parent.add_child(item)
		item.button_down.connect(load_profile.bind(profile))
		
func load_profile(profile:UserProfile):
	$ProfileView.load_user(profile)
	$ProfileView.visible = true
	$ProfileView.mouse_filter = MOUSE_FILTER_STOP


func _on_back_button_down() -> void:
	$ProfileView.visible = false
	$ProfileView.mouse_filter = MOUSE_FILTER_IGNORE
